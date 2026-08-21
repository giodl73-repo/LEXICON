# Inheritance, Transmission, Succession, and Bequest

Status: candidate anchor entry

Scope: rule-governed transfer scope

## Orientation

Inheritance is what passes from a predecessor holder to a successor by virtue of
a standing rule rather than a negotiated exchange. Transmission is the process
and channel by which something passes from one bearer to another, at a rate and
with a fidelity. Succession is the ordered replacement of the occupant of a
position, office, role, or holding under a rule and a trigger. A bequest is an
item of personal property directed by a testator to a beneficiary in a valid
testamentary instrument; the corresponding gift of an interest in real property
is a devise, which this entry records as a property-class factor of the same
sense rather than as a separate sense.

This entry answers what passes and by what rule. It never answers who comes from
whom, and it is meaningless until a regime is declared.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `inheritance` | What passes from a predecessor holder to a successor by a standing rule rather than exchange, under which regime? | rule-governed passing of holdings, traits, or definitions |
| `transmission` | Through which process, channel, and event does something pass from bearer to bearer, at what rate and fidelity? | passing process and channel |
| `succession` | Who or what next occupies a position, office, role, or holding, under which ordering rule and trigger? | ordered replacement of an occupant |
| `bequest` | Which item of personal property does which testator direct to which beneficiary under which valid instrument, and is the gift instead a devise of real property? | instrument-directed transfer at death |

## Root factorization

