# Formarium

**Tables for the structure of things.**

Website: <https://giodl73-repo.github.io/FORMARIUM/>

Formarium is an encyclopedia of decomposition patterns. Its primary
deliverables are books and **Factor Tables** that help a reader look up a
problem, distinguish its senses, compare several credible factorizations,
choose a pivot, and assign supporting factors to suitable structural
mechanisms. Specialized **Formula Tables** preserve major sourced equations
with their symbols, units, dimensions, assumptions, and conceptual structure.
Additional reference families cover values, mappings, decisions, transitions,
constraints, procedures, diagnostics, scales, and evidence while sharing one
canonical entry graph.

Formarium combines the lookup form of a dictionary, the alternatives of a
thesaurus, and the compact utility of an engineering handbook. It does not
promise one universal decomposition; it makes the available choices,
constraints, tradeoffs, counterexamples, and maturity visible.

Formarium has two complementary books over one canonical reference:

- **Formarium Tables** is the primary dictionary/thesaurus and structured
  reference. It defines and distinguishes concepts through canonical Factor
  Tables and specialized views.
- **The Formarium Reader** is the explanatory companion. It teaches and
  demonstrates how to use selected Tables for bounded questions without
  becoming a second authority.

**Factor Guides** are shorter applied journeys through selected Tables. The
complete contract is [Two-Book Product Architecture](specs/TWO-BOOK-PRODUCT-ARCHITECTURE.md).

The project, publication, CLI, and current machine-readable contract all use
**Formarium**. New artifacts use `.formarium`, `.formarium-query`, and
`formarium-*` identifiers. Frozen `.factorium` artifacts remain readable only
as historical imports; they are not templates or defaults for new work.

Public GitHub and portfolio references use `LEXICON`. This local checkout may
still live at `repos/knowledge-systems/factorium`; that path is historical and
is not the active product name. New onboarding, quickstarts, simulations,
customer previews, and portfolio handoffs should state the public repo
`LEXICON`, active product `Formarium`, local checkout path, and frozen
historical `Factorium` imports together before asking a user to edit, validate,
or cite the repo. Do not infer active schema, command, publication, or
customer-preview targets from the local folder name. See
[`docs/IDENTITY-AND-CHECKOUT.md`](docs/IDENTITY-AND-CHECKOUT.md).

Read the [grand vision](VISION.md), the active [roadmap](ROADMAP.md), the draft
[Factor Table entry format](specs/FACTOR-TABLE-ENTRY.md), the specialized
[Formula Table format](specs/FORMULA-TABLE-ENTRY.md), and the first
[environment example](tables/examples/environment.md).
The candidate [reference table family architecture](specs/REFERENCE-TABLE-FAMILIES.md)
defines how specialized views remain one coherent reference.

The [entry graph](specs/FORMARIUM-ENTRY-GRAPH.md) defines progressive
decomposition, typed joins, relative primes and composites, notation, and
faceted search. The [security example](tables/examples/security.md) leads to an
[eight-factor access-control request](tables/composites/access-control-request.md)
whose factors each have their own entries.

Browse the [generated reference catalog](tables/FORMARIUM-CATALOG.md) for canonical
anchors and specialized views. The [curated table index](tables/INDEX.md)
retains examples, foundations, roots, roles, primes, and composites without
copying the generated catalog. The [Factor Guide pilots](guides/INDEX.md)
demonstrate traceable narrowing in software security and laboratory
measurement.

The first [78-record volume prototype](volumes/01-structure-quantity-choice/VOLUME.md)
is ready for external reader testing with a separate
[usability protocol](volumes/01-structure-quantity-choice/USABILITY-PROTOCOL.md),
reader packet, evaluator rubric, and de-identified observation record.

## Primary deliverables

- **Formarium Tables** — the enduring dictionary/thesaurus reference book, with
  an A-Z reading sequence and structural pointer entry points;
