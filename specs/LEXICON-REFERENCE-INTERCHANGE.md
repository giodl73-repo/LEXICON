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
labels. Neither admission adds a relation. The resulting reference contains
107 entries, 711 senses, 1,218 factors, and 100 specialized views; assurance
binds its 107 entries, 100 views, and 11 relations with 218 exact records.

The immutable admission inputs are:

- `reference/lexicon-candidate-admissions-v1.json`
- `reference/lexicon-domain-admissions-v1.json`

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
cargo run --quiet -- reference-check reference\lexicon-reference-v4.lexicon .
cargo run --quiet -- reference-sidecar-check reference\lexicon-reference-v4.lexicon reference\lexicon-relations-v2.lexicon reference\lexicon-assurance-v4.lexicon .
```
