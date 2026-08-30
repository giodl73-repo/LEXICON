# Formarium PITFALL Doctrine Result

Date: 2026-08-30

## Scope

This pass connects Formarium's PITFALL memory to the active rename and
reference workflow without rewriting historical Factorium custody. New
artifacts continue to use Formarium names; frozen `.factorium`,
`.factorium-query`, and `factorium-*` artifacts remain readable historical
imports.

## Findings

- `FRM-PF-01` is mitigated: Reader routes, Factor Guides, generated sites, and
  simulations must point back to canonical Tables instead of becoming another
  definition source.
- `FRM-PF-02` is mitigated: a clean Factor Table cannot hide sense, pivot,
  alternative, maturity, counterexample, or disputed-analysis boundaries.
- `FRM-PF-03` is mitigated: synthetic campaigns and proof-set simulations stay
  separate from reader value, field-promotion, broad NLP, runtime, and
  publication-readiness claims.
- `FRM-PF-04` is solved for custody: the rename preserves historical imports
  while active contracts use Formarium names.
- `FRM-PF-05` is mitigated: software, Compose, search, renderers, and Workbench
  remain auxiliary to the books and Factor Tables.
- `FRM-PF-06` remains open: the public Formarium/LEXICON identity and local
  `factorium` checkout path can still confuse onboarding unless each new pass
  states the active public name, local path, historical imports, and safe edit
  surface together.
- PITFALL validation exposed stale source-digest bindings across 42 current
  entries and views. The first failing artifact was
  `entry:amount-concentration-composition`, whose source currently hashes to
  `ab9ca3b109a4225ac80cbaf8141fcaa77b003f81aaff8129b060df8012b7c820` while
  the assurance sidecars still carried the previous digest. This pass refreshes
  the V0, V1, V2, and V3 assurance bindings from their matching reference
  manifests so historical import validation and the current Formarium sidecar
  fail closed again on future drift.

## Role coverage

The existing role set covers the PITFALL surface. Parliament roles hold
factorization, evidence, controls, leakage, and method discipline; Editorial
roles hold claims, numeracy, lookup, architecture, and taxonomy boundaries;
Assurance roles hold provenance, mappings, equations, domains, and
cross-paradigm loss; Stakeholders hold implementation, benchmark consumption,
reader value, and product cost. No new role is required by this doctrine pass,
but `FRM-PF-06` should be cited during onboarding and portfolio reports until
the public-name/local-path split disappears from normal work.

## Tracker integration

For portfolio scoring, Formarium/LEXICON should be flagged as a high-value
PITFALL adopter: it has repeated synthetic/null-result evidence, a live rename,
many publication projections, and external reader gates that are easy to
overclaim. PITFALL is valuable here because it separates internal mechanics,
reader evidence, research novelty, publication readiness, and customer-facing
identity before those claims reach TRACKER summaries.

## Validation

- `cargo fmt --check` passed.
- `cargo test --all-targets` passed.
- `cargo clippy --all-targets --all-features -- -D warnings` passed.
- `node tools\build_formarium_contracts.js --check` passed.
- `python C:\src\tracker\repos\standards-protocols\roles\tools\check_roles.py .`
  passed.
- `git diff --check` passed.
- `pwsh -NoProfile -File tools\render_proof_set.ps1 -Edition sim-66`
  was attempted but could not run because `pandoc` is not installed in this
  shell; therefore `node tools\check_formarium_canonical.js` could not inspect
  `target\proof-set-sim-66\manifest.json`.

## Status

Complete.
