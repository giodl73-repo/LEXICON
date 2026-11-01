# Pulse 01: integrate doctrine and qualify existing Rust checks

Status: in progress. Prototype code is not an accepted stable interface or release.

1. Integrate tracked PITFALL intent with public main without changing native
   source, corpus, tables, founding artifacts, historical imports or review hashes.
2. Preserve stable FRM doctrine IDs; update active identity to Lexicon and retain
   the historical local checkout path and dated Formarium records.
3. Audit native and existing Pages gates before claiming qualification.
4. Prototype an isolated unpublished consumer of existing in-memory parsers and
   query-source checks. Support the real 314,276-byte current corpus, bounded at
   512 KiB per document and 2 MiB envelope, without embedding/publishing a new book.
5. Verify native tests, host/wasm Clippy, a linked WASM build and exact response
   parity. Subsequent UI/publication work must retain the existing public edition
   and complete own-input/export, error, recovery, keyboard/mobile and custody gates.

Acceptance IDs: INSPECT-01 own supplied interchange; INSPECT-02 exact native
grammar/source checks; INSPECT-03 separate original/canonical/hash exports;
INSPECT-04 declared-state and unperformed-check disclosure; INSPECT-05 bounds,
worker/file fences and accessibility; INSPECT-06 source/licensing/publication custody.

Required validation: identity boundary script; unchanged protected Git blobs;
complete native audit with failures retained; native consumer tests and strict
host/wasm lint/build; browser native/WASM parity; existing contract checks and
publication qualification. No failing baseline gate may be reported as green.
