# Pulse 04: publish the bounded preview without changing the books

Status: release candidate; final hosted/default-branch/live receipts required.

Gate ownership is explicit in `../GATE-OWNERSHIP.md`: the auxiliary task uses
the existing in-memory Rust parsers and supplied source hashes. Its required
native gate is 35 library tests, three authored custody fixtures and seven
consumer tests, with strict host/WASM lint. The full content/control audit keeps
its five Linux failures and continues to fail visibly in PRs and on main. No
approval hash, native production source, current reference, Table, fixture,
founding control or frozen result changes.

The prior hosted inspector job at `0aeca4b` passed its consumer/browser/source
checks and preserved all 528 published sim-67 files. The candidate now shares
that build between PR validation and default-branch Pages deployment. Discovery
is a book-first README link, not an overlay that would change the book files.
The deploy job accepts only a clean, exact-commit, complete verified artifact.
The static tree excludes hidden files that the Pages uploader would omit;
private ownership markers remain outside it and CI uploads retain hidden QA
receipts explicitly. Source ZIP, original notices, book baseline and compiled
WASM are verified again after artifact download.

Qualification also found a genuine native/wasm32 admission mismatch in query
budgets and node depths, whose unchanged native type is usize. A labelled
adapter-only u32 maximum now applies on both hosts; UI and JSON reports disclose
it. Seven consumer tests and 62 native/WASM cases cover at/over maximum budgets,
node depths, u64 overflow and plus/leading-zero forms. The native grammar is not
rewritten and no number is truncated or repaired. Local strict host/WASM lint
and all fourteen browser checks pass with the expanded parity set.

An authored reference example loads immediately unless the reader already
edited/imported/cleared inputs. Browser proof records descriptive startup,
worker round-trip and direct-WASM timings with input bytes and user agent;
these are not performance or reader-outcome claims. Empty, invalid, optional,
timeout, crash/restart, stale completion, download and keyboard/mobile states
retain their prior coverage.

AI-simulated result review: Product Owner accepts a useful subordinate preview;
Reference Architecture Editor accepts unchanged book bytes and README discovery;
Schema Implementer accepts explicit portable admission with shared native
parsers; Benchmark Consumer retains untouched founding experiments and failed
cross-platform controls; Research Integrity & Provenance requires complete
artifact/download/live verification; Evidence & Claims Editor retains declared
query state, unperformed assurance and the open current-content audit. This is
not a global fixed point, current-corpus release or R4/R5/R6 approval.


Hosted run 41352113999 at 5407255 passes the complete preview gate, including
45 native checks, fourteen browser cases, 62 native/WASM responses, independent
portable-source replay and every one of the 528 preserved book files. The full
current-content job remains red with 82/5 and now correctly propagates the test
exit status through its log pipeline.

The final interaction audit removed HTML maxlength, which could silently
truncate pasted text. Oversized paste/drop is rejected as a whole with prior
input retained; manually edited text still receives native UTF-8 admission.
The existing byte-limit browser case now proves this rejection and absence of
maxlength. Fresh preview qualification is required for the final source head.
