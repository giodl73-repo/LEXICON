# System Composition, Architecture, Capability, Interface, and Dependency

Status: candidate anchor entry

## Orientation

A system is a selected whole whose interacting elements together exhibit
behavior or meaning; engineered and organizational systems are commonly
organized toward one or more purposes. A system element is a member of that
selected whole; a component is an element treated as a constituent under
stated part-whole or assembly semantics. Architecture concerns fundamental
concepts or properties of an entity in its environment as embodied through
elements, relationships, and organizing principles; an architecture
description is an artifact expressing an architecture for declared
stakeholders and concerns. A capability is an ability to produce an outcome
under conditions. A boundary decides inclusion, an environment remains
outside that boundary, an interface owns interaction at a meeting point, and
a dependency records directional reliance. These concepts cooperate but are
not interchangeable.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `system` | Which interacting elements are selected as a whole, and what behavior, meaning, or purpose makes that view useful? | organized whole |
| `system-element` | Which member is included in this selected system view? | boundary-relative member |
| `component` | Which element is treated as a constituent under part-whole or assembly semantics? | composed constituent |
| `architecture` | Which fundamental concepts, properties, elements, relationships, and principles organize this entity in its environment? | entity organization and rationale |
| `architecture-description` | Which versioned work product expresses an architecture for declared stakeholders, concerns, viewpoints, and uses? | architecture representation artifact |
| `capability` | What outcome can the system or element produce, for whom, and under which conditions? | condition-bound ability |
| `boundary` | What is included, excluded, or treated as crossing in this view? | scope and inclusion decision |
| `system-environment` | Which external actors, systems, and circumstances influence or interact with the system? | outside context |
| `interface` | Where and under what contract do elements meet, interact, or exchange? | interaction locus and contract |
| `dependency` | What does one subject rely on from another, under which condition and consequence? | directional reliance relation |

## Role ladder

```text
purpose and viewpoint
  -- select --> system of interest and boundary

membership rule
  -- includes --> system elements

part-whole and lifecycle semantics
  -- classify some elements as --> components

stakeholders, concerns, environment, and decisions
  -- frame --> architecture and its organizing principles

viewpoint and model-kind conventions
  -- govern --> architecture descriptions, views, and models

required outcome and conditions
  -- identify --> capabilities

element or environment interaction
  -- occurs through --> interfaces

required property, service, resource, or condition
  -- creates --> directional dependency
```

## Root factorization

```text
system-composition-use
  := system of interest, behavior, or purpose
   x selected boundary and viewpoint
   x elements and membership rule
   x part-whole and lifecycle semantics
   x stakeholder concerns and decision use
   x fundamental concepts, properties, and organizing principles
   x architecture-description viewpoints, views, and model kinds
   x assumptions, decisions, rationale, consistency, and version
   x capabilities and required conditions
   x interfaces and interaction contracts
   x dependency source, target, and direction
   x environment and external actors
   x behavior, state, and emergent properties
   x authority, provenance, and effective time
```

## Contrast table

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| System vs. collection | both contain selected items | organized interaction and whole-level purpose/behavior vs. mere grouping |
| System element vs. component | both can be inside the boundary | membership in the selected view vs. asserted constituent semantics |
| System vs. subsystem | both satisfy the system sense | selected whole in the current view vs. a system also treated as an element or component of a containing system |
| Architecture vs. system structure | both concern elements and relationships | fundamental concepts, properties, and organizing principles in context vs. one selected structural projection |
| Architecture vs. architecture description | both concern the same entity of interest | organizing concepts/properties embodied in the entity vs. a versioned artifact expressing them |
| Architecture description vs. view | both are representations | the complete declared work product vs. one concern-framed representation governed by a viewpoint |
| Architecture vs. detailed design | both constrain realization | enduring organization and principles relevant to concerns vs. the fuller set of realization decisions and specifications |
| Component vs. capability | a component may support a capability | what is assembled vs. what outcome can be produced |
| Boundary vs. environment | both define system context | inclusion decision vs. external actors and circumstances |
| Boundary vs. interface | an interface may cross a boundary | scope demarcation vs. interaction locus and contract |
| Interface vs. dependency | interaction can satisfy reliance | how parties meet/exchange vs. why one relies on another |
| Relationship vs. dependency | both connect subjects | general connection vs. directional reliance with consequence |
| Capability vs. behavior | behavior can realize capability | offered ability under conditions vs. observed or modeled activity |

## Diagnostic examples

- A contractor can be a system element in an operational view without being
  an owned organizational component.
- A database is a component of one deployed service view and an external
  dependency in another team's ownership view.
- An HTTP API is an interface; the service's ability to authorize a request is
  a capability.
- A network boundary does not by itself define the semantic contract of every
  interface crossing it.
- A library import records a software dependency only when the relying
  subject, required behavior/version, and failure consequence are stated.
- A propulsion unit may be selected as the system of interest for one analysis
  and treated as a subsystem or component in a vehicle-level view; its entity
  identity need not change when its contextual role does.
- A box-and-line view can express part of an architecture description without
  being the architecture, the complete description, or evidence that the
  represented entity conforms to either.

## Specialized view

The linked
[System Composition and Architecture Integrity Constraints](../constraints/system-composition-integrity.md)
records the minimum distinctions needed to keep membership, composition,
architecture, description, capability, interaction, and reliance valid.

## Selection procedure

