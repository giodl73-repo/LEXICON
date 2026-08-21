# Descent, Kinship, Pedigree, and Genealogy

Status: candidate anchor entry

Scope: ancestry-structure scope

## Orientation

Descent is the ancestor-to-descendant derivation relation between individuals or
populations. Kinship is relatedness as a recognition system defines it, which
includes biological, legal, and social ties. A pedigree is the recorded set of
individuals and parent-offspring links, drawn or encoded under a standard. A
genealogy is a sourced reconstruction of ancestry for named individuals under a
stated proof standard.

This entry answers who comes from whom and who counts as related. It never
answers what passes along those relations.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `descent` | Which ancestor-to-descendant derivation holds between which individuals or populations, over how many generations, on what evidence? | derivation relation between generations |
| `kinship` | Which socially or culturally recognized relatedness category connects which persons, under which system's rules? | recognized relatedness category |
| `pedigree` | Which individuals and parent-offspring links are recorded, under which nomenclature, completeness, and ascertainment rule? | structured link record |
| `genealogy` | Which sourced reconstruction of ancestry for named individuals is asserted, under which proof standard and confidence? | evidenced ancestry reconstruction |

## Root factorization

```text
descent-kinship-record-use
  := subject individuals or populations, identity rule, and decision use
   x population delimitation rule and authority where the subject is a population
   x external evidence supplier for population-level claims, cited not owned
   x generation depth, direction, and time span
   x parent-offspring link evidence and link type: biological, legal, social
   x descent rule applied and its stated system
   x recognition system, its authority, and its own terms
   x relatedness measure, definition, and basis
   x expectation versus realized genomic sharing
   x record structure, nomenclature standard, and exchange format
   x completeness, ascertainment, and misattributed-parentage allowance
   x source citation, conflict resolution, and proof standard
   x confidence, disputed links, and unresolved branches
   x privacy, consent, and third-party exposure of relatives
   x prohibited inferences: trait, entitlement, race, and character
   x model, data, uncertainty, and scope limits
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Descent vs. kinship | both relate persons | derivation across generations vs. relatedness a system recognizes |
| Descent vs. inheritance | both look backward along a line | who came from whom vs. what passes by rule, owned by the transfer family |
| Descent vs. `lineage` (data) | both are directed chains | derivation among organisms or persons vs. source-to-derived chains of records, held as a concept by the change-lineage evidence view under the identity and version headword rather than as a canonical sense |
| Descent vs. phylogeny | both use ancestry | derivation among individuals or populations vs. taxonomic branching structure |
| Descent vs. gene tree | both use genetic evidence | organismal derivation vs. one locus's genealogy, which can disagree |
| Kinship vs. legal family status | both categorize relatives | recognition under a cultural system vs. status under a legal instrument |
| Kinship vs. household | both group people | recognized relatedness vs. co-residence |
| Kinship vs. relatedness coefficient | both measure closeness | a recognized category vs. a numeric expectation from a pedigree |
| Pedigree vs. genealogy | both record ancestry | the structured link record vs. the sourced reconstruction and its argument |
| Pedigree vs. family tree display | both are drawn | a standard-nomenclature record with ascertainment stated vs. a presentation artifact |
| Genealogy vs. provenance | both trace origins | ancestry of persons under a genealogical proof standard vs. custody of records or artifacts |
| Genealogy vs. legacy claim | both concern named subjects | derivation and relatedness vs. contribution, credit, and reputation |

## Dependencies and stopping boundary

- Identity rules for every individual are established before any link is
  asserted.
- Every parent-offspring link states its type — biological, legal, or social —
  and its evidence.
- The descent rule and the recognition system whose terms are used are named,
  with that system's authority.
- Pedigrees state completeness, ascertainment, and misattributed-parentage
  allowance, and name the nomenclature or exchange standard used.
- Relatedness coefficients state their definition and basis and mark expectation
  versus realized sharing.
- Genealogies name a proof standard, cite sources, resolve conflicts, and state
  confidence; disputed links and unresolved branches remain visible.
- Genetic genealogy states privacy, consent, and third-party exposure.
- **Population-level descent stays in scope.** A claim that one population
  derives from another is a `descent` claim, and it states the population
  delimitation rule and its authority in the same way an individual claim states
  an identity rule. What is excluded is the inference machinery: phylogenetic
  reconstruction, coalescent modeling, admixture estimation, and other
  population-genetic inference are cited as external evidence suppliers whose
  outputs support such a claim, and are never senses of this entry.

**`lineage` is routing language, not a sense.** The word is used for descent
among persons or organisms, for a line of transfer of a holding or office, for a
data-derivation chain held as a concept by
[History, Revision, Provenance, Lineage, and Change Evidence](../evidence/change-lineage.md)
under the identity, naming, classification, and versioning headword, for a
taxonomic branch, and for corporate ancestry claims. **No canonical sense owns
the bare word**, and that evidence view uses it as a concept rather than as a
sense. This entry admits no `lineage` sense and neither does
[Inheritance, Transmission, Succession, and Bequest](inheritance-transmission-succession-bequest.md).
Where other canonical Tables already use lineage or inheritance inside factor
names, those uses are reconciliation inputs for a later fixed-point pass, not
competing ownership claims. Any use must be disambiguated to a stated sense
before it enters a factor name here.

This entry stops before trait heritability, property and office transfer,
phylogenetic taxonomy, forensic identification, family law, and data
provenance; population-genetic inference is consumed as evidence, not owned.

## Selection procedure

1. Identify the subject individuals or populations, their identity rule or
   population delimitation rule, and the decision use.
2. Select the exact question: descent, kinship, pedigree, or genealogy.
3. State generation depth, direction, and time span.
4. Record each parent-offspring link with its type and its evidence; for a
   population-level claim, record the external evidence supplier and its
   assumptions instead of asserting inference machinery here.
5. Name the descent rule and the recognition system supplying the categories.
6. Record the pedigree's structure, nomenclature standard, completeness, and
   ascertainment, and allow explicitly for misattributed parentage.
7. Report relatedness coefficients with definition, basis, and expectation
   versus realized sharing.
8. Apply a named proof standard to any genealogical conclusion, with citations
   and conflict resolution.
9. Record confidence, disputed links, and unresolved branches.
10. Record privacy, consent, and exposure of non-participating relatives for any
    genetic search.
11. Route entitlement, property, office, and trait consequences to the transfer
    family; route record-derivation questions to the change-lineage evidence
    view.
12. Retain assumptions, uncertainty, prohibited inferences, and review state.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Dictionary | defines descent, kinship, pedigree, and genealogy loosely | prevents biological, legal, and social relatedness from collapsing |
| Anthropological reference | describes kinship systems comparatively | keeps recognition rules attached to a named system |
| Clinical pedigree standard | prescribes symbols and structure | makes completeness and ascertainment recorded factors |
| Genealogical proof standard | prescribes search, citation, and conflict resolution | keeps confidence and revisability explicit |
| Quantitative-genetics text | supplies relatedness coefficients | keeps expectation distinct from realized sharing |
| Exchange format specification | encodes records for transfer | keeps encoded assertions from reading as verified facts |

## Failure signs

- a recorded parent-offspring link is assumed to be biological;
- kinship categories are read directly off genetic relatedness;
- adoption, affinity, fosterage, and ritual kinship are treated as exceptions
  rather than as recognized relatedness;
- a pedigree omits completeness, ascertainment, or misattributed-parentage
  allowance;
- a relatedness coefficient is reported as a measurement of shared genome;
- a single locus or a single test result is presented as descent;
- a genealogy is asserted with no proof standard, citations, or confidence;
- disputed links are pruned to make a clean tree;
- `lineage` is used as if it were a sense of this entry, or a factor name in
  another Table is treated as an ownership claim over the bare word;
- a population-level descent claim is asserted without a delimitation rule, or
  its inference machinery is presented as a sense of this entry;
- data-derivation questions are answered with ancestry vocabulary;
- descent is used to assert entitlement, office, property, or trait outcomes;
- ancestry is used to support racial, typological, or character claims;
- a genetic search exposes non-consenting relatives with no record of that
  exposure.

## Cross-references

- [Inheritance, Transmission, Succession, and Bequest](inheritance-transmission-succession-bequest.md)
- [History, Revision, Provenance, Lineage, and Change Evidence](../evidence/change-lineage.md)
- [Identity, Naming, Classification, and Versioning](identity-naming-classification-versioning.md)
- [Claim and Evidence](claim-evidence.md)
- [Contribution, Credit, Priority, and Legacy Evidence](../evidence/contribution-credit-priority-legacy.md)
- [Association, Causal Effect, Influence, Mechanism, Intervention, and Attribution](causal-reasoning.md)
- [Sampling, Estimation, and Generalization](sampling-generalization.md)
- [Adaptation, Fitness, Selection, and Exaptation](adaptation-fitness-selection-exaptation.md)
- [Privacy, Confidentiality, Secrecy, Anonymity, and Disclosure](privacy-confidentiality-secrecy-anonymity-disclosure.md)
- [Editorial record](../../signals/discover/literature/descent-kinship-pedigree-genealogy-candidate-brief-2026-08-20.md)

## Sources and provenance

1. Sewall Wright, "Coefficients of Inbreeding and Relationship":
   https://doi.org/10.1086/279872
2. Elizabeth A. Thompson, "Identity by Descent: Variation in Meiosis, Across
   Genomes, and in Populations":
   https://doi.org/10.1534/genetics.112.148825
3. W. D. Hamilton, "The Genetical Evolution of Social Behaviour I":
   https://doi.org/10.1016/0022-5193(64)90038-4
4. Bennett et al., "Standardized Human Pedigree Nomenclature: Update and
   Assessment": https://doi.org/10.1007/s10897-008-9169-9
5. PLINK 1.9 `.fam` pedigree file format:
   https://www.cog-genomics.org/plink/1.9/formats#fam
6. FamilySearch GEDCOM 7 specification:
   https://gedcom.io/specifications/FamilySearchGEDCOMv7.html
7. Board for Certification of Genealogists, Ethics and Standards (Genealogical
   Proof Standard): https://bcgcertification.org/ethics-standards/
8. Lewis Henry Morgan, *Systems of Consanguinity and Affinity of the Human
   Family*: https://archive.org/details/systemsofconsang00morgrich
9. Marshall Sahlins, *What Kinship Is—And Is Not*:
   https://doi.org/10.7208/chicago/9780226925134.001.0001
10. Wayne P. Maddison, "Gene Trees in Species Trees":
    https://doi.org/10.1093/sysbio/46.3.523
11. de Queiroz and Gauthier, "Phylogenetic Taxonomy":
    https://doi.org/10.1146/annurev.es.23.110192.002313
12. Joseph T. Chang, "Recent Common Ancestors of All Present-Day Individuals":
    https://doi.org/10.1239/aap/1029955256
13. Rohde, Olson, and Chang, "Modelling the Recent Common Ancestry of All Living
    Humans": https://doi.org/10.1038/nature02842
14. Erlich, Shor, Pe'er, and Carmi, "Identity Inference of Genomic Data Using
    Long-Range Familial Searches": https://doi.org/10.1126/science.aau4832
15. Yudell, Roberts, DeSalle, and Tishkoff, "Taking Race Out of Human Genetics":
    https://doi.org/10.1126/science.aac4951

The source set supports a bounded ancestry-structure entry, not a kinship
theory, a genetic-genealogy method, or any licence to infer traits, entitlements,
or character from descent.
