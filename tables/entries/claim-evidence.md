# Claim and Evidence

Status: candidate anchor entry

## Orientation

A claim states what is asserted. An observation records what was encountered
or detected under a method and context; measurement is the narrower process
of obtaining quantity values; a result records a method's output; inference
connects premises and results to a conclusion. Evidence is claim-relative:
an observation, result, artifact, or argument supports or contradicts only
through an explicit implication. Limitations, confidence, and provenance
remain separate.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `claim` | What exactly is asserted, for which subject and scope? | proposition |
| `evidence-item` | What observation, artifact, source, or argument bears on the claim? | support or contradiction |
| `result` | What outcome did a specified method produce? | evaluated observation |
| `limitation` | What interpretation is excluded or remains unresolved? | scope boundary |
| `confidence` | How strong is current support under declared criteria? | evidence summary |
| `provenance` | Where did the evidence come from and how can it be reproduced? | custody metadata |
| `observation` | What was encountered or detected, by which observer or system, under what method and context? | recorded empirical or documentary encounter |
| `measurement` | Which quantity was measured through which procedure and system, producing which attributed values and uncertainty? | quantity-obtaining process |
| `evidential-inference` | Which premises, method or model, and assumptions connect evidence or results to a conclusion? | evidence-to-claim reasoning step |

Existing sense order is preserved in the canonical interchange; the three F3
senses are appended identities rather than replacements.

## Role ladder

```text
entity, event, or source
  -- encountered and recorded as --> observation

quantity, procedure, and measuring system
  -- produce --> measurement result

observation, result, or artifact
  + method/model and assumptions
  -- support inference --> conclusion

conclusion
  -- stated with subject and scope as --> claim

evidence item
  -- bears on claim through --> supporting or contradicting implication
```

## Root factorization

```text
claim-evidence-use
  := exact claim
   x subject, population, and scope
   x method and comparison
   x evidence artifact and identity
   x observation or result
   x supporting and contradicting implications
   x limitations and excluded claims
   x confidence criteria
   x provenance and reproduction
   x reviewer and revision
   x measurement model, procedure, and system
   x inference rule and assumptions
```

## Specialized views

The linked [Founding FACTOR Evidence](../evidence/founding-factor-evidence.md)
compares the narrow claims supported and excluded by the two accepted
synthetic bakeoffs.

The linked
[Observation-to-Inference Evidence Chain](../evidence/observation-inference-chain.md)
preserves the stages from source and method through observation, result,
inference, claim implication, confidence, and limitation.

## Selection procedure

1. State the exact claim, subject, population, scope, and time.
2. Identify source entities, activities, agents, versions, and custody.
3. Record observations with observer or system, method, context, time, and
   raw record identity.
4. Use `measurement` only for quantity-valued processes; state measurand,
   model, procedure, measuring system, conditions, values, units/references,
   and uncertainty.
5. Separate raw observation, corrected or transformed result, and derived
   summary.
6. Record inference premises, rule/model, assumptions, alternatives, and
   conclusion.
7. State exactly how each item supports, contradicts, or fails to bear on the
   claim.
8. Retain nulls, ties, exclusions, missingness, and competing explanations.
9. State limitations and excluded claims before assigning confidence.
10. Record review, revision, supersession, and reproduction paths.

## Reference Delta

| Reference form | Typical contribution | Factorium delta |
|---|---|---|
| Citation list | Identifies sources | Does not necessarily map sources to exact claims |
| Experiment report | Explains method and results | Owns detailed evidence and reproduction |
| Evidence matrix | Compares claims and support | Matches this specialized family |
| Reference Delta | Compares Factorium with neighboring reference forms | Is mandatory comparative metadata, not claim evidence |
| Factorium | Links compact claim-evidence views to full artifacts | Keeps support, contradiction, limitation, and maturity separate |

## Constraints and failure signs

- Claims are specific enough to be contradicted.
- Evidence identity and method are reproducible.
- Observations retain observer/system, context, time, and raw record identity.
- Measurements retain measurand, procedure, system, conditions, values,
  reference/unit, and uncertainty.
- Results are not relabeled as conclusions.
- Inferences retain premises, model/rule, assumptions, alternatives, and
  conclusion.
- Support and contradiction are both retained.
- Null and tied results are not omitted.
- Limitations state what the result does not establish.
- Confidence criteria are visible.
- Provenance does not automatically create an Evidence Table.
- Evidence does not automatically upgrade editorial maturity.

## Cross-references

- [Factorium Entry Publication](factorium-entry-publication.md)
- [Probability, Risk, and Uncertainty](probability-risk-uncertainty.md)
- [Information, Data, Signal, and Noise](information-data-signal-noise.md)
- [Association and Causal Reasoning](causal-reasoning.md)
- [Population, Sample, Estimand, Estimate, and Generalization](sampling-generalization.md)
- [Context](../roots/context.md)
- [Relation](../roots/relation.md)

## Sources and provenance

1. `docs/STRONG-CONTROL-BAKEOFF-RESULT.md`
2. `docs/ROLE-AMBIGUITY-RESULT.md`
3. `specs/REFERENCE-DELTA.md`
4. JCGM VIM, "measurement" and "measurement result":
   https://jcgm.bipm.org/vim/en/2.1.html
   https://jcgm.bipm.org/vim/en/2.9.html
5. W3C, PROV-O:
   https://www.w3.org/TR/prov-o/
6. NIST, "Measurement Uncertainty":
   https://www.nist.gov/itl/sed/topic-areas/measurement-uncertainty

Factorium evidence organization remains `candidate`.
