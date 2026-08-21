# Software Transaction, Message, and Contract

Status: candidate anchor entry

## Orientation

A transaction groups work under declared completion, rollback, visibility,
and concurrency semantics. A message is a bounded communication unit sent
from a sender toward one or more recipients under a protocol. A contract
states obligations, assumptions, guarantees, constraints, and compatibility
at a boundary. Transactions coordinate effects, messages carry interaction,
and contracts govern expected behavior; none can be inferred from a shared
request, event, document, or schema label.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `software-transaction` | Which operations commit, abort, become visible, retry, or compensate as one governed unit? | effect and visibility boundary |
| `message` | Which bounded communication unit carries which intent or information from which sender to which recipient? | protocol communication unit |
| `software-contract` | Which assumptions, obligations, guarantees, constraints, and change rules govern interaction at this boundary? | behavioral agreement |

## Root factorization

```text
software-interaction-mechanism-use
  := participants, system boundary, and authority
   x selected transaction, message, or contract sense
   x identity, correlation, and version
   x inputs, payload, and representations
   x operations, obligations, and expected effects
   x ordering, concurrency, and visibility
   x completion, acknowledgment, commit, or rollback
   x failure, timeout, retry, idempotency, and compensation
   x security, privacy, and resource limits
   x evidence, compatibility, and supersession
```

## Contrast table

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Transaction vs. process | both coordinate steps | commit/abort and visibility unit vs. general activity flow |
| Transaction vs. request | a request can start a transaction | communication act vs. effect/concurrency boundary |
| Transaction vs. saga | both coordinate multi-step work | local commit/rollback semantics vs. distributed sequence with compensation |
| Message vs. event | an event can be reported in a message | occurrence in a domain vs. communication unit |
| Message vs. data | messages carry data | protocol-bounded envelope and intent vs. represented content |
| Message vs. representation | a message may contain a representation | communication container vs. depiction of resource state |
| Contract vs. interface | interfaces expose interaction points | obligations and guarantees vs. access surface |
| Contract vs. schema | schemas constrain representation | behavioral agreement vs. structural description |
| Contract vs. policy | policy can contribute terms | agreement at a boundary vs. governing rule source |

## Diagnostic examples

- A database transaction may provide atomic commit and isolation, while a
  distributed workflow may require retries and compensating actions instead
  of rollback.
- Two messages can report the same event, and one message can describe many
  events.
- An HTTP request and response are messages; the target resource and any
  transferred representation remain separate concepts.
- A queue acknowledgment can confirm receipt or handling without proving the
  business transaction committed.
- A valid OpenAPI document can describe paths and schemas while leaving
  latency, availability, idempotency, and semantic obligations incomplete.
- Eiffel preconditions, postconditions, and invariants are one executable
  contract mechanism, not the only contract sense.

## Specialized view

The linked
[Software Interaction Mechanisms](../mappings/software-interaction-mechanisms.md)
maps these concepts into database, HTTP, SOA, OpenAPI, and Design by Contract
mechanisms while preserving partial correspondence.

## Selection procedure

1. Name the participants, ownership boundary, protocol/platform, version, and
   authority.
2. Decide whether the question concerns an effect unit, a communication unit,
   or an agreement.
3. For a transaction, record operations, begin/end, commit/abort, visibility,
   isolation, durability, retry, and compensation semantics.
4. For a message, record sender, recipient, channel, identity, correlation,
   payload, metadata, ordering, delivery, and acknowledgment.
5. For a contract, record parties, scope, assumptions, preconditions,
   obligations, guarantees, invariants, errors, and compatibility rules.
6. Separate domain events and resource representations from the messages that
   communicate them.
7. Record timeout, duplication, partial failure, security, and observability.
8. Test one concurrent case, one duplicate/retry case, and one incompatible
   contract change.

## Reference Delta

| Reference form | Typical contribution | Factorium delta |
|---|---|---|
| Dictionary | Defines transaction, message, contract, event, request, and agreement | Separates effect, communication, and behavioral-governance questions |
| Database reference | Defines transaction blocks and isolation levels | Prevents one database's guarantees from becoming universal transaction semantics |
| Protocol reference | Defines request/response message structure and meaning | Separates messages from resources, representations, and domain events |
| API or contract specification | Defines schemas, operations, assertions, or service terms | Requires obligations, failure behavior, compatibility, and evidence beyond document existence |
| Factorium | Connects interaction mechanisms to canonical system and lifecycle concepts | Preserves non-equivalence across local, distributed, protocol, and behavioral mechanisms |

## Constraints and failure signs

- Transaction guarantees are declared; ACID is not assumed from the word
  `transaction`.
- Commit, acknowledgment, response success, and business completion are not
  treated as equivalent.
- Messages retain sender, recipient, identity, correlation, protocol,
  ordering, delivery, and duplicate semantics.
- A message is not called an event merely because it is asynchronous.
- Contracts distinguish structural, behavioral, operational, security, and
  compatibility obligations.
- A schema or generated client is not treated as complete contract evidence.
- Retry and compensation rules state idempotency and duplicate effects.
- Distributed boundaries retain partial failure, timeout, and observation
  limits.

## Cross-references

- [System Composition, Capability, Interface, and Dependency](system-composition-dependency.md)
- [State, Event, Transition, Process, and Lifecycle](state-event-transition-process-lifecycle.md)
- [Policy, Rule, Constraint, Decision, and Exception](policy-rule-constraint-decision-exception.md)
- [Information, Data, Signal, and Noise](information-data-signal-noise.md)
- [Claim and Evidence](claim-evidence.md)
- [Software Type, Value, and Function](software-type-value-function.md)
- [Software Module, Service, and Resource](software-module-service-resource.md)

## Sources and provenance

1. PostgreSQL, "Transactions":
   https://www.postgresql.org/docs/current/tutorial-transactions.html
2. PostgreSQL, "Transaction Isolation":
   https://www.postgresql.org/docs/current/transaction-iso.html
3. RFC 9110, "HTTP Semantics", Sections 3.1-3.4 and 6:
   https://www.rfc-editor.org/rfc/rfc9110.html
4. OASIS, *Reference Model for Service Oriented Architecture 1.0*:
   https://docs.oasis-open.org/soa-rm/v1.0/soa-rm.html
5. ECMA-367, *Eiffel: Analysis, Design and Programming Language*:
   https://ecma-international.org/publications-and-standards/standards/ecma-367/
6. OpenAPI Specification 3.2.0:
   https://spec.openapis.org/oas/v3.2.0.html

Comparator access date: 2026-08-14. Exact database, protocol, assertion, and
API-description semantics remain source-owned; Factorium's general
interaction bridge remains `candidate`.
