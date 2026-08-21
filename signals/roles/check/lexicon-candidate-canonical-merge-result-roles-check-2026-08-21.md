---
skill: roles-check
topic: lexicon-candidate-canonical-merge-result
date: 2026-08-21
roles_used: 6
p1_count: 0
verdict: APPROVED
---

# Lexicon Candidate Canonical Merge Result Role Check

Status: fixed point; pass

## Artifact

The `sim-68` result admits 37 reviewed concept families at candidate maturity,
expands the canonical reference to 91 Tables, and adds 20 census-qualified
pointer labels without adding semantic relations.

## Selected roles

| Role | Selection reason |
|---|---|
| Reference Lexicographer | Reviews canonical identity, sense custody, and book findability. |
| Compositional Mapping Integrity Engineer | Reviews reference, assurance, query, and generated-surface closure. |
| Schema & Interchange Implementer | Reviews deterministic admission contracts and compatibility. |
| Research Integrity & Provenance | Reviews source parity, evidence maturity, and reproducibility. |
| Publication Product Owner | Reviews book inventory, sequencing, and release boundary. |
| Practitioner Representative | Reviews whether the enlarged proof remains usable for lookup and comparison. |

## Review

### Reference Lexicographer

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 1 | All 37 families now have stable canonical owners and alphabetical catalog positions. | P3 closed | Tables and catalog | Retain filename-derived identities. Closed. |
| 2 | The 205 admitted senses preserve their authored governing questions and boundaries. | P3 closed | Sense tables | Keep historical-to-canonical parity validation. Closed. |
| 3 | Canonical status could overstate editorial maturity. | P2 closed | Status and cover | Keep `candidate` maturity and the internal-proof banner. Closed. |

### Compositional Mapping Integrity Engineer

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 4 | Every admitted Table resolves through reference, assurance, catalog, search, and publication records. | P3 closed | Generated contracts | Retain the admission checker in CI. Closed. |
| 5 | The 11 Composition Queries were rebound to the exact enlarged reference hash. | P3 closed | Query fixtures | Continue exact source-hash validation. Closed. |
| 6 | Shared pointer labels could imply undeclared semantic edges. | P2 closed | Pointer v2 | Preserve pointer-only authority and the unchanged 11-relation sidecar. Closed. |

### Schema & Interchange Implementer

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 7 | The builder deterministically derives 91 entries, 624 senses, 1,090 factors, and 100 views. | P3 closed | Reference builder | Keep generated outputs under `--check`. Closed. |
| 8 | Admission manifests separate editorial decisions from the stable Lexicon grammar. | P3 closed | JSON manifests | Version future batches rather than mutating v1/v2 meaning. Closed. |
| 9 | Historical imports remain readable and no frozen Factorium/Formarium contract was rewritten. | P3 closed | Compatibility | Preserve frozen legacy checks. Closed. |

### Research Integrity & Provenance

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 10 | Every canonical copy is deterministic after the declared status/link transformation. | P3 closed | Admission validator | Keep the historical drafts immutable. Closed. |
| 11 | All 91 entry hashes are bound in assurance, including 37 to the admission review. | P3 closed | Assurance | Rebuild bindings whenever canonical prose changes. Closed. |
| 12 | Internal validation does not establish empirical correctness or reader outcomes. | P2 closed | Claims | Retain the result and colophon limitation. Closed. |

### Publication Product Owner

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 13 | The book exposes all 91 Tables before its subordinate 270-record pointer index. | P3 closed | Print sequence | Keep Tables as the primary deliverable. Closed. |
| 14 | Hosted Pages and default proof commands target the same sim-68 edition. | P3 closed | Publication workflow | Keep edition selection synchronized. Closed. |
| 15 | The 377-page proof suits controlled reader testing but not public R5 release. | P2 closed | Release boundary | Require external reader evidence before R5. Closed. |

### Practitioner Representative

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 16 | Representative long titles and dense sense grids render legibly without clipping. | P3 closed | Visual sample | Retain PDF collision and bounds checks. Closed. |
| 17 | The expanded two-column pointer index remains readable and names owning Tables. | P3 closed | Pointer appendix | Keep pointers subordinate and frequency-neutral. Closed. |
| 18 | The enlarged corpus increases lookup choice and may increase navigation burden. | P3 closed | Reader testing | Measure findability and selection confidence next. Closed. |

## Synthesis

Roles reviewed: 6
P1 blockers: 0 | P2 issues: 0 | P3 notes: 0

Verdict: **APPROVED**

Top finding: the complete candidate merge is internally coherent and ready
for controlled external reader testing at candidate maturity.

Cross-role consensus: stable canonical ownership is justified, while external
reader value, empirical correctness, and public R5 readiness remain open.

## Amendments

1. Keep both admission validators in hosted and local validation paths.
2. Preserve the exact candidate-maturity and internal-proof boundaries.
3. Use sim-68 for controlled reader evaluation before maturity promotion.
