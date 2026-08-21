# Tipping Point, Critical Transition, Cascade, Contagion, and Spillover

Status: candidate anchor entry

Scope: regime-change and propagation scope

## Orientation

A tipping point is the level of a control variable at which a small further
change commits a system to a qualitatively different state. A critical
transition is that abrupt regime change together with the feedback, bifurcation,
or hysteresis structure producing it. A cascade is an ordered propagation of
dependent failures or activations through structural couplings. Contagion is
unit-to-unit transmission of a state through a population. A spillover is an
effect landing on units outside the treated, exposed, or originating set.

None of these is a decision boundary, and none of them is established by the
size of an observation.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `tipping-point` | At which level of which control variable does a small further change commit the system to a qualitatively different state? | dynamical commitment level |
| `critical-transition` | Which abrupt regime change occurs, through which feedback, bifurcation, or hysteresis structure? | nonlinear regime change |
| `cascade` | Which ordered sequence of dependent failures or activations propagates through which couplings, and where does it stop? | structural propagation sequence |
| `contagion` | Which unit-to-unit transmission spreads a state through a population, separated from shared exposure and homophily? | population transmission claim |
| `spillover` | Which effect lands on units outside the treated, exposed, or originating set, through which channel? | out-of-set effect claim |

## Root factorization

