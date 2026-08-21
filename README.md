# Lexicon

**Tables for the structure of things.**

[Read Lexicon](https://giodl73-repo.github.io/LEXICON/) ·
[Browse the catalog](tables/LEXICON-CATALOG.md) ·
[Read the vision](VISION.md) ·
[Contribute](CONTRIBUTING.md)

Lexicon is an encyclopedia of ways to decompose problems.

A dictionary helps you choose a meaning. A thesaurus helps you choose a word.
Lexicon helps you choose a structure: the relevant sense of a concept, the
factors that shape it, credible alternative decompositions, and the constraints
that determine when each alternative is useful.

It does not claim that every subject has one universal factorization. It makes
the choices and their consequences visible.

## A small example

Consider **environment**. The word can mean a deployment tier, an
organizational scope, a physical surrounding, or a set of operating conditions.
Treating those senses as interchangeable produces confused names, policies, and
boundaries.

A Lexicon entry first separates the senses. It then shows the factors relevant
to each one, compares possible organizing pivots, records failure signs, and
links every reusable concept to its own entry. The result is not one prescribed
model; it is a compact map of the legitimate structural choices.

See the [Environment example](tables/examples/environment.md) or the
[Security example](tables/examples/security.md).

## How to use it

1. **Look up a concept.** Start from the
   [website](https://giodl73-repo.github.io/LEXICON/) or
   [generated catalog](tables/LEXICON-CATALOG.md).
2. **Select the intended sense.** Similar words and overloaded headwords often
   hide materially different questions.
3. **Compare factorizations.** Inspect the proposed pivots, supporting factors,
   dependencies, constraints, and counterexamples.
4. **Follow the graph.** Reusable factors link to their owning entries rather
   than being redefined locally.
5. **Apply with a guide.** A [Factor Guide](guides/INDEX.md) narrows selected
   entries to a bounded problem without becoming a second authority.

## What an entry contains

Each canonical entry uses a table-first form:

- a headword and short orientation;
- distinct senses with governing questions;
- competing factorizations and structural roles;
- decisive distinctions, constraints, and failure signs;
- specialized views for questions such as mapping, decision, transition,
  procedure, diagnosis, scale, and evidence;
- cross-references, provenance, limitations, and maturity.

Formula Tables use the same discipline for equations, preserving symbols,
units, dimensions, assumptions, validity boundaries, and the distinction among
definitions, identities, laws, empirical relations, estimators, and algorithms.

## One reference, two books

- **Lexicon** is the primary dictionary, thesaurus, and structured reference.
- **Lexicon Reader** is the explanatory companion for learning through worked
  questions.

Both books are projections of one canonical reference. Factor Guides are
bounded applications of that reference. Software supports construction,
validation, search, and publication; it is not the product itself.

The full contract is recorded in
[Two-Book Product Architecture](specs/TWO-BOOK-PRODUCT-ARCHITECTURE.md).

## Current state

The canonical machine-readable reference contains:

- **133 entries**;
- **846 senses**;
- **1,419 factors**;
- **100 specialized views**;
- **11 reviewed cross-entry relations**.

The discovery corpus preserves the **37 source drafts and 205 proposed senses**
that were admitted together on 2026-08-21. Their identities are now canonical
at candidate maturity; the original drafts remain historical evidence and do
not create a second publication authority.

The current corpus is a practical conceptual fixed point under the comparison
controls reviewed so far. It is ready for real-reader testing; it is not a
claim of completeness across every discipline.

See the [roadmap](ROADMAP.md), [candidate index](signals/discover/candidates/README.md),
and [active funded expansion wave](context/waves/2026-08-21-funded-domain-gap-roadmap/WAVE.md).

## Explore the work

| If you want to... | Start here |
|---|---|
| Read the published reference | [Lexicon website](https://giodl73-repo.github.io/LEXICON/) |
| Browse canonical entries and views | [Generated catalog](tables/LEXICON-CATALOG.md) |
| Understand the long-term idea | [Vision](VISION.md) |
| See how an entry is structured | [Factor Table format](specs/FACTOR-TABLE-ENTRY.md) |
| Understand links and composition | [Entry graph](specs/LEXICON-ENTRY-GRAPH.md) |
| Apply entries to bounded problems | [Factor Guides](guides/INDEX.md) |
| Review proposed additions | [Candidate entries](signals/discover/candidates/README.md) |
| Inspect provenance and research | [Research](docs/research/) |
| Follow delivery status | [Roadmap](ROADMAP.md) |

## Principles

- Separate senses before decomposing them.
- Preserve credible alternatives instead of forcing one universal structure.
- Keep factors distinct from the mechanisms used to implement them.
- Make scope, assumptions, uncertainty, and failure signs explicit.
- Keep canonical content, candidate analysis, local application, and reader
  evidence visibly separate.
- Let sources and domain authorities retain their own scope.
- Never allow generated plausibility to substitute for provenance and review.

## Contribute

Contributions are welcome at several levels. You can report a confusing lookup,
suggest a missing concept, correct an existing entry, or prepare a complete
candidate packet. You do not need to learn the full schema before sharing a
useful reader observation.

New concepts begin as noncanonical candidates. Canonical admission is a later,
evidence-gated decision; a thoughtful submission may be accepted as evidence,
routed to an existing owner, merged with another proposal, or retained as a
candidate without becoming canonical.

See [CONTRIBUTING.md](CONTRIBUTING.md) for submission routes, editorial
standards, templates, and review gates.

## Repository and formats

New machine-readable artifacts use `.lexicon` and `.lexicon-query`, with
`lexicon-*` identifiers. Frozen `.factorium` and `.formarium` files remain
readable historical imports but are not templates for new work.

The authoritative project map is [CONTEXT.md](CONTEXT.md). Contributors should
also read [AGENTS.md](AGENTS.md), [PRODUCT_PLAN.md](PRODUCT_PLAN.md), and the
[wave index](context/waves/PHASES.md).

Useful validation commands:

```powershell
node tools\check_candidate_entries.js
node tools\check_lexicon_candidate_admissions.js
node tools\check_lexicon_domain_admissions.js
node tools\check_lexicon_roadmap_admissions.js
node tools\build_lexicon_contracts.js --check
node tools\check_lexicon_canonical.js
.\tools\render_proof_set.ps1 -Edition sim-75
.\tools\render_book_proof_pdf.ps1 -Edition sim-75
```

For a release-candidate proof, require a clean source tree and then verify the
PDF metadata, embedded fonts, searchable text, source binding, and page layout:

```powershell
.\tools\render_book_proof_pdf.ps1 -Edition sim-75 -RequireCleanSource
.\tools\check_book_proof_pdf.ps1 -Edition sim-75 -RequireCleanSource
```

## Origins

The repository began as **FACTOR**, a hardware-neutral investigation of
factor-preserving semantic encoding. Its strongest synthetic result was narrow:
factored representations generalized across unseen combinations while
whole-symbol controls failed, but ordinary packed and structured factor
representations matched the specialized encoding.

That work established useful evidence discipline, not proof of Lexicon or of a
universal factorization. The retained experiments and packets remain founding
evidence; the enduring product is the reference work.

## License

Lexicon uses split licensing:

- **Books and other original content:** [CC BY-NC 4.0](LICENSE-CONTENT.md),
  copyright 2026 Gio Della-Libera. Sharing and adaptation are welcome for
  noncommercial purposes with attribution. Commercial use requires separate
  written permission.
- **Software:** [MIT](LICENSE), copyright 2026 Lexicon contributors.

Versions previously distributed under the MIT License remain available under
that license; this change governs content distributed from this version
forward.
