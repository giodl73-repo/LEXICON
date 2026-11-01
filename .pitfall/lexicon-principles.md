# Lexicon Principles

These entries summarize Lexicon's durable decision rules for canonical
reference work, founding research evidence, and publication projections.

## FRM-P-01: Tables Own Canonical Authority

**Status:** ACTIVE

**Statement:** Lexicon Tables and canonical Factor Tables own definitions,
senses, factors, relations, provenance, and machine-readable identity.

**Rationale:** The Reader, Guides, software, and generated sites can teach or
project the reference only if they do not become competing authority.

**Decision rule:** Any new Reader, Guide, site, or tool output must link back to
owning Table identities instead of copying definitions or creating silent
relations.

**Evidence:** `specs/TWO-BOOK-PRODUCT-ARCHITECTURE.md`, `README.md`, and
`PRODUCT_PLAN.md`.

## FRM-P-02: Separate Senses From Competing Factorizations

**Status:** ACTIVE

**Statement:** Different senses must be distinguished before presenting
alternative factorizations of one sense.

**Rationale:** A useful decomposition reference fails if ambiguity is collapsed
into one convenient structure.

**Decision rule:** New entries, views, and guides must preserve sense identity,
pivots, alternatives, and unresolved states when those distinctions affect use.

**Evidence:** `PRODUCT_PLAN.md`, `specs/FACTOR-TABLE-ENTRY.md`, and
`specs/FORMARIUM-ENTRY-GRAPH.md`.

## FRM-P-03: Provenance And Maturity Stay Visible

**Status:** ACTIVE

**Statement:** Provenance, maturity, counterexamples, disputed analyses, and
assurance coverage stay visible in the reference.

**Rationale:** Lexicon is a reference project, not a plausibility generator;
readers need to know how much confidence each structure deserves.

**Decision rule:** A batch cannot broaden publication or domain claims without
source custody, review evidence, and explicit limitations.

**Evidence:** `.roles/ROLE.md`, `reference/formarium-assurance-v3.formarium`,
and `context/waves/2026-08-19-formarium-canonical/WAVE.md`.

## FRM-P-04: Software Remains Auxiliary

**Status:** ACTIVE

**Statement:** Software and experiments support construction, validation, and
publication; they do not displace the books and Factor Tables as the product.

**Rationale:** Tooling can easily become the visible product and weaken the
reference discipline.

**Decision rule:** New commands, generated projections, and simulations must
state their artifact boundary and avoid claiming reader evidence or canonical
authority.

**Evidence:** `README.md`, `PRODUCT_PLAN.md`, and
`specs/TWO-BOOK-PRODUCT-ARCHITECTURE.md`.

## FRM-P-05: New Contracts Use Lexicon Names

**Status:** ACTIVE

**Statement:** New files, schemas, commands, publication surfaces, and active
machine-readable contracts use Lexicon naming.

**Rationale:** Historical Factorium imports remain important custody records,
but new dual-name defaults create permanent confusion.

**Decision rule:** New schema extensions, generated artifacts, and documentation
use `.formarium`, `.formarium-query`, and `formarium-*` unless they are frozen
historical imports.

**Evidence:** `AGENTS.md`, `specs/FORMARIUM-REFERENCE-INTERCHANGE.md`, and
`context/waves/2026-08-19-formarium-canonical/WAVE.md`.
