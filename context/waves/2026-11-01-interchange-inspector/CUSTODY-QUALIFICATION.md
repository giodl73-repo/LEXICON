# Review-custody qualification

Status: content readiness remains red. This is an auxiliary software audit,
not a new reference approval or a public book release.

The 2026-11-01 checkout preserves the public `4c7b174` reference, Tables,
assurance, native production source, root Cargo manifests and frozen artifacts.
Its current reference contains 133 entries, 100 views and eleven relations,
with 244 assurance bindings. The old 101/212 test census was obsolete and has
been corrected; the content checks still require successful validation.

## Reproduce

```powershell
cargo +1.95.0 build --locked --bin lexicon
python tools/check_review_custody.py --lexicon-binary <cargo-target>/debug/lexicon.exe
cargo +1.95.0 test --locked --no-fail-fast
```

The custody command writes JSON to stdout and returns nonzero unless both
native reference/projection and sidecar gates pass. Native checks are
authoritative; its exhaustive hash list is supplemental diagnosis. It records
the executable and input hashes and never edits sources or approval bindings.
Redirect stdout to an ignored `target/` file to retain a local report.

The current reference/projection check passes. The current sidecar check fails
at `entry:amount-concentration-composition`. Exhaustive diagnosis finds 56 raw
source-digest mismatches: 21 match a CRLF transport variant, and 35 do not match
the tested current transport variants. A separate investigation walked all
available revisions of the affected paths, including LF/CRLF, BOM, UTF-16 and
trailing-newline variants; none of those 35 reviewed sources was recovered.
The available Git repository was not shallow. Failure to recover a source is
not evidence that its approval can be transferred to the present text.

`tools/build_lexicon_contracts.js --check` is insufficient to close this finding:
the generator retains most historical approval digests while regenerating the
current contracts. A matching generated file does not establish matching
reviewed source bytes.

The frozen v0 workspace test also fails against the later Tables: the
`claim-evidence` source no longer contains the old `inference` sense marker.
Frozen parse compatibility and approval of a mutable current workspace are
different claims. This pulse preserves the failing success requirement rather
than treating rejection as renewed book approval.

## Software evidence and boundaries

Three additional tests construct an isolated, explicitly authored workspace
with one entry, one view, six relation kinds and eight synthetic bindings.
Both the native library and CLI accept it. Independent mutations prove that
changed source text, CRLF conversion, a missing review file and a pending
review marker fail closed. The synthetic fixed-point marker is test data,
not an editorial review of real content.

These tests supplement the committed-content checks; no test is ignored,
no existing required-success assertion is inverted, and no native validator
or review hash is weakened. Current release readiness remains red. Repairing
content custody requires recovered reviewed bytes or explicit renewed review
of each changed source, with the relevant domain roles and retained evidence.

## Result review

AI-simulated Schema Implementer: pass for authored positive and mutation
coverage; native semantics remain unchanged. Research Integrity & Provenance:
pass for retaining failed controls, exact hashes and the unresolved content
finding. Evidence & Claims Editor: pass for qualifying the dated internal
acceptance claims in CONTEXT and the funded-roadmap acceptance audit. These
reviews do not establish a fixed point for the book or approve publication.
