# Lexicon Invariants

These entries summarize properties that must remain true for Lexicon's
reference, research, publication, and rename boundaries.

## FRM-I-01: Projection Does Not Create Authority

**Status:** VERIFIED

**Claim:** Reader pages, Factor Guides, generated sites, and simulation outputs
do not create canonical definitions, relations, or domain decisions.

**Why it matters:** Projection authority would fork the reference and make
updates unreplayable.

**Enforcement:** Two-book architecture, generated-site checks, and role reviews
separate canonical Tables from companion projections.

**Evidence:** `specs/TWO-BOOK-PRODUCT-ARCHITECTURE.md`, `.roles/ROLE.md`, and
`git diff --check`.

## FRM-I-02: Historical Factorium Imports Remain Readable

**Status:** VERIFIED

**Claim:** Frozen `.factorium`, `.factorium-query`, and `factorium-*` envelopes
remain parseable historical imports while new active contracts use Lexicon
names.

**Why it matters:** The rename must not invalidate reviewed custody, exact paths,
or deterministic reproduction.

**Enforcement:** Lexicon contract checks derive current contracts without
changing semantic records and preserve legacy import compatibility.

**Evidence:** `specs/FORMARIUM-REFERENCE-INTERCHANGE.md`,
`context/waves/2026-08-19-formarium-canonical/WAVE.md`, and
`node tools\\build_formarium_contracts.js --check`.

## FRM-I-03: Evidence Classes Stay Separate

**Status:** VERIFIED

**Claim:** Synthetic, semantic, model, runtime, reader, field-promotion, and
publication-readiness evidence remain separate.

**Why it matters:** Lexicon repeatedly uses simulations and synthetic
campaigns; conflating them with reader evidence would overstate product value.

**Enforcement:** Product plan non-goals, role review, and wave records label
simulations, null results, and external-reader gates explicitly.

**Evidence:** `PRODUCT_PLAN.md`, `.roles/ROLE.md`, `CONTEXT.md`, and
`context/waves/`.

## FRM-I-04: Equally Expressive Controls Are Preserved

**Status:** VERIFIED

**Claim:** Founding factor-preserving claims preserve packed-feature,
feature-structure, one-hot, and learned factored controls.

**Why it matters:** The founding research is valid only as a bounded semantic
result, not a broad hardware, compression, or language-understanding claim.

**Enforcement:** Benchmark and packet validation commands preserve strong
controls and retained nulls.

**Evidence:** `specs/STRONG-CONTROL-BAKEOFF.md`,
`specs/BINDING-CONTROLS.md`, `docs/STRONG-CONTROL-BAKEOFF-RESULT.md`, and
`cargo run --quiet -- bakeoff`.

## FRM-I-05: Canonical Reference Identity Is Machine-Checked

**Status:** VERIFIED

**Claim:** The current reference, relation, assurance, and composition-query
contracts are validated against exact identities and linked Markdown.

**Why it matters:** A reference project cannot rely on prose-only claims about
catalog completeness, closure, or source custody.

**Enforcement:** Reference, sidecar, closure, and composition-query checks fail
when identities, links, or admitted relations drift.

**Evidence:** `reference/lexicon-reference-v3.formarium`,
`reference/formarium-relations-v1.formarium`,
`reference/formarium-assurance-v3.formarium`, and the README validation
commands.

## FRM-I-06: Public Name, Product Name, Local Path, And Historical Imports Stay Separate

**Status:** MITIGATED

**Claim:** Public repository references use `LEXICON`; active product and
contract references use Lexicon; the local `factorium` checkout is a
historical path; frozen Factorium artifacts remain historical imports only.

**Why it matters:** A contributor can otherwise edit the wrong artifact, cite
an obsolete identity, or treat a frozen import as the current product surface.

**Enforcement:** Onboarding, AGENTS routing, README identity notes, the boundary
manifest, role gate, and retained identity-boundary test keep the four naming
surfaces visible together.

**Evidence:** `AGENTS.md`, `README.md`, `docs/IDENTITY-AND-CHECKOUT.md`,
`docs/pitfall-boundaries.v1.json`, `.roles/ROLE.md`, and
`tests/check-identity-boundary.ps1`.
