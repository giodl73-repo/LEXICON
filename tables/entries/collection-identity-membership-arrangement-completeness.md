# Collection Identity, Membership, Arrangement, and Completeness

Status: candidate anchor entry

## Orientation

A collection here is a separately identified aggregate governed by a stated
organizing principle and membership rule. It can remain the same collection
through member change, rearrangement, and incomplete holdings. This is not a
mathematical set, a mereological sum, a system, or a generic classification.

The candidate applies across archival, library, museum, specimen, research, and
data contexts without universalizing any one domain's doctrine. A member,
boundary, and lifecycle stage are factors or routes: membership is typed and
declared, boundary is an output of the rule, and lifecycle is owned elsewhere.
It does not admit an unqualified `part-of` relation.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `named-collection` | Which separately identified aggregate is governed by which organizing principle and purpose, independently of its current extension? | governed aggregate identity |
| `membership-rule` | Which declared criterion determines what belongs to this named collection independently of its current extension? | collection-specific inclusion criterion |
| `collection-arrangement` | Under which scheme are the collection's members ordered, grouped, sequenced, or declared unordered? | internal organization |
| `collection-completeness` | To what extent does the current membership satisfy the collection's declared scope, and which gaps are known? | scope-relative holdings condition |

## Root factorization

```text
collection-identity-use
  := named collection, organizing principle, purpose, and identity basis
   x membership rule, declared scope, current members, and typed membership assertions
   x boundary as output of the membership rule
   x arrangement scheme, order/grouping, and unordered state where applicable
   x completeness basis, expected holdings, current holdings, and known gaps
   x lifecycle stage, member provenance, custody, access rights, authority, evidence, and revision
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Named collection vs. mathematical set | both can identify members | a set is extensionally determined; a collection has governed identity that can persist through gaps and member change |
| Named collection vs. system | both gather selected elements | a system requires interacting elements and whole-level behavior or purpose; a collection need not |
| Membership rule vs. classification | both use criteria | classification assigns an entity to a scheme class; the rule governs inclusion in this particular collection |
| Arrangement vs. membership rule | both concern collection members | changing order or grouping need not add or remove members |
| Completeness vs. cardinality | both can count holdings | completeness is a gap against declared scope, not the size of the current extension |
| Collection membership vs. part-of | both connect an aggregate and entities | membership is a declared typed relation under a rule; it is not unqualified parthood |

## Dependencies and stopping boundary

- Record an identity basis, which may be provenance-based, selection-based, or
  another declared account; do not treat archival or library practice as
  universal.
- Treat members, boundary, lifecycle, member provenance, custody, and access as factors
  or routes, not senses. Boundary routes to
  [System Composition, Architecture, Capability, Interface, and Dependency](system-composition-dependency.md);
  lifecycle routes to
  [State, Event, Transition, Process, and Lifecycle](state-event-transition-process-lifecycle.md).
- Route abstract-work ontology to the abstract-work candidate, classification to
  [Identity, Namespace, Naming, Classification, and Versioning](identity-naming-classification-versioning.md),
  custody to
  [Organization, Position, Role, Competency, Responsibility, Authority, and Accountability](organization-role-authority.md),
  access to the access entry, and provenance claims to claim-and-evidence.
- Do not express a member relation as `part-of`, create relation sidecars, or
  resolve legal title, access authorization, or generic record/schema semantics.

## Selection procedure

1. Identify the proposed collection and its organizing principle; reject a
   merely transient query result or ungoverned aggregate.
2. Select `named-collection` for identity, then state the membership rule
   separately from the current member list.
3. Record arrangement independently of membership, including an explicit
   unordered arrangement where applicable.
4. Assess completeness against the declared scope, not against cardinality.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Archival description | provenance, arrangement, and custody practices | retains archival scope as one identity basis and routes custody to its existing owner |
| Library reference model | aggregate works and member relations | separates collection governance from work ontology |
| Data/provenance vocabulary | collections as entities with asserted members | does not turn vocabulary predicates into a generic part-of relation |
| Set theory | extensional membership | marks the contrast between extension and governed collection identity |

## Failure signs

- treating any folder, query result, or list as a collection without a persistent
  identity and membership rule;
- treating a member as a sense or using unqualified `part-of`;
- equating arrangement with membership, or current count with completeness;
- minting collection-specific custody where the organization owner already
  records possession/control custody;
- universalizing archival provenance or library selection as the only identity
  basis;
- minting boundary or lifecycle senses already owned elsewhere.

## Cross-references

- [System Composition, Architecture, Capability, Interface, and Dependency](system-composition-dependency.md)
- [Identity, Namespace, Naming, Classification, and Versioning](identity-naming-classification-versioning.md)
- [Decomposition Modes and Combination Contracts](decomposition-modes-combination-contracts.md)
- [Organization, Position, Role, Competency, Responsibility, Authority, and Accountability](organization-role-authority.md)
- [State, Event, Transition, Process, and Lifecycle](state-event-transition-process-lifecycle.md)
- [Admission brief](../../signals/discover/literature/collection-identity-membership-arrangement-candidate-brief-2026-08-20.md)

## Sources and provenance

1. IFLA Library Reference Model (2017/2022),
   https://repository.ifla.org/handle/20.500.14598/40 — contribution:
   aggregate-work and member-relation context; limitation: work ontology does
   not define all collection governance.
2. ICA, Records in Contexts (RiC-CM),
   https://www.ica.org/ica-network/expert-groups/egad/records-in-contexts-ontology/
   — contribution: record-set and custody context; limitation: archival
   provenance is not a universal identity basis.
3. W3C DCAT 3 (2024), https://www.w3.org/TR/vocab-dcat-3/ — contribution:
   curated catalog and dataset-series examples; limitation: data catalog
   vocabulary does not settle collection completeness or custody generally.
4. W3C PROV-O (2013), https://www.w3.org/TR/prov-o/ — contribution: a
   collection as an entity with asserted members; limitation: it is intentionally
   agnostic about membership rules, arrangement, completeness, and custody.

Comparator access date: 2026-08-20. These sources are domain evidence only;
their predicates and terminology are not canonical relations.
