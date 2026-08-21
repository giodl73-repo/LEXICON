---
skill: validate-design
topic: lexicon-book-proof-sim-67
date: 2026-08-21
reviewer_count: 11
p1_count: 5
p2_count: 23
p3_count: 16
domain_roles_active:
  - Print Production Designer
  - Reference Information Architect
  - Accessibility Specialist
  - Equation and Units Auditor
  - Research Integrity Reviewer
---

# Lexicon Book Proof `sim-67` Design Review

## Review basis

The review covered the 114-page PDF at
`target/proof-set-sim-67/Lexicon-book-proof-sim-67.pdf`, its generated
`book.html`, print CSS, manifest, PDF renderer, canonical validators, and a
full text extraction. Visual samples covered the front matter, ordinary
pointers, substantial Tables, formulas, and the ending. A bounding-box scan
identified suspected collisions, and pages 7, 25, 32, 46, 61, 65, 85, and 103
were visually confirmed to contain overlapping or clipped table content.

## BLOCK 0 -- Content signal catalogue

| Signal phrase or concept | Domain category |
|---|---|
| Two-column, 114-page printable reference book | print production |
| 250 pointer entries interleaved with 54 canonical Tables | reference information architecture |
| Tagged PDF, dense small type, links, and multi-column reading order | accessibility |
| Formula Tables, quantities, dimensions, and units | equations and units |
| Source commit, manifest, source custody, and reproducible release | research integrity and provenance |

## BLOCK 1 -- Expert roster

### Stock disciplines

| Reviewer | Role |
|---|---|
| Architect | Stock |
| Code-Quality | Stock |
| Documentation | Stock |
| Testing | Stock |
| Process | Stock |
| Implementation | Stock |

### Domain experts

| Signal detected | Expert added | Reason |
|---|---|---|
| Two-column, 114-page printable reference book | Print Production Designer | Pagination, column flow, tables, and physical lookup conventions determine whether this PDF can ship. |
| 250 pointer entries interleaved with 54 canonical Tables | Reference Information Architect | The distinction and sequence between pointer records and substantive Tables determines findability and perceived scope. |
| Tagged PDF, dense small type, links, and multi-column reading order | Accessibility Specialist | Tagging alone does not establish readable order, legibility, or usable navigation. |
| Formula Tables, quantities, dimensions, and units | Equation and Units Auditor | Mathematical symbols and quantity contracts must survive the print projection without clipping or ambiguity. |
| Source commit, manifest, source custody, and reproducible release | Research Integrity Reviewer | The artifact makes source and reproducibility claims that require exact custody. |

BLOCK 1 domain count = 5

## BLOCK 1.5 -- Roster commitment

| Reviewer | Role | Source |
|---|---|---|
| Print Production Designer | Domain expert | Domain |
| Reference Information Architect | Domain expert | Domain |
| Accessibility Specialist | Domain expert | Domain |
| Equation and Units Auditor | Domain expert | Domain |
| Research Integrity Reviewer | Domain expert | Domain |
| Architect | Stock discipline | Stock |
| Code-Quality | Stock discipline | Stock |
| Documentation | Stock discipline | Stock |
| Testing | Stock discipline | Stock |
| Process | Stock discipline | Stock |
| Implementation | Stock discipline | Stock |

Domain row count equals the committed domain count, and every domain name
matches BLOCK 1.

## BLOCK 2 -- Per-reviewer findings

### Print Production Designer

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| PP-1 | Wide tables collide with the adjacent column on eight confirmed pages. | P1 | PDF pp. 7, 25, 32, 46, 61, 65, 85, 103 | Give substantive Tables a full-width print layout or otherwise guarantee that table intrinsic width cannot cross the column boundary. |
| PP-2 | The proof has no printed page numbers or running heads. | P2 | All interior pages | Add folios and an A-Z or entry running head so citations and physical lookup work. |
| PP-3 | The cover is followed immediately by the A stream with no contents, use note, or print index. | P2 | PDF pp. 1-2 | Add a compact contents/how-to page and an end index or explicit appendix boundary. |
| PP-4 | The book ends on the `Workflow` pointer without an end mark, colophon, or source note. | P3 | PDF p. 114 | Add a colophon containing status, edition date, license, source identity, and continuation route. |

### Reference Information Architect

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| IA-1 | The alphabetical stream interleaves 250 short pointers with 54 substantive Tables without a persistent visual legend. | P2 | Whole book | Separate the substantive Table volume from a pointer index, or mark record kind in running furniture. |
| IA-2 | The PDF does not explain the governing reader action: choose a sense, compare structures, then follow factors. | P2 | Front matter | Carry the README's short usage sequence into the proof. |
| IA-3 | Sources, provenance, and other supplements are print-hidden and available only through the online book. | P2 | Print CSS and all canonical Tables | Retain a minimal source/provenance line per Table and provide a stable consolidated source appendix. |
| IA-4 | Alphabetical order is useful for lookup but offers no visible thematic or Reader route. | P3 | Whole book | Add a one-page route map to the separate Lexicon Reader and selected clusters. |

