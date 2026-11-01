# Draft interchange inspector

Auxiliary consumer of existing Lexicon Rust parsers. This is a local prototype,
not a deployed site, R6 Workbench, book release or semantic/review approval.
Books and canonical Tables retain authority. Inputs and paths remain local/inert.

Use Rust 1.95.0 with wasm32-unknown-unknown and wasm-bindgen-cli 0.2.127, Python,
Node 22 and installed Chromium:

```
cargo +1.95.0 test --locked --manifest-path browser/inspector/Cargo.toml
cargo +1.95.0 clippy --locked --manifest-path browser/inspector/Cargo.toml --all-features --all-targets -- -D warnings
cargo +1.95.0 clippy --locked --manifest-path browser/inspector/Cargo.toml --lib --features wasm --target wasm32-unknown-unknown -- -D warnings
npm --prefix browser/inspector ci
python -B browser/inspector/build-check.py
npm --prefix browser/inspector run test:pages
python -B browser/inspector/serve-check.py
```

Open http://127.0.0.1:4188/. The draft accepts a JSON envelope whose `reference`,
optional `relations` and optional `query` fields contain raw document strings.
Each document is capped at 512 KiB UTF-8; the envelope at 2 MiB. Native canonical
transport is enforced without repairing LF/BOM/order failures in JavaScript.
Queries require a supplied relations document and pass native declared-source
checks. Empty optional fields are reported as not requested. The result retains
the exact request, native canonical texts/digests, declared query state and
explicitly unperformed Markdown/filesystem/review-assurance checks.

The standalone workspace/lockfile does not change the main Cargo dependency
graph. Test-only input includes the full 314,276-byte current reference, which is
not embedded in the WASM binary. Authored examples are software demonstrations,
not canonical Tables or reader evidence. Software uses the existing MIT scope;
reference/documentation content retains LICENSE-CONTENT.md. Neither scope changes.

Six native tests, strict host/wasm Clippy and two local Chromium checks pass,
including 48 exact native/WASM responses and an own-input worker task. Full UI,
file recovery/export/accessibility/deadline tests and deployment/source/legal
custody remain pending. The main native audit has 80 passing tests and four
pre-existing content/snapshot failures after correcting checkout line endings.
See the wave's integration and plan-review records; no gate is waived or hidden.
