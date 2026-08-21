# Ecosystem, Habitat, Ecological Niche, Food Web, and Ecological Interdependence

Status: candidate anchor entry

Scope: ecological scope

## Orientation

An ecosystem is a biotic community together with its abiotic environment,
treated as one interacting functional unit over a stated extent and period. A
habitat is the place or type of site where a named organism or population
occurs; it is referenced to that organism, not to a coordinate system. An
ecological niche is the environmental role and resource space a population
occupies along stated axes — the conditions and resources it requires, and the
conditions and resources it consumes or alters. An ecological community is the
set of co-occurring populations in the delimited area and period. A food web is
the network of asserted feeding links among nodes at a stated aggregation and
sampling effort. Ecological interdependence is a measured or modeled mutual
reliance that holds under a stated perturbation.

Boundaries here are selected by the analyst. No ecosystem, community, or web
delimits itself, and an observed distribution is not a niche.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `ecosystem` | Which biotic community and its abiotic environment are treated as one interacting functional unit, over what extent and period? | bounded biotic-abiotic functional unit |
| `habitat` | Which physical or environmental place or site type supports the occurrence of which organism or population? | organism-referenced place or site type |
| `ecological-niche` | Which environmental conditions, resource space, and functional role does a population occupy or affect, along which stated axes? | environmental role and resource-space position |
| `ecological-community` | Which co-occurring populations in the delimited area and period are treated as the assemblage of interest? | co-occurrence assemblage |
| `food-web` | Which feeding (trophic) links among which nodes, at what aggregation and sampling effort, are asserted? | trophic interaction network |
| `trophic-level` | Which position in the energy or material transfer chain is assigned, under what assignment rule? | transfer-position assignment |
| `biological-species-interaction` | Which directional effect of one population on another (predation, competition, mutualism, facilitation, parasitism) is claimed, with which sign, strength, and evidence? | signed pairwise or higher-order effect |
| `ecological-interdependence` | Which measured or modeled mutual reliance among populations, or between populations and abiotic processes, holds under which perturbation, and with what expected consequence of removal? | perturbation-relative mutual reliance claim |

## Root factorization

