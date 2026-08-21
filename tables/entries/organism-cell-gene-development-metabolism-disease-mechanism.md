# Organism, Cell, Gene, Development, Metabolism, and Disease Mechanism

Status: candidate anchor entry

## Orientation

An organism is a living individual under a stated biological account; a cell is
a bounded living unit within a lifecycle and lineage; a gene is a heritable
functional or sequence-associated unit under a declared genetic account.
Development is organized biological change across a lifecycle. Metabolism is
the network of transformations of matter and energy sustaining biological
activity. A disease mechanism is a scoped causal process contributing to a
pathological state under an authority and evidence base.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `organism` | Which living individual is identified under which biological account, boundary, lineage, and lifecycle? | living individual |
| `cell` | Which bounded cellular unit of which type, lineage, organism, state, and context is identified? | cellular biological unit |
| `gene` | Which sequence-associated or hereditary unit has which identity, product, function, and variation under which account? | genetic unit |
| `biological-development` | Which organized changes transform which biological entity across which lifecycle interval? | lifecycle transformation process |
| `metabolism` | Which biochemical transformations of matter and energy occur in which entity, compartment, and condition? | biochemical transformation network |
| `disease-mechanism` | Which causal process contributes to which pathological state under which classification, population, and evidence? | scoped pathological mechanism |

## Root factorization

```text
biological-organization-use
  := organism, population, taxon account, and environment
   x cell, tissue, compartment, lineage, and lifecycle state
   x gene identity, sequence, product, expression, function, and variation
   x developmental stage, transition, regulation, and morphology
   x substrates, products, reactions, energy, transport, and metabolic context
   x normal range, pathological state, mechanism, manifestation, and outcome
   x model organism, assay, classification authority, version, and evidence
   x uncertainty, alternatives, provenance, time, and ethical limits
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Organism vs. ecosystem | organisms participate in ecosystems | living individual vs. interacting assemblage and environment |
| Cell vs. component | a cell can be a component | biological unit with lineage/lifecycle vs. view-relative system role |
| Gene vs. gene product | products depend on genes | hereditary or sequence-associated unit vs. RNA/protein or other product |
| Development vs. lifecycle record | either orders stages | organized biological transformation vs. general state-transition account |
| Metabolism vs. chemical reaction | metabolism contains reactions | regulated biological network vs. individual chemical transformation |
| Disease mechanism vs. diagnosis | either concerns pathology | causal process under evidence vs. authority-bound classification conclusion |

## Dependencies and stopping boundary

Adaptation, ecosystems, chemical reactions, state/lifecycle, causal reasoning,
clinical classification, and evidence retain their owners. This Table stops
before taxonomic catalogs, gene nomenclature, pathway enumeration, individual
diagnosis, treatment, risk prediction, or medical advice. Every specialized
claim states authority, version, organism/population, method, and evidence.

## Selection procedure

1. Identify biological entity, account, level, lineage, lifecycle, and context.
2. Select living individual, cell, genetic unit, developmental process, metabolic network, or disease mechanism.
3. Record identity authority, version, method, evidence, and alternatives.
4. Separate gene, product, activity, process, and location.
5. Separate pathological mechanism, manifestation, diagnosis, prognosis, and treatment.
6. Preserve open-world missingness and model-to-target limitations.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Biological ontology | supplies controlled entity and process classes | keeps level, relation, evidence, and version explicit |
| Gene annotation | connects products to functions, processes, and locations | prevents gene, product, activity, and phenotype collapse |
| Clinical classification | records conditions and findings | routes mechanism separately from diagnosis and prognosis |

## Failure signs

- organism, population, and ecosystem are used interchangeably;
- cell is treated as a generic component without biological lifecycle;
- gene, allele, sequence, product, and function share one identity;
- development is any temporal change;
- metabolism is reduced to a list of reactions without biological context;
- mechanism language produces diagnosis or treatment advice.

## Cross-references

- [Adaptation, Fitness, Selection, and Exaptation](adaptation-fitness-selection-exaptation.md)
- [Ecosystem, Habitat, Ecological Niche, Food Web, and Ecological Interdependence](ecosystem-habitat-niche-food-web-interdependence.md)
- [Chemical Reaction, Stoichiometry, Extent, Rate, Equilibrium, and Catalyst](chemical-reaction-stoichiometry-equilibrium.md)
- [Clinical Sign, Symptom, Syndrome, Diagnosis, Differential Diagnosis, and Prognosis](clinical-sign-symptom-syndrome-diagnosis-differential-diagnosis-prognosis.md)

## Sources and provenance

1. Gene Ontology Consortium, ontology documentation:
   https://geneontology.org/docs/ontology-documentation/
2. Gene Ontology Consortium, annotation documentation:
   https://geneontology.org/docs/go-annotations/
3. OBO Foundry, Cell Ontology:
   https://obofoundry.org/ontology/cl.html
4. OBO Foundry, Disease Ontology:
   https://obofoundry.org/ontology/doid.html

These sources provide comparison controls and annotation boundaries. This
Table is not a biological taxonomy, clinical interpretation, or medical advice.
