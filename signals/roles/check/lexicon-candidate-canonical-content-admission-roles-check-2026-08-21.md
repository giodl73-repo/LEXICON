---
skill: roles-check
topic: lexicon-candidate-canonical-content-admission
date: 2026-08-21
roles_used: 5
p1_count: 0
verdict: APPROVED
---

# Lexicon Candidate Canonical Content Admission Role Check

Status: fixed point; pass

## Artifact

Thirty-seven source-reviewed candidate drafts are copied without semantic
expansion into `tables/entries/` and declared in
`reference/lexicon-candidate-admissions-v1.json`. The transition establishes
canonical identity at `candidate` maturity.

## Selected roles

| Role | Selection reason |
|---|---|
| Compositional Semantics Steward | Reviews the 205 sense identities and authored decompositions. |
| Factorization Method Steward | Reviews factor preservation and alternative/stopping boundaries. |
| Reference Lexicographer | Reviews headwords, sense separation, and cross-reference custody. |
| Concept & Taxonomy Boundary Editor | Reviews domain taxonomies, examples, and stop rules. |
| Research Integrity & Provenance | Reviews exact source retention, prior reviews, and admission identity. |

## Review

### Compositional Semantics Steward

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 1 | Canonical identity could be mistaken for universal semantic correctness. | P2 closed | All entries | Retain candidate maturity and each authored alternative/stopping boundary. Closed. |
| 2 | Surface labels could become implicit graph relations. | P2 closed | Reference build | Admit no new relation records in this batch. Closed. |
| 3 | Shared labels could collapse distinct senses across owners. | P3 closed | Sense tables | Keep sense IDs entry-scoped and reject within-entry duplicates. Closed. |

### Factorization Method Steward

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 4 | Wrapped root factors could be split into invented dimensions. | P2 closed | Root factorizations | Retain authored Markdown and index only declared factor starts. Closed. |
| 5 | Domain mechanisms could displace general factors. | P2 closed | Candidate boundaries | Preserve each draft's routing and failure signs. Closed. |
| 6 | Batch admission could imply factor independence or completeness. | P3 closed | Reference records | Add no independence or completeness claim. Closed. |

### Reference Lexicographer

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 7 | Draft status conflicts with canonical publication. | P2 closed | Status | Canonical copies say `candidate anchor entry`; historical drafts remain unchanged. Closed. |
| 8 | Link depth changes can strand sources and owners. | P2 closed | Cross-references | Rewrite repository-relative paths and require link validation. Closed. |
| 9 | Canonical entries require stable discoverable identities. | P3 closed | Admission manifest | Use exact filename-derived IDs and generated alphabetical catalogs. Closed. |

### Concept & Taxonomy Boundary Editor

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 10 | Named ecological, clinical, legal, linguistic, and social classes may become open-ended taxa. | P2 closed | Sense and boundary sections | Admit only the reviewed senses; examples and frameworks remain factors or external authorities. Closed. |
| 11 | Bulk admission may invite completion by sibling enumeration. | P2 closed | Batch boundary | Stop after the named 37-entry corpus. Closed. |
| 12 | Pointer generation could turn every noun into a quasi-entry. | P3 closed | Pointer census | Require reuse, recurrence, exact occurrence, and a bounded cue. Closed. |

### Research Integrity & Provenance

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 13 | Moving discovery files would erase the original evidence state. | P2 closed | Source custody | Copy rather than move; retain all dated drafts and briefs. Closed. |
| 14 | Admission could discard source limitations. | P2 closed | Sources and provenance | Preserve the complete section in every canonical copy. Closed. |
| 15 | Prior noncanonical reviews do not alone authorize canonical identity. | P2 closed | Assurance | Bind this owner-authorized admission review to exact canonical source hashes. Closed. |

## Synthesis

Roles reviewed: 5  
P1 blockers: 0 | P2 issues: 0 | P3 notes: 0

Verdict: **APPROVED**

Top finding: canonical identity and evidence maturity must remain separate.

Cross-role consensus: the semantic content passed its prior source and role
reviews; canonical admission is acceptable because the merge preserves those
bytes in a stable Table grammar, retains candidate maturity, and adds no
relations or outcome claims.

## Amendments

1. Bind every admitted entry hash to this admission review.
2. Validate historical/canonical provenance parity and all rewritten links.
3. Run pointer admission as a separate bounded census after the 91-entry
   reference passes.
