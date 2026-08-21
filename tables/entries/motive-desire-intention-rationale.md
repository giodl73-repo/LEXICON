# Motive, Desire, Intention, and Rationale

Status: candidate anchor entry

Scope: not legal advice

## Orientation

A desire is a pro-attitude toward a state of affairs: the agent favors it or is
disposed to pursue it, and holding it imposes no requirement of consistency with
other desires. An intention is settled: a prospective intention commits the
agent to a future act and is subject to means-end coherence and to the default
of not reconsidering, while an intention in action is what makes an act
intentional under a particular description. A motive is the further end or
concern that explains why the agent wanted or did the thing. A rationale is a
recorded justification, addressed to an audience, for a decision, requirement,
or design.

This entry supplies internal structure for the Purpose root rather than rivaling
it. Purpose already factors as beneficiary, desired outcome, and rationale in
context; this family says what that desired outcome and that rationale are made
of, and on what basis either is attributed.

No goal sense is claimed. Canonical `objective` already governs which desired
result, state, or performance level is being pursued, and that question is not
limited to quantified targets. Goal, aim, end-state, and target are contextual
vocabulary in this entry: a row expressed in goal language is routed to
`objective`, and goal-derived attributes such as specificity, difficulty,
commitment, softgoals, and goal refinement are recorded as factor vocabulary on
the routed row or on an intention row.

Rationale is bound by a routing rule rather than by topic. Purpose, the decision
owner, the requirement owner, and the architecture owner each already hold a
recorded justification. Rationale recorded inside a decision record, a
requirement or specification, or an architecture description stays with that
owner. Only recorded justification that is not already bound to one of those
artifacts is claimed here.

An ascription of desire, intention, or motive to a group, organization, or
artificial system requires a stated attribution basis. Nothing here licenses
treating a system's optimization behavior as evidence that it wants anything.

Motivation as a subject matter stays outside. Intrinsic and extrinsic
motivation, difficulty, and commitment strength are factors of a row, not
senses, and no theory of motivation is adopted.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `desire` | Which state of affairs does this agent favor or is disposed to pursue, absent any settled plan? | conative pro-attitude |
| `motive` | Which further end or concern explains why this agent wanted or did this? | explanatory background end |
| `intention-prospective` | To what future act is this agent settled, with what commitment, consistency, and means-end coherence? | forward-looking commitment state |
| `intention-in-action` | Under which description is this act being done intentionally, and with which intention? | act-description-relative aim |
| `rationale` | Which recorded reasons, alternatives, assumptions, and trade-offs justify this decision, requirement, or design, to whom, when the record is not already held by a decision, requirement, or architecture owner? | unbound recorded justification |

Goal, aim, end-state, and target are aliases, not senses. Every row stated in
that vocabulary is routed to canonical `objective`.

## Root factorization

