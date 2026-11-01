# Build the Lexicon inspector

Public repository: **LEXICON**. Active product: **Lexicon**. The historical
portfolio checkout is `repos/knowledge-systems/factorium`; frozen Formarium and
Factorium imports retain their original paths and contracts.

The portable source ZIP contains all first-party source and compile-time
includes needed to build the inspector and run its six consumer tests and
48-response browser qualification corpus. It is not the full reference
repository. Use the UI's exact-commit full-repository archive for the books,
Tables, historical artifacts and complete native corpus/workspace tests.
The included current reference is consumer test input, not a book release.

Install Rust **1.95.0**, its `wasm32-unknown-unknown` target, **wasm-bindgen-cli
0.2.127**, Python **3.11+**, Node **22**, and Chromium through Playwright.
Commands below run from the extracted ZIP's root or a repository checkout:

```
rustup target add wasm32-unknown-unknown --toolchain 1.95.0
cargo install wasm-bindgen-cli --version 0.2.127 --locked
cargo +1.95.0 test --locked --manifest-path browser/inspector/Cargo.toml
cargo +1.95.0 clippy --locked --manifest-path browser/inspector/Cargo.toml --all-features --all-targets -- -D warnings
cargo +1.95.0 clippy --locked --manifest-path browser/inspector/Cargo.toml --lib --features wasm --target wasm32-unknown-unknown -- -D warnings
npm --prefix browser/inspector ci
npm --prefix browser/inspector exec -- playwright install chromium
python -B browser/inspector/build-check.py
npm --prefix browser/inspector run test:pages
```

The builder remaps compiler workspace paths to `/lexicon` and Cargo-home paths
to `/cargo`, preserving caller-supplied Rust flags. This changes compiler source
locations only, never supplied interchange or parser behavior. Runtime build
proof binds compile-time source/includes and generated artifact hashes; staging
rejects changed source or artifacts until rebuilt.

`python -B browser/inspector/verify-source.py` extracts the source ZIP outside
Git and repeats all six consumer tests, 48 native/WASM responses and fourteen
browser checks. It compares every original/rebuilt native request and response
and records both WASM hashes. Cross-directory binary reproducibility remains
unproven: compiler remapping removes literal local paths, but the WASM name and
code sections still differed between the tested source locations. No claim of
byte-identical builds across directories or hosts is made. Hosted publication
must instead verify the exact tested artifact against every deployed file.

The builder generates the bound WASM and 48 native responses in the ignored
`target/inspector-preview/`. That directory contains large test inputs and
scratch requests; **never upload it as a website**.

In a Git checkout, stage the bounded site with:

```
python -B browser/inspector/stage.py
```

Staging requires a clean checkout with LF source bytes matching Git. During
development, `--preview` permits dirty sources and labels that fact in the
build provenance and inventory. `build-check.py` also stages this local preview.
A source ZIP extraction without `.git` can rebuild the runtime, stage the helper
and replay the consumer/browser tests. Its `SOURCE-PROVENANCE.json` records the
archive's declared source commit and hashes; it is not an independent Git
attestation. Changed archived source bytes are marked dirty and require preview
mode. Use a clean Git checkout for hosted release qualification.

The staged helper is `target/pages/LEXICON/inspector/`, served under the real
project prefix `/LEXICON/inspector/`. Its explicit runtime allowlist excludes
native QA cases and scratch requests. The complete helper, including source,
notices and inventory, must fit in **5,000,000 bytes**. Rust source ZIP, compiled
WASM, bindings, provenance and existing software/content licenses are separate
downloads. Cargo dependency notices include build-time proc macros; Rust
library notices are preserved from the pinned distribution.

Staging and local software tests do not certify current review-source custody,
the frozen/current workspace relationship, semantic truth, reader outcomes or
a book release. Those native gates remain visible and fail closed. The live
book manifest currently identifies **sim-67** at source
`0526d86ff5629abbda26affb9bf8666e7bee7088`; the failed newer workflow's sim-69
target is not evidence of publication. Hosted delivery must preserve the live
edition and separately qualify its source, render and navigation.
