# Lexicon Book Proof Repair Plan

Status: complete

## Problem

The 114-page `sim-67` PDF places wide canonical Tables inside a two-column
mixed dictionary stream. Eight pages contain confirmed collisions. The proof
also lacks independent print navigation and custody checks, and the rendered
artifact names a dirty pre-commit source state.

## Scope

1. Preserve the existing interactive mixed A-Z book on screen.
2. Give print a separate full-width canonical Table body and a subordinate
   compact pointer index.
3. Add internal-proof status, use guidance, inventory, running print furniture,
   minimum provenance, and a colophon.
4. Emit Lexicon-native active manifest identifiers.
5. Render through a temporary file, validate the PDF, and promote it only when
   page, text, font, source, and collision checks pass.
6. Regenerate from a committed clean tree and record the exact PDF hash.

## Non-goals

- canonical content or source changes;
- new Tables, pointers, relations, or claims;
- closing The Sieve or asserting reader outcomes;
- redesigning the online search, Reader, or Composition Lab.

## Verification

- candidate, contract, and Lexicon-native validators;
- exact book-HTML structure assertions;
- PDF page/text/font/source checks;
- zero text-box collisions in the PDF;
- targeted visual review of former failure pages and representative formulas;
- `git diff --check` and fixed-point Lexicon role review.