- **The Formarium Reader** — the linked explanatory companion;
- **Factor Tables** — canonical entries and competing decompositions;
- **Formula Tables** — sourced mathematical relations with scope and units;
- **specialized reference tables** — mappings, decisions, transitions,
  constraints, procedures, diagnostics, scales, values, and evidence;
- **Factor Guides** — bounded, loss-aware applications for a particular problem;
- **evidence and reviews** — provenance, maturity, and limitations;
- **software and experiments** — auxiliary construction and validation tools.

## Founding research

The repository began as **FACTOR**, a hardware-neutral investigation of
Factor-Preserving Semantic Encoding. That work remains as one tested Formarium
domain and as evidence infrastructure:

- explicit semantic schemas and constraints;
- compositional and role/ambiguity fixtures;
- exact conventional controls and bounded HRR diagnostics;
- `.roles` reviews and retained nulls;
- independently verifiable evidence packets.

## Evidence inherited from Squarebit

Squarebit's first synthetic language experiment found that factored
representations generalized across unseen combinations while whole-symbol
controls failed. Ordinary packed features tied the named product-state encoding
exactly. FACTOR begins from that narrow result:

> Factorization was useful; specialized Squarebit packing was not required.

This narrow result helped establish Formarium's discipline. It does not prove
the encyclopedia or any universal factorization.

## Non-goals

- presenting one convenient factorization as universally canonical;
- allowing AI-generated plausibility to substitute for review and provenance;
- letting software become more important than the reference work;
- claiming novelty for feature structures or compositional representation;
- claiming that synthetic exact-match predicts broad NLP quality;
- replacing tokenizers, embeddings, or language models without evidence;
- tying the method to Squarebit hardware;
- hiding ordinary packed or structured controls;
- promoting hardware, compression, or runtime advantages from semantics alone.

## Project workflow

Read `CONTEXT.md`, `PRODUCT_PLAN.md`, `ROADMAP.md`, and
`context/waves/PHASES.md`. Work is organized into small waves and pulses with
explicit validation.

## PITFALL doctrine

Formarium's reusable reference-doctrine memory is indexed at
[`.pitfall/PITFALL.md`](.pitfall/PITFALL.md). It keeps authority splits,
over-generalized factorizations, synthetic-evidence overclaims, rename custody,
software displacement, and public-name/local-path confusion visible before
publication, research, or Workbench claims expand.

## Reference specifications

- [Factor Table Entry Format V0](specs/FACTOR-TABLE-ENTRY.md)
- [Formarium Entry Graph](specs/FORMARIUM-ENTRY-GRAPH.md)
- [Factor Guide Format V0](specs/FACTOR-GUIDE.md)
- [Composition Query Trace V0](specs/COMPOSITION-QUERY.md)
- [Bounded Composition Lab Simulation](specs/COMPOSITION-LAB.md)
- [Composition Reading Route Simulation](specs/COMPOSITION-READING-ROUTE.md)
- [Composition Factor Focus Simulation](specs/COMPOSITION-FACTOR-FOCUS.md)
- [Composition Concept Palette Simulation](specs/COMPOSITION-PALETTE.md)
- [Composition Reader Views Simulation](specs/COMPOSITION-READER-VIEWS.md)
- [Composition Closure Map Simulation](specs/COMPOSITION-CLOSURE-MAP.md)

## Founding research specifications

- [Semantic Factor Schema v1](specs/SEMANTIC-FACTOR-SCHEMA.md)
- [Compositional Split Fixtures v1](specs/COMPOSITIONAL-SPLITS.md)
- [Strong-Control Bakeoff v1](specs/STRONG-CONTROL-BAKEOFF.md)
- [Portable Evidence Packet v1](specs/PORTABLE-PACKET.md)
- [Role Frames and Analysis Sets v1](specs/ROLE-ANALYSIS-SETS.md)
- [Role and Ambiguity Fixtures v1](specs/ROLE-AMBIGUITY-FIXTURES.md)
- [Role/Filler Binding Controls v1](specs/BINDING-CONTROLS.md)
- [Role and Ambiguity Bakeoff v1](specs/ROLE-AMBIGUITY-BAKEOFF.md)
- [Portable Role and Ambiguity Packet v1](specs/ROLE-PORTABLE-PACKET.md)