```text
ecosystem-community-use
  := ecosystem or community identity, purpose, and decision use
   x spatial extent, boundary rule, and habitat or ecotope delimitation
   x temporal window, seasonality, succession stage, and disturbance history
   x taxonomic and functional resolution and node aggregation rule
   x populations, occurrence evidence, abundance, and detectability
   x survey design, sampling frame, analytic sample, and field practice
   x abiotic conditions, resources, and limiting factors
   x niche axes, requirement and impact components, and measurement basis
   x interaction kind, sign, direction, strength, and context dependence
   x trophic link evidence, diet resolution, and sampling effort
   x energy and material transfer, efficiency, and accounting basis
   x network structure, connectance, keystone and higher-order effects
   x perturbation, removal, response, and recovery evidence
   x disturbance absorption, regime persistence, and observed state change
   x human use, ecosystem services, and accounting classification
   x model, data, uncertainty, scale dependence, and scope limits
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Ecosystem vs. ecological community | either bounds multiple populations | biotic and abiotic interacting functional unit vs. co-occurring populations only |
| Ecosystem vs. system | either selects an interacting whole | biotic-abiotic unit with material and energy transfer vs. purpose-selected system-of-interest view |
| Habitat vs. ecological niche | either relates organism and environment | place or site type where the organism occurs vs. conditions, resources, and functional role along stated axes |
| Ecological niche vs. selective environment | either relates a population to its environment | an owned sense here: the environmental role and resource space a population occupies or affects, along stated axes vs. a factor of the evolutionary family's selection claims: which conditions bear on differential persistence of heritable variants, which is not a niche sense anywhere |
| Habitat vs. location or region | either places a subject | organism-referenced supporting site type vs. reference-system coordinates or a bounded region |
| Ecological niche vs. observed distribution | either maps where a population is found | requirement or impact relation along stated axes vs. recorded occurrences, which reflect dispersal and sampling too |
| Food web vs. food chain | either encodes feeding order | full network of trophic links vs. one linear sequence |
| Food web vs. network | either is a node and edge structure | empirically sampled trophic-link claim with diet resolution vs. any typed connectivity view |
| Trophic level vs. species identity | either labels a node | assigned transfer position, often fractional under omnivory, vs. taxonomic identity |
| Biological species interaction vs. correlation | either relates two populations | signed directional effect with removal or perturbation evidence vs. co-variation |
| Ecological resilience vs. dependability resilience | either concerns persistence under disturbance | disturbance a system absorbs while retaining its ecological regime vs. required capability maintained or recovered under adversity for a stated service |
| Ecological regime shift vs. tipping point | either marks abrupt ecological change | observed shift between ecological states of a delimited unit vs. the control-variable level and critical-transition dynamics owned by the tipping-point family |
| Ecological population vs. target population | either bounds a set of units | biological population in the delimited area and period vs. the inference target of a sampling claim |
| Ecological interdependence vs. dependency | either records reliance | measured or modeled population-level mutual reliance under perturbation vs. declared directional reliance with consequence |
| Ecosystem services vs. ecosystem | either concerns the same unit | accounted human-benefit flow under a stated classification vs. the ecological unit itself |

## Dependencies and stopping boundary

- Unit identity, spatial extent, boundary rule, temporal window, and decision
  use are explicit before any ecosystem or community claim.
- Taxonomic or functional resolution and the node aggregation rule are stated
  for every community, food-web, and trophic claim.
- Trophic link claims carry diet resolution, sampling effort, and detectability;
  network metrics are reported as sensitive to both.
- Trophic level records its assignment rule and admits fractional or ambiguous
  positions under omnivory.
- Habitat is referenced to a named organism or population and distinguishes
  habitat, habitat type, habitat use, and habitat quality.
- `ecological-niche` states its axes and marks whether the claim is a
  requirement component (conditions and resources needed) or an impact
  component (conditions and resources consumed or altered). An observed
  distribution is never presented as the niche.
- Interaction and interdependence claims carry sign, direction, strength,
  context dependence, and perturbation or removal evidence, and remain open to
  higher-order effects.
- Biological species is written `biological-species` and pairwise effects are
  written `biological-species-interaction` in sense and factor names because
  `chemical-species` already exists.
- Population claims state whether the population is the biological population
  of the delimited unit or the target population of a sampling claim, and carry
  the sampling frame, analytic sample, and detectability practice on which the
  estimate depends.

This entry stops before evolutionary explanation of organismal fit and
selective persistence, energy and nutrient budget arithmetic, spatial reference
systems and generic network reachability, generic system, boundary,
environment, and dependency semantics, general feedback-loop theory,
critical-transition, cascade, and contagion dynamics, dependability resilience
and recovery measures, sampling and generalization machinery, general
causal-inference machinery, environmental risk assessment and ecotoxicology,
conservation policy and legal designations, exhaustive biome or ecosystem
typologies, ecosystem-service valuation, and organizational, market, or
metaphorical uses of ecosystem, habitat, niche, food chain, and
interdependence.

**Sole ownership of the niche.** This entry owns `ecological-niche` as
environmental role and resource space, and no other family owns a niche sense.
The Adaptation, Fitness, Selection, and Exaptation candidate briefly proposed an
evolutionary niche sense; a fixed-point review on 2026-08-20 found it was not
disjoint from `natural-selection` plus a stated environment and removed it. A
claim here may describe which conditions and resources a population occupies or
alters, including organism-driven environmental modification; it may not claim
heritable variation, differential reproduction, or selected origin, which belong
to that family. That family consumes the description here as selection context
and may not restate assemblage membership, trophic structure, resource-space
description, or removal response. Hutchinson and Soberon are cited by both
entries — substantively here, and there as the record of the declined question;
Leibold is cited only here.

## Selection procedure

1. Name the ecological unit, purpose, and decision use.
2. Fix spatial extent, boundary rule, temporal window, succession stage, and
   disturbance history.
3. Select the exact question: ecosystem, habitat, ecological niche, community,
   food web, trophic level, biological species interaction, or ecological
   interdependence.
4. State taxonomic or functional resolution and the node aggregation rule.
5. Record populations, occurrence evidence, abundance, and detectability, and
   record the abiotic conditions, resources, and limiting factors in scope.
6. For a niche claim, list the axes, mark requirement or impact, and give the
   measurement or model basis; do not substitute a distribution map.
7. For a food-web claim, record link evidence, diet resolution, and sampling
   effort before any structural metric.
8. For a trophic-level claim, state the assignment rule and admit fractional
   positions.
9. For an interaction or interdependence claim, state sign, direction,
   strength, context dependence, and perturbation or removal evidence.
10. State whether a population claim concerns the biological population of the
    delimited unit or the target population of a sampling claim, and record the
    sampling frame, analytic sample, and detectability practice.
11. Route energy and nutrient budgets, spatial reference, generic causal
    machinery, sampling and generalization machinery, critical-transition and
    cascade dynamics, dependability resilience and recovery measures,
    valuation, and evolutionary explanation to their owners.
12. Retain model assumptions, scale dependence, uncertainty, counterexamples,
    and review state.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Dictionary | defines ecosystem, habitat, niche, and food web | prevents everyday, organizational, and technical senses from collapsing |
| Ecology textbook | explains mechanisms and worked field examples | supplies domain authority beyond the compact entry |
| Classic ecological paper | fixes the origin of ecosystem, niche, trophic level, and keystone | keeps the origin's scope limits visible instead of universalizing it |
| Food-web network study | quantifies connectance and structural metrics | retains aggregation and sampling-effort sensitivity as part of the claim |
| Treaty or accounting standard | supplies citable definitions of ecosystem and habitat | keeps instrument-bound definitions from becoming scientific settlement |
| Ecosystem typology | enumerates ecosystem functional groups | keeps named types as external examples, not Lexicon senses |
| Ecological stability study | distinguishes disturbance absorption from return to equilibrium | keeps ecological resilience separate from dependability resilience and recovery |
| Survey or monitoring protocol | fixes design, effort, and detectability | keeps the sampling owner's population, frame, and estimand vocabulary intact |

## Failure signs

- ecosystem or community is asserted without extent, period, or boundary rule;
- habitat is used without naming the organism, or habitat type, use, and
  quality are merged;
- niche is reduced to a location or to an observed distribution;
- niche requirement and niche impact components are conflated;
- an ecological niche claim silently carries a selection or adaptation
  explanation;
- food-web metrics are reported without aggregation rule or sampling effort;
- trophic level is forced to an integer despite omnivory;
- co-variation between populations is reported as a biological species
  interaction;
- an ecological population is silently treated as the target population of a
  sampling claim, or detectability practice is omitted;
- ecological resilience is reported as, or compared numerically with, a
  dependability resilience or recovery measure;
- a regime shift is reported with tipping-point or cascade dynamics that this
  entry does not own;
- keystone or interdependence status is generalized beyond the tested
  perturbation and site;
- energy or nutrient budget arithmetic is restated here instead of being
  routed to its owner;
- organizational or market "ecosystem" and "niche" enter the ecological sense.

## Cross-references

- [Adaptation, Fitness, Selection, and Exaptation](adaptation-fitness-selection-exaptation.md)
  owns no niche sense; this entry is the sole owner of `ecological-niche`, and
  that family consumes the description here as selection context.
- [Tipping Point, Critical Transition, Cascade, Contagion, and Spillover](tipping-point-critical-transition-cascade-contagion-spillover.md)
  owns critical transitions, cascades, and contagion; ecological regime shifts
  are described here only as observed state changes of a delimited unit.
- [Reliability, Availability, Maintainability, Resilience, and Recovery](dependability-reliability-availability-resilience.md)
  owns `resilience` and `recovery` as service-relative measures; ecological
  resilience remains a separate disturbance-absorption claim and borrows no
  dependability measure.
- [Population, Sample, Estimand, Estimate, and Generalization](sampling-generalization.md)
  owns `target-population`, `sampling-frame`, `analytic-sample`, and
  generalization; ecological population claims cite them rather than restating
  them.
- [System Composition, Architecture, Capability, Interface, and Dependency](system-composition-dependency.md)
- [Stock, Flow, Accumulation, Balance, and Conservation](stock-flow-balance.md)
- [Location, Region, Containment, Proximity, Route, and Network](spatial-operating-context.md)
- [Association, Causal Effect, Influence, Mechanism, Intervention, and Attribution](causal-reasoning.md)
- [Objective, Control, Monitoring, and Response](control-monitoring-response.md)
- [Hazard, Exposure, Harm, Vulnerability, and Safety](hazard-exposure-harm-safety.md)
- [Chemical Entity, Substance, Compound Class, Mixture, and Solution](chemical-substance-classification.md)
- [Cost, Price, Value, and Return](cost-price-value-return.md)
- [Admission brief](../../signals/discover/literature/ecology-habitat-niche-food-web-candidate-brief-2026-08-20.md)

## Sources and provenance

1. A. G. Tansley, "The Use and Abuse of Vegetational Concepts and Terms,"
   *Ecology* 16(3):284-307 (1935): https://doi.org/10.2307/1930070
2. Charles Elton, *Animal Ecology* (1927):
   https://archive.org/details/animalecology00elto
3. Joseph Grinnell, "The Niche-Relationships of the California Thrasher,"
   *The Auk* 34(4):427-433 (1917): https://doi.org/10.2307/4072271
4. G. E. Hutchinson, "Concluding Remarks," *Cold Spring Harbor Symposia on
   Quantitative Biology* 22 (1957):
   https://doi.org/10.1101/SQB.1957.022.01.039
5. Whittaker, Levin, and Root, "Niche, Habitat, and Ecotope,"
   *The American Naturalist* 107(955):321-338 (1973):
   https://doi.org/10.1086/282837
6. Mathew A. Leibold, "The Niche Concept Revisited," *Ecology*
   76(5):1371-1382 (1995): https://doi.org/10.2307/1938141
7. Jorge Soberon, "Grinnellian and Eltonian Niches and Geographic
   Distributions of Species," *Ecology Letters* (2007):
   https://doi.org/10.1111/j.1461-0248.2007.01107.x
8. Raymond L. Lindeman, "The Trophic-Dynamic Aspect of Ecology," *Ecology*
   23(4):399-417 (1942): https://doi.org/10.2307/1930126
9. Robert T. Paine, "Food Web Complexity and Species Diversity,"
   *The American Naturalist* 100(910):65-75 (1966):
   https://doi.org/10.1086/282400
10. Dunne, Williams, and Martinez, "Food-web structure and network theory,"
    *PNAS* 99(20) (2002): https://doi.org/10.1073/pnas.192407699
11. Bascompte and Jordano, "Plant-Animal Mutualistic Networks," *Annual Review
    of Ecology, Evolution, and Systematics* 38 (2007):
    https://doi.org/10.1146/annurev.ecolsys.38.091206.095818
12. Levine, Bascompte, Adler, and Allesina, "Beyond pairwise mechanisms of
    species coexistence in complex communities," *Nature* 546:56-64 (2017):
    https://doi.org/10.1038/nature22898
13. Convention on Biological Diversity, Article 2, Use of Terms:
    https://www.cbd.int/convention/articles?a=cbd-02
14. UN System of Environmental-Economic Accounting — Ecosystem Accounting
    (SEEA EA), adopted by the UN Statistical Commission in March 2021:
    https://seea.un.org/en/methodology/ecosystem-accounting
15. Keith et al., "A function-based typology for Earth's ecosystems,"
    *Nature* 610:513-518 (2022), IUCN Global Ecosystem Typology:
    https://doi.org/10.1038/s41586-022-05318-4
16. Krausman and Morrison, "Another plea for standard terminology,"
    *Journal of Wildlife Management* 80(7):1143-1144 (2016), successor to
    Hall, Krausman, and Morrison (1997):
    https://doi.org/10.1002/jwmg.21121
17. Millennium Ecosystem Assessment, *Ecosystems and Human Well-being: A
    Framework for Assessment* (2005):
    https://www.millenniumassessment.org/en/Framework.html
18. IPBES Glossary: https://www.ipbes.net/glossary
19. C. S. Holling, "Resilience and Stability of Ecological Systems," *Annual
    Review of Ecology and Systematics* 4:1-23 (1973):
    https://doi.org/10.1146/annurev.es.04.110173.000245

Provenance notes. Sources 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, and 19
were confirmed through Crossref metadata (title, container, year, and where
applicable volume, pages, and authors) because the publisher HTML refused
automated retrieval; Hutchinson (source 4) and Soberon (source 7) were
confirmed this way on 2026-08-20 and are also cited by the evolutionary
candidate. Sources 13, 14, 17, and 18 were retrieved directly; source 2
resolved to an item page only. Hall, Krausman, and Morrison (1997) could not be
retrieved and is cited only through its verified 2016 successor. No paywalled
clause or article text is quoted or claimed as verified. Comparator access
date: 2026-08-20.

The source set supports a bounded ecological entry with analyst-selected
boundaries, not a universal ecosystem taxonomy, a settled niche theory, or a
claim that ecological terminology is used consistently across ecology.