```text
transfer-succession-use
  := regime: genetic, cultural, epidemiological, legal, organizational, computational
   x transferred object: trait, holding, right, obligation, state, or definition
   x predecessor holder, successor, and identity rules for both
   x standing rule, authority, and default versus elective status
   x trigger event, effective time, and vesting or effect conditions
   x process, channel, contact or contact-equivalent, and fidelity
   x rate, probability, and loss or mutation during passing
   x instrument, formalities, validity conditions, and revocation
   x property class of a testamentary gift: personal property (bequest) or an
     interest in real property (devise), with merged jurisdictional usage noted
   x governing law or governing scheme where transfer crosses regimes
   x ordering rule, eligibility, disqualification, and contest path
   x liabilities, obligations, and encumbrances passing with the object
   x acceptance, disclaimer, and refusal options
   x evidence, record, and dispute resolution
   x individual-level versus population-level claim status
   x model, data, uncertainty, and scope limits
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Inheritance vs. descent | both look along a line | what passes by rule vs. who came from whom, owned by the ancestry family |
| Inheritance vs. gift or sale | both move a holding | passing by a standing rule vs. a negotiated or elective transfer inter vivos |
| Inheritance vs. transmission | both involve passing | the entitlement or outcome under a rule vs. the process, channel, and fidelity |
| Inheritance vs. heritability | both use the same root | what an individual receives under a rule vs. a population variance-partition statistic |
| Transmission vs. signal transmission | both send something along a channel | passing of a trait, holding, state, or practice between bearers vs. coding-theoretic transfer owned by the information entry |
| Transmission vs. power transmission | both are called transmission | bearer-to-bearer passing vs. mechanical energy transfer |
| Transmission vs. contagion | both concern spread | the per-event passing process, channel, and fidelity owned here vs. the population- or network-level propagation pattern and its identification burden owned by [Tipping Point, Critical Transition, Cascade, Contagion, and Spillover](tipping-point-critical-transition-cascade-contagion-spillover.md); each side consumes the other's factors rather than restating them |
| Succession vs. inheritance | both name a successor | who next occupies the position vs. what passes to them |
| Succession vs. delegation | both place another actor in a function | the predecessor ceases to hold the position vs. the delegator retains it |
| Succession vs. ecological succession | both are called succession | ordered replacement of an occupant under a rule vs. directional community change, excluded here and not owned as a sense elsewhere either: it appears only as a `succession stage` factor in [Ecosystem, Habitat, Ecological Niche, Food Web, and Ecological Interdependence](ecosystem-habitat-niche-food-web-interdependence.md), so it remains unowned routing residue |
| Succession vs. version supersession | both replace a predecessor | occupancy of a position vs. version identity under a scheme |
| Bequest vs. intestate inheritance | both transfer at death | direction by a valid instrument vs. the default statutory rule where none governs |
| Bequest vs. devise | both are will-made gifts | a gift of personal property vs. a gift of an interest in real property; where an instrument or jurisdiction merges the terms, the merged usage is recorded as a factor rather than assumed |
| Bequest vs. legacy claim | both use the word legacy loosely | instrument-directed holding vs. reputation and contribution claims owned by the evidence table |
| Class inheritance vs. behavioral subtyping | both relate types | rule-governed passing of definitions vs. substitutability obligations owned by the type entry |

## Dependencies and stopping boundary

- The regime is declared before any claim; without it the family equivocates
  across genetics, law, organizations, and software.
- Transferred object, predecessor holder, successor, and identity rules for both
  are explicit.
- The standing rule, its authority, and its default or elective status are
  named, along with the trigger event, effective time, and vesting conditions.
- Transmission claims state process, channel, contact or contact-equivalent,
  rate, and fidelity, and record loss or mutation during passing.
- Succession claims state the ordering rule, eligibility, disqualification, and
  contest path.
- Bequest claims state the instrument, formalities, validity, revocation status,
  and governing law where transfer is cross-border, and state the property class
  of the gift: personal property for a `bequest`, an interest in real property
  for a devise.
- **Transmission is consumed by contagion, and consumes contagion's structure in
  return.** This entry defines the per-event mechanism, channel, contact or
  contact-equivalent, rate, and fidelity, and
  [Tipping Point, Critical Transition, Cascade, Contagion, and Spillover](tipping-point-critical-transition-cascade-contagion-spillover.md)
  cites them. That entry defines susceptibility, network topology, the
  population-level propagation pattern, and the identification burden, and this
  entry cites them whenever a transmission claim is generalized to a population.
  Neither side restates the other's factors as its own.
- Liabilities, encumbrances, acceptance, and disclaimer options travel with the
  transferred object.
- Every claim is marked individual-level or population-level.

**`lineage` is routing language, not a sense.** It is used for descent among
persons or organisms, for a line of transfer of a holding or office, for the
data-derivation chain held as a concept by
[History, Revision, Provenance, Lineage, and Change Evidence](../evidence/change-lineage.md)
under the identity, naming, classification, and versioning headword, for a
taxonomic branch, and for corporate ancestry claims. **No canonical sense owns
the bare word**, and that evidence view uses it as a concept rather than as a
sense. Neither this entry nor
[Descent, Kinship, Pedigree, and Genealogy](descent-kinship-pedigree-genealogy.md)
admits a `lineage` sense. Where other candidate drafts already use lineage or
inheritance inside factor names, those uses are reconciliation inputs for a
later fixed-point pass, not competing ownership claims. The word must be
disambiguated before it enters a factor name here.

**Ecological succession is routing residue.** It is excluded from `succession`
here, and it is not owned as a sense by
[Ecosystem, Habitat, Ecological Niche, Food Web, and Ecological Interdependence](ecosystem-habitat-niche-food-web-interdependence.md)
either, where it appears only as a `succession stage` factor. A reader is routed
to that factor, and no entry is credited with owning the phrase.

This entry stops before ancestry structure, coding-theoretic channels,
mechanical power transmission, ecological succession, population-level contagion
claims, jurisdiction-specific probate procedure, estate valuation and taxation,
and language-specific type-system design.

## Selection procedure

1. Declare the regime and the decision use.
2. Select the exact question: inheritance, transmission, succession, or bequest.
3. Name the transferred object, the predecessor holder, the successor, and the
   identity rules for both.
4. Name the standing rule, its authority, and whether it is default or elective.
5. Record the trigger event, effective time, and vesting or effect conditions.
6. For transmission, record process, channel, contact definition, rate, and
   fidelity, and record loss or mutation during passing.
7. Route population-pattern spread claims to the dynamical family and keep the
   per-event process here; cite that family's susceptibility, topology, and
   identification factors rather than restating them.
8. For succession, record the ordering rule, eligibility, disqualification, and
   contest path, and confirm the predecessor ceases to hold the position.
9. For bequest, record the instrument, formalities, validity, revocation, and
   governing law, and record the property class: personal property for a
   bequest, an interest in real property for a devise, noting any merged
   jurisdictional usage.
10. Record liabilities, encumbrances, acceptance, and disclaimer options.
11. Mark individual-level versus population-level status, and never present
    heritability as individual inheritance.
12. Route entitlement content, obligation content, valuation, and ancestry
    questions to their owners.
13. Retain evidence, dispute state, uncertainty, and review state.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Dictionary | defines inheritance and succession loosely | forces a regime declaration before use |
| Genetics reference | describes modes of inheritance | keeps individual inheritance distinct from population heritability |
| Epidemiology reference | describes transmission modes and rates | keeps the per-event process distinct from a contagion claim |
| Model statute or code | supplies default succession and will formalities | keeps default rules and instruments as separate factors |
| Conflict-of-laws instrument | fixes the applicable law for cross-border succession | makes governing law an explicit factor |
| Language specification | defines class inheritance precisely | keeps definitional passing distinct from substitutability obligations |

## Failure signs

- a claim is made without declaring the regime;
- inheritance and descent are used interchangeably;
- heritability is presented as what an individual inherits;
- epigenetic inheritance is asserted without mechanism evidence;
- a transmission mechanism is presented as proof of population spread;
- transmission is used for signal or mechanical energy transfer;
- a reproduction number is quoted as a pathogen constant;
- succession is asserted with no ordering rule or trigger;
- delegation is described as succession while the delegator retains the
  position;
- ecological succession is filed under this family, or is attributed to the
  ecology candidate as an owned sense when it is only a factor there;
- a bequest is asserted without the instrument, formalities, or validity status;
- a gift of real property is called a bequest with no record of the devise
  distinction or of a merged jurisdictional usage;
- intestate default rules are described as the testator's intent;
- governing law is left implicit in a cross-border transfer;
- liabilities, encumbrances, or disclaimer options are omitted from a transfer;
- class inheritance is treated as automatic behavioral substitutability;
- `lineage` is used as if it were a sense of this entry, or a factor name in
  another draft is treated as an ownership claim over the bare word.

## Cross-references

- [Descent, Kinship, Pedigree, and Genealogy](descent-kinship-pedigree-genealogy.md)
- [History, Revision, Provenance, Lineage, and Change Evidence](../evidence/change-lineage.md)
- [Access, Permission, Authorization, and Entitlement](access-permission-authorization-entitlement.md)
- [Organization, Role, Authority, and Accountability](organization-role-authority.md)
- [Governance, Obligation, and Compliance](governance-obligation-compliance.md)
- [Identity, Naming, Classification, and Versioning](identity-naming-classification-versioning.md)
- [State, Event, Transition, Process, and Lifecycle](state-event-transition-process-lifecycle.md)
- [Information, Data, Signal, and Noise](information-data-signal-noise.md)
- [Software Type, Value, and Function](software-type-value-function.md)
- [Tipping Point, Critical Transition, Cascade, Contagion, and Spillover](tipping-point-critical-transition-cascade-contagion-spillover.md)
- [Adaptation, Fitness, Selection, and Exaptation](adaptation-fitness-selection-exaptation.md)
- [Ecosystem, Habitat, Ecological Niche, Food Web, and Ecological Interdependence](ecosystem-habitat-niche-food-web-interdependence.md)
- [Admission brief](../../signals/discover/literature/inheritance-transmission-succession-bequest-candidate-brief-2026-08-20.md)

## Sources and provenance

1. Gregor Mendel, "Experiments in Plant Hybridization" (English translation):
   http://www.esp.org/foundations/genetics/classical/gm-65.pdf
2. MedlinePlus Genetics, "Inheritance Patterns":
   https://medlineplus.gov/genetics/understanding/inheritance/inheritancepatterns/
3. Heard and Martienssen, "Transgenerational Epigenetic Inheritance: Myths and
   Mechanisms": https://doi.org/10.1016/j.cell.2014.02.045
4. Cavalli-Sforza and Feldman, *Cultural Transmission and Evolution*:
   https://doi.org/10.1515/9780691209357
5. Diekmann, Heesterbeek, and Metz, "On the Definition and the Computation of
   the Basic Reproduction Ratio R0": https://doi.org/10.1007/BF00178324
6. World Health Organization, "Coronavirus Disease (COVID-19): How Is It
   Transmitted?":
   https://www.who.int/news-room/questions-and-answers/item/coronavirus-disease-covid-19-how-is-it-transmitted
7. Uniform Law Commission, Uniform Probate Code:
   https://www.uniformlaws.org/acts/probate
8. Cornell Legal Information Institute, "Intestate Succession":
   https://www.law.cornell.edu/wex/intestate_succession
9. Cornell Legal Information Institute, "Bequest":
   https://www.law.cornell.edu/wex/bequest
10. Cornell Legal Information Institute, "Devise":
    https://www.law.cornell.edu/wex/devise
11. Regulation (EU) No 650/2012 on jurisdiction, applicable law, and the
    European Certificate of Succession:
    https://eur-lex.europa.eu/eli/reg/2012/650/oj
12. HCCH, Convention on the Law Applicable to Succession to the Estates of
    Deceased Persons:
    https://www.hcch.net/en/instruments/conventions/full-text/?cid=62
13. 3 U.S.C. § 19, Vacancy in offices of both President and Vice President:
    https://www.law.cornell.edu/uscode/text/3/19
14. ISO 30414, *Human Resource Management — Guidelines for Internal and External
    Human Capital Reporting* (succession planning):
    https://www.iso.org/standard/69338.html
15. Liskov and Wing, "A Behavioral Notion of Subtyping":
    https://doi.org/10.1145/197320.197383
16. Alan Snyder, "Encapsulation and Inheritance in Object-Oriented Programming
    Languages": https://doi.org/10.1145/960112.28702
17. Java Language Specification (SE 21), Chapter 8: Classes:
    https://docs.oracle.com/javase/specs/jls/se21/html/jls-8.html
18. Thomas Piketty, "On the Long-Run Evolution of Inheritance":
    https://doi.org/10.1093/qje/qjr020
19. Connell and Slatyer, "Mechanisms of Succession in Natural Communities"
    (cited as an exclusion boundary): https://doi.org/10.1086/283241

The source set supports a bounded transfer entry across declared regimes, not a
probate procedure, a genetics of inheritance, an epidemic model, or a type-system
design guide.
