# Lexicon Book Proof Repair Result

Status: complete; fixed-point pass

## Result

The `sim-67` book proof is repaired and reproducibly bound to clean source
commit `8510683e2a1b419911544cfd68448ad215308c52`. The print projection now gives
the 54 canonical Tables a full-width body and places the 250 navigation
pointers in a separate two-column index. It includes proof status, use
guidance, edition inventory, running furniture, page numbers, provenance, and
a colophon.

The PDF is
`target/proof-set-sim-67/Lexicon-book-proof-sim-67.pdf`:

- 235 pages and 7,702,925 bytes;
- SHA-256
  `3de66ee8ff84dfc064aef78a65e340df1a3474858e6be94cf9d2f09491b1de60`;
- rendered by Chrome `151.0.7922.172` from a clean workspace;
- 15 embedded fonts with Unicode mappings and 818,144 extracted characters;
- zero detected text-collision pages and zero out-of-bounds text pages.

## Closed findings

- The eight visually confirmed collision pages in the former 114-page proof
  no longer use the mixed two-column print flow.
- Canonical Tables and pointers are visibly distinct publication classes.
- The cover and colophon state that this is an internal proof and not
  reader-outcome evidence or public-release authority.
- The artifact and its sidecar name the exact clean source commit.
- Active generated contracts use `lexicon-*` identifiers; historical import
  names remain confined to frozen compatibility inputs.
- Rendering is transactional: a temporary PDF is checked before promotion.

## Verification

- candidate entries: 37 drafts, 37 briefs, 205 proposed senses, links resolved;
- contract check: 20 contracts, 250 pointers;
- canonical check: Lexicon-native, 11 queries, 250 pointers, zero missing;
- PDF acceptance: metadata, searchable text, source binding, embedded fonts,
  collision scan, and page-bound scan passed;
- visual review covered the cover, canonical section opening, former collision
  patterns, long Tables, formulas, pointer-index opening and ending, and
  colophon;
- `git diff --check` passed before source commit.

## Disposition

**PASS FOR CONTROLLED EXTERNAL R4 READER TESTING.** Lexicon is worthy of
continued development: its canonical reference is substantial and internally
coherent, and the proof is now usable enough to test with real readers. This
does not close The Sieve, establish reader value, or authorize a public R5
release. Those conclusions still require recorded external-reader evidence.
