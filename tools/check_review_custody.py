"""Read-only current-workspace audit. Native checks are authoritative.

Usage: python tools/check_review_custody.py --lexicon-binary <built lexicon>
Writes a JSON report to stdout; exits nonzero unless both native gates pass.
Diagnostic hashes never update review bindings or certify content.
"""

import argparse
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
REFERENCE = "reference/lexicon-reference-v4.lexicon"
RELATIONS = "reference/lexicon-relations-v2.lexicon"
ASSURANCE = "reference/lexicon-assurance-v4.lexicon"


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def diagnostics(root):
    """Enumerate raw-byte mismatches; this is not a second grammar validator."""
    sources = {}
    for line in (root / REFERENCE).read_text(encoding="utf-8").splitlines():
        if line.startswith("entry "):
            fields = line[6:].split(" | ")
            sources["entry:" + fields[0]] = fields[4]
        elif line.startswith("view "):
            fields = line[5:].split(" | ")
            sources["view:" + fields[0]] = fields[5]
    for line in (root / RELATIONS).read_text(encoding="utf-8").splitlines():
        if line.startswith("relation "):
            sources["relation:" + line[9:].split(" | ")[0]] = RELATIONS
    records = []
    for line in (root / ASSURANCE).read_text(encoding="utf-8").splitlines():
        if not line.startswith("review "):
            continue
        artifact, expected, review, status, date = line[7:].split(" | ")
        source = sources[artifact]
        path = (root / source).resolve()
        if not path.is_relative_to(root.resolve()):
            raise ValueError("source escapes workspace: " + source)
        data = path.read_bytes()
        observed = sha256(data)
        if observed != expected:
            lf = data.replace(b"\r\n", b"\n")
            variants = {"lf": lf, "crlf": lf.replace(b"\n", b"\r\n")}
            records.append({
                "artifact": artifact, "source": source,
                "expected_sha256": expected, "observed_sha256": observed,
                "transport_matches": [key for key, value in variants.items()
                                      if sha256(value) == expected],
                "review": review, "declared_status": status, "declared_date": date,
            })
    return {"source_bindings": len(sources), "source_digest_mismatches": records}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lexicon-binary", type=Path, required=True)
    args = parser.parse_args()
    binary = args.lexicon_binary.resolve(strict=True)
    checks = []
    for arguments in [
        ["reference-check", REFERENCE, "."],
        ["reference-sidecar-check", REFERENCE, RELATIONS, ASSURANCE, "."],
    ]:
        result = subprocess.run([str(binary), *arguments], cwd=ROOT,
                                capture_output=True, encoding="utf-8", check=False)
        checks.append({"arguments": arguments, "exit_code": result.returncode,
                       "stdout": result.stdout, "stderr": result.stderr})
    report = {
        "schema": "lexicon.review-custody-audit.v1",
        "ready": all(check["exit_code"] == 0 for check in checks),
        "native_binary_sha256": sha256(binary.read_bytes()),
        "input_sha256": {name: sha256((ROOT / name).read_bytes())
                         for name in [REFERENCE, RELATIONS, ASSURANCE]},
        "native_checks": checks,
        "boundary": "Native checks are authoritative. Diagnostics confer no review, "
                    "semantic, reader-outcome or publication approval. No files changed.",
    }
    try:
        report["diagnostics"] = diagnostics(ROOT)
    except (OSError, ValueError, KeyError, IndexError) as error:
        report["diagnostic_error"] = str(error)
        report["ready"] = False
    print(json.dumps(report, indent=2, ensure_ascii=False))
    return 0 if report["ready"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
