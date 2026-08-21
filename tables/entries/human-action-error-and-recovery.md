# Human Action Error and Recovery

Status: candidate anchor entry

## Orientation

This family distinguishes an action or omission that diverges from the actor's
intention, plan, or applicable procedure from the process that detects,
corrects, and stabilizes after that divergence. It is descriptive and
non-blaming. It neither diagnoses persons nor determines causal attribution,
deontic violation, liability, safety acceptability, or the appropriate response.

Slip, lapse, mistake, rule-based mistake, knowledge-based mistake, and deliberate
departure or violation are factor values for `action-error`, not senses.
`error-recovery` is not the dependability recovery of a failed system: action
error can be caught before a system failure.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `action-error` | Where does an agent's action or omission diverge from the agent's stated intention, plan, or applicable procedure, under which descriptive divergence mechanism and context? | intention-relative action divergence |
| `error-recovery` | By which detection, correction, and stabilization process does an agent or team respond to an identified action-error and return the bounded activity to its stated intended or required course? | post-divergence corrective process |

## Root factorization

```text
action-error-recovery-use
  := agent or team, task, context, and attribution basis
   x stated intention, plan, procedure, and applicable deontic position where any
   x action or omission, observed divergence, and action-cycle stage
   x divergence mechanism: slip, lapse, mistake, rule-based, knowledge-based,
     deliberate departure/violation, or another stated descriptive category
   x performance level, workload, interruption, information, interface, and conditions
   x detection source and time
   x correction, stabilization, residual consequence, evidence, uncertainty, and revision
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Action error vs. dependability error | both can be called error | this is a divergence in an agent's act; dependability error is a deviant item state |
| Action error vs. nonconformity | both can reveal a mismatch | this is descriptive behavior relative to intention/plan; nonconformity is a criterion-relative finding about a subject or work product |
| Action error vs. deontic violation | both can concern procedure departure | action-error classifies the observed divergence and mechanism; deontic concepts state the normative position |
| Action error vs. causal attribution | both can appear in an outcome account | classification of a divergence does not establish that it caused a particular outcome |
| Error recovery vs. dependability recovery | both restore something after disruption | this corrects a detected behavioral divergence; dependability recovery restores required system capability after disruption |
| Error recovery vs. intervention | both may change activity | this is a detection-correction-stabilization loop after an identified action-error, not any deliberate change |

## Dependencies and stopping boundary

- Use stated or evidenced intention, plan, procedure, and attribution basis; do
  not infer mental state or diagnosis from an outcome alone.
- Treat slip, lapse, mistake, rule-based/knowledge-based values, and deliberate
  departure/violation as descriptive factors. The last does not decide blame,
  culpability, compliance, or liability.
- Route normative positions and compliance assessment to governance and deontic
  owners; route causal claims to causal reasoning; route hazard, harm, and safety
  acceptability to their owner; route system failure and recovery to
  [Reliability, Availability, Maintainability, Resilience, and Recovery](dependability-reliability-availability-resilience.md).
- This Table provides no diagnosis, causal attribution, blame assignment,
  safety advice, or operational response prescription.

## Selection procedure

1. Bound the actor/team, task, context, and source for the intention, plan, or
   procedure.
2. Select `action-error` only for the descriptive divergence; select
   `error-recovery` for its subsequent detection-correction-stabilization loop.
3. Record the divergence mechanism and performance level as factors, including
   deliberate departure/violation where descriptively supported.
4. Record detection source, correction, stabilization, and residual state
   without claiming causation, diagnosis, blame, or safety acceptability.
5. Route system restoration, compliance assessment, and causal investigation to
   their owners.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Cognitive engineering | distinguishes execution, memory, and planning divergence | preserves categories as optional factor values rather than universal diagnoses |
| Threat-and-error management | describes detection and trapping before an undesired state | separates behavioral recovery from system recovery |
| Usability quality model | recognizes user-error recovery | does not make product-quality terminology a general action taxonomy |
| Safety literature | supplies contextual cases and defense concepts | does not license safety advice or causal/blame conclusions |

## Failure signs

- recording a human action as a `dependability-error`;
- turning a slip, lapse, mistake, or violation into a separate sense;
- equating a deliberate departure with a deontic judgment or blame finding;
- inferring intention, diagnosis, or causal responsibility from an adverse
  outcome;
- treating every correction as dependability recovery or every system recovery
  as action-error recovery;
- giving safety or medical advice under this descriptive candidate.

## Cross-references

- [Fault, Defect, Error, Failure, Incident, and Outage](fault-defect-error-failure-incident-outage.md)
- [Reliability, Availability, Maintainability, Resilience, and Recovery](dependability-reliability-availability-resilience.md)
- [Governance, Obligation, and Compliance](governance-obligation-compliance.md)
- [Association, Causal Effect, Influence, Mechanism, Intervention, and Attribution](causal-reasoning.md)
- [Objective, Control, Monitoring, and Response](control-monitoring-response.md)
- [Editorial record](../../signals/discover/literature/human-action-error-recovery-candidate-brief-2026-08-20.md)

## Sources and provenance

1. Reason, “Human error: models and management” (2000),
   https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1117770/ — contribution:
   active failures, latent conditions, and non-blaming framing; limitation: a
   human-factors model is not a universal attribution or diagnosis method.
2. SKYbrary, “Human Error Types,”
   https://skybrary.aero/articles/human-error-types — contribution: accessible
   Reason/Rasmussen classification synthesis; limitation: aviation context and
   secondary presentation.
3. SKYbrary, “Threat and Error Management,”
   https://skybrary.aero/articles/threat-and-error-management-tem — contribution:
   detection, trapping, and recovery context; limitation: aviation operational
   framework, not a general safety prescription.
4. NCBI Bookshelf, *Patient Safety: Achieving a New Standard for Care*,
   https://www.ncbi.nlm.nih.gov/books/NBK2673/ — contribution: design-for-recovery
   context; limitation: health-care design guidance does not classify all action
   divergences.

Comparator access date: 2026-08-20. Sources retain their disciplinary scopes;
this entry makes no diagnostic, causal, blame, or safety claim.
