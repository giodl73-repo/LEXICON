# Prevention, Intervention, Treatment, Therapy, and Rehabilitation

Status: candidate anchor entry

## Orientation

Prevention aims to avert, delay, detect early, or reduce consequences of a health problem under a stated prevention framework. A health intervention is an intentional action intended to affect health, functioning, behavior, exposure, service use, or determinants. Treatment targets a recognized health condition to cure, control, relieve, or reduce its effects. Therapy is a treatment modality delivered through a specified therapeutic method and relationship. Rehabilitation comprises person-centered interventions intended to optimize functioning and reduce disability in interaction with environment.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `health-prevention` | Which health problem or consequence is intended to be averted or reduced at what stage for which population? | prevention-stage intervention purpose |
| `health-intervention` | Which intentional action targets which health-related mechanism, behavior, exposure, service, or determinant? | broad intentional health action |
| `treatment` | Which intervention targets which recognized condition for which curative, controlling, relieving, or risk-reducing purpose? | condition-targeted intervention |
| `therapy` | Which treatment modality uses which therapeutic method, provider relationship, dose, and course? | method-governed treatment modality |
| `rehabilitation` | Which interventions pursue which functioning goals and reduce which disability in what environment? | functioning-optimization intervention set |

## Root factorization

```text
health-intervention-use
  := intended recipient or population, target, setting, authority, and time
   x prevention framework, stage, risk or condition basis, and intended prevented outcome
   x intervention components, mechanism, delivery agent, intensity, dose, duration, and fidelity
   x treatment indication, goal, alternatives, contraindications, burdens, and monitoring
   x therapy modality, therapeutic relationship, protocol, session/course, and adaptation
   x rehabilitation goals, functioning domains, environment, participation, assistive supports, and team
   x efficacy, effectiveness, safety, adherence, access, outcome, and attribution
   x evidence, consent, uncertainty, version, provenance, and no-advice boundary
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Prevention vs. treatment | prevention may include early treatment | stage/purpose framework vs. condition-targeted action |
| Intervention vs. treatment | treatments are interventions | broad intentional health action vs. condition-targeted subset |
| Treatment vs. therapy | therapies are treatments in many uses | intervention purpose/category vs. specified therapeutic modality/relationship |
| Therapy vs. rehabilitation | rehabilitation may use therapies | modality/course vs. coordinated functioning-goal intervention set |
| Rehabilitation vs. recovery | rehabilitation may support recovery | intentional intervention strategy vs. health/functioning change process/outcome |
| Intervention vs. effect | interventions seek effects | delivered action vs. observed/causal outcome |

## Dependencies and stopping boundary

Generic intervention/causation, clinical diagnosis, consent, implementation, outcome, and functioning retain their owners. This Table stops before establishing indication, selecting treatment, comparing individual options, stating dosage, assessing contraindications, or replacing professional guidance.

## Selection procedure

1. Identify recipient/population, health target, authority, setting, stage, and intended outcome.
2. Select prevention purpose, broad intervention, treatment, therapy modality, or rehabilitation strategy.
3. Record components, provider, dose/intensity, duration, fidelity, alternatives, and monitoring separately.
4. Separate intervention delivery from efficacy, effectiveness, safety, response, and causal attribution.
5. Preserve consent, preferences, burdens, access, uncertainty, and qualified decision-making.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Prevention framework | classifies action by stage/target | keeps framework and prevented outcome explicit |
| Clinical guideline | links indications to interventions | remains authoritative for real choices and versions |
| Rehabilitation framework | organizes functioning goals and intervention packages | separates rehabilitation from generic therapy and recovery |

## Failure signs

- prevention always occurs before disease or never includes treatment;
- every beneficial action is called treatment;
- therapy and rehabilitation are synonyms;
- delivery proves efficacy or individual benefit;
- harms, alternatives, consent, or access are omitted;
- the Table recommends or specifies treatment.

## Cross-references

- [Association, Causal Effect, Influence, Mechanism, Intervention, and Attribution](causal-reasoning.md)
- [Clinical Sign, Symptom, Syndrome, Diagnosis, Differential Diagnosis, and Prognosis](clinical-sign-symptom-syndrome-diagnosis-differential-diagnosis-prognosis.md)
- [Consent, Assent, Refusal, Withdrawal, and Revocation](consent-assent-refusal-withdrawal-revocation.md)
- [Function, Impairment, Activity Limitation, Disability, and Participation](function-impairment-activity-limitation-disability-participation.md)

## Sources and provenance

1. WHO, “Rehabilitation”: https://www.who.int/news-room/fact-sheets/detail/rehabilitation
2. CDC, “Framework for Assessing Disease and Injury Prevention”: https://www.cdc.gov/mmwr/preview/mmwrhtml/00016403.htm
3. CDC, Field Epidemiology Manual, “Developing Interventions”: https://www.cdc.gov/field-epi-manual/php/chapters/interventions.html

Qualified clinicians and public-health authorities retain all real intervention decisions.
