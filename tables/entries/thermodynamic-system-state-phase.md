# Thermodynamic System, Boundary, State, Process, Phase, and Transition

Status: candidate anchor entry

## Orientation

A thermodynamic system is the selected subject; surroundings are outside it,
and a boundary separates them for accounting. Exchange rules distinguish open,
closed, and isolated idealizations. A state is the current condition described
by sufficient properties under a model. A process changes state along a path.
A phase is uniform in composition and physical state; a phase transition
changes phase nature or number as conditions vary.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `thermodynamic-system` | What matter, region, or control volume is selected? | analyzed subject |
| `thermodynamic-surroundings` | What lies outside and can interact with it? | external complement |
| `thermodynamic-boundary` | What real or imagined surface separates them? | accounting interface |
| `open-system` | Can matter and energy cross the boundary? | exchange idealization |
| `closed-system` | Is matter fixed while energy may cross? | exchange idealization |
| `isolated-system` | Are matter and energy exchanges excluded by the model? | limiting idealization |
| `thermodynamic-state` | What current condition is specified by sufficient properties? | condition description |
| `state-variable` | What property participates in specifying state? | state descriptor |
| `intensive-quantity` | What magnitude is independent of system extent? | scaling class |
| `extensive-quantity` | What quantity is additive for subsystems? | scaling class |
| `equation-of-state` | What scoped model relates selected state variables? | constitutive relation |
| `thermodynamic-process` | What change carries the system between states? | change process |
| `process-path` | What sequence describes how the process occurred? | history description |
| `thermodynamic-phase` | What part is uniform in composition and physical state? | material-state entity |
| `phase-transition` | What change alters phase nature or count? | material-state change |

## Conceptual chain

```text
system + boundary + surroundings -> exchange contract -> open/closed/isolated
state variables + model -> state -> process along path -> later state
material + uniformity criterion -> phase inventory -> transition
```

## Root factorization

```text
thermodynamic-system-use
  := selected matter, region, or control volume
   x surroundings and system boundary
   x matter, heat, work, and other allowed transfers
   x equilibrium, steady, transient, or nonequilibrium scope
   x state variables, property basis, and sufficiency criterion
   x intensive, extensive, specific, molar, or density scaling
   x equation-of-state or constitutive model and validity range
   x initial state, final state, process path, and constraints
   x constituents, composition, phase inventory, and interfaces
   x transition driver, coexistence, metastability, hysteresis, and kinetics
   x measurement conditions, uncertainty, provenance, and claim scope
```

## Contrast table

| Pair | Decisive distinction |
|---|---|
| System vs. surroundings | selected subject vs. external complement |
| Boundary vs. wall | accounting interface vs. material object |
| Open vs. closed | matter exchange allowed vs. excluded |
| Closed vs. isolated | energy exchange may occur vs. excluded |
| State vs. path | current condition vs. route/history |
| State variable vs. transfer | property assigned to state vs. boundary exchange during change |
| Intensive vs. extensive | independent of extent vs. additive for subsystems |
| Extensive vs. specific | total additive quantity vs. normalized quantity |
| Equation of state vs. universal law | scoped model vs. unrestricted identity |
| Phase vs. state of aggregation | uniform material entity vs. broad familiar label |
| Phase transition vs. reaction | phase nature/count change vs. species interconversion |
| Equilibrium vs. steady state | no driving imbalance vs. maintained flows with constant readings |

## Selection procedure

1. Draw the boundary and name surroundings, interval, and frame.
2. State permitted and observed matter and energy transfers.
3. Select open, closed, or isolated only from that exchange contract.
4. Name state variables, units, resolution, equilibrium scope, and model.
5. Classify quantity scaling using independence or additivity tests.
6. Separate endpoint state change from heat, work, and other path transfers.
7. Record process constraints and path, or admit only endpoints are known.
8. Identify phases by composition and physical-state uniformity at a declared scale.
9. For transitions, record conditions, phase inventories, hysteresis, kinetics, and uncertainty.
10. Keep named phases and devices as examples unless a distinct concept passes boundary review.

## Constraints and failure signs

- Boundary, surroundings, exchanges, and time scope remain explicit.
- Open/closed/isolated follows the exchange contract, not appearance.
- State descriptions name a sufficiency/model scope and do not encode path.
- Heat and work remain transfers, not stored contents.
- Intensive/extensive uses independence/additivity tests.
- Equations of state retain material, phase, and validity range.
- Phase identity retains scale, uniformity, composition, and evidence.
- Phase transition and chemical reaction do not collapse.
- Steady state is not automatically equilibrium.
- Named states do not become an open-ended canonical taxonomy.

## Specialized view

The [Thermodynamic System and Phase Failure Diagnostic](../diagnostics/thermodynamic-system-state-phase-failures.md)
maps boundary, exchange, state, scaling, path, phase, and transition symptoms to checks.

## Cross-references

- [Thermal Quantity](thermal-quantity.md)
- [Chemical Entity, Substance, Compound Class, Mixture, and Solution](chemical-substance-classification.md)
- [Chemical Reaction, Stoichiometry, Extent, Rate, Equilibrium, and Catalyst](chemical-reaction-stoichiometry-equilibrium.md)
- [Stock, Flow, Accumulation, Balance, and Conservation](stock-flow-balance.md)
- [State, Event, Transition, Process, and Lifecycle](state-event-transition-process-lifecycle.md)
- [Work, Energy, and Power](work-energy-power.md)
- [Boundary](../roots/boundary.md)

## Sources and provenance

1. [Research note](../../docs/research/2026-08-15-thermodynamic-system-state-phase.md)
2. IUPAC Green Book: https://iupac.org/what-we-do/books/greenbook/
3. NIST, *Thermodynamics*: https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=918377
4. IUPAC phase: https://goldbook.iupac.org/terms/view/P04528
5. IUPAC phase transition: https://goldbook.iupac.org/terms/view/P04537

Comparator access date: 2026-08-15. Specialized authorities retain scope;
this organization remains `candidate`.
