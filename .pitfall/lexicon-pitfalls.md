# Lexicon Pitfalls

These entries capture recurring failure classes for Lexicon's reference,
research, publication, and rename boundaries.

## FRM-PF-01: Reader Or Guide Becomes A Second Authority

**Status:** MITIGATED

**Pattern:** A teaching route or applied guide copies definitions, hides loss,
or creates local conclusions that compete with the canonical Tables.

**Domain:** Two-book publication architecture, Factor Guides, generated sites,
and companion explanations.

**Detection difficulty:** Companion prose can look helpful while silently
forking authority.

**Structural solution:** Require exact Table links, projection-loss labels,
frontier/unresolved state, and explicit "not a third authority" boundaries.

**Evidence:** `specs/TWO-BOOK-PRODUCT-ARCHITECTURE.md`, `README.md`, and
`.roles/ROLE.md`.

## FRM-PF-02: One Plausible Factorization Becomes Universal

**Status:** MITIGATED

**Pattern:** A convenient decomposition is presented as the canonical answer
without preserving sense, pivot, alternative, constraint, or counterexample
context.

**Domain:** Factor Tables, specialized views, Factor Guides, and cross-paradigm
mappings.

**Detection difficulty:** A clean table can hide ambiguity better than messy
prose.

**Structural solution:** Preserve senses, alternatives, pivots, maturity,
counterexamples, disputed analyses, and local applicability.

**Evidence:** `PRODUCT_PLAN.md`, `specs/FACTOR-TABLE-ENTRY.md`, and
`specs/FORMARIUM-ENTRY-GRAPH.md`.

## FRM-PF-03: Synthetic Evidence Is Promoted Too Far

**Status:** MITIGATED

**Pattern:** Synthetic exact-match, simulation, or authored campaign results are
treated as reader value, field promotion, broad NLP quality, or runtime evidence.

**Domain:** Founding research, Formography track, proof-set simulations,
synthetic user campaigns, and publication readiness.

**Detection difficulty:** Reproducible synthetic numbers can feel stronger than
their scope permits.

**Structural solution:** Keep evidence-class labels, null results, external
reader gates, and role-reviewed claim boundaries explicit.

**Evidence:** `CONTEXT.md`, `.roles/ROLE.md`, `PRODUCT_PLAN.md`, and
`docs/research/`.

## FRM-PF-04: Rename Breaks Historical Custody

**Status:** SOLVED

**Pattern:** A public rename rewrites or moves historical artifacts and breaks
review packets, exact source paths, old envelopes, or deterministic
reproduction.

**Domain:** Factorium-to-Lexicon migration, schema headers, generated
artifacts, and wave archives.

**Detection difficulty:** Mechanical rename tools make broad edits look clean
while invalidating evidence custody.

**Structural solution:** Use Lexicon names for new contracts while preserving
legacy Factorium imports and historical archive paths.

**Evidence:** `AGENTS.md`, `specs/FORMARIUM-REFERENCE-INTERCHANGE.md`, and
`context/waves/2026-08-19-formarium-canonical/WAVE.md`.

## FRM-PF-05: Software Displaces The Reference

**Status:** MITIGATED

**Pattern:** Workbench, renderers, search, Compose, or automation become the
primary product and start shaping the reference around tool affordances.

**Domain:** Lexicon Workbench, static projections, composition lab, search,
and validation tooling.

**Detection difficulty:** Tools produce visible progress faster than reference
quality or reader evidence.

**Structural solution:** Keep books and Factor Tables as primary deliverables;
label generated outputs as projections; require role review and validation
before claims broaden.

**Evidence:** `README.md`, `PRODUCT_PLAN.md`, `ROADMAP.md`, and `.roles/ROLE.md`.

## FRM-PF-06: Public Name And Local Path Split Confuses Onboarding

**Status:** MITIGATED

**Pattern:** A user follows Lexicon/LEXICON-facing docs while the local checkout
and some historical artifacts still use `factorium`, then edits the wrong file,
cites an obsolete identity, or treats frozen imports as active product surfaces.

**Domain:** Repository onboarding, `AGENTS.md`, `CONTEXT.md`, public identity
notes, generated site manifests, historical `.factorium` imports, current
`.formarium` contracts, proof-set simulations, and portfolio adoption reports.

**Detection difficulty:** Rename custody is historically preserved and valid, so
the failure is not broken evidence; it appears when a new user must decide which
name, path, schema, or generated artifact is active for new work.

**Structural solution:** User-facing onboarding should display the active public
name, local checkout path, frozen historical names, current source contract, and
safe edit path together before any quickstart, simulation, or customer preview
claim.

**Evidence:** `AGENTS.md`, `CONTEXT.md`, `README.md`,
`docs/IDENTITY-AND-CHECKOUT.md`, `docs/pitfall-boundaries.v1.json`,
`context/waves/2026-08-19-formarium-canonical/WAVE.md`,
`context/waves/2026-08-19-formarium-canonical/FORMARIUM-PITFALL-DOCTRINE-RESULT.md`,
`context/waves/2026-08-13-factorium-vision/PROOF-SET-INTERNAL-FIXED-POINT-AUDIT.md`,
and `tests/check-identity-boundary.ps1`.
