# Formarium Canonical Naming

Status: implementation complete; external reader evidence unchanged

## Frame

Working owner system: the reviewed Formarium reference, books, renderer, and
validation tooling already work.

Missing shared capability: active machine-readable contracts and CLI surfaces
still defaulted to the former Factorium namespace after the public rename.

Thesis: making Formarium canonical for new schemas, extensions, commands,
source identities, generated UX, and documentation removes a permanent
dual-name tax without rewriting historical custody.

Disproof: stop if the migration changes semantic records, drops legacy
readability, invalidates reviewed source custody, or prevents deterministic
reproduction of `sim-65`.

## Audit

The previous active defaults were `.factorium`, `.factorium-query`,
`factorium-*` headers, the `factor` Cargo package, and `sim-65`. Hundreds of
historical paths also contain Factorium because the prior active wave and
review packets were created under that name. Moving those archives would
invalidate exact source paths and assurance evidence.

## Slice

`sim-66` is the smallest complete forward migration:

- `formarium` Cargo package and CLI error prefix;
- V3 reference, V1 relation, V3 assurance, V1 Composition Query, and V1 pointer
  envelopes under `.formarium` and `.formarium-query`;
- Formarium-native publication entry, procedure, and maturity-scale sources;
- Formarium DOM globals and handoff selectors;
- deterministic generation and static/browser acceptance checks;
- read compatibility for frozen Factorium envelopes.

## Result

See `FORMARIUM-CANONICAL-NAMING-RESULT.md`,
`FORMARIUM-CANONICAL-NAMING-ROLE-REVIEW.md`, and
`FORMARIUM-PITFALL-DOCTRINE-RESULT.md`.