## Schema conformance

The Rust reference validates canonical schema documents, computes schema and
document identities, and checks exact packed aliases:

```powershell
cargo run --quiet -- check fixtures\schemas\navigation.factor
```

Canonicalize an admitted CRLF transport or verify exact canonical output:

```powershell
cargo run --quiet -- canonicalize fixtures\schemas\navigation.factor
```

Validate the current V1 compatibility reference metadata, linked Markdown, and
generated projections:

```powershell
cargo run --quiet -- reference-check reference\formarium-reference-v3.formarium .
```

Validate the unchanged bounded V0 relation sidecar and complete V1
digest-bound review coverage:

```powershell
cargo run --quiet -- reference-sidecar-check reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium reference\formarium-assurance-v3.formarium .
```

See [Formarium Reference Interchange](specs/FORMARIUM-REFERENCE-INTERCHANGE.md).

Validate one bounded, author-declared Composition Query trace against exact
reference and relation identities:

```powershell
cargo run --quiet -- composition-query-check fixtures\composition\system-dependency.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\decision-evidence.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\decision-bridge-closure.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\constraint-feasibility.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\causal-outcome-scope.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\risk-consequence.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\value-criterion.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
```

Build the disposable Proof Set simulation rendering with Pandoc:

```powershell
.\tools\render_proof_set.ps1
```

The command writes a standalone core-book HTML file and exact-source manifest
under `target\proof-set-sim-01`. It is an internal rehearsal artifact, not
`preview-01` or reader evidence.

Render the current-source expanded simulation with the exact 15-record Factor
Forge delta:

```powershell
.\tools\render_proof_set.ps1 -Edition sim-02
```

Render the expanded edition with twenty-three neutral Factor Forge coverage tasks while
excluding the author-only rubric:

```powershell
.\tools\render_proof_set.ps1 -Edition sim-03
```

Render the same book with a static in-browser search surface over all 120
selected records and the two application guides:

```powershell
.\tools\render_proof_set.ps1 -Edition sim-04
```

The generated search index is a disposable publication projection. Canonical
Markdown and reference metadata remain authoritative, and the simulation is
not reader evidence or the later Formarium Workbench.

Render the adaptive reader edition with Compact, Abbreviated, Book, and Full
profiles plus independent detail, metadata, and spacing controls:

```powershell
.\tools\render_proof_set.ps1 -Edition sim-05
```

Book is the default. The profile contract is
[`specs/PROOF-SET-READER-VIEWS.md`](specs/PROOF-SET-READER-VIEWS.md).

Render the bounded Context Profile prototype over the adaptive reader:

```powershell
.\tools\render_proof_set.ps1 -Edition sim-06
```

The prototype distinguishes inherited defaults and conventions from choices
that remain required at use time. See
[`specs/CONTEXT-PROFILE.md`](specs/CONTEXT-PROFILE.md).

Render the current proof-edition bounded composition-lab simulation:

```powershell
.\tools\render_proof_set.ps1 -Edition sim-29
```

