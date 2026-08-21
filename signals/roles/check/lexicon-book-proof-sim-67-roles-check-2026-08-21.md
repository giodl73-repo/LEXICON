---
skill: roles-check
topic: lexicon-book-proof-sim-67
date: 2026-08-21
roles_used: 8
p1_count: 5
p2_count: 17
p3_count: 2
verdict: NEEDS-WORK
---

# Lexicon Book Proof `sim-67` Role Review

## Artifact identification

- Type: generated reference-book proof and release projection.
- Artifact: `target/proof-set-sim-67/Lexicon-book-proof-sim-67.pdf`.
- Domain signals: lexicography, reference architecture, evidence claims,
  numeracy, provenance, equations and units, practitioner usability, and
  product/release value.
- Evidence checked: 114 pages; approximately 63,000 extracted words; tagged
  PDF; embedded fonts; 227-source render manifest; canonical validators; 14
  broad visual samples; targeted visual inspection of every page flagged by
  the collision scan.

## Role selection

| Role | Why selected |
|---|---|
| Reference Lexicographer | The proof is the public lookup projection of headwords, senses, pointers, and Tables. |
| Reference Architecture Editor | It must form one coherent and navigable book from many records. |
| Evidence & Claims Editor | The proof's status and readiness claims must match internal rather than reader evidence. |
| Benchmark Numeracy Checker | Counts on the cover and current-state documents must use consistent denominators. |
| Research Integrity & Provenance | The PDF claims a reproducible source identity and depends on source custody. |
| Equation & Units Auditor | The volume contains Formula Tables and quantitative contracts. |
| Reference Practitioner | The book must support rapid independent lookup and application. |
| Product Owner | The key decision is whether this artifact earns publication or further investment. |

## Findings

### Reference Lexicographer

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| RL-1 | Eight pages contain overlapping or clipped table text, making distinctions unreadable. | P1 | PDF pp. 7, 25, 32, 46, 61, 65, 85, 103 | Repair the print architecture and require zero collisions. |
| RL-2 | Pointer records and substantive Tables are interleaved without a persistent record-kind cue. | P2 | Whole book | Separate the pointer index or add unambiguous running labels. |
| RL-3 | The proof has no contents/how-to layer for selecting a sense and following the graph. | P2 | Front matter | Add the concise three-step Lexicon lookup method. |

### Reference Architecture Editor

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| RA-1 | The two-column container cannot safely carry wide canonical Tables. | P1 | Print CSS and eight affected pages | Give Tables a full-width flow and reserve columns for compact pointers. |
| RA-2 | A reference work with no folios, running heads, contents, or end index is not navigable in print. | P2 | Whole book | Add standard reference-book navigation. |
| RA-3 | Print-hidden supplements remove source and provenance structure from the offline artifact. | P2 | Print CSS | Retain minimum custody and provide an edition-specific appendix/manifest. |

### Evidence & Claims Editor

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| EC-1 | The cover omits the manifest's `internally validated projection; not reader-outcome evidence` status. | P2 | PDF p. 1 | Put the evidence class on the cover and colophon. |
| EC-2 | Calling the online target `the published book` overstates the present gate state. | P2 | PDF p. 1 | Use internal-proof or online-companion language until R4/R5 evidence gates close. |
| EC-3 | The proof has no compact limitations note despite strong limitations discipline in the repository. | P3 | Front/back matter | Add a short limitations and evidence-boundary note. |

### Benchmark Numeracy Checker

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| BN-1 | `304 entries` uses an aggregate whose denominator includes 250 pointers and only 54 canonical Tables. | P2 | PDF p. 1 | Lead with `54 canonical Tables` and label 250 pointer-index records separately. |
| BN-2 | Current documents contain 40/53-entry and 57/95-view baselines beside the current 54-entry/100-view state. | P2 | `ROADMAP.md`, `CONTEXT.md`, `README.md` | Mark older numbers as dated snapshots or reconcile current summaries. |
| BN-3 | The PDF has no edition-statistics/coverage table explaining what is present and omitted. | P3 | Front matter | Add one bounded inventory table with canonical, pointer, view, source, and omitted-supplement counts. |

### Research Integrity & Provenance

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| RP-1 | The proof says source `141fa236`, while its manifest records a dirty render and its renderer/CSS landed in later commit `0526d86`. | P1 | Cover, manifest, commit history | Regenerate from a clean commit and bind the final PDF hash to it. |
| RP-2 | The PDF is ignored transient output rather than a custodied release asset. | P2 | `target/` artifact | Publish through an immutable release/checksum record. |
| RP-3 | Detailed source/provenance sections are absent from the offline PDF. | P2 | Print supplements | Preserve minimum source custody with stable edition-specific resolution. |

