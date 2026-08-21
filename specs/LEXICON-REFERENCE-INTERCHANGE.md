# Lexicon Reference Interchange

Status: current canonical contract

## Canonical files

- `reference/lexicon-reference-v4.lexicon`
- `reference/lexicon-relations-v2.lexicon`
- `reference/lexicon-assurance-v4.lexicon`
- `fixtures/composition/*.lexicon-query`
- `volumes/01-structure-quantity-choice/lexicon-pointer-registry-v2.lexicon`

The canonical headers are `lexicon-reference-v4`,
`lexicon-relations-v2`, `lexicon-assurance-v4`,
`lexicon-composition-query-v2`, and `lexicon-pointer-registry-v2`.

`tools/build_lexicon_contracts.js` deterministically derives the Lexicon
contracts from the last reviewed Factorium artifacts plus the explicit
Lexicon admission manifests. The 2026-08-21 candidate admission adds 37 entry
records at candidate maturity and 20 noncanonical pointer labels. The domain
admission adds another 10 candidate-maturity entry records and no pointer
labels. Five funded roadmap manifests add 32 candidate-maturity entries and no
pointer labels. None of these admissions adds a relation. The resulting
reference contains 133 entries, 846 senses, 1,419 factors, and 100 specialized
views; assurance binds its 133 entries, 100 views, and 11 relations with 244
exact records.

The immutable admission inputs are:

- `reference/lexicon-candidate-admissions-v1.json`
- `reference/lexicon-domain-admissions-v1.json`
- `reference/lexicon-roadmap-wave-1-admissions-v1.json` through
  `reference/lexicon-roadmap-wave-5-admissions-v1.json`
- `reference/lexicon-admission-index-v1.json`
- `reference/lexicon-roadmap-reconciliation-v1.json`

The reconciliation contract enumerates all 32 roadmap entries and 166 senses,
records the resolution of 14 previously duplicated sense-ID groups, and binds
the decision to retain the existing 11-relation set. The contract builder
rejects any duplicate active sense identity.

## Legacy imports

The parser continues to accept the frozen `factorium-reference-v0` through
`factorium-reference-v2`, `factorium-relations-v0`,
`factorium-assurance-v0` through `factorium-assurance-v2`, and
`factorium-composition-query-v0` envelopes. It also accepts the frozen
`formarium-reference-v3`, `formarium-relations-v1`,
`formarium-assurance-v3`, and `formarium-composition-query-v1` envelopes.
These are read compatibility formats. New files, examples, tests, generated
projections, and documentation must use Lexicon headers and extensions.

## Validation

```powershell
node tools\build_lexicon_contracts.js --check
node tools\check_lexicon_candidate_admissions.js
node tools\check_lexicon_domain_admissions.js
node tools\check_lexicon_roadmap_admissions.js
node tools\build_lexicon_roadmap_reconciliation.js --check
node tools\check_lexicon_roadmap_ordinary_language.js sim-75
cargo run --quiet -- reference-check reference\lexicon-reference-v4.lexicon .
cargo run --quiet -- reference-sidecar-check reference\lexicon-reference-v4.lexicon reference\lexicon-relations-v2.lexicon reference\lexicon-assurance-v4.lexicon .
```
