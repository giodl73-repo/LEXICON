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

## Local prototype outcome

Six consumer tests and strict host/wasm Clippy pass. Linked WASM is 321,555 bytes,
SHA-256 `c9d4ddafb876e36fd0408a858cc1c9bf826368fc1bbffe286e1eb6942f578307`.
Two local Chromium tests pass: all 48 native/WASM responses match exactly, and
the worker accepts own input with explicit unperformed-check reporting. Cases
include the full current reference, 32 identity variants, changed query sources,
canonical transport, malformed/unknown input and resource limits.

This is a local draft. Robust multi-document UI/import/export, independent
deadlines/fences/accessibility, full source/legal custody and publication
qualification remain open. The complete native baseline retains 80 passing and
four failing content/snapshot tests after checkout-byte correction. No review
hash, canonical content, frozen packet or native production source was altered.

## Custody diagnostic continuation

The read-only `tools/check_review_custody.py` now retains authoritative native
check output and all 56 source-digest mismatches in `../custody-audit.json`.
See `../CUSTODY-QUALIFICATION.md` for source-history limits and result review.
The obsolete census assertions are corrected to 133 entries and 244 bindings.
Three authored workspace tests add positive native library/CLI validation and
negative source-text, CRLF, missing-review and pending-marker controls.

Validation: strict all-target native Clippy and formatting pass; complete
native tests report 84 passing and three failing, none ignored. The three
content/workspace success requirements remain red and unchanged. The strict
custody command returns 1 with `ready: false`; all 244 bindings are enumerated,
188 match current bytes and 56 mismatch (21 CRLF matches). Root native source,
Cargo manifests, reference, Tables, specs, fixtures and artifacts remain exact
public-entry Git blobs. Browser prototype evidence is unchanged and is not
recast as release proof. This diagnostic slice is ready to commit; the broader
qualification and book content findings remain open.
