# Organization, Position, Role, Competency, Responsibility, Authority, and Accountability

Status: candidate anchor entry

## Orientation

An organization coordinates actors and resources toward purposes within a
boundary. A role groups expected functions in a context; responsibility
assigns duties or expected results; authority grants bounded decision or
action rights; accountability makes an actor answerable through a review
relationship. Delegation transfers selected authority or duties without
silently erasing retained governance. Ownership or stewardship assigns
custody over a subject under a scheme. Technical action traceability is a
second accountability sense and does not by itself establish organizational
answerability.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `organization` | Which coordinated actors, resources, processes, and interfaces form the institution in this view? | coordinated social system |
| `organizational-position` | Which organization-defined bundle of assigned work exists independently of its current incumbent? | work assignment slot |
| `organizational-role` | Which expected functions are grouped independently of the current assignee? | context-specific function bundle |
| `competency` | Which measurable pattern of knowledge, skill, ability, behavior, or other characteristic is needed or demonstrated for work? | work-capability criterion |
| `responsibility` | Which duty, obligation, or expected result is assigned to an actor? | performance obligation |
| `authority` | Which decisions, actions, or resources may this actor legitimately direct, and from what source? | bounded decision or action right |
| `accountability-answerability` | To whom must which actor explain and answer for which result or conduct? | review and consequence relation |
| `action-accountability` | Can an action be attributed uniquely enough to support review or response? | traceability property |
| `delegation` | Which authority or duty is transferred, by whom, to whom, with what retained obligations and limits? | bounded transfer relation |
| `ownership-stewardship` | Which actor has governed custody or lifecycle decision responsibility for this subject? | scoped custody assignment |

## Role ladder

```text
purpose, boundary, actors, resources, and processes
  -- coordinate as --> organization

expected functions
  -- define --> role

role or direct assignment
  -- assigns --> responsibility

legitimate source
  -- grants --> authority

result or conduct
  -- reviewed through --> accountability

delegator
  -- transfers bounded duty or authority --> delegate

governing scheme
  -- assigns custody --> owner or steward
```

## Root factorization

```text
organizational-assignment-use
  := purpose and organizational boundary
   x actors, position identities, assigned work, and membership
   x roles and assignment context
   x competencies, proficiency criteria, assessment basis, and evidence
   x duties, obligations, and expected results
   x decision rights and resource authority
   x accountable subject and review forum
   x delegation source, scope, and limits
   x owned subject and stewardship contract
   x controls, separation, and escalation
   x effective time, evidence, and supersession
```

## Contrast table

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Organization vs. org chart | chart may depict organization | coordinated institution vs. one structural projection |
| Position vs. person | a person may occupy a position | continuing work assignment vs. incumbent identity |
| Role vs. person | a person may fill a role | expected function bundle vs. actor identity |
| Role vs. job or position | positions carry roles | reusable function context vs. employment or structural slot |
| Competency vs. responsibility | both concern successful work | capability criterion vs. assigned duty or expected result |
| Competency vs. qualification | competency can support qualification | measurable capability pattern vs. authority-specific eligibility result |
| Responsibility vs. authority | both may be assigned together | duty/result obligation vs. legitimate decision/action right |
| Responsibility vs. accountability | responsible actor may answer for work | expected performance vs. review and consequence relation |
| Organizational vs. action accountability | traceability supports review | answerability relationship vs. attribution property |
| Delegation vs. assignment | both allocate work | transfer from a source with retained/limited authority vs. direct allocation |
| Ownership vs. performance | owner may oversee work | custody/lifecycle governance vs. doing every task |
| Ownership/title vs. stewardship/custody | all may be called ownership | authority- and jurisdiction-backed rights vs. management duty vs. possession/control mechanism |
| Authority vs. privilege | privilege may implement authority | semantic decision right vs. system-specific permission |

## Diagnostic examples

- A product manager role can outlive every person assigned to it.
- A position can persist through incumbent changes; competency evidence belongs
  to a person and assessment context, not to the position identity.
- A team can be responsible for operating a service without authority to
  accept regulatory risk.
- An approver may delegate signing authority for a period while retaining
  oversight and revocation duties.
- An audit log may attribute an action precisely but cannot prove that the
  actor was answerable to the right review forum.
- A data owner can set lifecycle controls while a steward performs daily data
  quality work.
- Naming one "owner" for a shared platform does not resolve funding,
  operational, security, and product decision rights unless the scope is
  stated.
- “Owner” may mean legal title, accountable stewardship, or technical custody;
  the applicable authority and jurisdiction decide which claim is supportable.

## Specialized view

