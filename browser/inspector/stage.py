"""Stage only inspector runtime, source and legal artifacts; never QA payloads."""
import argparse
import hashlib
import html
import json
import shutil
import subprocess
import zipfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
OUTPUT = ROOT / "target/pages/LEXICON/inspector"
BUDGET = 5_000_000
RUNTIME = ["index.html", "app.js", "style.css", "worker.js", "examples.json",
           "runtime-build.json", "pkg/lexicon_inspector.js", "pkg/lexicon_inspector_bg.wasm"]
TOP_SOURCE = {"Cargo.toml", "Cargo.lock", ".gitattributes", ".gitignore", "LICENSE",
              "LICENSE-CONTENT.md", "tools/verify_packet.py", "tools/verify_role_packet.py",
              "reference/lexicon-reference-v4.lexicon"}
PREFIX_SOURCE = ("src/", "fixtures/schemas/", "browser/inspector/")


def capture(*args):
    return subprocess.check_output(args, cwd=ROOT).decode("utf-8").strip()


def pin(data):
    return {"bytes": len(data), "sha256": hashlib.sha256(data).hexdigest()}


def linked(path):
    return path.is_symlink() or bool(getattr(path.lstat(), "st_file_attributes", 0) & 1024)


def source_path(name):
    path = ROOT / name
    if ("\\" in name or ".." in Path(name).parts or not path.is_file()
            or linked(path) or not path.resolve().is_relative_to(ROOT)):
        raise ValueError("Nonlocal source refused: " + name)
    return path


def reset_output():
    target = (ROOT / "target").resolve()
    if not OUTPUT.resolve().is_relative_to(target) or OUTPUT.resolve() == target:
        raise ValueError("Output escapes this repository's target directory")
    for ancestor in [OUTPUT, *OUTPUT.parents]:
        if ancestor == ROOT:
            break
        if ancestor.exists() and linked(ancestor):
            raise ValueError("Linked staging path refused")
    if OUTPUT.exists():
        if (OUTPUT / ".stage-owned").read_text() != "lexicon-inspector-stage-v1\n":
            raise ValueError("Refusing to replace an unowned output")
        if any(linked(path) for path in OUTPUT.rglob("*")):
            raise ValueError("Linked staging output refused")
        shutil.rmtree(OUTPUT)
    OUTPUT.mkdir(parents=True)
    (OUTPUT / ".stage-owned").write_text("lexicon-inspector-stage-v1\n", encoding="ascii")


def put(name, data):
    path = OUTPUT / name
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)


def json_bytes(value):
    return (json.dumps(value, indent=2, ensure_ascii=False) + "\n").encode("utf-8")


def portable_sources(dirty, archive=None):
    names = list(archive["source_files"]) if archive else capture(
        "git", "ls-files", "--cached", "--others", "--exclude-standard", "-z").split("\0")
    selected = sorted({name for name in names if name in TOP_SOURCE or name.startswith(PREFIX_SOURCE)})
    sources = {}
    for name in selected:
        path = source_path(name)
        data = path.read_bytes()
        if not dirty and not archive:
            committed = subprocess.check_output(["git", "show", "HEAD:" + name], cwd=ROOT)
            if data != committed:
                raise ValueError("Checkout source bytes differ from Git; use an LF checkout: " + name)
        sources[name] = data
    return sources


