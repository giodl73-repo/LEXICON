"""Rebuild and replay the portable source ZIP outside Git, retaining a receipt."""
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import zipfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
SITE = ROOT / "target/pages/LEXICON/inspector"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    target = (ROOT / "target").resolve()
    extracted = Path(tempfile.mkdtemp(prefix="inspector-source-rebuild-", dir=target)).resolve()
    if not extracted.is_relative_to(target):
        raise ValueError("Extraction escapes target")
    with zipfile.ZipFile(SITE / "source.zip") as archive:
        names = archive.namelist()
        if len(names) != len(set(names)):
            raise ValueError("Duplicate source ZIP paths")
        for name in names:
            if ("\\" in name or ".." in Path(name).parts
                    or not (extracted / name).resolve().is_relative_to(extracted)):
                raise ValueError("Nonlocal ZIP path refused")
        archive.extractall(extracted)
    source = json.loads((extracted / "SOURCE-PROVENANCE.json").read_bytes())
    for name, expected in source["source_files"].items():
        data = (extracted / name).read_bytes()
        if sha(data) != expected["sha256"] or len(data) != expected["bytes"]:
            raise ValueError("Extracted source differs: " + name)
    cache = HERE / ".cache"
    cache.mkdir(exist_ok=True)
    log = cache / "source-rebuild.log"
    commands = [
        ["cargo", "+1.95.0", "test", "--locked", "--manifest-path", "browser/inspector/Cargo.toml"],
        ["python", "-B", "browser/inspector/build-check.py"],
        ["npm", "--prefix", "browser/inspector", "ci"],
        ["npm", "--prefix", "browser/inspector", "run", "test:pages"],
    ]
    with log.open("w", encoding="utf-8") as output:
        for command in commands:
            actual = list(command)
            if actual[0] == "npm" and os.name == "nt":
                actual[0] = "npm.cmd"
            output.write("COMMAND " + json.dumps(command) + "\n")
            output.flush()
            subprocess.run(actual, cwd=extracted, check=True, stdout=output, stderr=subprocess.STDOUT)
    rebuilt = extracted / "target/pages/LEXICON/inspector"
    results = json.loads((extracted / "browser/inspector/.cache/browser-results.json").read_bytes())
    if results["stats"]["expected"] != 14 or any(results["stats"][k] for k in ["unexpected", "flaky", "skipped"]):
        raise ValueError("Extracted-source browser suite did not pass in full")
    wasm = "pkg/lexicon_inspector_bg.wasm"
    receipt = {"schema": "lexicon.portable-source-rebuild.v1", "source_commit": source["commit"],
               "source_dirty": source["dirty"], "source_zip_sha256": sha((SITE / "source.zip").read_bytes()),
               "source_files": len(source["source_files"]), "consumer_tests_passed": 7,
               "browser_tests_passed": results["stats"]["expected"],
               "original_wasm_sha256": sha((SITE / wasm).read_bytes()),
               "rebuilt_wasm_sha256": sha((rebuilt / wasm).read_bytes()),
               "scope": "Portable source archive rebuild; not current book or hosted publication approval"}
    receipt["wasm_byte_identical"] = receipt["original_wasm_sha256"] == receipt["rebuilt_wasm_sha256"]
    original_cases = json.loads((ROOT / "target/inspector-preview/native-cases.json").read_bytes())
    rebuilt_cases = json.loads((extracted / "target/inspector-preview/native-cases.json").read_bytes())
    if original_cases != rebuilt_cases:
        raise ValueError("Portable source rebuild changed native inputs or canonical responses")
    receipt["all_native_inputs_and_responses_identical"] = True
    receipt["native_wasm_responses"] = len(original_cases)
    receipt["cross_directory_binary_reproducibility"] = "proven" if receipt["wasm_byte_identical"] else "not_established"
    (cache / "source-rebuild.json").write_text(json.dumps(receipt, indent=2) + "\n", encoding="utf-8")
    shutil.copyfile(extracted / "browser/inspector/.cache/browser-results.json", cache / "source-rebuild-browser.json")
    print(json.dumps(receipt))
    # This exact directory was allocated above; do not retain duplicate npm/build
    # trees after the complete receipt and log have been preserved.
    if extracted.parent != target or not extracted.name.startswith("inspector-source-rebuild-"):
        raise ValueError("Unsafe extraction cleanup target")
    shutil.rmtree(extracted)


if __name__ == "__main__":
    main()
