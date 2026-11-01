"""Verify the exact complete static artifact before upload and after download."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import zipfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
SITE = ROOT / "target/pages/LEXICON"


def pin(data):
    return {"bytes": len(data), "sha256": hashlib.sha256(data).hexdigest()}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--expected-commit", required=True)
    args = parser.parse_args()
    actual_commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
    if args.expected_commit != actual_commit:
        raise ValueError("Verifier checkout differs from expected artifact commit")
    if subprocess.check_output(["git", "status", "--porcelain"], cwd=ROOT).strip():
        raise ValueError("Artifact verification requires a clean Git checkout")
    helper = SITE / "inspector"
    provenance = json.loads((helper / "provenance.json").read_bytes())
    inventory = json.loads((helper / "inventory.json").read_bytes())
    if (provenance["commit"] != actual_commit or inventory["commit"] != actual_commit
            or provenance["dirty"] or inventory["dirty"] or provenance["source_origin"] != "git_checkout"
            or provenance["current_book_review_ready"] is not False):
        raise ValueError("Preview/foreign-source artifact refused")
    expected = {"inspector/" + name: value for name, value in inventory["files"].items()}
    expected["inspector/inventory.json"] = pin((helper / "inventory.json").read_bytes())
    baseline = json.loads((HERE / "publication/baseline.json").read_bytes())
    expected.update(baseline["files"])
    custody = json.loads((SITE / "book-custody.json").read_bytes())
    if (custody["source_commit"] != baseline["source_commit"] or custody["edition"] != "sim-67"
            or custody["files_matched"] != len(baseline["files"])
            or custody["baseline_sha256"] != pin((HERE / "publication/baseline.json").read_bytes())["sha256"]
            or custody["manifest_sha256"] != baseline["files"]["manifest.json"]["sha256"]
            or custody["current_candidate_review_approval"] != "not_conferred"
            or custody["navigation_changed"] or custody["book_edition_changed"]):
        raise ValueError("Book preservation receipt differs")
    expected["book-custody.json"] = pin((SITE / "book-custody.json").read_bytes())
    actual = {}
    for path in SITE.rglob("*"):
        if path.is_symlink() or bool(getattr(path.lstat(), "st_file_attributes", 0) & 1024):
            raise ValueError("Linked site path refused")
        if not path.is_file():
            continue
        name = path.relative_to(SITE).as_posix()
        if any(part.startswith(".") for part in Path(name).parts):
            raise ValueError("Hidden file would be omitted by the Pages uploader: " + name)
        actual[name] = pin(path.read_bytes())
    if actual != expected:
        raise ValueError("Complete static file set or hashes differ: " + ", ".join(
            sorted(name for name in set(actual) | set(expected) if actual.get(name) != expected.get(name))))
    helper_bytes = sum(value["bytes"] for name, value in actual.items() if name.startswith("inspector/"))
    total_bytes = sum(value["bytes"] for value in actual.values())
    if helper_bytes > 5_000_000 or total_bytes > 1_000_000_000:
        raise ValueError("Helper or whole-site delivery budget exceeded")
    for name, expected_pin in provenance["source_files"].items():
        committed = subprocess.check_output(["git", "show", actual_commit + ":" + name], cwd=ROOT)
        if pin(committed) != expected_pin:
            raise ValueError("Source provenance differs from Git: " + name)
    with zipfile.ZipFile(helper / "source.zip") as archive:
        if len(archive.namelist()) != len(set(archive.namelist())):
            raise ValueError("Duplicate portable source ZIP paths")
        if set(archive.namelist()) != set(provenance["source_files"]) | {"SOURCE-PROVENANCE.json"}:
            raise ValueError("Portable source ZIP file set differs")
        for name, expected_pin in provenance["source_files"].items():
            if pin(archive.read(name)) != expected_pin:
                raise ValueError("Portable source ZIP bytes differ: " + name)
        source = json.loads(archive.read("SOURCE-PROVENANCE.json"))
        if source["commit"] != actual_commit or source["dirty"] or source["source_files"] != provenance["source_files"]:
            raise ValueError("Portable source ZIP has preview provenance")
    if pin((helper / "source.zip").read_bytes()) != provenance["source_zip"]:
        raise ValueError("Source ZIP digest differs")
    if pin((helper / "pkg/lexicon_inspector_bg.wasm").read_bytes()) != provenance["wasm"]:
        raise ValueError("Compiled WASM digest differs")
    result = {"schema": "lexicon.complete-site-verification.v1", "commit": actual_commit,
              "files": len(actual), "bytes": total_bytes, "helper_files": len(inventory["files"]) + 1,
              "helper_bytes": helper_bytes, "published_book_files": len(baseline["files"]),
              "book_edition": "sim-67", "current_content_ready": False,
              "files_sha256": pin((json.dumps(actual, sort_keys=True) + "\n").encode())["sha256"]}
    cache = HERE / ".cache"
    cache.mkdir(exist_ok=True)
    (cache / "complete-site.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    (cache / "complete-site-files.json").write_text(json.dumps(actual, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result))


if __name__ == "__main__":
    main()