The linked
[Organizational Assignment Semantics](../mappings/organizational-assignment-semantics.md)
maps the canonical concepts to common records without claiming that titles,
permissions, or diagrams are equivalent to them.

## Selection procedure

1. Name the organization view, purpose, boundary, and authority system.
2. Identify actors and positions separately from roles.
3. Define each role by expected functions, scope, context, and exclusions;
   bind required competencies to work and proficiency criteria, and bind
   demonstrated competency to evidence, assessor, method, and time.
4. Assign responsibilities with subject, expected result, conditions,
   resources, and effective period.
5. Grant authority from a legitimate source with explicit decisions/actions,
   limits, controls, and revocation.
6. Record answerability with accountable actor, subject, review forum,
   evidence, consequences, and escalation.
7. Record action traceability separately from organizational answerability.
8. For delegation, preserve delegator, recipient, transferred scope, retained
   obligations, expiry, substitution, and revocation.
9. For ownership or stewardship, state the governed subject, lifecycle rights,
   duties, authority, and relation to operators and contributors.
10. Check least privilege, separation of duty, conflicts, vacancies,
    succession, and supersession.

## Reference Delta

| Reference form | Typical contribution | Factorium delta |
|---|---|---|
| Dictionary | Defines organization, role, responsibility, authority, accountability, delegation, and ownership | Places function, obligation, right, answerability, transfer, and custody under distinct questions |
| Thesaurus | Links duty, control, power, owner, steward, manager, and assignee | Prevents related labels from becoming interchangeable |
| Encyclopedia or governance standard | Explains institutions, structures, controls, and management systems | Supplies a compact source, scope, time, evidence, and review contract |
| Org chart or responsibility matrix | Shows selected assignments | Requires underlying semantics and non-equivalence to remain visible |
| Factorium | Connects organizational concepts to policy, identity, lifecycle, and mechanism mappings | Separates canonical assignments from titles and implementation permissions |

## Constraints and failure signs

- Roles are not identified solely by current assignees or titles.
- Responsibilities state subject, expected result, conditions, and period.
- Authority states granting source, scope, limits, controls, and revocation.
- Responsibility without sufficient authority is visible and escalated.
- Authority without responsibility, accountability, or review is visible.
- Organizational answerability is not replaced by technical action logs.
- Delegation states retained obligations and does not silently become permanent.
- Ownership states scheme and scope and does not imply legal title unless that
  sense is explicitly selected.
- Vacancies, conflicts, substitutions, and succession have defined handling.
- Least privilege and separation of duty constrain combined assignments.

## Cross-references

- [Identity, Naming, Classification, and Versioning](identity-naming-classification-versioning.md)
- [Policy, Rule, Constraint, Decision, and Exception](policy-rule-constraint-decision-exception.md)
- [State, Event, Transition, Process, and Lifecycle](state-event-transition-process-lifecycle.md)
- [System Composition, Capability, Interface, and Dependency](system-composition-dependency.md)
- [Governance, Obligation, and Compliance](governance-obligation-compliance.md)
- [Factor Role to Mechanism Crosswalk](../mappings/factor-role-mechanisms.md)

## Sources and provenance

1. NIST, NICE Framework Resource Center:
   https://www.nist.gov/itl/applied-cybersecurity/nice/nice-framework-resource-center
2. NIST CSRC Glossary, "authorization":
   https://csrc.nist.gov/glossary/term/authorization
3. NIST CSRC Glossary, "accountability":
   https://csrc.nist.gov/glossary/term/accountability
4. NIST CSRC Glossary, "information owner":
   https://csrc.nist.gov/glossary/term/information_owner
5. NIST CSRC Glossary, "least privilege":
   https://csrc.nist.gov/glossary/term/least_privilege
6. NIST CSRC Glossary, "separation of duty":
   https://csrc.nist.gov/glossary/term/separation_of_duty
7. OPM, "Oversight and Effectiveness":
   https://www.opm.gov/policy-data-oversight/oversight-and-effectiveness/
8. GAO Green Book 2025, Principle 3:
   https://guides.gaoinnovations.gov/greenbook/2025/principle-3-establish-structure-responsibility-and-authority/
9. U.S. OPM, “Classification and qualifications”:
   https://www.opm.gov/frequently-asked-questions/classification-faq/general/are-classification-and-qualifications-the-same-thing/
10. U.S. OPM, *General Schedule Qualification Policies*:
   https://www.opm.gov/policy-data-oversight/classification-qualifications/general-schedule-qualification-policies/
11. NIST CSRC Glossary, “information steward”:
   https://csrc.nist.gov/glossary/term/information_steward

Comparator access date: 2026-08-14. Factorium's cross-domain organization and
assignment model remains `candidate`.