Open `target/proof-set-sim-29/index.html` for a problem-led path through six
trace-bound Composition Query guides, the five-step first journey,
kind-and-domain search, thirteen subsectioned chapter routes, and dedicated
reading pages. The systems, evidence, feedback, exclusion, finite-budget, and
Decision/Evidence examples retain relation direction, local semantics, and
complete, incomplete, contradictory, and truncated outcomes. They are worked
examples rather than an open-ended builder. The Decision/Evidence route is an
exact incomplete read-only trace over the first admitted cross-entry relation;
it remains outside Compose. A read-only Composition Explorer compares the exact
seeds, admitted joins and nodes, checks, budgets, closure boundaries,
projection counts, and trace identities beneath those guides. The Compose page
runs deterministic, bounded closure over explicit seeds and only the six
allowlisted reviewed F1-F6 relations. Problem prose never selects
semantics, every check
remains unresolved, and drafts are neither canonical traces nor publishable
guides. Query data is not stored or transmitted; only the non-sensitive
reader-view preference may persist. The generated site remains a
disposable publication projection. After closure, a deterministic reading
route deduplicates admitted factors into their owning anchor-entry pages and
then links the specialized views that own unresolved checks. Human page titles
lead; exact graph roles and dispositions remain under disclosure. The route
does not expand the graph, rank relevance, or create a canonical guide. Problem
Five problem cards also link to authored Compose starters derived from their
exact traces; the sixth is explicitly read-only. Loading a starter changes visible explicit controls but does not run
closure, infer selections from prose, inherit reviewed outcomes, or serialize
arbitrary query data into the URL. See
[`specs/COMPOSITION-AUTHORED-STARTERS.md`](specs/COMPOSITION-AUTHORED-STARTERS.md).
See [`specs/DECISION-EVIDENCE-READING-ROUTE.md`](specs/DECISION-EVIDENCE-READING-ROUTE.md)
for the canonical/read-only boundary.
The sticky pre-run card now condenses the current explicit controls into Add,
Multiply, Subtract, Frame, and Bound records. It reports only syntactic control
completeness, never predicts closure, and warns when edited controls no longer
match the displayed result. See
[`specs/COMPOSITION-QUERY-PLAN.md`](specs/COMPOSITION-QUERY-PLAN.md).
Each of the twelve reviewed endpoint factors also has an edition-local focus
fragment: a Start or Continue link opens a generated card with the exact factor
label and ID, then hands off to the source entry's Root factorization. The card
is hidden during ordinary reading, uses CSS `:target`, and does not rewrite
canonical Markdown or claim an exact source-text span. The Add stage groups
those same twelve exact controls into six human-named entry topics, with the
selected topic open first. Multiply shows live
direction-sensitive predecessor readiness while leaving all six Lab relations
enabled. Readiness uses only explicit controls and does not predict budget
admission, compatibility, or domain validity.

The Compose page now carries the same Compact, Abbreviated, Book, and Full
profiles as the book reader. Book remains the default: it leads with human
concept labels, short relation codes, and endpoint routes while Full reveals
the exact artifacts, qualifications, check IDs, and result digest. Profiles
change only display detail, metadata, and spacing. Query controls and closure
identity remain unchanged; only the shared reader-view preference may persist.

The result now leads with a unique-node Closure Map generated from the same
identified graph as the reading route. Solid arrows show exact typed
traversals, dashed links distinguish evaluation ownership and stopped
frontiers, and conflicts remain visible in text as well as styling. A complete
HTML record equivalent and the folded six-stage audit remain available; the
map adds no nodes, edges, ranking, or identity.

All four declared finite bounds are live, including the canonical emitted-
record Work cap. After execution, Result Reconciliation accounts for every
selected seed, relation, exclusion, and budget without treating unselected
routes as rejected. Exact stopped or conflicting reasons may offer optional
single-control edits for a possible next request; those buttons never submit
or predict closure. If the reader separately runs after such an edit, one
ephemeral comparison shows whether the edit survived into the executed
request, names every additional control change, and compares the two exact
structural results without calling either one better, valid, or successful.
The comparison is consumed after that run and no query, action, result, or
history is stored.

