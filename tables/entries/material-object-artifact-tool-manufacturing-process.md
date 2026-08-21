# Material, Object, Artifact, Tool, and Manufacturing Process

Status: candidate anchor entry

## Orientation

Material is matter characterized for composition, properties, provenance, and
use under an account. A physical object is a materially bounded continuant or
item under an identity rule. An artifact is an object or feature intentionally
made or modified for a role under an account. A tool is an artifact or resource
used to act on another subject or process. Manufacturing process is an organized
production process that transforms inputs into specified physical outputs.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `material` | Which matter is identified by which composition, properties, state, provenance, and intended use? | characterized matter |
| `physical-object` | Which materially bounded item persists under which identity, boundary, and change rule? | physical individual |
| `artifact` | Which object or feature was made or modified by whom, for which intended role, design, and context? | intentionally produced or modified thing |
| `tool` | Which artifact or resource is used by which agent to perform which operation on which subject? | operation-enabling instrument |
| `manufacturing-process` | Which organized activities transform which materials/components into which specified outputs under which controls? | physical production process |

## Root factorization

```text
material-artifact-use
  := material identity, composition, properties, state, and batch
   x object identity, boundary, parts, condition, and persistence rule
   x maker, modification, design, intended role, and actual use
   x tool user, operation, workpiece, interface, capability, and safety
   x production plan, activities, sequence, equipment, and controls
   x inputs, components, consumables, outputs, residuals, and waste
   x requirements, tolerances, verification, provenance, and custody
   x place, time, environment, uncertainty, and lifecycle
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Material vs. object | objects consist of material | characterized matter kind/batch vs. bounded individual |
| Object vs. artifact | artifacts are objects or features | physical identity vs. intentional production/modification account |
| Artifact vs. tool | tools are artifacts or resources | made/modified thing generally vs. use as operation-enabling instrument |
| Manufacturing vs. production | manufacturing is production | organized physical transformation vs. broader account-defined output creation |
| Design vs. artifact | design can govern an artifact | specification or procedure vs. produced physical thing |

## Dependencies and stopping boundary

Matter/load measures, chemical substance, system components, disposition and
function, work/energy, requirements, reliability, and lifecycle retain their
owners. This Table does not enumerate materials, products, tools, techniques,
or manufacturing methods and provides no engineering or safety instruction.

## Selection procedure

1. Identify account, entity, boundary, material state, provenance, and time.
2. Select matter characterization, bounded object, intentional artifact, instrument use, or production process.
3. Separate design intent, actual capability, use, condition, and performance.
4. Record inputs, outputs, residuals, equipment, controls, and verification.
5. Preserve modifications, repairs, replacement, custody, and uncertainty.
6. Route named taxa and technical procedures to external authorities.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Materials reference | catalogs composition and properties | requires specimen/batch, state, method, and provenance |
| Cultural-heritage ontology | separates object, material, design, production, and custody | generalizes roles without importing the full class hierarchy |
| Manufacturing model | relates plans, processes, equipment, inputs, and outputs | retains actual event, residuals, verification, and lifecycle |

## Failure signs

- material name substitutes for composition, state, or evidence;
- any bounded quantity of matter is assumed to be one object;
- present use proves original design intent;
- every artifact is treated as a tool;
- manufacturing, assembly, repair, and generic production share one event;
- the Table supplies technical process or safety advice.

## Cross-references

- [Matter and Load Measure](matter-load-measure.md)
- [Chemical Entity, Substance, Compound Class, Mixture, and Solution](chemical-substance-classification.md)
- [Disposition, Power, and Designed Function](disposition-power-designed-function.md)
- [System Composition, Architecture, Capability, Interface, and Dependency](system-composition-dependency.md)

## Sources and provenance

1. CIDOC CRM 7.1.3, material, object, design, and production classes:
   https://cidoc-crm.org/sites/default/files/Documents/cidoc_crm_version_7.1.3.html
2. ISO, *Smart Manufacturing* white paper:
   https://www.iso.org/files/live/sites/isoorg/files/store/en/PUB100459.pdf
3. NIST, Smart Manufacturing Systems Design and Analysis Program:
   https://www.nist.gov/programs-projects/smart-manufacturing-systems-design-and-analysis-program

The sources provide comparison controls. This Table is not a materials
specification, manufacturing standard, or professional engineering judgment.