def dependency_notices():
    metadata = json.loads(capture("cargo", "+1.95.0", "metadata", "--locked", "--manifest-path",
                                 "browser/inspector/Cargo.toml", "--features", "wasm",
                                 "--filter-platform", "wasm32-unknown-unknown", "--format-version", "1"))
    packages = {p["id"]: p for p in metadata["packages"]}
    nodes = {n["id"]: n for n in metadata["resolve"]["nodes"]}
    pending = [p["id"] for p in metadata["packages"] if p["name"] == "lexicon-inspector"]
    visited, dependencies = set(), []
    while pending:
        current = pending.pop()
        if current in visited:
            continue
        visited.add(current)
        pending.extend(nodes[current]["dependencies"])
        package = packages[current]
        if package["source"] is None:
            continue
        base = Path(package["manifest_path"]).parent
        files = sorted({p for pattern in ("LICENSE*", "COPYRIGHT*", "NOTICE*")
                        for p in base.glob(pattern) if p.is_file()})
        if not files:
            raise ValueError("No upstream notice for " + package["name"])
        record = {key: package[key] for key in ("name", "version", "license", "source")}
        record["notices"] = {}
        for path in files:
            name = f"licenses/dependencies/{package['name']}-{package['version']}/{path.name}"
            data = path.read_bytes()
            put(name, data)
            record["notices"][name] = pin(data)
        dependencies.append(record)
    dependencies.sort(key=lambda p: (p["name"], p["version"]))
    put("dependencies.json", json_bytes(dependencies))
    rows = []
    for package in dependencies:
        links = " · ".join(f'<a href="{html.escape(name, quote=True)}">{html.escape(Path(name).name)}</a>'
                           for name in package["notices"])
        rows.append(f"<li>{html.escape(package['name'])} {html.escape(package['version'])} "
                    f"({html.escape(package['license'] or 'see upstream notice')}): {links}</li>")
    put("licenses/index.html", ("<!doctype html><html lang=en><meta charset=utf-8>"
        "<meta name=viewport content='width=device-width,initial-scale=1'><base href='../'>"
        "<title>Lexicon inspector licenses</title><h1>Licenses and notices</h1>"
        "<p><a href='./'>Return to inspector</a></p><p>First-party software: "
        "<a href='LICENSE'>MIT scope</a>. Reference, examples and documentation: "
        "<a href='LICENSE-CONTENT.md'>existing content scope</a>. Prior grants remain intact. "
        "These notices do not relicense third-party material.</p>"
        "<p><a href='rust/COPYRIGHT-library.html'>Rust 1.95.0 library notices</a> · "
        "<a href='rust/provenance.json'>Rust notice provenance</a> · "
        "<a href='dependencies.json'>Resolved dependency closure, including build-time macros</a></p><ul>"
        + "".join(rows) + "</ul></html>\n").encode("utf-8"))
    return dependencies


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preview", action="store_true", help="Allow and label dirty local source")
    args = parser.parse_args()
    archive = None
    if (ROOT / ".git").exists():
        dirty = bool(capture("git", "status", "--porcelain", "--untracked-files=all"))
        commit = capture("git", "rev-parse", "HEAD")
    else:
        archive = json.loads((ROOT / "SOURCE-PROVENANCE.json").read_bytes())
        if archive["schema"] != "lexicon.portable-source.v1":
            raise ValueError("Unsupported portable source provenance")
        commit = archive["commit"]
        dirty = archive["dirty"] or any(pin(source_path(name).read_bytes()) != expected
                                        for name, expected in archive["source_files"].items())
        if not args.preview:
            raise ValueError("Archive staging is preview-only; use a clean Git checkout for hosted qualification")
    if len(commit) != 40 or any(c not in "0123456789abcdef" for c in commit):
        raise ValueError("Invalid source commit identity")
    if dirty and not args.preview:
        raise ValueError("Release staging requires a clean checkout; --preview is local qualification only")
    from_archive = archive is not None
    sources = portable_sources(dirty, archive)
    preview = ROOT / "target/inspector-preview"
    runtime = json.loads((preview / "runtime-build.json").read_bytes())
    if runtime["schema"] != "lexicon.inspector-runtime-build.v1":
        raise ValueError("Unsupported runtime build proof")
    for name, expected in runtime["compile_inputs"].items():
        if pin(source_path(name).read_bytes()) != expected:
            raise ValueError("Compiled source changed; rebuild first: " + name)
    for name, expected in runtime["runtime_files"].items():
        if pin((preview / name).read_bytes()) != expected:
            raise ValueError("Runtime artifact changed; rebuild first: " + name)
    reset_output()
    for name in RUNTIME:
        data = (preview / name).read_bytes()
        if name == "index.html":
            data = data.replace(b"{{SOURCE_COMMIT}}", commit.encode("ascii"))
        put(name, data)
    for name in ["index.html", "app.js", "worker.js", "style.css"]:
        original = (HERE / "web" / name).read_bytes().replace(b"{{SOURCE_COMMIT}}", commit.encode("ascii"))
        if original != (OUTPUT / name).read_bytes():
            raise ValueError("Runtime/source mismatch; rebuild first: " + name)
    for name in ["LICENSE", "LICENSE-CONTENT.md"]:
        put(name, sources[name])
    put("BUILD.md", sources["browser/inspector/BUILD.md"])
    rust = HERE / "legal/rust"
    notice_provenance = json.loads((rust / "provenance.json").read_bytes())
    for name, expected in notice_provenance["files"].items():
        data = (rust / name).read_bytes()
        if pin(data) != expected:
            raise ValueError("Rust notice bytes changed: " + name)
        put("rust/" + name, data)
    put("rust/provenance.json", (rust / "provenance.json").read_bytes())
    dependencies = dependency_notices()
    with zipfile.ZipFile(OUTPUT / "source.zip", "w", compression=zipfile.ZIP_DEFLATED) as archive:
        portable_provenance = {"schema": "lexicon.portable-source.v1", "commit": commit,
                               "dirty": dirty, "source_files": {name: pin(data) for name, data in sources.items()}}
        for name, data in [*sources.items(), ("SOURCE-PROVENANCE.json", json_bytes(portable_provenance))]:
            info = zipfile.ZipInfo(name, date_time=(1980, 1, 1, 0, 0, 0))
            info.external_attr = 0o100644 << 16
            info.compress_type = zipfile.ZIP_DEFLATED
            archive.writestr(info, data)
    source_links = []
    for name, data in sources.items():
        if name.startswith("src/") or name in {"Cargo.toml", "Cargo.lock"} or name in {
            "browser/inspector/src/lib.rs", "browser/inspector/src/main.rs",
            "browser/inspector/Cargo.toml", "browser/inspector/Cargo.lock"}:
            put("source/" + name, data)
            source_links.append(f'<li><a href="{html.escape(name, quote=True)}">{html.escape(name)}</a></li>')
    put("source/index.html", ("<!doctype html><html lang=en><meta charset=utf-8>"
        "<meta name=viewport content='width=device-width,initial-scale=1'>"
        "<title>Lexicon Rust sources</title><h1>Rust sources and locks</h1>"
        "<p><a href='../'>Return to inspector</a>. These are source files, not compiled WebAssembly. "
        "The portable source ZIP includes compile-time fixtures and consumer test inputs; "
        "it does not certify those inputs as a book release.</p><ul>"
        + "".join(source_links) + "</ul></html>\n").encode("utf-8"))
    provenance = {"schema": "lexicon.inspector-build.v1", "commit": commit, "dirty": dirty,
                  "source_origin": "portable_archive" if from_archive else "git_checkout",
                  "path_remapping": runtime["path_remapping"],
                  "scope": "Auxiliary inspector build only; current book review custody remains unqualified",
                  "rust": capture("rustc", "+1.95.0", "--version"),
                  "bindings": capture("wasm-bindgen", "--version"),
                  "source": "https://github.com/giodl73-repo/LEXICON/tree/" + commit,
                  "full_repository_zip": "https://github.com/giodl73-repo/LEXICON/archive/" + commit + ".zip",
                  "source_zip_scope": "Complete portable inspector build and consumer tests, not full repository",
                  "source_zip": pin((OUTPUT / "source.zip").read_bytes()),
                  "source_files": {name: pin(data) for name, data in sources.items()},
                  "wasm": pin((OUTPUT / "pkg/lexicon_inspector_bg.wasm").read_bytes()),
                  "dependencies": dependencies, "budget_bytes": BUDGET,
                  "current_book_review_ready": False}
    put("provenance.json", json_bytes(provenance))
    files = {p.relative_to(OUTPUT).as_posix(): pin(p.read_bytes())
             for p in sorted(OUTPUT.rglob("*")) if p.is_file()}
    inventory = {"schema": "lexicon.inspector-site.v1", "commit": commit, "dirty": dirty,
                 "scope": "Files excludes inventory.json itself; QA cases and scratch requests are never staged",
                 "files": files}
    put("inventory.json", json_bytes(inventory))
    size = sum(p.stat().st_size for p in OUTPUT.rglob("*") if p.is_file())
    if size > BUDGET:
        raise ValueError("Inspector exceeds 5 MB budget")
    print(json.dumps({"output": str(OUTPUT), "bytes": size, "files": len(files) + 1,
                      "dependencies": len(dependencies), "dirty": dirty}))


if __name__ == "__main__":
    main()
