# Objective, Control, Monitoring, and Response

Status: candidate anchor entry

## Orientation

An objective states a desired result or condition. A set point is a selected
reference value for a controlled variable; an actuator converts a command into
influence on a process. Monitoring observes; indicators summarize; thresholds
classify; alerts communicate. A service-level objective binds a service-level
indicator to a target and compliance window. These are different target,
measurement, mechanism, communication, and effect layers.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `objective` | Which desired result, state, or performance level is being pursued? | target or evaluation reference |
| `monitoring` | What subject is observed through which method, cadence, window, and quality controls? | ongoing observation process |
| `monitoring-indicator` | Which defined measure or signal summarizes relevant condition or performance? | selected observable proxy |
| `threshold` | Which comparison boundary changes classification, attention, or action? | decision boundary |
| `alert` | Which significant condition is communicated to whom, at what priority, with what expected response? | routed notification |
| `feedback-control` | How does observed state influence action intended to affect future state relative to an objective? | closed-loop influence |
| `governance-control` | Which safeguard, countermeasure, process, policy, or practice modifies risk or supports a requirement? | governed risk/requirement treatment |
| `feedback` | How do effects return to influence causes or future activity? | reinforcing or balancing loop relation |
| `control-intervention` | Which deliberate action changes the subject, process, or environment? | applied response |
| `outcome` | Which intended or unintended effect resulted over the selected horizon? | resulting effect |
| `set-point` | What reference value or schedule should this controlled variable follow under the current operating mode? | control-loop reference input |
| `actuator` | Which mechanism accepts a command and converts it into physical or logical action on the selected process? | command-to-process influence mechanism |
| `service-level-objective` | What target or range must a declared service-level indicator meet for an eligible population over a compliance window? | scoped service-performance objective |

## Role ladder

```text
desired condition
  -- stated as --> objective

subject observations
  -- collected by --> monitoring
  -- summarized as --> indicator

indicator and threshold policy
  -- may derive --> alert

observed state and objective
  -- evaluated by feedback control --> intervention

controlled-variable observation and set point
  -- compared by controller --> command
  -- converted by actuator --> manipulated process influence

service behavior
  -- measured by SLI over eligible events --> observed service level
  -- compared over compliance window --> service-level objective status

policy, requirement, or risk
  -- treated by governance control --> changed exposure or behavior

intervention and environment
  -- produce --> outputs, transitions, outcomes, and feedback
```

## Root factorization

```text
control-response-use
  := subject, system, and boundary
   x objective and desired state
   x indicator definition and measurement
   x monitoring method, window, and frequency
   x threshold basis, hysteresis, and persistence
   x alert recipient, priority, and routing
   x control sense, loop, or governance mechanism
   x feedback path, delay, and sign
   x intervention authority, action, and side effects
   x outcome measures and time horizon
   x review, learning, and revision
   x controlled variable, set point, schedule, and operating mode
   x controller command, control law, and update cadence
   x actuator interface, range, saturation, dynamics, and failure state
   x service boundary, user population, and eligible-event definition
   x service-level indicator numerator, denominator, threshold, and measurement point
   x objective target, comparison operator, and compliance window
   x commitment or agreement, consequences, and error-budget policy
```