```text
regime-change-propagation-use
  := system, unit set, boundary, and decision use
   x state variable, control variable, and observation window
   x baseline regime, alternative regime, and qualitative difference
   x feedback structure, nonlinearity, and bifurcation type
   x hysteresis, reversibility, and recovery path
   x commitment point, location uncertainty, and irreversibility horizon
   x coupling structure, dependency direction, and topology
   x propagation order, timing, amplification, and stopping condition
   x transmission mechanism, contact or exposure definition, and rate
     (consumed from the transfer candidate)
   x unit activation or reinforcement rule and its model source
   x population, susceptibility, and reproduction-number basis
   x exposed set, non-exposed set, and interference structure
   x channel of outside effect and affected-unit identification
   x identification strategy, confounding, homophily, and simultaneity handling
   x early-warning indicator, detection method, and false-signal rate
   x model, data, uncertainty, and scope limits
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Tipping point vs. threshold | both name a level | a system-dynamical commitment level nobody chooses vs. a decision boundary an owner sets and can move |
| Tipping point vs. critical transition | both concern regime change | the level at which commitment occurs vs. the transition and its mechanism |
| Critical transition vs. gradual change | both change state | qualitative regime change with feedback and hysteresis vs. continuous response to a moving driver |
| Critical transition vs. noise-driven shift | both look abrupt | bifurcation-structured change vs. stochastic excursion between existing states |
| Critical transition vs. observation artifact | both appear in a record | change in the system vs. change in sampling, definition, or instrument |
| Cascade vs. contagion | both spread | propagation along a known dependency structure vs. transmission among units of a population |
| Cascade vs. common-cause failure | both produce correlated failures | failure of one element causing the next vs. one shared cause acting on many |
| Contagion vs. shared exposure | both produce clustered adoption | unit-to-unit transmission vs. a common environmental driver |
| Contagion vs. homophily | both produce network correlation | influence flowing along ties vs. similar units forming ties |
| Contagion vs. transmission | both concern something passing between units | the population- or network-level propagation pattern and its identification burden vs. the per-event passing process, channel, rate, and fidelity owned by the transfer family |
| Simple vs. complex contagion | both transmit | single-contact sufficiency vs. reinforcement from multiple sources |
| Unit activation rule vs. threshold | both name a level at which a unit switches | a model construct describing individual adoption, owned by the model owner vs. a decision boundary that triggers action |
| Contagion vs. interdependence | both produce comovement | a change in the transmission mechanism vs. an unchanged linkage under higher volatility |
| Spillover vs. direct effect | both are causal effects | effect on units outside the exposed set vs. effect on the exposed units |
| Spillover vs. externality | both affect outsiders | the causal effect claim vs. its valuation and cost assignment |
| Spillover vs. generalization | both extend a finding | an effect on other units in this study vs. extension of a result to another population |

## Dependencies and stopping boundary

- System, unit set, boundary, state variable, control variable, and observation
  window are explicit before any claim.
- A tipping-point claim names the control variable, the committed consequence,
  and the uncertainty in the point's location.
- A critical-transition claim names the two regimes, the feedback or bifurcation
  structure, hysteresis and reversibility status, and the evidence separating it
  from a shifting driver, noise, or artifact.
- Early-warning indicators are reported with detection method, detrending
  choice, and false-signal behavior; a signal is not a prediction.
- A cascade claim names the coupling structure, propagation order and timing,
  the stopping condition, and excludes common-cause failure.
- Ecological regime shifts recorded as observed state changes of a delimited
  ecological unit stay with
  [Ecosystem, Habitat, Ecological Niche, Food Web, and Ecological Interdependence](ecosystem-habitat-niche-food-web-interdependence.md).
  This entry retains the control-variable, bifurcation, hysteresis,
  early-warning, and propagation structure.
- Successive incident or outage intervals under a declared service or
  measurement contract stay with
  [Fault, Defect, Error, Failure, Incident, and Outage](fault-defect-error-failure-incident-outage.md).
  This entry retains only the coupled propagation dynamics and evidence needed
  to establish a cascade rather than common-cause or coincident failures.
- A contagion claim names the transmission mechanism, exposure or contact
  definition, contagion type, and an identification strategy addressing
  homophily, shared exposure, simultaneity, and the reflection problem.
- **Contagion consumes transmission; it does not restate it.**
  [Inheritance, Transmission, Succession, and Bequest](inheritance-transmission-succession-bequest.md)
  owns `transmission` as the per-event passing process: mechanism, channel,
  contact or contact-equivalent, rate, and fidelity. Those factors are defined
  there and cited here. This entry owns the population- or network-level
  propagation pattern, its susceptibility and topology structure, and its
  identification burden, which the transfer family consumes in return.
- Unit activation and reinforcement rules from threshold and complex-contagion
  models are recorded as model constructs attributed to
  [Model, Representation, and Simulation](model-representation-simulation.md);
  they are never described as decision thresholds.
- A spillover claim names the exposed and non-exposed sets, the channel, the
  interference structure, and the redefined estimand.
- Reproduction numbers are reported with the model and population that define
  them.

**Shared boundary with the neighboring analytical families.** `tail` and
`extreme-value` are distributional and belong to
[Distribution, Shape, Skewness, Tail, Outlier, and Extreme Value](distribution-shape-skewness-tail-outlier-extreme-value.md).
Rare-event anticipation and rare-event verification are temporal-evaluative and
belong to
[Prediction, Forecast, Conditional Projection, Backtest, and Forecast Skill](prediction-forecast-conditional-projection-backtest-skill.md).
The senses here are dynamical-structural. Decision boundaries that trigger
classification, attention, or action remain `threshold` in
[Objective, Control, Monitoring, and Response](control-monitoring-response.md).

This entry stops before bifurcation mathematics, epidemic model families,
network-science metrics, systemic-risk regulation, externality valuation, and
metaphorical "viral", "domino", or popular tipping-point usage.

## Selection procedure

1. Identify the system, unit set, boundary, decision use, and observation
   window.
2. Select the exact question: tipping point, critical transition, cascade,
   contagion, or spillover.
3. Name the state variable and the control variable, and state what
   qualitatively distinguishes the regimes.
4. For a tipping point, state the committed consequence, the irreversibility
   horizon, and the uncertainty in the point's location.
5. For a critical transition, state the feedback or bifurcation structure,
   hysteresis, and reversibility, and test shifting-driver, noise, and artifact
   alternatives.
6. Report early-warning indicators with method, detrending, and false-signal
   behavior; never present a signal as an imminent-transition claim.
7. For a cascade, map the coupling structure, propagation order, timing,
   amplification, and stopping condition, and exclude common-cause failure.
8. For contagion, state the transmission mechanism, exposure definition, and
   contagion type by citing the transfer family's per-event factors, then state
   the identification strategy against homophily, shared exposure, and
   simultaneity for the population-level pattern claimed here.
9. Record any unit activation or reinforcement rule as a model construct with
   its model source, never as a decision threshold.
10. Run an implausible-outcome falsification check on observational propagation
    estimates where one is available.
11. For spillover, define exposed and non-exposed sets, the channel, the
    interference structure, and the estimand, and declare the stable-unit
    assumption explicitly.
12. Separate valuation, alerting, and response decisions and route them to their
    owners.
13. Retain model assumptions, uncertainty, alternatives, and review state.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Dictionary | defines tipping point and contagion loosely | prevents dynamical, decision, and metaphorical readings from merging |
| Dynamical-systems text | supplies bifurcation and hysteresis theory | keeps the qualitative claim tied to stated structure and evidence |
| Assessment glossary | fixes tipping point for climate assessment | ports the definition without importing one domain's element list |
| Network-science paper | models cascades and diffusion | keeps stylized model results from becoming empirical claims |
| Epidemiology reference | defines transmission and reproduction numbers | keeps R0 attached to its model and population |
| Causal-inference literature | formalizes interference and identification | makes confounding limits contract factors rather than caveats |

## Failure signs

- a chosen decision cut-off is called a tipping point;
- a tipping point is asserted with no named control variable;
- an abrupt change in a series is treated as proof of a bifurcation;
- early-warning signals are read as an imminent-transition prediction;
- absence of early-warning signals is read as absence of risk;
- hysteresis and reversibility are never stated;
- correlated failures are called a cascade without excluding a common cause;
- a cascade is claimed without a propagation order or a stopping condition;
- contagion is inferred from clustering in observational network data;
- a per-event transmission process is restated here instead of being cited from
  the transfer family, or is presented as proof of a population pattern;
- a model's unit activation rule is described as a decision threshold;
- homophily, shared exposure, and simultaneity are not addressed;
- a reproduction number is quoted as a property of a pathogen;
- rising comovement under higher volatility is reported as contagion;
- spillover is claimed without defining the non-exposed set or the channel;
- the stable-unit-treatment-value assumption is silently relaxed;
- spillover is conflated with generalization to a different population;
- a large observation is treated as evidence of a regime change.

## Cross-references

- [Objective, Control, Monitoring, and Response](control-monitoring-response.md)
- [State, Event, Transition, Process, and Lifecycle](state-event-transition-process-lifecycle.md)
- [Association, Causal Effect, Influence, Mechanism, Intervention, and Attribution](causal-reasoning.md)
- [Reliability, Availability, Maintainability, Resilience, and Recovery](dependability-reliability-availability-resilience.md)
- [System Composition, Architecture, Capability, Interface, and Dependency](system-composition-dependency.md)
- [Hazard, Exposure, Harm, Vulnerability, and Safety](hazard-exposure-harm-safety.md)
- [Sampling, Estimation, and Generalization](sampling-generalization.md)
- [Probability, Risk, and Uncertainty](probability-risk-uncertainty.md)
- [Ecosystem, Habitat, Ecological Niche, Food Web, and Ecological Interdependence](ecosystem-habitat-niche-food-web-interdependence.md)
- [Fault, Defect, Error, Failure, Incident, and Outage](fault-defect-error-failure-incident-outage.md)
- [Distribution, Shape, Skewness, Tail, Outlier, and Extreme Value](distribution-shape-skewness-tail-outlier-extreme-value.md)
- [Prediction, Forecast, Conditional Projection, Backtest, and Forecast Skill](prediction-forecast-conditional-projection-backtest-skill.md)
- [Inheritance, Transmission, Succession, and Bequest](inheritance-transmission-succession-bequest.md)
- [Editorial record](../../signals/discover/literature/tipping-point-critical-transition-cascade-candidate-brief-2026-08-20.md)

## Sources and provenance

1. Scheffer, Carpenter, Foley, Folke, and Walker, "Catastrophic Shifts in
   Ecosystems": https://doi.org/10.1038/35098000
2. Scheffer et al., "Early-Warning Signals for Critical Transitions":
   https://doi.org/10.1038/nature08227
3. Dakos et al., "Methods for Detecting Early Warnings of Critical Transitions
   in Time Series": https://doi.org/10.1371/journal.pone.0041010
4. Boettiger and Hastings, "Early Warning Signals and the Prosecutor's Fallacy":
   https://doi.org/10.1098/rspb.2012.2085
5. Hastings and Wysham, "Regime Shifts in Ecological Systems Can Occur With No
   Warning": https://doi.org/10.1111/j.1461-0248.2010.01439.x
6. Lenton et al., "Tipping Elements in the Earth's Climate System":
   https://doi.org/10.1073/pnas.0705414105
7. Armstrong McKay et al., "Exceeding 1.5 °C Global Warming Could Trigger
   Multiple Climate Tipping Points": https://doi.org/10.1126/science.abn7950
8. IPCC AR6 WG1, Annex VII Glossary (tipping point, abrupt change,
   irreversibility):
   https://www.ipcc.ch/report/ar6/wg1/chapter/annex-vii-glossary/
9. Sussmann and Zahler, "Catastrophe Theory as Applied to the Social and
   Biological Sciences: A Critique": https://doi.org/10.1007/BF00869575
10. Buldyrev, Parshani, Paul, Stanley, and Havlin, "Catastrophic Cascade of
    Failures in Interdependent Networks": https://doi.org/10.1038/nature08932
11. Duncan J. Watts, "A Simple Model of Global Cascades on Random Networks":
    https://doi.org/10.1073/pnas.082090499
12. Mark Granovetter, "Threshold Models of Collective Behavior":
    https://doi.org/10.1086/226707
13. Thomas C. Schelling, "Dynamic Models of Segregation":
    https://doi.org/10.1080/0022250X.1971.9989794
14. Centola and Macy, "Complex Contagions and the Weakness of Long Ties":
    https://doi.org/10.1086/521848
15. Diekmann, Heesterbeek, and Metz, "On the Definition and the Computation of
    the Basic Reproduction Ratio R0": https://doi.org/10.1007/BF00178324
16. World Health Organization, "Coronavirus Disease (COVID-19): How Is It
    Transmitted?":
    https://www.who.int/news-room/questions-and-answers/item/coronavirus-disease-covid-19-how-is-it-transmitted
17. Christakis and Fowler, "The Spread of Obesity in a Large Social Network Over
    32 Years": https://doi.org/10.1056/NEJMsa066082
18. Cohen-Cole and Fletcher, "Detecting Implausible Social Network Effects":
    https://doi.org/10.1136/bmj.a2533
19. Shalizi and Thomas, "Homophily and Contagion Are Generically Confounded in
    Observational Social Network Studies":
    https://doi.org/10.1177/0049124111404820
20. Charles F. Manski, "Identification of Endogenous Social Effects: The
    Reflection Problem": https://doi.org/10.2307/2298123
21. Joshua D. Angrist, "The Perils of Peer Effects":
    https://doi.org/10.1016/j.labeco.2014.05.008
22. Forbes and Rigobon, "No Contagion, Only Interdependence":
    https://doi.org/10.1111/0022-1082.00494
23. Diebold and Yilmaz, "Measuring Financial Asset Return and Volatility
    Spillovers": https://doi.org/10.1111/j.1468-0297.2008.02208.x
24. BIS, FSB, and IMF, "Guidance to Assess the Systemic Importance of Financial
    Institutions, Markets and Instruments": https://www.bis.org/publ/othp07.htm
25. Donald B. Rubin, comment on "Randomization Analysis of Experimental Data"
    (stable-unit-treatment-value assumption): https://doi.org/10.2307/2287653
26. Hudgens and Halloran, "Toward Causal Inference With Interference":
    https://doi.org/10.1198/016214508000000292

The source set supports a bounded regime-change and propagation entry, not a
dynamical-systems theory, an epidemic modeling framework, or a licence to read
clustering as transmission.
