# Wave 6 Cross-Table Relation Review

Status: fixed point; retain existing relation set

## Decision

Retain the 11 reviewed relations in `reference/lexicon-relations-v2.lexicon`.
Add no roadmap relation.

## Gate applied

A relation is admitted only when the edge has a distinct reusable reader or
composition job, a named direction, source and target factor owners, closure
conditions, applicability metadata, provenance, and a reviewed example that
cannot be represented adequately by Table dependencies and cross-references.

## Candidate seams reviewed

| Seam | Potential edge | Disposition | Reason |
|---|---|---|---|
| norm to institution/policy | governs or constitutes | no edge | direction and authority vary by norm kind and institution; current owners and dependencies are safer |
| responsibility to law/organization/causation | attributes or answers to | no edge | moral, legal, organizational, and causal relations have different subjects and closure conditions |
| political authority to public policy/law | authorizes | no edge | jurisdiction, office, delegation, effective time, and legal source are required before a typed edge is valid |
| premise/inference to conclusion | supports or derives | no new edge | existing `f3-inference-observation` covers the reviewed evidence chain; formal consequence varies by logic |
| health intervention to outcome | affects | no edge | temporal response does not establish causal effect; a typed edge would overclaim without contrast and population |
| translation to meaning/equivalence | preserves | no edge | preservation is dimension-, purpose-, language-, and evaluator-relative |
| culture/tradition to ritual | manifests | no edge | community classification and practice boundaries are fluid and standpoint-dependent |
| work to performance/reception | realizes or receives | no edge | work/instance ontology and audience history need distinct event-specific records, not a universal Table edge |

## Evidence

- relation count remains 11;
- relation SHA-256 remains
  `c4fdc129701bf4bee822754672d6dd11361c9507beb42f7942346bee4b92d27a`;
- all 32 roadmap Tables expose reviewed cross-references and stopping
  boundaries;
- the reconciliation contract records this disposition and the checker
  verifies the unchanged relation count.

No numerical relation target exists. A later relation requires a separate
evidence and role review.
