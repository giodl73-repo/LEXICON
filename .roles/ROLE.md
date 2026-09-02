# Formarium Role Index

Formarium is a reference project for decomposition patterns, supported by
research evidence and software. Reviews return `pass`, `finding`, or `defer`.
Findings name severity (`critical`, `major`, or `minor`), the affected
artifact, and a closure condition.

## Parliament

| File | Role | Primary tension |
|---|---|---|
| `parliament/compositional-semantics-steward.md` | Compositional Semantics Steward | Useful factorization vs. an arbitrary decomposition |
| `parliament/experimental-methodologist.md` | Experimental Methodologist | Systematic evidence vs. favorable synthetic examples |
| `parliament/representation-control-auditor.md` | Representation Control Auditor | Named encodings vs. equally expressive conventional controls |
| `parliament/data-split-leakage-auditor.md` | Data Split & Leakage Auditor | Genuine recombination vs. surface or identity leakage |
| `parliament/factorization-method-steward.md` | Factorization Method Steward | Useful alternatives and explicit pivots vs. one arbitrary structure |

## Editorial

| File | Role | Gate |
|---|---|---|
| `editorial/evidence-claims-editor.md` | Evidence & Claims Editor | Synthetic, semantic, model, and runtime claims stay separate |
| `editorial/benchmark-numeracy-checker.md` | Benchmark Numeracy Checker | Denominators, storage, parameters, and uncertainty remain visible |
| `editorial/reference-lexicographer.md` | Reference Lexicographer | Fast sense lookup vs. collapsed meanings or vague synonyms |
| `editorial/reference-architecture-editor.md` | Reference Architecture Editor | A coherent encyclopedia vs. disconnected essays and tables |
| `editorial/concept-taxonomy-boundary-editor.md` | Concept & Taxonomy Boundary Editor | Reusable concepts vs. open-ended named taxonomies and catalogs |

## Assurance

| File | Role | Gate |
|---|---|---|
| `assurance/research-integrity-provenance.md` | Research Integrity & Provenance | Inputs, prior art, revisions, nulls, and results are reconstructable |
| `assurance/cross-paradigm-mapping-auditor.md` | Cross-Paradigm Mapping Auditor | General factor roles vs. one paradigm's mechanisms |
| `assurance/domain-source-reviewer.md` | Domain Source Reviewer | Useful synthesis vs. unsupported specialized guidance |
| `assurance/equation-units-auditor.md` | Equation & Units Auditor | Compact formulas vs. lost operators, dimensions, units, or scope |
| `assurance/mapping-integrity-auditor.md` | Mapping Integrity Auditor | Convenient correspondence vs. hidden direction, loss, domain, or version |

## Stakeholders

| File | Stakeholder | Primary concern |
|---|---|---|
| `stakeholders/schema-implementer.md` | Schema Implementer | Can an independent implementation parse and validate the contract? |
| `stakeholders/benchmark-consumer.md` | Benchmark Consumer | Can another project reproduce and interpret the result without FACTOR internals? |
| `stakeholders/reference-practitioner.md` | Reference Practitioner | Can a reader improve a real decision quickly? |
| `stakeholders/product-owner.md` | Product Owner | Does each batch improve a recognizable reader job enough to justify its product and maintenance cost? |

## Review order

1. Parliament reviews factorization, semantics, controls, splits, and design.
2. Editorial reviews entries, claims, navigation, and numeracy.
3. Assurance reviews equations, mappings, domain sources, source custody,
   prior art, and reproduction.
4. Stakeholders review practical lookup, implementability, and consumption.

A fixed point requires no unresolved critical or major actionable finding.

## PITFALL Gates

| Gate | Required roles | Blocks |
|---|---|---|
| LEXICON/Formarium onboarding identity | Product Owner, Reference Architecture Editor, Reference Lexicographer, Schema Implementer, Benchmark Consumer, Research Integrity & Provenance, Evidence & Claims Editor | Onboarding, quickstarts, simulations, customer previews, or portfolio handoffs that mention only one of public repo `LEXICON`, active product `Formarium`, local checkout `repos/knowledge-systems/factorium`, or frozen historical `Factorium` imports before asking a user to edit, validate, or cite the repo. |
