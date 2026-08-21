# Geographic Place, Environment, Weather, Climate, Earth System, and Environmental Change

Status: candidate anchor entry

## Orientation

A geographic place is a named or identified location/region under a spatial and
jurisdictional account. Environment is the relevant surrounding physical,
biological, social, and built conditions for a subject and question. Weather is
atmospheric state over a relatively short interval. Climate is a statistical
description of weather or climate-system state over a declared reference
period. Earth system is the coupled planetary system of major physical,
chemical, biological, and human-influenced components. Environmental change is
a measured or attributed change in environmental state over a stated baseline.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `geographic-place` | Which location or region is identified by which geometry, name, authority, boundary, and time? | spatially identified place |
| `environment` | Which surrounding conditions are relevant to which subject, process, population, and governing question? | subject-relative surrounding conditions |
| `weather` | What is the atmospheric state for which place, vertical extent, time, and measurement basis? | short-interval atmospheric state |
| `climate` | Which statistical state and variability are described for which region, variables, and reference period? | long-period statistical system description |
| `earth-system` | Which coupled planetary components, boundaries, stocks, flows, and interactions are included under which model or account? | planetary coupled system |
| `environmental-change` | Which environmental state changed relative to which baseline, scale, drivers, attribution method, and uncertainty? | baseline-relative change |

## Root factorization

```text
earth-environment-use
  := subject, population, place, region, boundary, and jurisdiction
   x geometry, coordinate reference, scale, resolution, and time
   x physical, biological, social, and built environmental conditions
   x atmospheric variables, observations, state, event, and forecast
   x climate variables, statistics, variability, extremes, and reference period
   x atmosphere, hydrosphere, cryosphere, lithosphere, biosphere, and human systems
   x stocks, flows, interactions, internal dynamics, external forcings, and feedback
   x baseline, observed change, attribution, model, evidence, and uncertainty
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Place vs. environment | environments have spatial context | identified location/region vs. relevant surrounding conditions for a subject/question |
| Weather vs. climate | climate is described through weather variables | atmospheric state/event over short interval vs. statistics/system state over a reference period |
| Climate vs. Earth system | climate is an Earth-system property | statistical climate-system description vs. broader coupled planetary system |
| Environmental change vs. event | events can drive change | baseline-relative state difference vs. bounded occurrence |
| Observation vs. attribution | observations support attribution | measured state/change vs. causal assignment under a method/model |

## Dependencies and stopping boundary

Spatial context, ecosystems, state/event, quantity/measurement, periodic waves,
causal reasoning, prediction, tipping points, and hazard/risk retain their
owners. This Table does not forecast weather or climate, attribute a particular
event, prescribe policy, enumerate geographic or environmental taxonomies, or
provide environmental, emergency, or safety advice.

## Selection procedure

1. Name subject/question, place, boundary, scale, time, authority, and reference system.
2. Select identified place, relevant surroundings, atmospheric state, climate statistics, coupled system, or baseline-relative change.
3. Record variables, units, observations, reference period, model, and uncertainty.
4. Separate observation, detection, attribution, projection, impact, and evaluation.
5. Preserve internal variability, external forcing, alternative baselines, and scale dependence.
6. Route forecasts, hazards, ecological relations, and policy decisions to their owners.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Gazetteer or GIS | identifies places, geometries, and reference systems | retains authority, time, boundary, and uncertainty |
| Meteorology | measures and predicts atmospheric state | separates observed weather, forecast, and climate statistics |
| Earth-system science | models coupled components, forcing, and feedback | keeps model boundary and evidence explicit |

## Failure signs

- place and environment share one boundary;
- one weather event is treated as climate or climate change;
- climate is reduced to a single average without variability/reference period;
- an Earth-system model is treated as the Earth system itself;
- detected change is automatically attributed to one cause;
- the Table produces forecasts, impact claims, or policy advice.

## Cross-references

- [Location, Region, Containment, Proximity, Route, and Network](spatial-operating-context.md)
- [Ecosystem, Habitat, Ecological Niche, Food Web, and Ecological Interdependence](ecosystem-habitat-niche-food-web-interdependence.md)
- [Prediction, Forecast, Conditional Projection, Backtest, and Forecast Skill](prediction-forecast-conditional-projection-backtest-skill.md)
- [Tipping Point, Critical Transition, Cascade, Contagion, and Spillover](tipping-point-critical-transition-cascade-contagion-spillover.md)

## Sources and provenance

1. World Meteorological Organization, Weather:
   https://wmo.int/themes/weather
2. IPCC, SROCC Glossary:
   https://www.ipcc.ch/srocc/chapter/glossary/
3. IPCC AR6 WGII, Annex II Glossary:
   https://www.ipcc.ch/report/ar6/wg2/chapter/annex-ii/
4. OGC, Abstract Specification Topic 5: Features:
   https://docs.ogc.org/as/17-087r13/17-087r13.html

The sources retain their scientific, standards, and assessment scopes. This
Table is not a forecast, event attribution, impact assessment, or policy claim.
