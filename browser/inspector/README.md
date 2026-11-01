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

Open http://127.0.0.1:4188/LEXICON/inspector/. The draft provides separate reference, optional
relations and optional query editors, UTF-8 file imports and two small authored
examples. Rust receives a JSON envelope containing the three document strings.
Each document is capped at 512 KiB UTF-8; the envelope at 2 MiB. Native canonical
transport is enforced without silently repairing LF/BOM/order failures.
Queries require a supplied relations document and pass native declared-source
checks. Empty optional fields are reported as not requested. The result retains
the exact request, native canonical texts/digests, declared query state and
explicitly unperformed Markdown/filesystem/review-assurance checks.

The standalone workspace/lockfile does not change the main Cargo dependency
graph. Test-only input includes the full 314,276-byte current reference, which is
not embedded in the WASM binary. Authored examples are software demonstrations,
not canonical Tables or reader evidence. Software uses the existing MIT scope;
reference/documentation content retains LICENSE-CONTENT.md. Neither scope changes.

Imported originals are retained as exact UTF-8 bytes, separately from current
editor text and validated canonical exports. Textarea display normalization does
not change imported payloads. Editing uses textarea LF text; the explicit LF-copy
action removes BOM/CR transport while preserving the original download. It does
not reorder records, repair grammar or renew declared query source hashes.
Every edit/import/example invalidates prior reports and canonical downloads.
File reads, worker startup and computation have separate 5/12/10-second limits;
retired readers/workers cannot overwrite newer inputs or results. Restart retains
inputs. Current-input, original, exact request, native report and canonical
downloads state which bytes they contain.

Seven native consumer tests, strict host/wasm Clippy and fourteen local Chromium
checks pass, including 62 exact native/WASM responses, own inputs, imports and
exports, byte bounds, deadlines/recovery, stale completions and mobile keyboard
use. Static source/lockfiles, a portable build/test ZIP, exact-commit full-repo
archive, WASM/bindings, build provenance, existing licenses and verbatim notices
are accessible independently of the worker. The complete helper is under its
5 MB budget; private native-case/scratch files are excluded from staging.
See [BUILD.md](BUILD.md) for portable archive scope and rebuild commands.
Hosted and publication qualification remain pending. The main
native audit has 84 passing tests and three content/snapshot failures, retained
as required-success gates. The strict custody audit remains nonzero/not-ready.
The first hosted Linux audit adds two founding-control snapshot failures
(82 pass, five fail): HRR-64 transfer reports 456/512 instead of the frozen
452/512 Windows result, which also changes the dependent role-bakeoff digest.
Those results are preserved without changing controls or frozen expectations.
See the wave's integration and plan-review records; no gate is waived or hidden.

The portable adapter labels a maximum of 4,294,967,295 for query budgets and
node depths on both native and WASM. The native grammar itself still uses
pointer-sized integers. This guard admits the common wasm32 subset without
silently changing supplied numbers; invalid syntax still belongs to the native
parser. The original source remains unchanged.