```text
motive-intention-rationale-use
  := agent, group, or system attributed the state
   x attitude type: desire, motive, or intention
   x object under a description, scope, and horizon
   x commitment strength, settledness, and reconsideration trigger
   x means-end structure, plan, subordinate ends, and refinement
   x pursued-result vocabulary, goal-language alias, and routing to objective
   x satisfaction test, partial attainment, and abandonment
   x motivating reasons, normative reasons, and defeaters
   x explanation vs. justification, audience, and record
   x record binding: decision, requirement, architecture, or unbound
   x attribution basis: avowal, behavior, artifact, or inference
   x conflict, ambivalence, competing ends, and priority
   x revision, failure, and post-hoc rationalization
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Desire vs. intention | both favor an outcome | pro-attitude with no consistency demand vs. settled commitment under means-end coherence and non-reconsideration |
| Prospective intention vs. intention in action | both are intentions | commitment to a future act vs. what makes the current act intentional under a description |
| Intention vs. motive | both answer a "why" | what is aimed at under a description vs. the further end that explains the aim |
| Motive vs. rationale | both can be offered as reasons | the end that explains the act vs. the justification recorded for an audience |
| Desire vs. preference | both concern what an agent favors | conative state of an agent vs. comparative ordering over alternatives, which is owned elsewhere |
| Goal language vs. objective | both name a pursued result | contextual alias with no sense of its own vs. the canonical owner of the desired result, state, or performance level |
| Intention vs. objective | both look forward | settled commitment of an agent to act vs. the pursued result against which performance is evaluated |
| Motive vs. objective | both explain pursuit | the agent's further end or concern vs. the recorded result being pursued |
| Intention vs. plan | both structure future action | settled commitment vs. the revisable artifact that schedules and sequences work |
| Intention vs. obligation | both can require conduct of a subject | the agent's own settled commitment vs. a binding duty from an authority source |
| Rationale vs. warrant | both connect reasons to a conclusion | recorded justification for a decision or design vs. the rule licensing an inference from grounds to a proposition |
| Rationale vs. decision-record rationale | both are recorded justifications | unbound recorded justification vs. the rationale field of a recommendation, exclusion, or selection |
| Rationale vs. requirement rationale | both justify a stated commitment | unbound recorded justification vs. justification recorded against a requirement or specification |
| Rationale vs. architecture rationale | both are recorded in artifacts | unbound recorded justification vs. the rationale element of an architecture description |
| Rationale vs. Purpose rationale | both sit under purpose | the internal structure of a recorded justification vs. the root factor it instantiates |
| Motivating vs. normative reason | both are reasons | what explains why the agent acted vs. what counts in favor of acting |
| Reason vs. cause | both can explain an act | reason ascribed to an agent under a description vs. causal mechanism or attributed causal contribution |
| Motive vs. incentive | both bear on why an act occurred | internal end held by the agent vs. externally designed contingent consequence intended to change a choice |
| Intention vs. attribution | both appear in reports | the state ascribed vs. the basis, whether avowal, behavior, artifact, or inference, on which it is ascribed |

## Dependencies and stopping boundary

- Every row names the agent, group, or system to which the state is attributed
  and the basis for that attribution.
- Objects of desire and intention are stated under a description, with scope and
  horizon.
- Intentions record settledness, reconsideration triggers, and means-end
  structure; desires do not require them.
- Pursued results are not owned here. Rows stated as goals, aims, end-states, or
  targets are routed to `objective`, with indicator, threshold, set point, and
  outcome retained by that owner.
- Goal specificity, difficulty, commitment, softgoals, satisficing, goal
  refinement, implementation intentions, and joint intention remain factor
  vocabulary rather than senses.
- Rationale records reasons, alternatives considered, assumptions, trade-offs,
  and audience, and records its binding. If the binding is a decision record, a
  requirement or specification, or an architecture description, the row belongs
  to that owner.
- Intrinsic and extrinsic motivation remain factors of a motive row.
- Objective and control, preference and criteria, requirement and specification
  statements, obligation, causal attribution, warrant, plan artifacts,
  architecture description, and the Purpose root retain their existing owners.

This entry stops before ranked catalogs of motivation theory, needs and
personality taxonomies, objective-and-key-result method catalogs, goal-modeling
notations treated as canonical, jurisdiction-specific culpability doctrine, and
metaphysics of free will and intentionality.

## Selection procedure

1. Identify the agent, group, or system and state the attribution basis:
   avowal, behavior, artifact, or inference.
2. State whether the question concerns desire, motive, prospective intention,
   intention in action, or rationale.
3. If the question is about a pursued result, however phrased, route it to
   `objective` and record any goal-derived attributes as factor vocabulary on
   that row.
4. Fix the object under an explicit description, with scope and horizon; record
   competing descriptions rather than choosing one silently.
5. For intentions, record settledness, commitment strength, consistency
   demands, and what would trigger reconsideration.
6. Separate means-end structure, subordinate ends, and refinement from the plan
   artifact that schedules the work.
7. Separate motivating reasons from normative reasons and record defeaters.
8. For rationale, record reasons, alternatives, assumptions, trade-offs,
   audience, and the artifact binding; route bound rationale to the decision,
   requirement, or architecture owner and keep only unbound justification here.
9. Distinguish externally designed inducements from the agent's own ends and
   route inducement design to the incentive candidate.
10. Preserve conflict, ambivalence, abandonment, failure, and post-hoc
    rationalization rather than resolving them into one stated purpose.
11. Route objective, indicator, preference, criteria, requirement, obligation,
    causal, warrant, and plan questions to their existing owners.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Dictionary | distinguishes motive, intention, aim, and reason | makes the agent, description, settledness, and attribution basis explicit |
| Philosophy of action | analyzes intention, desire, and reasons for action | preserves competing theories rather than adopting one |
| Formal agent model | supplies commitment, persistence, and belief-desire-intention structure | keeps formal commitment as one reading, not the definition |
| Goal-setting research | supplies specificity, difficulty, and commitment effects | keeps that vocabulary as factors on a row routed to `objective` |
| Requirements or goal-modeling method | refines goals into operational requirements | treats refinement as vocabulary; pursued results stay with `objective` and statements stay with the requirement owner |
| Architecture or motivation standard | records rationale and relates ends to means | leaves bound rationale with its artifact owner and claims no goal-versus-objective split |

## Failure signs

- desire and intention share one field;
- an act is called intentional without stating the description under which it is
  intentional;
- motive is treated as the same thing as intent, or as an element of a
  culpability enumeration;
- a pursued result is given a `goal` sense here instead of being routed to
  `objective`;
- goal-setting vocabulary is used to create a second owner for desired results;
- rationale already recorded in a decision record, requirement, or architecture
  description is duplicated here;
- post-hoc rationalization is recorded as the motive;
- reasons are silently converted into causal claims;
- an organization or system is credited with a desire, intention, or motive with
  no attribution basis;
- competing desires or ends are collapsed into a single stated purpose;
- the entry is used as a motivation-theory catalog or as legal advice.

## Cross-references

- [Purpose](../roots/purpose.md)
- [Agency](../roots/agency.md)
- [Objective, Control, Monitoring, and Response](control-monitoring-response.md)
- [Choice, Alternative, Criterion, Preference, Recommendation, and Selection](choice-alternative-selection.md)
- [Requirement, Specification, Verification, and Validation](requirement-specification-verification-validation.md)
- [Governance, Obligation, and Compliance](governance-obligation-compliance.md)
- [Association, Causal Effect, Influence, Mechanism, Intervention, and Attribution](causal-reasoning.md)
- [Epistemic Standing, Inquiry, and Warrant](../evidence/epistemic-standing-inquiry-warrant.md)
- [Planned Work Procedure](../procedures/planned-work.md)
- [System Composition, Architecture, Capability, Interface, and Dependency](system-composition-dependency.md)
- [Incentive, Alignment, Externality, Moral Hazard, and Adverse Selection](incentive-alignment-externality-moral-hazard-adverse-selection.md)
- [Admission brief](../../signals/discover/literature/motive-intention-rationale-candidate-brief-2026-08-20.md)

## Sources and provenance

1. Stanford Encyclopedia of Philosophy, "Intention":
   https://plato.stanford.edu/entries/intention/
2. Stanford Encyclopedia of Philosophy, "Desire":
   https://plato.stanford.edu/entries/desire/
3. Stanford Encyclopedia of Philosophy, "Reasons for Action: Justification vs.
   Explanation": https://plato.stanford.edu/entries/reasons-just-vs-expl/
4. Donald Davidson, "Actions, Reasons, and Causes," *Journal of Philosophy*
   60(23):685-700: https://doi.org/10.2307/2023177
5. G. E. M. Anscombe, *Intention*, 2nd ed., Harvard University Press, 2000,
   ISBN 978-0-674-00399-9.
6. Michael E. Bratman, *Intention, Plans, and Practical Reason*, CSLI
   Publications, 1999, ISBN 978-1-57586-192-7.
7. Philip R. Cohen and Hector J. Levesque, "Intention is choice with
   commitment," *Artificial Intelligence* 42(2-3):213-261:
   https://doi.org/10.1016/0004-3702(90)90055-5
8. Peter M. Gollwitzer, "Implementation intentions," *American Psychologist*
   54(7):493-503: https://doi.org/10.1037/0003-066X.54.7.493 (goal-usage source:
   factor vocabulary for intention rows).
9. Edwin A. Locke and Gary P. Latham, "Building a practically useful theory of
   goal setting and task motivation," *American Psychologist* 57(9):705-717:
   https://doi.org/10.1037/0003-066X.57.9.705 (goal-usage source: specificity,
   difficulty, and commitment as factor vocabulary on a routed `objective` row).
10. Axel van Lamsweerde, "Goal-oriented requirements engineering: a guided
    tour," *Proceedings of RE'01*, 249-262:
    https://doi.org/10.1109/ISRE.2001.948567 (goal-usage source: refinement and
    softgoal vocabulary only).
11. Object Management Group, *Business Motivation Model* v1.3:
    https://www.omg.org/spec/BMM/1.3/ (vocabulary relating ends and means; no
    goal-versus-objective ownership split is claimed from it).
12. ISO/IEC/IEEE 42010:2022, *Architecture description*:
    https://www.iso.org/standard/74393.html
13. American Law Institute, *Model Penal Code* §2.02, 1962, which enumerates
    kinds of culpability as purposely, knowingly, recklessly, and negligently;
    motive is not among the enumerated kinds.

These sources support a plural boundary entry. They do not settle whether
reasons are causes, do not establish one theory of desire, intention, or
motivation, do not state the doctrine of any jurisdiction, and do not license
ascribing mental states to organizations or systems without a stated attribution
basis. This draft is not legal advice.
