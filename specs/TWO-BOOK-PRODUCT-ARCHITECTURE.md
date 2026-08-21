# Lexicon Two-Book Product Architecture

Status: internal product architecture fixed point

## Decision

Lexicon publishes one canonical reference through two complementary books:

1. **Lexicon** is the primary dictionary/thesaurus and structured
   reference. It owns lookup, sense distinction, factors, relations,
   contrasts, cross-references, provenance, and machine-readable identity.
2. **Lexicon Reader** is the explanatory companion. It teaches how to
   frame, factor, compose, evaluate, and explain bounded questions by routing
   through canonical Tables.

**Factor Guides** are shorter applied journeys. They select and project Tables
for one bounded question, disclose loss and unresolved state, and never become
canonical entries or a third book authority.

## Authority and projection contract

| Surface | Owns | Must not own |
|---|---|---|
| Lexicon | headwords, senses, factors, table-family views, typed relations, constraints, provenance, stable revisions | a mandatory cover-to-cover argument or copied guide conclusions |
| Lexicon Reader | teaching order, explanation, worked questions, transitions, interpretation warnings, routes into Tables | canonical definitions, duplicated Factor Tables, silent relation creation, or final domain decisions |
| Factor Guides | local question, selected concepts/senses, bounded closure, checks, projection loss, frontier, next action | canonical headwords, universal procedure, hidden flattening, or unreviewed authority |

The Reader and Guides link to exact Table identities. If a definition or
factor changes, it changes in the Table and is inherited by projection; copied
authority is a defect.

## Reader jobs

### Lexicon

For a reader who has a term, distinction, or neighboring concept in mind:

- find the intended sense quickly;
- distinguish broader, narrower, related, contrasting, and confused concepts;
- inspect factors, pivots, constraints, alternatives, relations, examples,
  maturity, and provenance;
- move laterally through a thesaurus-like concept graph or deeper into a full
  table;
- choose Compact, Abbreviated, Book, or Full projection without changing
  canonical content.

### Lexicon Reader

For a reader who wants to learn the method or begin from a messy question:

- understand why framing and sense selection precede combination;
- follow the 24-record teaching spine as a non-universal route;
- see worked bounded questions that retain conflict, truncation, missing
  evidence, projection loss, and authority;
- hand off to any of the 151 additional canonical records when specialized
  depth is required.

## Publication and navigation contract

The primary site entry presents two choices in this order:

1. **Explore the Tables** — search or browse the canonical dictionary/
   thesaurus;
2. **Read the Guide** — enter the Reader's 24-record teaching route and worked
   examples.

Every Table page keeps search, browse, and related-concept routes available.
Every Reader or Guide page identifies itself as a companion projection and
links back to owning Tables. Search spans canonical records and guides but
labels their kinds; ranking does not change authority.

## Current artifact mapping

| Existing artifact | Product placement |
|---|---|
| `reference/lexicon-reference-v4.lexicon` and `tables/` | Lexicon canonical source |
| generated search, contents, entry pages, and reader profiles | Lexicon publication projections |
| `guides/bounded-question-composition-book-one.md` 24-record spine | Lexicon Reader candidate backbone |
| problem-led routes and Composition examples | Reader worked examples |
| other files under `guides/` | bounded Factor Guides |
| `sim-30` | frozen pre-split Reader-oriented candidate baseline |
| `sim-31` | frozen two-book front-door simulation |
| `sim-67` | repaired 54-Table Lexicon-native book projection |
| `sim-68` | 91-Table candidate canonical merge projection |
| `sim-69` | 101-Table editorial and domain expansion projection |
| `sim-70` | current 107-Table social and normative foundations projection |

## Claim boundary

This architecture clarifies product identity and generated navigation. It does
not establish dictionary completeness, thesaurus quality, teaching efficacy,
reader comprehension, practical decision quality, accessibility success,
return use, external-preview readiness, or publication readiness.

## Reference implementation

`sim-31` is the first deterministic two-book publication projection. It keeps
the canonical 175-record selection unchanged, presents Tables before Reader,
provides two direct actions for each book, retains six Reader fields and the
24/151 handoff, and keeps both book routes on generated pages. Its static and
live-browser contracts are `tools/check_two_book_site.js` and
`tools/check_two_book_site_browser.js`.
