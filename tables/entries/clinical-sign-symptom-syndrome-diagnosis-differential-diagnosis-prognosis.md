# Clinical Sign, Symptom, Syndrome, Diagnosis, Differential Diagnosis, and Prognosis

Status: candidate anchor entry

[Admission brief](../../signals/discover/literature/clinical-reasoning-candidate-brief-2026-08-20.md)

## Orientation

This descriptive candidate maps concepts used in clinical classification and
reasoning. It is not medical advice, diagnosis, triage, treatment, or a
substitute for a classification authority. Every classification claim requires
an authority, version, context, and evidence.

## Sense table

| Sense ID | Governing question | Core |
| --- | --- | --- |
| `clinical-sign` | Which observer-detectable finding is documented under what method and context? | observed finding |
| `clinical-symptom` | Which subject-reported experience is documented under what wording and context? | reported experience |
| `clinical-syndrome` | Which co-occurring pattern is named under which classification or clinical account? | patterned constellation |
| `clinical-diagnosis` | Which classification conclusion is asserted under which authority, version, criteria, and evidence? | authority-bound conclusion |
| `clinical-differential-diagnosis` | Which alternative classification hypotheses are compared under which evidence and criteria? | alternatives under comparison |
| `clinical-prognosis` | Which future course or outcome estimate is asserted for which population, condition, horizon, and evidence? | scoped forecast |

## Root factorization

Factor person or population, encounter context, source, observer, finding or
report, method, classification authority/version, criteria, alternatives,
evidence, uncertainty, horizon, and update time. Risk, causation, prediction,
and evaluation are factors or routed owners.

## Decisive distinctions

A sign is observer-detectable; a symptom is reported. A syndrome names a pattern
and need not itself establish a diagnosis. Diagnosis is an authority- and
version-bound conclusion; differential diagnosis preserves alternatives.
Prognosis estimates a future course and is not causal explanation, evaluation,
or a general prediction sense.

## Dependencies and stopping boundary

Require a named classification authority and version for any classification
claim. Route prediction to forecast owners, probability/risk to their owners,
causal mechanisms to causal reasoning, and evaluation to evaluation records.
Never supply advice, treatment recommendations, or patient-specific inference.

## Selection procedure

Record whether the statement is an observation, report, named pattern,
classification conclusion, alternative set, or forecast; record authority and
version before comparison. Mark missing criteria and uncertainty rather than
filling gaps.

## Reference Delta

Adds a terminology and provenance layer for descriptive clinical records,
without becoming a clinical decision system.

## Failure signs

Failure includes inferring diagnosis from a symptom, using an unversioned
classification, treating prognosis as certainty, or producing advice from this
entry.

## Cross-references

See `prediction-forecast-conditional-projection-backtest-skill`,
`causal-reasoning`, `evaluation-measure-scale-criterion`, and risk/probability
owners.

## Sources and provenance

The brief uses WHO ICD-11 and SNOMED CT documentation as classification
authorities and evidence-based reasoning literature only for descriptive
boundaries.

