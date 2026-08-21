# Clinical Outcome, Response, Recovery, Remission, and Quality of Life

Status: candidate anchor entry

## Orientation

A clinical outcome describes or reflects how a person feels, functions, or survives over a stated interval. A response is a defined change following an intervention or exposure, without automatically establishing causation. Recovery is a process or state of regained health, functioning, role, or self-directed life under a declared account. Remission is reduction or absence of specified manifestations below a criterion for a stated duration. Quality of life is a person's perception of their position in life relative to culture, values, goals, expectations, standards, and concerns.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `clinical-outcome` | Which result concerning feeling, functioning, or survival is assessed for whom over what interval? | person-relevant clinical result |
| `treatment-response` | Which defined change from what baseline occurs after which intervention over what time and by which criterion? | post-intervention change status |
| `health-recovery` | Which health, functioning, role, or personal-recovery process/state changes under which account and time horizon? | regained-state/process account |
| `remission` | Which specified manifestations fall below which criterion for what duration, with what ongoing condition status? | criterion-bounded manifestation reduction |
| `quality-of-life` | How does which person perceive their life position across which domains and cultural/value context? | person-perceived life-quality state |

## Root factorization

```text
clinical-outcome-use
  := person or population, condition if relevant, context, interval, and perspective
   x outcome concept, feeling/function/survival domain, endpoint, assessment, reporter, and timing
   x baseline, post-intervention state, response criterion, magnitude, durability, and comparator
   x recovery account, process or state, domains, goals, setbacks, supports, and self-definition
   x remission manifestations, threshold, duration, partial/complete status, relapse, and monitoring
   x quality-of-life domains, person report, culture, values, goals, expectations, and instrument
   x attribution, clinical importance, uncertainty, missingness, adverse outcomes, and heterogeneity
   x authority, version, evidence, provenance, and no-advice boundary
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Outcome vs. assessment | assessment measures an outcome | result/construct vs. method or instrument |
| Response vs. effect | effects can produce responses | observed defined change after exposure vs. causal contrast |
| Response vs. recovery | recovery may include response | bounded criterion change vs. broader process/state account |
| Recovery vs. cure | either may improve condition | multidomain process/state vs. removal/resolution of disease under criteria |
| Remission vs. recovery | either marks improvement | manifestation threshold/duration vs. broader regained-life account |
| Quality of life vs. health status | health shapes quality of life | person-perceived life position vs. clinical/functioning state |

## Dependencies and stopping boundary

Generic outcome, causal effect, measurement, health/well-being, functioning, prognosis, and reliability/recovery retain their owners. This Table stops before selecting endpoints, interpreting an individual's change, declaring treatment effectiveness, predicting relapse, or making care decisions.

## Selection procedure

1. Identify person/population, construct, baseline, interval, perspective, and purpose.
2. Select outcome, response, recovery account, remission criterion, or quality-of-life construct.
3. Record endpoint, assessment, reporter, threshold, timing, comparator, and missingness separately.
4. Do not infer causal effect from temporal response or catalog inclusion.
5. Preserve adverse outcomes, heterogeneity, cultural context, uncertainty, and qualified interpretation.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| FDA clinical outcome terminology | separates outcome, assessment, endpoint, and benefit | keeps measurement and causal claims distinct |
| Condition-specific criteria | define response/remission thresholds | require authority, version, duration, and scope |
| WHOQOL | supplies cross-cultural person-reported domains | prevents reduction to disease status alone |

## Failure signs

- outcome, endpoint, instrument, and score are synonyms;
- improvement after treatment proves treatment effect;
- response, remission, recovery, and cure collapse;
- clinician rating replaces the person's quality-of-life perspective;
- threshold, duration, baseline, or missingness is absent;
- the Table interprets an individual's outcome or treatment.

## Cross-references

- [Objective, Control, Monitoring, and Response](control-monitoring-response.md)
- [Association, Causal Effect, Influence, Mechanism, Intervention, and Attribution](causal-reasoning.md)
- [Evaluation Measure, Scale, Criterion, and Score](evaluation-measure-scale-criterion.md)
- [Good, Benefit, Welfare, Harm, and Flourishing](good-benefit-welfare-harm-flourishing.md)

## Sources and provenance

1. FDA, Patient-Focused Drug Development Glossary: https://www.fda.gov/drugs/development-approval-process-drugs/patient-focused-drug-development-glossary
2. FDA-NIH Biomarker Working Group, BEST Glossary: https://www.ncbi.nlm.nih.gov/books/NBK338448/
3. WHO, WHOQOL: https://www.who.int/tools/whoqol

Qualified clinical and measurement authorities retain every individual interpretation.