The identified result now also becomes a loss-aware, book-form Factor Guide
skeleton between the Closure Map and canonical Reading Route. It leads with
the declared problem and frame, retains exact source custody, exposes every
unresolved evaluation and closure boundary, and carries eight explicit groups
of work still missing from a conforming Factor Guide. Compact, Abbreviated,
Book, and Full scale explanation and exact metadata over the same manifest;
no profile can hide a conflict, frontier, unresolved check count, or missing
guide requirement. The skeleton supplies no local evidence, sense narrowing,
mechanism assignment, substantive outcome, change test, review, or
recommendation. See
[`specs/COMPOSITION-GUIDE-SKELETON.md`](specs/COMPOSITION-GUIDE-SKELETON.md).

When that skeleton contains admitted checks, the reader may create a separate
local Evaluation Record. Every included check requires an explicit
`pass`/`fail`/`unresolved` declaration, evidence reference, observation, and
rationale. Receipts retain partial coverage and remain labelled user-declared,
unreviewed, and unverified; they never change the closure state or close any of
the eight guide gaps. Evaluation data stays only in page memory, becomes stale
after edits, and disappears on Run or reload. See
[`specs/COMPOSITION-EVALUATION-RECORD.md`](specs/COMPOSITION-EVALUATION-RECORD.md).

See [`specs/COMPOSITION-WORK-BUDGET.md`](specs/COMPOSITION-WORK-BUDGET.md),
[`specs/COMPOSITION-RESULT-RECONCILIATION.md`](specs/COMPOSITION-RESULT-RECONCILIATION.md),
[`specs/COMPOSITION-EXPLICIT-CONTINUATIONS.md`](specs/COMPOSITION-EXPLICIT-CONTINUATIONS.md),
and [`specs/COMPOSITION-RERUN-COMPARISON.md`](specs/COMPOSITION-RERUN-COMPARISON.md).

See [`specs/PROOF-SET-BOOK-SITE.md`](specs/PROOF-SET-BOOK-SITE.md).

After an intentional metadata or source change, regenerate the catalog and
unresolved-candidate report:

```powershell
cargo run --quiet -- reference-sync reference\formarium-reference-v3.formarium .
```

See [Formarium Reference Interchange](specs/FORMARIUM-REFERENCE-INTERCHANGE.md).

Inspect the frozen generated corpus and split identities:

```powershell
cargo run --quiet -- fixtures
```

Inspect the ordered-role and ambiguity fixture identities:

```powershell
cargo run --quiet -- role-fixtures
```

Inspect exact TPR, structured, factored, and bounded HRR control evidence:

```powershell
cargo run --quiet -- binding-controls
```

Run the role/ambiguity split bakeoff:

```powershell
cargo run --quiet -- role-bakeoff
```

The [accepted Wave 2 result](docs/ROLE-AMBIGUITY-RESULT.md) is
`semantic-only`: role sharing and explicit candidate-set composition help, but
exact conventional controls tie HRR.

Validate the self-contained Wave 2 packet without importing the Rust crate:

```powershell
cd artifacts\factor-role-v1
python verify_role_packet.py .
```

See [independent role packet onboarding](docs/ROLE-PACKET-ONBOARDING.md).

Run the deterministic strong-control comparison:

```powershell
cargo run --quiet -- bakeoff
```

The founding result is
[accepted, semantic-only](docs/STRONG-CONTROL-BAKEOFF-RESULT.md): factor
preservation beats whole-meaning lookup on the systematic synthetic holdouts,
while packed aliases, feature structures, one-hot factors, and dense factored
controls tie.

Validate the committed self-contained evidence packet without importing the
Rust crate:

```powershell
cd artifacts\factor-v1
python verify_packet.py .
```

See [independent packet onboarding](docs/ONBOARDING.md).

## Portfolio reuse posture

Formarium is intentionally a specialist reference publication, not currently a
shared portfolio dependency. The `formarium-reference-v3` interchange is the
repository's candidate internal canonical owner, and the unpublished Rust
tooling validates that owner; neither is an ecosystem or cross-repository API.
The self-contained portable packets are verification evidence, not reusable
runtime libraries.

