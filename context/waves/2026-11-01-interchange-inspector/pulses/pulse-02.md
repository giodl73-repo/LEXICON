# Pulse 02: multi-document browser interaction

Status: local UI qualification in progress; not a release or deployed tool.

Implement INSPECT-01 through INSPECT-05 over the unchanged Rust consumer:
three document editors, optional relations/query, authored fixtures, UTF-8
file imports, separate original/current/canonical downloads, exact native
request/report and explicit unperformed-check/declared-state reporting.

Preserve imported raw payloads despite textarea display normalization. An
explicit LF-copy action changes only transport and invalidates output. No
JavaScript parsing, canonical ordering, digest correction or approval transfer.
Fence file completions and worker messages by current reader/worker identity,
document token and request revision. Enforce 512 KiB UTF-8 documents and a
2 MiB request, with separate 5-second file, 12-second startup and 10-second
computation deadlines. Worker restart must retain inputs.

Validation must cover byte-exact downloads, CRLF/BOM and malformed UTF-8,
stale source hashes, worker/file faults and late completion, mobile overflow,
keyboard operation and the existing 48-response native/WASM corpus. The Rust
core, reference content, approval metadata and published edition remain intact.
Source/legal delivery and hosted publication proof remain separate open gates.

## Local result

Eleven Chromium tests pass with zero retries, skips or unexpected results.
They cover all 48 exact native/WASM responses and current 133-entry reference
input, byte-exact original/current/request/report/canonical downloads, stale
query sources, malformed UTF-8 and byte limits, all three deadlines, startup
and computation recovery, worker crash, late file/worker completion, stale
export removal, and mobile keyboard use without horizontal overflow. Mobile
390-pixel and desktop screenshots were visually inspected. The Rust/WASM
binary is unchanged at 321,555 bytes, SHA-256
`c9d4ddafb876e36fd0408a858cc1c9bf826368fc1bbffe286e1eb6942f578307`.
See `../ui-verification.json` for tested source/artifact and screenshot hashes.

AI-simulated result review: Schema Implementer passes unchanged Rust grammar
and declared-source behavior; Evidence & Claims Editor passes explicit
declared-state and unperformed-check language; Research Integrity & Provenance
passes separate raw/current/canonical custody and revision/deadline controls.
This closes the local interaction slice, not publication or book readiness.
The three native content-custody failures remain required-success gates.
INSPECT-06 still needs complete source/legal delivery, clean hosted builds and
live artifact/browser evidence while preserving the existing published edition.
