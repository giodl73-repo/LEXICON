# Lexicon Book Proof Review Result

Status: needs-work

## Bottom line

Lexicon has crossed the threshold from an interesting method repository into a
real reference-work prototype. The 54 canonical Tables consistently separate
senses, compare credible structures, expose failure signs, and preserve source
and graph boundaries. The project is worthy of continued development and real
reader testing.

The current `sim-67` PDF is not ready for public release.

## Strong evidence

- 54 canonical entries, 419 senses, 638 factors, 100 specialized views, and 11
  reviewed typed relations are present in the current reference.
- The proof contains 54 canonical Tables and a 250-record pointer index across
  114 pages and approximately 63,000 extracted words.
- Candidate, contract, and Lexicon-native canonical validators pass.
- The generated site manifest reports 227 exact sources, 20,554 local links,
  zero missing local targets, 3,111 internal PDF-source fragments, and zero
  missing fragment targets.
- The PDF is tagged and all fonts are embedded.

## Blocking artifact findings

1. Pages 7, 25, 32, 46, 61, 65, 85, and 103 contain visually confirmed
   overlapping or clipped table content.
2. The manifest records `workspace_dirty_at_render: true` and source commit
   `141fa236`, while the PDF renderer and print CSS were committed afterward in
   `0526d86`; the existing proof is therefore not exactly bound to a clean
   source state.
3. No PDF-specific acceptance gate checks collision, clipping, page structure,
   metadata, formulas, or representative visual output.

## Major readiness findings

- The book lacks page numbers, running heads, contents/how-to front matter, an
  end index, and a colophon.
- The pointer index and substantive Tables share one stream, making 250 short
  navigation records visually dominate 54 canonical entries.
- The cover says `304 entries` and `the published book` without carrying the
  internal-proof and no-reader-evidence boundary from the manifest.
- Detailed sources and provenance are print-hidden, weakening the PDF as a
  standalone reference artifact.
- Active generation still emits two `factorium-*` identifiers in the `sim-67`
  manifest, outside the declared Lexicon-native boundary.
- Roadmap/context history contains older count snapshots that can be mistaken
  for current counts.

## Recommended next move

Run one bounded repair wave, not another content wave:

1. render canonical Tables full width and move pointer records into a clearly
   subordinate compact index;
2. add print navigation and minimal source/status/edition front and back matter;
3. make rendering clean-tree, atomic, digest-bound, and PDF-acceptance tested;
4. regenerate and rerun the exact eight-page collision audit plus representative
   formula and accessibility checks;
5. only then give the repaired proof to external readers through The Sieve.

## Verdict

**Project: CONTINUE.** The method and corpus are distinctive enough to deserve
the next test.

**PDF: REPAIR BEFORE RELEASE.** The blockers are projection and custody defects,
not a failure of the underlying Lexicon thesis.