1. Name the system of interest, purpose, observer, and viewpoint.
2. Draw the selected boundary and state the membership rule.
3. List elements without assuming every element is an owned component.
4. State part-whole, assembly, replacement, and lifecycle semantics for each
   claimed component.
5. If `subsystem` is used, name both the contained system view and the
   containing-system role; do not mint a new entity merely from nesting.
6. Name architecture stakeholders, concerns, intended decisions, environment,
   fundamental concepts/properties, organizing principles, and material
   relationships.
7. Separate the architecture from each architecture description; for every
   description, record version, scope, viewpoints, views/models, model kinds,
   correspondences, assumptions, decisions, rationale, and known omissions.
8. Describe capabilities as outcomes with beneficiaries, conditions, and
   measures.
9. For each interface, identify participants, interaction locus, exchanged
   items, protocol or contract, direction, and failure behavior.
10. For each dependency, identify relying source, relied-on target, required
   property, condition, consequence, and effective period.
11. Record external actors and environmental influences separately from
   internal elements.
12. Re-evaluate architecture, descriptions, and role assignments when
    concerns, viewpoint, boundary, ownership, deployment, or lifecycle stage
    changes.

## Reference Delta

| Reference form | Typical contribution | Factorium delta |
|---|---|---|
| Dictionary | Defines system, architecture, description, component, capability, interface, boundary, environment, and dependency | Places nearby senses under distinct governing questions |
| Thesaurus | Links part, element, module, ability, edge, connection, and reliance | Prevents lexical proximity from implying semantic equivalence |
| Encyclopedia or systems standard | Explains systems, architecture, description, emergence, and lifecycle | Supplies a compact ownership, representation, membership, interaction, and reliance contract |
| Architecture or dependency diagram | Shows one selected representation | Distinguishes architecture from description and view while requiring direction, ownership, conditions, and failure consequences |
| Factorium | Connects canonical senses to roles, constraints, and mechanism mappings | Keeps implementation mechanisms from defining domain concepts |

## Constraints and failure signs

- Every system states viewpoint, boundary, environment, and the behavior,
  meaning, or purpose that makes the selected whole relevant.
- Membership in one view does not prove ownership or lifecycle control.
- Components state their part-whole and replacement semantics.
- `Subsystem` states both the system it denotes and the containing-system view
  in which it serves as an element or component.
- Architecture claims name the entity, environment, stakeholders, concerns,
  material elements/relationships, and organizing principles.
- Architecture descriptions name their scope, version, viewpoints, views or
  models, model kinds, correspondences, assumptions, decisions, rationale,
  and known omissions.
- A diagram, repository, model, or document is not silently equated with the
  architecture it expresses.
- Capabilities state beneficiary, outcome, conditions, and evaluation basis.
- Interfaces name participants, exchanged items, contract, and direction.
- Dependencies name source, target, required property, condition, and
  consequence.
- A relationship is not called a dependency merely because two subjects are
  connected.
- An external dependency is not silently drawn inside the system boundary.
- Whole-level behavior is not attributed to one component without evidence.
- Changing viewpoint may change role assignments without changing canonical
  entity identity.

## Cross-references

- [Root Table](../foundations/ROOT-TABLE.md)
- [Factor Role Table](../foundations/FACTOR-ROLES.md)
- [Identity, Naming, Classification, and Versioning](identity-naming-classification-versioning.md)
- [State, Event, Transition, Process, and Lifecycle](state-event-transition-process-lifecycle.md)
- [Factor Role to Mechanism Crosswalk](../mappings/factor-role-mechanisms.md)
- [Software Module, Service, and Resource](software-module-service-resource.md)
- [Software Transaction, Message, and Contract](software-transaction-message-contract.md)

## Sources and provenance

1. NASA, *Systems Engineering Handbook*, "2.0 Fundamentals of Systems
   Engineering":
   https://www.nasa.gov/reference/2-0-fundamentals-of-systems-engineering/
2. NIST CSRC Glossary, "system":
   https://csrc.nist.gov/glossary/term/system
3. NIST CSRC Glossary, "system element":
   https://csrc.nist.gov/glossary/term/system_element
4. NIST CSRC Glossary, "system component":
   https://csrc.nist.gov/glossary/term/system_component
5. NIST CSRC Glossary, "interface":
   https://csrc.nist.gov/glossary/term/interface
6. NIST CSRC Glossary, "operational environment":
   https://csrc.nist.gov/glossary/term/operational_environment
7. SEBoK, "Introduction to Systems Engineering Fundamentals":
   https://sebokwiki.org/wiki/Introduction_to_Systems_Engineering_Fundamentals
8. ISO/IEC/IEEE 42010:2022, *Software, systems and enterprise — Architecture
   description*: https://www.iso.org/standard/74393.html
9. NIST CSRC Glossary, "architecture viewpoint," sourced to NIST SP
   800-160v1r1: https://csrc.nist.gov/glossary/term/architecture_viewpoint
10. ISO/IEC/IEEE 42030:2019, *Software, systems and enterprise — Architecture
    evaluation framework*: https://www.iso.org/standard/73436.html
11. NASA, *Systems Engineering Handbook*, Appendix, "Architecture":
    https://www.nasa.gov/reference/system-engineering-handbook-appendix/
12. [System architecture and description ownership research](../../docs/research/2026-08-16-system-architecture-description.md)

Comparator access dates: 2026-08-14 and 2026-08-16. Factorium's cross-domain
distinctions, especially the generic dependency and architecture-description
integrity contracts, remain `candidate`.