Other repositories may cite published Formarium entries with provenance, but
should not copy entries, identifiers, schemas, maturity labels, or generated
catalogs as locally owned contracts. Revisit direct reuse only after the
interchange is promoted from candidate status, a versioned distribution is
published, and a downstream manifest plus compatibility proof records a real
consumer.

## Research

- [Prior art and benchmark custody](docs/research/2026-08-13-prior-art-and-benchmark-custody.md)
- [Role binding and ambiguity research](docs/research/2026-08-13-role-binding-and-ambiguity.md)
- [Reference scale and Factorium entry size](docs/research/2026-08-13-reference-scale-and-entry-size.md)

## Validation

```powershell
cargo fmt --check
cargo clippy --all-targets --all-features -- -D warnings
cargo test --all-targets
cargo test --test relation_kind_fixtures
cargo run --quiet -- check fixtures\schemas\navigation.factor
cargo run --quiet -- fixtures
cargo run --quiet -- role-fixtures
cargo run --quiet -- binding-controls
cargo run --quiet -- role-bakeoff
cargo run --quiet -- role-packet-check artifacts\factor-role-v1
cargo run --quiet -- bakeoff
cargo run --quiet -- packet-check artifacts\factor-v1
cargo run --quiet -- reference-check reference\formarium-reference-v3.formarium .
cargo run --quiet -- reference-sidecar-check reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium reference\formarium-assurance-v3.formarium .
cargo run --quiet -- composition-query-check fixtures\composition\decision-evidence.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\decision-bridge-closure.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\constraint-feasibility.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\causal-outcome-scope.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\risk-consequence.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\value-criterion.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\system-dependency.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\latency-evidence.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\alert-feedback.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\dependency-exclusion-conflict.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
cargo run --quiet -- composition-query-check fixtures\composition\delegated-compliance-frontier.formarium-query reference\formarium-reference-v3.formarium reference\formarium-relations-v1.formarium
node tools\check_composition_lab.js
node tools\check_composition_reading.js
node tools\check_composition_palette.js
node tools\check_composition_views.js
node tools\check_composition_map.js
node tools\check_composition_query_plan.js
node tools\check_composition_reconciliation.js
node tools\check_composition_continuations.js
node tools\check_composition_rerun_comparison.js
node tools\check_composition_guide.js
node tools\check_composition_evaluation.js
node tools\check_reference_closure_coverage.js
node tools\check_query_led_campaign_02.js
node tools\check_query_led_lookup_02.js
node tools\run_query_led_baseline.js 02
node tools\check_query_led_baseline_02.js
node tools\run_query_led_gap_disposition.js 02
node tools\check_synthetic_user_campaign.js
node tools\run_synthetic_user_browse.js
node tools\build_synthetic_user_results.js
node tools\check_synthetic_user_results.js
node tools\check_synthetic_route_campaign.js
node tools\run_synthetic_route_browse.js
node tools\build_synthetic_route_results.js
node tools\check_synthetic_route_results.js
node tools\check_synthetic_ux_campaign.js
node tools\build_synthetic_ux_results.js
node tools\check_synthetic_ux_results.js
node tools\check_homepage_intent_router.js target\proof-set-sim-43
node tools\check_homepage_intent_router_browser.js target\proof-set-sim-43 target\sim43-intent-router.png
node tools\check_synthetic_handoff_campaign.js
node tools\run_synthetic_handoff_routes.js sim-43
node tools\build_synthetic_handoff_results.js
node tools\run_synthetic_handoff_routes.js sim-44
node tools\check_synthetic_handoff_results.js
node tools\check_ephemeral_handoff_note.js target\proof-set-sim-44
node tools\check_ephemeral_handoff_note_browser.js target\proof-set-sim-44 target\sim44-handoff-note.png
node tools\check_synthetic_concept_basket_campaign.js
node tools\run_synthetic_concept_basket_baseline.js
node tools\check_synthetic_concept_basket_baseline.js
node tools\check_synthetic_dual_lookup_campaign.js
node tools\run_synthetic_dual_lookup_baseline.js
node tools\check_synthetic_dual_lookup_baseline.js
node tools\check_dual_literal_lookup.js target\proof-set-sim-45
node tools\check_dual_literal_lookup_browser.js target\proof-set-sim-45 target\sim45-dual-lookup.png
node tools\run_synthetic_dual_lookup_browser.js
node tools\check_synthetic_dual_lookup_rerun.js
node tools\check_synthetic_syntactic_clause_lookup_campaign.js
node tools\run_synthetic_syntactic_clause_lookup_baseline.js
node tools\check_synthetic_syntactic_clause_lookup_baseline.js
node tools\check_synthetic_whole_question_clause_lenses_campaign.js
node tools\run_synthetic_whole_question_clause_lenses_baseline.js
node tools\check_synthetic_whole_question_clause_lenses_baseline.js
node tools\check_synthetic_recognized_foothold_connections_campaign.js
node tools\run_synthetic_recognized_foothold_connections_baseline.js
node tools\check_synthetic_recognized_foothold_connections_baseline.js
node tools\check_synthetic_reciprocal_connection_repair_campaign.js
node tools\check_reciprocal_connection_repair.js
node tools\run_synthetic_reciprocal_connection_repair_rerun.js
node tools\check_synthetic_reciprocal_connection_repair_rerun.js
node tools\check_reciprocal_connection_repair_site.js target\proof-set-sim-46
node tools\check_reciprocal_connection_repair_browser.js target\proof-set-sim-46 target\sim46-reciprocal-connections.png
node tools\check_synthetic_distinctive_terms_campaign.js
node tools\run_synthetic_distinctive_terms_holdout.js
node tools\check_synthetic_distinctive_terms_holdout.js
node tools\check_internal_fixed_point_refresh_46_plan.js
node tools\check_internal_fixed_point_refresh_46_result.js
node tools\check_system_architecture_description.js
node tools\check_decision_evidence_bridge.js
node tools\check_decision_bridge_combined_closure.js
node tools\check_constraint_feasibility_relation.js
node tools\check_causal_outcome_relation.js
node tools\check_risk_consequence_relation.js
node tools\check_value_criterion_relation.js
node tools\check_decision_evidence_reading_route.js
node tools\check_proof_set_decision_combined_reading.js target\proof-set-sim-29
node tools\check_proof_set_search.js target\proof-set-sim-29\search-index.json 184
node tools\check_proof_set_composition.js target\proof-set-sim-29\manifest.json target\proof-set-sim-29\index.html
node tools\check_proof_set_decision_evidence_reading.js target\proof-set-sim-29
node tools\check_proof_set_composition_lab.js target\proof-set-sim-29
node tools\check_proof_set_composition_reading.js target\proof-set-sim-29
node tools\check_proof_set_composition_focus.js target\proof-set-sim-29
node tools\check_proof_set_composition_palette.js target\proof-set-sim-29
node tools\check_proof_set_composition_views.js target\proof-set-sim-29
node tools\check_proof_set_composition_map.js target\proof-set-sim-29
node tools\check_proof_set_composition_starters.js target\proof-set-sim-29
node tools\check_proof_set_composition_query_plan.js target\proof-set-sim-29
node tools\check_proof_set_composition_work_budget.js target\proof-set-sim-29
node tools\check_proof_set_composition_reconciliation.js target\proof-set-sim-29
node tools\check_proof_set_composition_continuations.js target\proof-set-sim-29
node tools\check_proof_set_composition_rerun_comparison.js target\proof-set-sim-29
node tools\check_proof_set_composition_guide.js target\proof-set-sim-29
node tools\check_proof_set_composition_evaluation.js target\proof-set-sim-29
node tools\check_proof_set_composition_reading_browser.js target\proof-set-sim-29
node tools\check_proof_set_composition_guide_browser.js target\proof-set-sim-29
node tools\check_proof_set_composition_evaluation_browser.js target\proof-set-sim-29
node tools\check_book_one_candidate.js target\proof-set-sim-30\search-index.json
node tools\check_book_one_sim_candidate.js target\proof-set-sim-30
node tools\check_proof_set_search.js target\proof-set-sim-30\search-index.json 185
node tools\check_book_one_simulation_browser.js target\proof-set-sim-30 target\sim30-book-one-candidate.png
node tools\check_two_book_site.js target\proof-set-sim-31
node tools\check_two_book_site_browser.js target\proof-set-sim-31 target\sim31-two-book-front-door.png
node tools\check_tables_navigator.js target\proof-set-sim-32
node tools\check_tables_navigator_browser.js target\proof-set-sim-32 target\sim32-table-navigator.png
node tools\check_tables_family_search.js target\proof-set-sim-33
node tools\check_tables_family_search_browser.js target\proof-set-sim-33 target\sim33-table-family-search.png
node tools\check_tables_family_contents.js target\proof-set-sim-34
node tools\check_tables_family_contents_browser.js target\proof-set-sim-34 target\sim34-table-family-contents.png
node tools\check_tables_alphabetical_index.js target\proof-set-sim-35
node tools\check_tables_alphabetical_index_browser.js target\proof-set-sim-35 target\sim35-tables-alphabetical-index.png
node tools\check_factorium_reader_route.js target\proof-set-sim-36
node tools\check_factorium_reader_route_browser.js target\proof-set-sim-36 target\sim36-factorium-reader-route.png
node tools\check_factorium_reader_sequence.js target\proof-set-sim-37
node tools\check_factorium_reader_sequence_browser.js target\proof-set-sim-37 target\sim37-factorium-reader-sequence.png
node tools\check_factorium_reader_start.js target\proof-set-sim-38
node tools\check_factorium_reader_start_browser.js target\proof-set-sim-38 target\sim38-factorium-reader-start.png
node tools\check_factorium_reader_end.js target\proof-set-sim-39
node tools\check_factorium_reader_end_browser.js target\proof-set-sim-39 target\sim39-factorium-reader-end.png
node tools\check_tables_everyday_search_cue.js target\proof-set-sim-40
node tools\check_tables_everyday_search_cue_browser.js target\proof-set-sim-40 target\sim40-everyday-search-cue.png
node tools\check_subject_object_canonical_depth.js target\proof-set-sim-41
node tools\check_subject_object_canonical_depth_browser.js target\proof-set-sim-41 target\sim41-subject-object-depth.png
python artifacts\factor-role-v1\verify_role_packet.py artifacts\factor-role-v1
python artifacts\factor-v1\verify_packet.py artifacts\factor-v1
python C:\src\tracker\repos\standards-protocols\roles\tools\check_roles.py .
git diff --check
```

Render and validate the current rolling V2 internal book/search/site projection:

```powershell
.\tools\render_proof_set.ps1 -Edition sim-50
node tools\check_v2_rolling_reference_integration.js
node tools\check_v2_rolling_reference_integration_browser.js
```

`sim-50` preserves the GPC-09 meaning, epistemic-standing, and evidence-custody
records and exposes the three post-V1 reviewed views. V2 remains a rolling,
unfrozen internal candidate. This is an internal simulation, not reader
evidence or `preview-01`.

## License

Formarium uses split licensing:

- **Books and other original content:** [CC BY-NC 4.0](LICENSE-CONTENT.md),
  copyright 2026 Gio Della-Libera. Sharing and adaptation are welcome for
  noncommercial purposes with attribution. Commercial use requires separate
  written permission.
- **Software:** [MIT](LICENSE), copyright 2026 Formarium contributors.

Versions previously distributed under the MIT License remain available under
that license; this change governs content distributed from this version
forward.
