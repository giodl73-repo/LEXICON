---
skill: roles-check
topic: lexicon-candidate-canonical-merge-plan
date: 2026-08-21
roles_used: 8
p1_count: 0
verdict: APPROVED-WITH-CONDITIONS
---

# Lexicon Candidate Canonical Merge Plan Role Check

## Artifact

`context/waves/2026-08-21-candidate-canonical-merge/LEXICON-CANDIDATE-CANONICAL-MERGE-PLAN.md`
is an editorial admission and migration plan spanning semantic ownership,
reference contracts, navigation, publication, provenance, and product scope.

## Selected roles

| Role | Selection reason |
|---|---|
| Compositional Semantics Steward | The merge creates 205 canonical sense identities and many factorizations. |
| Factorization Method Steward | Candidate root factors and pivots become reusable reference structure. |
| Reference Lexicographer | Headwords, senses, links, and ownership move into the primary reference. |
| Reference Architecture Editor | Thirty-seven entries alter catalogs, books, sequence, and interchange. |
| Concept & Taxonomy Boundary Editor | Several drafts contain domain labels that must remain factors or examples. |
| Research Integrity & Provenance | Discovery evidence and canonical bytes must remain reconstructable. |
| Reference Practitioner | The batch must improve lookup without confusing maturity or authority. |
| Product Owner | A 68% entry-count increase adds substantial editorial and navigation cost. |

## Review

### Compositional Semantics Steward

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 1 | Candidate senses are already explicit, but admission could imply one universally correct decomposition. | P2 | Admission contract | Retain alternatives, dependencies, stopping boundaries, and candidate maturity verbatim. |
| 2 | Surface headwords cannot serve as interchange identities. | P2 | Step 3 | Use stable normalized entry and sense identifiers and reject duplicates. |
| 3 | Repeated roles and shared entities need not create new relations. | P3 | Step 5 | Keep pointers nonsemantic and admit no inferred graph edges in this wave. |

### Factorization Method Steward

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 4 | Root-factor extraction from prose could split dependent phrases incorrectly. | P2 | Step 3 | Preserve each authored factor line as one declared factor unless manually reviewed. |
| 5 | Domain examples inside factorizations could become accidental dimensions. | P2 | Steps 2-3 | Retain the candidate stopping-boundary language and do not generate senses from examples. |
| 6 | Candidate factors need an exact mechanical count and identity audit. | P3 | Verification | Record pre/post counts and fail on duplicate normalized factor IDs. |

### Reference Lexicographer

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 7 | Relative links among candidates will break after copying into `tables/entries/`. | P2 | Step 2 | Rewrite and validate every candidate, canonical, and admission-brief link. |
| 8 | Draft status language would contradict canonical publication. | P2 | Step 2 | Change the copied status line to `candidate anchor entry` while leaving historical drafts untouched. |
| 9 | Cross-references may still call newly admitted owners candidates. | P3 | Step 2 | Normalize copied cross-reference prose and targets where authority changes. |

### Reference Architecture Editor

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 10 | The canonical grammar must remain stable across 91 independently authored entries. | P2 | Steps 1-3 | Add a promotion validator for required sections, path identity, and reference parity. |
| 11 | Catalog and book counts must be derived, not hand-maintained. | P2 | Step 4 | Regenerate all contracts and assert exact counts in the canonical checker. |
| 12 | A 91-Table PDF may change pagination enough to reintroduce print failures. | P3 | Step 4 | Re-run full geometry acceptance and representative visual review. |

### Concept & Taxonomy Boundary Editor

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 13 | Ecology, clinical, linguistic, legal, and social entries contain familiar taxonomies. | P2 | Steps 2-3 | Admit only authored governing senses; keep named classes and frameworks as bounded examples. |
| 14 | “Merge all” could be misread as admitting every noun in the drafts. | P2 | Step 5 | Require new pointers to pass recurrence, reuse, and boundary criteria. |
| 15 | The batch needs a defensible stopping rule after 37 entries. | P3 | Claim boundary | State that no additional term is admitted merely to complete a sibling list. |

### Research Integrity & Provenance

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 16 | Moving files would erase the distinction between discovery evidence and admitted publication. | P2 | Step 6 | Copy into canonical paths and retain the original dated drafts and briefs. |
| 17 | Source URLs and limitations must survive the transformation exactly. | P2 | Step 2 | Compare each canonical Sources and provenance section with its source draft. |
| 18 | The final PDF must bind the post-admission clean commit. | P3 | Step 4 | Render transactionally after the implementation commit and record its digest. |

### Reference Practitioner

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 19 | More entries improve coverage but can increase choice overload. | P2 | Reader decision | Preserve alphabetical lookup and distinct governing questions; do not add a second navigation authority. |
| 20 | Candidate maturity may be mistaken for provisional identity. | P3 | Claim boundary | Explain that identity is canonical while evidence maturity remains candidate. |
| 21 | Pointer coverage should help ordinary-term entry without flattening senses. | P3 | Step 5 | Link exact structural occurrences back to owning Tables and retain pointer warnings. |

### Product Owner

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 22 | Admission is owner-authorized but lacks external recurring-need evidence. | P2 | Reader decision | Label the value hypothesis as editorial intent and defer outcome claims to R4. |
| 23 | The batch increases long-term review cost by 37 owners and 205 senses. | P2 | Verification | Record exact complexity added and stop further bulk admission after this bounded corpus. |
| 24 | Publication software must not become the primary deliverable. | P3 | Step 4 | Keep canonical Markdown and Tables primary; change tooling only to maintain their contracts. |

## Synthesis

Roles reviewed: 8  
P1 blockers: 0 | P2 issues: 16 | P3 notes: 8

Verdict: **APPROVED-WITH-CONDITIONS**

Top finding: bulk admission must preserve the distinction between canonical
identity and candidate evidence maturity.

Cross-role consensus: stable identities, source custody, taxonomy boundaries,
and generated-count validation are mandatory; pointer frequency alone cannot
create meaning or authority.

## Amendments

1. Add an explicit historical-source retention and provenance-parity check.
2. Add a promotion validator that compares canonical Markdown, interchange,
   senses, factors, paths, and required grammar.
3. Add a bounded pointer census and stop rule; do not create pointers from all
   headwords, senses, examples, or taxa.
