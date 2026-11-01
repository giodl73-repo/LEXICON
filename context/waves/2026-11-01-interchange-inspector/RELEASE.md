# Initial auxiliary inspector release

The [interchange inspector preview](https://giodl73-repo.github.io/LEXICON/inspector/)
is available without installation, account or API service. It runs existing Rust
reference/relation/query parsers in a worker over supplied UTF-8 documents, with
labelled resource/portable-number limits and exact original/current/canonical,
request and native-report downloads. Authored examples are immediately usable.
Books remain primary; their 528 published files are unchanged.

This is the **initial proven deployment**, not a statement that every later
commit is already deployed. The [deployed provenance](https://giodl73-repo.github.io/LEXICON/inspector/provenance.json)
and [Pages workflow](https://github.com/giodl73-repo/LEXICON/actions/workflows/pages.yml)
identify later source revisions and their repeated build/deploy gates.

| Evidence | Initial result |
|---|---|
| Merged source | `b62315085c429aab215048e5f8f0e08cc2532969`, PR 1 |
| Default build/deployment | Run `41353746956`, build job `124989266475`, deploy job `124990199024`: success |
| Required native checks | 35 library + three authored custody + seven consumer tests; strict native/host/WASM lint passes |
| Browser execution | Fourteen hosted and fourteen fresh live Chromium checks; 62 exact native/WASM responses |
| Portable source replay | Seven consumer and fourteen browser tests; all 62 original/rebuilt requests and responses identical |
| Whole static artifact | 631 files / 16,246,584 bytes; verified before upload, after download and against live HTTP bytes |
| Helper | 102 files / 1,879,708 bytes, below its 5 MB budget |
| Published book | All 528 sim-67 files at `0526d86` preserved byte for byte |
| Compiled WASM SHA-256 | `97cb70783cced2ca9aef742c301ecc4a408749e1225aed71c84ab3b79d77e57b` |
| Source/legal routes | Independent source/locks, portable ZIP, exact-commit complete repository, build/provenance and existing license scopes; notices for 27 Cargo dependencies and 13 original Rust library notice files retain custody |

The live suite includes own inputs, UTF-8/CRLF/BOM originals, downloads,
oversized/malformed input, u32 query-number admission, all three deadlines,
crash/restart, late file/worker results, stale export removal, source routes
without WASM and mobile keyboard use. Descriptive startup/worker/direct-WASM
timings record input bytes and user agent; they are not comparative performance
or reader-outcome evidence. Cross-directory binary identity remains unproven,
with both hashes retained; the exact tested deployment itself is verified.

The full repository audit is still **Windows 84 pass/3 fail; Linux 82 pass/5
fail**. Current review custody, frozen/current workspace and frozen Linux HRR/
bakeoff expectations are not renewed. No review hash, control, frozen result,
native production source, root Cargo file, reference, Table or fixture changed.
These gates keep failing visibly and block their own current-content/control
claims. See [gate ownership](GATE-OWNERSHIP.md) and [custody qualification](CUSTODY-QUALIFICATION.md).

All INSPECT-01 through INSPECT-06 gates pass for the bounded preview. The
AI-simulated role review is scoped to that implementation and delivery, not
human/practitioner evidence, semantic truth, Markdown/review assurance, automatic
graph construction, current-corpus approval or R4/R5/R6 readiness.