### Accessibility Specialist

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| AX-1 | `Tagged: yes` is positive, but the semantic reading order of a fragmented multi-column stream has not been independently checked. | P2 | PDF structure | Run a screen-reader/order audit and include it in PDF acceptance checks. |
| AX-2 | Pointer-parent text prints at about 0.72rem in a dense two-column layout. | P2 | Pointer records | Raise the minimum print size/leading or move long parent lists to the pointer appendix. |
| AX-3 | Links rely heavily on green color and become ordinary text in monochrome print. | P3 | Cross-references | Add a print-safe affordance or typographic convention for links and destinations. |
| AX-4 | PDF metadata names only the title; author, language, subject, and keywords are absent. | P3 | PDF metadata | Set document language and descriptive metadata during rendering. |

### Equation and Units Auditor

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| EU-1 | Formula-adjacent and quantitative tables are exposed to the same column-collision defect as prose tables. | P2 | PDF pp. 35, 46, 61, 65, 80, 103, 114 | Render mathematical Tables in a full-width block and regression-check symbol cells. |
| EU-2 | Cascadia Code is embedded as multiple Type 3 subsets, which is less robust for formula copy, zoom, and downstream tooling than an embedded TrueType/OpenType font. | P3 | PDF fonts | Prefer a PDF-native embeddable math/code font and test copy/paste of representative symbols. |
| EU-3 | Formula source and validity supplements are omitted from the printed proof. | P3 | Print supplements | Preserve a compact source, relation kind, and validity pointer with each Formula Table. |
| EU-4 | The PDF pipeline has no explicit regression set for superscripts, Greek letters, set symbols, arrows, or dimensional expressions. | P3 | PDF acceptance | Add exact text-extraction and visual fixtures for representative formulas. |

### Research Integrity Reviewer

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| RI-1 | The manifest says `workspace_dirty_at_render: true` and binds the proof to source commit `141fa236`, while the rendering CSS and script were committed afterward in `0526d86`. | P1 | Cover and manifest | Regenerate from a clean committed tree and bind the PDF hash to that exact clean commit. |
| RI-2 | The PDF lives under ignored `target/` output and is not itself in Git custody. | P2 | Release custody | Publish the PDF through a versioned release asset or checksum ledger with immutable edition metadata. |
| RI-3 | The condensed PDF omits the detailed source/provenance sections that support its authority. | P2 | Print supplements | Include minimum custody in the PDF and a resolvable edition-specific source manifest. |
| RI-4 | The PDF metadata has no author, creation basis, license, or source digest. | P3 | PDF metadata | Add author, license, edition, source commit, and artifact digest to metadata/colophon. |

### Architect

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| AR-1 | One multi-column flow is being asked to carry intrinsically wide Tables and compact pointer records, and it fails structurally. | P1 | `.dictionary-book__entries` print architecture | Split the projection into a full-width Table body and a multi-column pointer appendix. |
| AR-2 | Print behavior depends on the full website stylesheet rather than a small independently testable publication contract. | P2 | Generated `assets/site.css` | Extract and version a dedicated Lexicon print stylesheet with explicit invariants. |
| AR-3 | The projection collapses canonical entries, pointer entries, and omitted supplements into one apparent book stream. | P2 | `book.html` | Make record kinds and authority boundaries first-class in the document structure. |
| AR-4 | The generated artifact directory is transient despite the proof being treated as a release candidate. | P3 | `target/proof-set-sim-67` | Define a promotion step from transient build output to a custodied release artifact. |

### Code-Quality

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| CQ-1 | Active generation still emits `factorium-reader-profile` and `factorium-composition-guide-skeleton-v0` in the `sim-67` manifest. | P2 | `tools/render_proof_set.ps1` | Rename active identifiers to Lexicon-native contracts and extend the canonical validator to reject active legacy identifiers. |
| CQ-2 | The renderer selects the first installed browser without a pinned or recorded acceptance range. | P2 | `tools/render_book_proof_pdf.ps1` | Record browser executable/version and make layout acceptance independent of local browser choice. |
| CQ-3 | A fixed two-second delay is used after the browser exits even though process completion is already awaited. | P3 | PDF renderer | Replace the delay with output-file stabilization/validation. |
| CQ-4 | The existing output is deleted before the replacement PDF has passed validation. | P3 | PDF renderer | Render to a temporary file, validate it, then atomically replace the destination. |

