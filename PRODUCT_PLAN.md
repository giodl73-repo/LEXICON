# Lexicon Product Plan

## Product thesis

Lexicon will be a lasting reference collection of decomposition patterns.
Its books and Factor Tables help people discover dimensions, distinguish
senses, compare pivots, assign factor roles to available mechanisms, and avoid
invalid or unstable structures. Formula Tables extend the same reference form
to major sourced mathematical relations without losing units, dimensions,
scope, or assumptions.

Software, experiments, and evidence exist to construct and improve the
reference. They are not the top-level product.

## Product identity

- Name: **Lexicon**
- Primary reference book: **Lexicon** — dictionary, thesaurus, and
  structured canonical reference
- Teaching companion: **Lexicon Reader** — linked explanations, selected
  routes, and worked bounded questions
- Reference unit: **Factor Table**
- Specialized mathematical unit: **Formula Table**
- Specialized reference views: **Value, Mapping, Decision, Transition,
  Constraint, Procedure, Diagnostic, Scale, and Evidence Tables**
- Narrowed output: **Factor Guide**
- Supporting software: **Lexicon Workbench**
- Founding research method: **Factor-Preserving Semantic Encoding**
- Repo type: encyclopedia/reference project with supporting research and tools

Canonical naming boundary: new contracts use `.lexicon`, `.lexicon-query`,
and `lexicon-*` schema names. Frozen `.factorium`, `.factorium-query`,
`.formarium`, and `.formarium-query` files and their headers remain parseable
historical imports, not forward defaults. Formography remains a separate
proposed method whose field and novelty claims are not established by the
product rename.

## Principles

1. Lexicon and its canonical Factor Tables are the primary authority;
   Lexicon Reader teaches their use without copying that authority.
2. Separate different senses from competing factorizations of one sense.
3. Present credible alternatives instead of one unexplained canonical answer.
4. Make pivots, dependencies, constraints, and failure signs explicit.
5. Define general factor roles before mapping them into particular paradigms.
6. Prefer lists and tables; use only enough exposition to prevent misuse.
7. Preserve provenance, maturity, counterexamples, and disputed analyses.
8. Keep software auxiliary and make AI suggestions reviewable.
9. Preserve null results and the founding research evidence.
10. Keep mathematical equality distinct from semantic decomposition.
11. Add specialized table families only when they answer a distinct recurring
    lookup question and retain one canonical entry authority.
12. Keep Factor Guides as bounded applied projections, not a third book or
    alternate definition source.

## Waves

The milestone sequence, exit gates, content priorities, publication path, and
software boundary are maintained in [ROADMAP.md](ROADMAP.md).

### Wave 1: Method foundation

Define the terminology, schema contract, benchmark protocol, controls, and
first reproducible reference corpus.

### Wave 2: Role and ambiguity

Test role/filler binding, repeated factor values, ambiguity, and alternative
surface forms against feature structures and vector-symbolic controls.

Sequence:

1. research and role-reviewed plan;
2. analysis-set and role-frame contract;
3. generated role and ambiguity fixtures;
4. exact TPR, structured, factored, and bounded HRR controls;
5. role/ambiguity bakeoff;
6. portable Wave 2 packet.

### Wave 3: Lexicon reference foundation

Define the grand vision, Factor Table grammar, general factor-role vocabulary,
cross-paradigm mappings, pilot entries, and Factor Guide method.

Provisional scale: 25–50 pilot entries, about 250 entries for the first
substantial volume, about 1,000 canonical headwords for the core reference,
and 3,000–5,000 only after mature editorial validation.

### Wave 4: First Lexicon volume and Reader companion

Assemble and usability-test a coherent table-first reference across several
domains, with a separately labelled Reader companion for learning and worked
questions. After the moderated prototype round, distribute a repaired, frozen
proof edition to an invited private-preview cohort. Test independent lookup,
Reader onboarding, application to a real non-sensitive scenario, and
voluntary return use before the first substantial public volume.

### Wave 5: Lexicon Workbench

Add search, construction, comparison, narrowing, and publishing software only
after the editorial method is stable.

Its central construction artifact is a noncanonical Composition Query: several
selected concepts and senses induce a bounded, typed, policy-governed closure
over the reference graph; declared checks evaluate that working graph; and a
loss-aware projection produces a traceable Factor Guide. Automated closure is
not admitted until relation semantics, stopping states, adversarial fixtures,
identity, provenance, and `.roles` review are frozen.

### Wave 6: Reference expansion

Grow reviewed volumes, contributors, provenance, and cross-references without
losing canonical entry identity.

The roadmap refines these waves into R0-R8 milestones. It places the
25-50-entry editorial pilot before interchange freeze, the current 119-entry
usability prototype within the 75-125-entry band, before the approximately 250-entry first substantial
volume, and the Workbench after the editorial contract is proven. The R5P
Proof Set release bridge sits between the observed R4 prototype gate and R5
public publication. It is an invited, non-promoted proof round rather than a
public launch, confidential-source promise, or substitute for either gate.

## Founding research pulses

1. Workspace foundation.
2. Semantic-factor schema contract.
3. Prior art and benchmark custody.
4. Schema parser and conformance.
5. Compositional split fixtures.
6. Alias and strong-control bakeoff.
7. Portable result packet and onboarding guide.

## Non-goals

- replacing the books with a chat interface or generated prose;
- claiming one universal ontology or decomposition;
- publishing large unreviewed lists of plausible AI suggestions;
- forcing every domain into OO, Rust, or another favored paradigm;
- broad NLP, reasoning, or language-understanding claims from toy corpora;
- Squarebit-specific hardware or performance claims;
- arbitrary whole-symbol baselines presented as state of the art;
- outcome-selected splits, dimensions, or metrics;
- production framework scope before the method contract stabilizes.

## Validation

```powershell
cargo fmt --check
cargo clippy --all-targets --all-features -- -D warnings
cargo test --all-targets
cargo run --quiet -- check fixtures\schemas\navigation.factor
cargo run --quiet -- fixtures
cargo run --quiet -- role-fixtures
cargo run --quiet -- binding-controls
cargo run --quiet -- role-bakeoff
cargo run --quiet -- role-packet-check artifacts\factor-role-v1
cargo run --quiet -- bakeoff
cargo run --quiet -- packet-check artifacts\factor-v1
python artifacts\factor-role-v1\verify_role_packet.py artifacts\factor-role-v1
python artifacts\factor-v1\verify_packet.py artifacts\factor-v1
python C:\src\tracker\repos\standards-protocols\roles\tools\check_roles.py .
git diff --check
```

Each implementation pulse must add focused correctness and smoke commands
before code is admitted.
