# Lexicon Candidate Canonical Merge Result

Status: complete

## Outcome

All 37 reviewed candidate concept families and their 205 senses are now
canonical Lexicon Tables at candidate maturity. The historical discovery
drafts and briefs remain unchanged as evidence of their pre-admission state.

The current canonical inventory is:

- 91 Tables;
- 624 senses;
- 1,090 factors;
- 100 specialized views;
- 11 reviewed relations;
- 202 exact assurance bindings.

The fresh pointer census admitted 20 recurring structural labels, taking the
subordinate pointer index from 250 to 270 records. Pointer admission creates no
canonical Table, taxonomy, or semantic relation.

## Publication result

`sim-68` renders 293 site pages and a 377-page searchable PDF. The PDF contains
91 canonical Tables followed by 270 pointer-index records. It has 15 embedded
font records, 1,339,630 extracted text characters, no detected collision pages,
and no detected out-of-bounds pages.

- Source commit: `0a9c27be569c82762e3d6b59ca124970e0167e13`
- PDF SHA-256: `fc8ac008e1edb384dbb8fe5e2cd77527a2dc9b0a24c840ab575e83264950c83b`
- PDF bytes: `11,526,537`
- PDF status: `pass`

Visual checks covered the cover, first admitted Table, clinical Table,
expanded pointer index, and colophon. Long headings, dense grids, two-column
pointer owners, and source identity all rendered legibly.

## Verification

- `node tools/check_candidate_entries.js`: pass, 37 drafts / 37 briefs / 205 senses;
- `node tools/check_lexicon_candidate_admissions.js`: pass;
- `node tools/build_lexicon_contracts.js --check`: pass;
- `node tools/check_lexicon_canonical.js`: pass;
- `cargo test --all-targets`: pass;
- `reference-check`: pass, 91 entries / 624 senses / 1,090 factors / 100 views;
- `reference-sidecar-check`: pass, 11 relations / 202 bindings;
- clean-source PDF render and independent PDF check: pass.

## Disposition

The result is worthy of controlled external reader testing. It is materially
more complete than sim-67 and includes the latest reviewed concept work. It is
not yet evidence of reader comprehension, domain correctness, market demand,
or public R5 release readiness.

The next meaningful step is reader evaluation of findability, sense selection,
Table-to-pointer navigation, and whether candidate maturity is communicated
clearly enough to prevent overclaiming.