## Contrast table

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Objective vs. threshold | thresholds may operationalize objectives | desired result/reference vs. classification or action boundary |
| Monitoring vs. control | control may use monitoring | observing/assessing vs. deliberately influencing |
| Observation vs. indicator | indicators derive from observations | retained encounter/result vs. selected summary or proxy |
| Indicator vs. threshold | thresholds compare indicators | measured/derived signal vs. decision boundary |
| Threshold event vs. alert | event may trigger alert | detected condition vs. routed notification under policy |
| Alert vs. intervention | alert may request response | communication vs. action on subject/environment |
| Feedback control vs. governance control | both pursue objectives | closed-loop process influence vs. safeguard/countermeasure |
| Feedback vs. outcome | outcomes can feed future activity | loop relation over time vs. selected resulting effect |
| Intervention vs. outcome | intervention seeks outcome | action applied vs. effect observed |
| Output vs. outcome | both follow action | immediate product/state change vs. effect over selected horizon |
| Objective vs. set point | a set point may operationalize an objective | broad desired result vs. reference for one controlled variable and mode |
| Set point vs. threshold | both may be comparison values | reference the loop seeks to track vs. boundary that classifies or triggers action |
| Set point vs. observed value | both use the controlled variable's unit | selected reference vs. measured or estimated state |
| Controller vs. actuator | both participate in control | computes/selects command vs. converts command into process influence |
| Actuator vs. intervention | an actuator may execute an intervention | persistent mechanism role vs. particular action applied in context |
| Indicator vs. service-level objective | an SLO is measured through an indicator | defined service measure vs. target plus comparison window |
| SLO vs. achieved service level | both may use the same percentage | desired target vs. observed aggregate |
| SLO vs. service-level agreement | an agreement may contain an SLO | operational objective vs. commitment with parties, authority, and consequences |
| SLO vs. user outcome | SLOs should reflect user-relevant behavior | scoped service proxy/target vs. broader experienced effect |

## Diagnostic examples

- A dashboard displays indicators but does not control the service.
- A CPU-temperature threshold can trigger an alert, while a fan controller
  independently performs feedback control.
- A security policy and multifactor-authentication mechanism are governance
  controls; they are not feedback control loops merely because metrics exist.
- An alert with no recipient or expected response is only a detected
  condition or log event.
- A corrective intervention can create reinforcing side effects elsewhere.
- Meeting an activity target does not prove the desired outcome occurred.
- A temperature objective can produce different set points by operating mode;
  changing the set point does not prove the process reached or stabilized at it.
- A controller can issue the correct command while a saturated, delayed,
  disconnected, or failed actuator produces little process change.
- A service can meet an average-latency SLO while a user segment experiences
  severe tail latency excluded or hidden by the indicator definition.
- Missing an internal SLO is not automatically breach of an agreement, and
  meeting it does not prove every user outcome or contractual obligation.

## Specialized view

The linked
[Control and Response Failure Diagnostic](../diagnostics/control-response-failures.md)
maps observed monitoring and response symptoms to candidate causes and
discriminating tests.

## Selection procedure

1. State the subject, boundary, stakeholders, objective, and time horizon.
2. Separate direct observations from derived indicators.
3. Define each indicator's numerator/denominator or model, unit/scale, window,
   freshness, quality, and owner.
4. Define thresholds with basis, operator, window, persistence, hysteresis,
   missing-data behavior, and reset semantics.
5. Define alerts with recipient, priority, routing, deduplication, context,
   acknowledgment, escalation, and expected response.
6. Select feedback control only when observed state influences action that
   affects future state; record set point/objective, loop path, delay, sign,
   authority, and stability assumptions.
7. Select governance control for safeguards or countermeasures; record
   requirement/risk, owner, implementation, evidence, effectiveness test, and
   residual exposure.
8. Record interventions separately from decisions, alerts, and outcomes.
9. Measure intended and unintended outcomes over a declared horizon and
   baseline or comparison.
10. Revise indicators, thresholds, controls, and interventions from observed
    failure, drift, and feedback.
11. For a set point, declare controlled variable, unit, reference source,
    schedule, mode, bounds, ramping, tolerance, and change authority.
12. For an actuator, declare command/interface, manipulated variable, range,
    saturation, rate limits, delay, dynamics, feedback, failure modes, manual
    override, and safe-state ownership.
13. For an SLO, declare service and user boundary, SLI specification and
    implementation, eligible events, numerator/denominator or statistic,
    threshold, target, compliance window, exclusions, missingness, error-budget
    policy, owner, revision, and relation to any agreement.

## Reference Delta