### Equation & Units Auditor

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| EU-1 | Quantitative and mathematical tables participate in the collision defect. | P1 | PDF pp. 35, 46, 61, 65, 80, 103, 114 | Make them full width and visually regression-test representative formulas. |
| EU-2 | Formula/code text is embedded through Type 3 Cascadia Code subsets. | P2 | PDF fonts | Prefer an embedded TrueType/OpenType face and verify symbol copy/search. |
| EU-3 | Formula source, relation-kind, and validity supplements are omitted in print. | P2 | Formula Tables | Retain a compact local source and validity contract. |

### Reference Practitioner

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| RPRA-1 | A practitioner cannot use the distinctions on eight corrupted pages. | P1 | Confirmed affected pages | Treat zero overlap as a release gate. |
| RPRA-2 | Independent lookup lacks contents, folios, running heads, and a quick usage instruction. | P2 | Whole book | Add the smallest viable print navigation layer. |
| RPRA-3 | Long `Appears in` lists and dense Tables make the pointer stream visually dominate the reader job. | P2 | Pointer records | Move pointers to an appendix/index and let canonical Tables lead. |

### Product Owner

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| PO-1 | The PDF is a strong internal corpus projection but not a shippable book artifact. | P2 | Overall | Continue investment, but block public PDF promotion until print defects and custody are fixed. |
| PO-2 | The pointer-heavy stream increases perceived count and navigation burden more than reader value. | P2 | Whole book | Reframe the product around 54 canonical Tables, with pointers as navigation infrastructure. |
| PO-3 | No external-reader evidence yet establishes findability, comprehension, application, or return use. | P2 | R4/R5 gates | Run The Sieve after the artifact is mechanically sound; do not infer worth from internal validation alone. |

## Synthesis

Roles reviewed: 8

P1 blockers: 5  |  P2 issues: 17  |  P3 notes: 2

Verdict: NEEDS-WORK

Top finding: Eight confirmed pages contain overlapping or clipped text because
wide Tables are flowing through a two-column print layout.

Cross-role consensus: The underlying reference content, canonical validation,
and evidence discipline are credible. The PDF projection and its release
custody are not yet at the level of the underlying work.

## Product value statement

| Field | Result |
|---|---|
| Reader | Practitioners and curious generalists who need to distinguish overloaded concepts and choose an appropriate decomposition. |
| Job | Look up a familiar term, select its intended sense, compare structural choices, and follow factors to deeper Tables. |
| Current friction | Ordinary references separate definitions, formulas, standards, and applied structure; the reader must reconstruct the factorization and its limits. |
| Product change | Lexicon presents governing questions, factorizations, decisive contrasts, selection procedures, failure signs, and linked factors in one repeatable reference grammar. |
| Evidence now | The 54-entry canonical corpus is structurally validated, source-custodied, graph-linked, and broad enough to demonstrate a distinctive reference form. The PDF proves that a compact book projection is possible, not that this projection is finished. |
| Evidence later | Real readers must establish findability, comprehension, application quality, and return use. Domain experts must continue to validate authoritative content. |
| Cost and displacement | The corpus is dense and expensive to maintain; the 250-pointer layer can overwhelm the 54 substantive Tables, and software/format work can displace editorial and reader testing. |
| Continue/merge/stop | Continue Lexicon and repair the proof. Merge pointer records into a clearly subordinate index. Stop adding breadth until reader evidence or a demonstrated owner gap reopens intake. |

## Amendments

1. Replace the two-column all-record stream with a full-width canonical Table
   body plus a separately labelled compact pointer index.
2. Add a PDF acceptance and custody gate: clean source commit, exact hash,
   collision detection, representative visual snapshots, metadata, fonts,
   links, text, and page-count checks.
3. Add minimal front/back matter: internal-proof status, usage steps, inventory,
   folios/running heads, source/license metadata, limitations, and colophon.

## Worthiness verdict

**Lexicon is worthy of continued development and controlled reader testing.**
The distinctive value is the repeated combination of sense separation,
competing factorizations, decisive distinctions, failure signs, provenance,
and graph-following. That is more than a generated glossary.

**This PDF is not worthy of public release in its current form.** Its visible
layout failures, weak print navigation, omitted offline custody, and dirty
source binding are repairable artifact defects, not reasons to abandon the
reference itself.

