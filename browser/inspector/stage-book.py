"""Preserve the pinned live book byte for byte; add no navigation or new edition."""
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
SOURCE = ROOT / "target/published-source"
RENDER = SOURCE / "target/proof-set-sim-67"
OUTPUT = ROOT / "target/pages/LEXICON"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def normal(path):
    return path.read_bytes().replace(b"\r\n", b"\n")


def main():
    baseline_bytes = (HERE / "publication/baseline.json").read_bytes()
    baseline = json.loads(baseline_bytes)
    manifest_bytes = (HERE / "publication/sim67-manifest.json").read_bytes()
    expected_manifest = json.loads(manifest_bytes)
    capture = lambda *args: subprocess.check_output(["git", "-C", str(SOURCE), *args], text=True).strip()
    if capture("rev-parse", "HEAD") != baseline["source_commit"] or capture("status", "--porcelain"):
        raise ValueError("Published book source must be the exact clean pinned commit")
    observed = json.loads((RENDER / "manifest.json").read_bytes())
    if observed["pandoc"] != baseline["pandoc"] or observed["sources"] != expected_manifest["sources"]:
        raise ValueError("Wrong renderer or changed book source inputs")
    files = {p.relative_to(RENDER).as_posix(): normal(p) for p in RENDER.rglob("*") if p.is_file()}
    if set(files) != set(baseline["files"]):
        raise ValueError("Rendered book file set changed")
    identity_names = ["index.html", "tables.html", "reader.html", "terms.html", "compose.html"] + [
        name for name in files if name.split("/")[0] in {"chapters", "entries", "pointers", "assets"}]
    identity = sha("\n".join(f"{name}|{sha(files[name])}|{len(files[name])}"
                             for name in sorted(identity_names)).encode("utf-8"))
    observed["site_checks"]["identity"] = identity
    observed["output"].update({
        "sha256": sha(files["proof-set-sim-67.html"]), "bytes": len(files["proof-set-sim-67.html"]),
        "search_index_sha256": sha(files["search-index.json"]),
        "site_index_sha256": sha(files["index.html"]), "site_identity": identity,
    })
    for record in observed["site_assets"]:
        data = files[record["path"]]
        record.update({"sha256": sha(data), "bytes": len(data)})
    if observed != expected_manifest:
        raise ValueError("Recomputed book manifest differs from live baseline")
    files["manifest.json"] = manifest_bytes
    mismatches = [name for name, data in files.items()
                  if {"sha256": sha(data), "bytes": len(data)} != baseline["files"][name]]
    if mismatches:
        raise ValueError("Published book bytes differ; no files staged: " + ", ".join(mismatches))
    target = (ROOT / "target").resolve()
    if not OUTPUT.resolve().is_relative_to(target):
        raise ValueError("Output escapes target")
    for name, data in files.items():
        dest = OUTPUT / name
        if not dest.resolve().is_relative_to(OUTPUT.resolve()) or dest.is_symlink():
            raise ValueError("Linked/external book output refused")
        if dest.exists() and dest.read_bytes() != data:
            raise ValueError("Refusing to overwrite different staged book bytes: " + name)
    for name, data in files.items():
        dest = OUTPUT / name
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_bytes(data)
    receipt = {"schema": "lexicon.published-book-custody.v1", "edition": baseline["edition"],
               "source_commit": baseline["source_commit"], "files_matched": len(files),
               "baseline_sha256": sha(baseline_bytes), "manifest_sha256": sha(manifest_bytes),
               "navigation_changed": False, "book_edition_changed": False,
               "current_candidate_review_approval": "not_conferred"}
    (OUTPUT / "book-custody.json").write_text(json.dumps(receipt, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(receipt))


if __name__ == "__main__":
    main()