| Reference form | Typical contribution | Factorium delta |
|---|---|---|
| Dictionary | Defines objective, monitor, indicator, threshold, alert, control, feedback, intervention, and outcome | Separates observation, decision, communication, action, and effect |
| Thesaurus | Links metric, alarm, safeguard, response, correction, and result | Prevents related operational words from becoming interchangeable |
| Encyclopedia or control text | Explains feedback systems, monitoring, and governance controls | Places technical and governance control senses side by side without merging them |
| Dashboard or alert configuration | Implements selected indicators and rules | Requires source semantics, response ownership, and outcome review |
| Factorium | Connects evidence, decisions, constraints, diagnostics, transitions, and outcomes | Makes every stage and failure owner visible |

## Constraints and failure signs

- Objectives identify beneficiary, desired condition, measure, horizon, and
  tradeoffs.
- Monitoring states method, frequency, window, freshness, quality, and owner.
- Indicators state derivation, interpretation, and known proxy limitations.
- Thresholds state temporal and missing-data semantics.
- Alerts state recipient, priority, route, expected response, and reset.
- Monitoring is not credited as control without an influence path.
- Feedback sign, delay, authority, saturation, and side effects are visible.
- Governance controls retain requirement/risk, implementation, evidence,
  effectiveness, and residual exposure.
- Interventions are not relabeled as outcomes.
- Intended and unintended outcomes are reviewed over the declared horizon.
- Set points are not substituted for objectives, thresholds, observations, or
  evidence that the target was reached.
- Actuator existence or command acknowledgment is not evidence of process
  influence; range, saturation, dynamics, feedback, and failure state remain visible.
- An SLO retains service boundary, user population, SLI, eligible events,
  measurement point, aggregation, target, and compliance window.
- SLO target, observed service level, error budget, alert threshold, and
  contractual commitment remain separate.
- Meeting an SLO does not certify correctness, user satisfaction, safety,
  compliance, or all service outcomes.
- Named controller families, actuator types, monitoring products, and service
  commitments remain examples or scoped authorities rather than senses.

## Cross-references

- [Stock, Flow, Accumulation, Balance, and Conservation](stock-flow-balance.md)
- [Claim and Evidence](claim-evidence.md)
- [Policy, Rule, Constraint, Decision, and Exception](policy-rule-constraint-decision-exception.md)
- [State, Event, Transition, Process, and Lifecycle](state-event-transition-process-lifecycle.md)
- [Probability, Risk, and Uncertainty](probability-risk-uncertainty.md)
- [System Composition, Capability, Interface, and Dependency](system-composition-dependency.md)
- [Association and Causal Reasoning](causal-reasoning.md)

## Sources and provenance

1. NIST CSRC Glossary, "control":
   https://csrc.nist.gov/glossary/term/control
2. NIST CSRC Glossary, "security control":
   https://csrc.nist.gov/glossary/term/security_control
3. NIST/SEMATECH, "What is Process Control?":
   https://www.itl.nist.gov/div898/handbook/pmc/section1/pmc13.htm
4. NIST SP 800-137, *Information Security Continuous Monitoring*:
   https://csrc.nist.gov/pubs/sp/800/137/final
5. CDC, "Looking for Feedback":
   https://www.cdc.gov/polaris/php/thinking-in-systems/looking-for-feedback.html
6. Google SRE Workbook, "Alerting on SLOs":
   https://sre.google/workbook/alerting-on-slos/
7. NASA, Human Integration Design Handbook, Appendix C definitions:
   https://www.nasa.gov/reference/appendix-c-vol-2/
8. NIST, actuator definition:
   https://www.nist.gov/el/intelligent-systems-division-73500/definitions
9. Google SRE, "Service Level Objectives":
   https://sre.google/sre-book/service-level-objectives/
10. Google Cloud Observability, service-monitoring concepts:
    https://docs.cloud.google.com/stackdriver/docs/solutions/slo-monitoring

Comparator access date: 2026-08-15. Cross-domain organization remains
`candidate`; cited control and alert mechanisms retain their source scopes.
