# Consistency, Contradiction, Satisfiability, and Completeness

Status: candidate anchor entry

## Orientation

Consistency says that a theory or set of formulas does not derive a prohibited pair or every formula under a stated calculus. A contradiction is a formula or jointly asserted content incompatible under a logic. Satisfiability says an interpretation or model makes all formulas in a set true. Completeness is a family of coverage properties: a calculus may derive every semantic consequence, a theory may decide every sentence in a class, or a specification may cover a declared target.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `formal-consistency` | Does which theory/formula set avoid which derivational conflict under which calculus? | syntactic nonconflict status |
| `contradiction` | Which formula or contents cannot jointly hold under which logic and interpretation? | formal incompatibility object/status |
| `satisfiability` | Is there an interpretation/model satisfying every formula in which set? | semantic model-existence status |
| `semantic-completeness` | Does which calculus derive every consequence valid under which semantics? | calculus-to-semantics coverage property |
| `theory-completeness` | Does which theory decide every sentence in which language or declared class? | theory decision-coverage property |

## Root factorization

```text
formal-compatibility-use
  := formula or theory set, language, logic, calculus, and version
   x derivability relation, negation or conflict form, explosion behavior, and consistency criterion
   x interpretations, domain, valuation, satisfaction relation, and model existence
   x semantic consequence, proof relation, soundness, completeness direction, and theorem scope
   x sentence class, decision criterion, independence, incompleteness, and extension
   x local or global scope, finite or infinite set, compactness assumptions, and metalanguage
   x witness, countermodel, proof, automation, resource bound, and unknown status
   x provenance, uncertainty, and limitations
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Consistency vs. satisfiability | classical sound/complete systems connect them | no prohibited derivation vs. existence of a model |
| Contradiction vs. contrary claims | either conflicts | formal joint impossibility vs. broader opposition |
| Unsatisfiable vs. false | false formulas may be satisfiable elsewhere | no satisfying interpretation vs. false in one interpretation |
| Semantic completeness vs. soundness | both compare proof and semantics | all valid consequences derivable vs. all derivations valid |
| Theory completeness vs. semantic completeness | both say “complete” | sentences decided by theory vs. calculus captures semantics |
| Unknown vs. incomplete | either lacks a result | current epistemic state vs. proved coverage limitation |

## Dependencies and stopping boundary

Generic conflict, data completeness, requirement coverage, proof, model, and software satisfiability retain their owners. This Table stops before proving consistency/completeness, solving satisfiability, selecting a logic, or treating resource-limited failure as a metatheorem.

## Selection procedure

1. State formula/theory, language, logic, calculus, semantics, and version.
2. Select syntactic consistency, contradiction, satisfiability, semantic completeness, or theory completeness.
3. Record scope, derivability, satisfaction, model class, and metalanguage.
4. Distinguish proof, countermodel, timeout, unknown, independence, and incompleteness.
5. Preserve nonclassical behavior, resource bounds, and limitations.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Classical logic | connects consistency/satisfiability and proof/validity | refuses to universalize classical equivalences |
| Proof/model theory | supplies metatheorems and witnesses | requires exact system and theorem direction |
| Solver | reports sat/unsat/unknown under an encoding | separates operational verdict from broad formal claim |

## Failure signs

- consistency and satisfiability are synonyms in every logic;
- disagreement is called a formal contradiction;
- false in one model means unsatisfiable;
- all meanings of completeness collapse;
- solver timeout proves incompleteness or unsatisfiability;
- a system-relative theorem becomes a universal claim.

## Cross-references

- [Model, Representation, and Simulation](model-representation-simulation.md)
- [Policy, Rule, Constraint, Decision, Review, Appeal, and Exception](policy-rule-constraint-decision-exception.md)
- [Evaluation Measure, Scale, Criterion, and Score](evaluation-measure-scale-criterion.md)
- [Collection Identity, Membership, Arrangement, and Completeness](collection-identity-membership-arrangement-completeness.md)

## Sources and provenance

1. “Classical Logic,” *Stanford Encyclopedia of Philosophy*: https://plato.stanford.edu/entries/logic-classical/
2. “Proof Theory,” *Stanford Encyclopedia of Philosophy*: https://plato.stanford.edu/entries/proof-theory/
3. “Logical Consequence,” *Stanford Encyclopedia of Philosophy*: https://plato.stanford.edu/archives/spr2019/entries/logical-consequence/

Equivalences and metatheorems remain system-relative.