### Documentation

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| DOC-1 | The cover does not say `internal proof` or `not reader-outcome evidence`, although the manifest does. | P2 | PDF p. 1 | Put the evidence/status boundary on the cover and colophon. |
| DOC-2 | `full online supplements at the published book` blurs an internal proof with a published release. | P2 | PDF p. 1 | Use `online companion for this internal proof` until the release gate closes. |
| DOC-3 | The proof lacks an edition date and concise change note. | P3 | Front matter | Add date, source revision, and a one-sentence edition scope. |
| DOC-4 | `304 entries: 250 pointers + 54 Tables` is transparent numerically but does not explain that only 54 are canonical substantive entries. | P3 | PDF p. 1 | Label them `54 canonical Tables and 250 pointer-index records`. |

### Testing

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| T-1 | No PDF acceptance test detects text collisions or clipping, allowing eight broken pages to pass. | P1 | PDF pipeline | Add bounding-box collision checks plus raster snapshots for all wide-table patterns. |
| T-2 | The renderer checks only that a file exists and prints its hash. | P2 | PDF renderer | Assert page count, nonempty text, metadata, embedded fonts, link annotations, and zero layout collisions. |
| T-3 | Canonical validators verify HTML contracts but do not verify the PDF projection. | P2 | `tools/check_lexicon_canonical.js` | Add a separate book-proof acceptance command and keep its gate distinct from canonical content validity. |
| T-4 | There is no stored representative fixture covering narrow cells, long tables, formulas, and cross-column continuation. | P3 | Test fixtures | Add a compact print torture page and compare it on every renderer change. |

### Process

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| PR-1 | The PDF was produced after the latest content role review but had no artifact-specific print/release review. | P2 | Execution history | Require a proof-specific review before attaching or linking a PDF. |
| PR-2 | The PDF was rendered from a dirty worktree before the renderer/CSS commit. | P2 | Release process | Require clean-tree rendering or explicitly record and digest every dirty input. |
| PR-3 | Roadmap and context history retain 40/53-entry and 57/95-view baselines beside the current 54-entry, 100-view state without explicit historical labels. | P2 | `ROADMAP.md`, `CONTEXT.md` | Mark old counts as historical snapshots or consolidate the current-state summary. |
| PR-4 | There is no documented retention and supersession policy for generated PDFs. | P3 | Release process | Define edition naming, checksum, publication location, and supersession rules. |

### Implementation

| # | Finding | Sev | Section | Recommendation |
|---|---|---|---|---|
| IM-1 | `display: table; width: 100%` inside CSS columns does not constrain intrinsic table width, causing the observed overflow. | P1 | Print CSS lines 4930-4936 | Avoid wide tables inside columns; use a full-width flow or fixed-layout table rules with verified wrapping. |
| IM-2 | `display: contents` combined with multi-column fragmentation makes entry and table boundaries fragile across browser engines. | P2 | Print CSS lines 4920-4928 | Use explicit block containers and deliberate break rules for print. |
| IM-3 | `overflow: visible !important` converts screen-scroll safety into print collisions. | P2 | Print CSS lines 4930-4941 | Replace visible overflow with print-safe wrapping or layout promotion. |
| IM-4 | Renderer output records a hash but does not emit a sidecar containing page/layout acceptance results. | P3 | PDF renderer | Emit a Lexicon-native proof manifest beside the PDF after all checks pass. |

## BLOCK 3 -- Synthesis

Overall verdict: NEEDS-WORK

P1 blockers (must resolve before release):

- PP-1 / AR-1 / IM-1 -- the two-column architecture produces unreadable table collisions on eight confirmed pages.
- RI-1 -- the existing proof is not bound to the clean committed tree that contains its renderer and print CSS.
- T-1 -- no acceptance check prevents the same visible corruption from recurring.

P2 conditions (must resolve before sign-off):

- Establish print navigation and explain the pointer/Table distinction.
- Put the internal-proof and evidence boundary on the artifact itself.
- Preserve minimum source custody in the offline PDF.
- Add accessibility, formula-symbol, metadata, and release-custody checks.
- Remove active legacy identifiers from the Lexicon-native generation path.
- Reconcile or explicitly historicize conflicting portfolio counts.

Cross-reviewer consensus:

The canonical content and web projection are much stronger than the PDF
projection. Multiple reviewers converge on the same remedy: treat substantial
Tables as a full-width book body, move pointers to a compact index, and admit a
PDF only after clean-source and visual acceptance gates pass.

Strongest signal:

The artifact looks credible at first glance but contains unreadable content on
eight pages. The missing PDF-specific acceptance gate is therefore the first
problem to fix.

## AMEND

1. In the print architecture, render 54 canonical Tables in a full-width body
   and the 250 pointer records as a separately labelled compact appendix; this
   removes the intrinsic-width collision and clarifies product authority.
2. In `tools/render_book_proof_pdf.ps1`, render to a temporary output, verify
   clean-source identity, page/text/font/link/layout invariants, then promote
   atomically and emit a Lexicon-native sidecar manifest.
3. In PDF front and back matter, add internal-proof status, how-to-use steps,
   folios/running heads, edition/source/license metadata, minimum provenance,
   and a final colophon.
