# Pulse 03: source/legal delivery and published-edition custody

Status: implementation and local qualification; hosted verification pending.

The public helper is staged through a runtime allowlist under the actual
`/LEXICON/inspector/` prefix. Native-case and scratch-request payloads stay
outside that tree. Separate static routes expose Rust source/locks, a complete
portable build/test ZIP, an exact-commit full-repository archive link, compiled
WASM/bindings, build provenance, file hashes and existing software/content
scopes. Twenty-seven resolved Cargo dependencies, including build-time macros,
retain verbatim notices. Thirteen pinned Rust 1.95.0 library notice files retain
their original byte hashes and licenses. The complete helper is below 5 MB.

The source ZIP is extracted outside Git to repeat all six consumer tests,
fourteen browser checks and 48 exact native/WASM responses. This detects missing
compile-time includes and test inputs. Compiler workspace/Cargo-home paths are
remapped to remove literal local paths. Independent directory builds still
produced different code/name sections despite identical data sections and
passing behavior. Cross-directory binary identity is therefore **not proven**;
both hashes and failed comparisons are retained. No Cargo disambiguator override
or validator change is introduced to force equality. Qualification compares
every original/rebuilt native input/response and later requires the exact
hosted artifact to match deployment, rather than claiming cross-host identity.

Live-manifest inspection corrected the publication baseline: **sim-67**, source
`0526d86ff5629abbda26affb9bf8666e7bee7088`, Pandoc 3.9. The current failed
workflow's sim-69 target was never evidence that sim-69 was live. The captured
manifest's legacy `site_file_count: 270` is also not a full inventory: its
aggregate binds 523 files, and the actual tree has 528. Proof/search/index hashes
and independently fetched book/dictionary pages complete the baseline.

The clean pinned source is rendered separately. With Pandoc 3.9 and LF output,
all 523 aggregate files, the proof/search/index and dictionary match live
hashes. The Windows book page differs by whitespace and is correctly rejected
by the strict 528-file stager. No mismatching book files are copied. A new
read-only PR workflow will repeat the checks on Linux, preserve evidence and
run the current native/custody gates independently. It has no deployment token,
Pages environment or deployment step. Existing book/workspace review failures
are not waived by auxiliary success.

AI-simulated result review: Research Integrity & Provenance passes explicit
source scopes, upstream notices and retained negative comparisons; Evidence &
Claims Editor passes the corrected live-edition/census boundary and unproven
cross-directory identity. Reference Architecture Editor keeps the hosted
528-file book comparison and any future navigation/manifest overlay open.
Schema Implementer keeps clean-source, hosted source-ZIP replay and live
artifact proof open. Current book review custody remains red.

## First hosted evidence

Run `41349782846` at `0aeca4b` confirms the content-custody failure. Its complete
Linux native audit reports **82 passing and five failing** tests, versus 84/3
on Windows. Two additional frozen-control expectations differ: transfer HRR-64
is 456/512 exact and 1,992/2,048 roles rather than 452/512 and 1,988/2,048;
the binding digest is `4470d463ff16df9c63daf87492161bd7db923d5321b776dfcab4a15acb7555ca`
rather than `a6c19ea8a47c5de0b343b5de6800b62e1471195833898ba3444131740eb62137`.
The dependent role-bakeoff frozen digest also fails. Same-process repetition
still matches. No cross-platform deterministic-control claim is renewed.

The first workflow submission (`41349504189`) was rejected because runner
context is unavailable at job-level env; workspace context fixes that error.
The first running workflow also exposed a shell pipeline error: `tee` hid the
native test exit status, although the strict custody step correctly failed the
job. Explicit Bash enables pipefail so both failures remain visible. This is a
workflow correction, not a test waiver. The subsequent workflow uses the
official, SHA-pinned wasm-bindgen 0.2.127 binary to avoid repeatedly compiling
the build tool; the library and binding versions are unchanged.
