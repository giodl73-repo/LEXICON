# Prediction, Forecast, Conditional Projection, Backtest, and Forecast Skill

Status: candidate anchor entry

Scope: anticipation-and-verification scope

## Orientation

A prediction asserts something about a value that has not been observed, from a
stated information set. A forecast is a prediction issued at a stated time for a
stated future valid time. A conditional projection is the outcome path implied
by a stated assumption or input set, with no claim that those assumptions will
hold. A backtest replays a method against withheld or historical data under a
declared protocol. Forecast skill compares a scored forecast against a declared
reference forecast over a stated verification sample.

Accuracy is not skill, skill is not value, and a projection is not a forecast.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `prediction` | Which unobserved value, event, or outcome does a stated method assert, from which information set, and in which uncertainty form? | information-conditioned claim about an unknown |
| `forecast` | Which prediction is issued for which predictand at which issue time, lead time, and valid time? | time-indexed issued prediction |
| `conditional-projection` | Which outcome path follows from a stated assumption or input set, with no claim that the set is likely? | assumption-conditioned outcome path |
| `backtest` | How would this method, model, or rule have performed on withheld or historical data under a declared replay protocol? | time-ordered retrospective performance test |
| `forecast-skill` | How much better or worse is this forecast than a declared reference forecast, under which score and sample? | reference-relative accuracy comparison |

## Root factorization

```text
prediction-forecast-evaluation-use
  := predictand, population, variable, and decision use
   x information set available at assertion time
   x issue time, lead time, valid time, and verification period
   x conditioning assumptions, inputs, and scenario reference
   x conditionality declaration and likelihood status
   x uncertainty form: point, interval, quantile, distribution, or category
   x method, model, estimation window, and parameter freeze rule
   x data vintage, revision status, and look-ahead exclusion
   x replay protocol, window scheme, and out-of-sample boundary
   x verifying observation and its own measurement error
   x score, propriety, and case aggregation
   x reference forecast identity and justification
   x calibration, sharpness, resolution, and skill reporting
   x base rate, rare-event definition, and degeneracy check
   x sample size, dependence, and accuracy-difference significance
   x limits, regime change, and prohibited generalization
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Prediction vs. forecast | both assert an unobserved value | any information-conditioned claim vs. a claim indexed to issue time, lead time, and valid time |
| Forecast vs. conditional projection | both produce a future path | a claim about what will happen vs. what follows from assumptions that may never hold |
| Conditional projection vs. scenario | both name assumed conditions | the computed outcome path vs. the configured possibility frame owned elsewhere |
| Conditional projection vs. counterfactual | both hold conditions fixed and read off an outcome | an outcome path run forward from a stated, possibly future, assumption set vs. a contrary-to-fact comparison frame owned by [Assumption, Condition, Scenario, Case, and Comparison](scenario-assumption-condition-case.md); when the frame is counterfactual, both owners are cited |
| Conditional projection vs. `projection` (view) | both are called projection | assumption-conditioned outcome path vs. loss-declared view transformation; never write the bare term here |
| Forecast vs. objective or target | both name a future value | expected outcome under evidence vs. a chosen commitment or set-point in [Objective, Control, Monitoring, and Response](control-monitoring-response.md), or a desired value as `target` in [Evaluation Frame, Measure, Scale, and Criterion](evaluation-measure-scale-criterion.md) |
| Forecast vs. plan | both look forward | anticipated outcome vs. intended course of action |
| Backtest vs. in-sample fit | both use historical data | replay with a look-ahead prohibition vs. fit on data used to build the method |
| Backtest vs. cross-validation | both withhold data | time-ordered replay honoring information availability vs. exchangeable resampling, which no canonical sense currently owns and which is cited here as external practice |
| Backtest vs. validation | both check adequacy | retrospective performance replay vs. fitness-for-purpose confirmation against requirements |
| Accuracy vs. skill | both use scores | closeness to what occurred vs. improvement over a declared reference |
| Forecast skill vs. comparator-relative evaluation result | both compare a subject against something else | the comparator must itself be a forecast for the same predictand and valid time, and the comparison runs over a verification sample vs. any rule applied to any subject against any baseline or comparator, which stays `evaluation-result` in [Evaluation Frame, Measure, Scale, and Criterion](evaluation-measure-scale-criterion.md) |
| Skill vs. value | both grade a forecast | score-based quality vs. decision-relative usefulness to a user |
| Calibration vs. sharpness | both grade probabilities | agreement between stated and observed frequencies vs. concentration of the predictive distribution |
| Predictive accuracy vs. explanation | both use models | performance on unseen cases vs. mechanism or causal claim |

## Dependencies and stopping boundary

- Predictand, population, variable, decision use, and uncertainty form are
  explicit before any prediction claim.
- Issue time, lead time, valid time, and verification period are explicit for
  every forecast; without them the claim remains a prediction.
- A conditional projection names its assumption or input set, cites the scenario
  owner for that frame, and carries no likelihood claim. If the frame is
  contrary to fact, the frame stays `counterfactual` with the scenario owner and
  only the outcome path is claimed here.
- A backtest names its replay protocol, data vintage, window scheme, parameter
  freeze rule, look-ahead exclusion, and the number of configurations tried.
  Cross-validation and other resampling designs are cited as external practice;
  no canonical sense currently owns them and none is claimed here.
- Skill claims name the reference forecast, the score, the propriety status of
  the score, and the verification sample. The reference must itself be a
  forecast for the same predictand and the same valid time, and the reported
  skill is a property of the forecast-reference-sample triple rather than of the
  forecast alone: change the reference or the sample and the number changes.
- Calibration and sharpness are reported together; the verifying observation and
  its own error remain separate factors.
- Rare-event claims report base rate, the rare-event definition, and score
  degeneracy behavior.

**Shared boundary with the neighboring analytical families.** `tail` and
`extreme-value` are distributional and belong to
[Distribution, Shape, Skewness, Tail, Outlier, and Extreme Value](distribution-shape-skewness-tail-outlier-extreme-value.md).
Rare-event anticipation and rare-event verification are temporal-evaluative and
belong here. `tipping-point` and `critical-transition` are dynamical-structural
and belong to
[Tipping Point, Critical Transition, Cascade, Contagion, and Spillover](tipping-point-critical-transition-cascade-contagion-spillover.md).
Decision boundaries that trigger classification, attention, or action remain
`threshold` in
[Objective, Control, Monitoring, and Response](control-monitoring-response.md).
A desired value, range, or trajectory sought under an objective stays `target`
in
[Evaluation Frame, Measure, Scale, and Criterion](evaluation-measure-scale-criterion.md).

**Predictive-distribution seam.** When a forecast carries a full predictive
distribution, the distributional family owns the distributional object and its
shape, tail, and extreme-value characterization; this family owns the issuance
that attaches that object to a predictand and a valid time, and the verification
that scores it against what occurred.

This entry stops before model estimation, scoring-rule catalogs, ensemble
design, trading-strategy construction, climate physics, macroeconomic modeling,
and prophecy.

## Selection procedure

1. Identify the predictand, population, variable, decision use, and required
   uncertainty form.
2. Select the exact question: prediction, forecast, conditional projection,
   backtest, or forecast skill.
3. For a forecast, record issue time, lead time, valid time, verification
   period, and the information set available at issue.
4. For a conditional projection, record the assumption or input set, cite the
   scenario frame, mark the absence of a likelihood claim, and state whether the
   frame is counterfactual so the frame is attributed to the scenario owner.
5. Record method, model, estimation window, parameter freeze rule, data vintage,
   and revision status.
6. For a backtest, record the replay protocol, window scheme, out-of-sample
   boundary, look-ahead exclusion, and configurations tried.
7. Record the verifying observation, its source, and its own error.
8. Select the score, state whether it is proper, and state the aggregation rule
   over cases.
9. Name the reference forecast and justify it before reporting skill; confirm
   it forecasts the same predictand for the same valid time, and record the
   result as reference- and sample-relative.
10. Report calibration, sharpness, and resolution alongside any headline score.
11. For rare events, report base rate, rare-event definition, and degeneracy
    behavior of the chosen score.
12. Test whether accuracy differences are distinguishable from sampling noise
    given the dependence structure.
13. Retain assumptions, uncertainty, regime-change risk, prohibited
    generalizations, and review state.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Dictionary | defines prediction, forecast, and projection loosely | prevents the conditional and unconditional readings from collapsing |
| Verification handbook | catalogs scores and diagrams | keeps score choice, propriety, and reference selection auditable |
| Assessment glossary | separates projection from prediction | ports the separation without importing one discipline's scope |
| Supervisory backtesting rule | prescribes exception counting | keeps replay protocol and low power visible instead of implied |
| Forecasting textbook | supplies accuracy measures | keeps measure choice tied to predictand and horizon |
| Statistics vocabulary standard | fixes prediction-interval terms | keeps interval semantics with their existing owner |
| Generic evaluation vocabulary | compares a subject against a baseline or comparator | requires the skill comparator to be a forecast for the same predictand and valid time, over a verification sample, and marks the result reference- and sample-relative |

## Failure signs

- a forecast is reported without issue time, lead time, or valid time;
- a conditional projection is read as a likelihood claim about the future;
- the bare word projection is used for an outcome path;
- a scenario frame is redescribed as if it were the forecast;
- accuracy is reported as skill with no reference forecast;
- skill is quoted without the score, sample, or reference that produced it;
- an improper score is used where hedging changes the reported value;
- calibration is claimed without sharpness, or sharpness without calibration;
- a rare-event score is reported without its base rate;
- a backtest omits data vintage, look-ahead exclusion, or the number of
  configurations tried;
- repeated tuning on the same history is presented as out-of-sample evidence;
- predictive performance is offered as evidence of mechanism;
- verifying-observation error is silently attributed to the forecast;
- a conditional projection is presented as a counterfactual, or a counterfactual
  frame is claimed here instead of by the scenario owner;
- skill is computed against a comparator that is not a forecast for the same
  predictand and valid time;
- skill is quoted as an intrinsic property of a forecast rather than as
  reference- and sample-relative;
- a forecast is treated as a target, commitment, or plan.

## Cross-references

- [Assumption, Condition, Scenario, Case, and Comparison](scenario-assumption-condition-case.md)
- [Decomposition Modes, Interaction, Contribution, and Combination Contracts](decomposition-modes-combination-contracts.md)
- [Objective, Control, Monitoring, and Response](control-monitoring-response.md)
- [Model, Representation, and Simulation](model-representation-simulation.md)
- [Probability, Risk, and Uncertainty](probability-risk-uncertainty.md)
- [Statistical Summary and Interval](statistical-summary-interval.md)
- [Sampling, Estimation, and Generalization](sampling-generalization.md)
- [Evaluation Frame, Measure, Scale, and Criterion](evaluation-measure-scale-criterion.md)
- [Measurement Quality](measurement-quality.md)
- [Distribution, Shape, Skewness, Tail, Outlier, and Extreme Value](distribution-shape-skewness-tail-outlier-extreme-value.md)
- [Tipping Point, Critical Transition, Cascade, Contagion, and Spillover](tipping-point-critical-transition-cascade-contagion-spillover.md)
- [Admission brief](../../signals/discover/literature/prediction-forecast-backtest-skill-candidate-brief-2026-08-20.md)

## Sources and provenance

1. IPCC AR6 WG1, Annex VII Glossary (projection, prediction, forecast):
   https://www.ipcc.ch/report/ar6/wg1/chapter/annex-vii-glossary/
2. Allan H. Murphy, "What Is a Good Forecast?":
   https://doi.org/10.1175/1520-0434(1993)008%3C0281:WIAGFA%3E2.0.CO;2
3. Allan H. Murphy, "Skill Scores Based on the Mean Square Error":
   https://doi.org/10.1175/1520-0493(1988)116<2417:SSBOTM>2.0.CO;2
4. Glenn W. Brier, "Verification of Forecasts Expressed in Terms of
   Probability":
   https://doi.org/10.1175/1520-0493(1950)078<0001:VOFEIT>2.0.CO;2
5. Gneiting and Raftery, "Strictly Proper Scoring Rules, Prediction, and
   Estimation": https://doi.org/10.1198/016214506000001437
6. Gneiting, Balabdaoui, and Raftery, "Probabilistic Forecasts, Calibration and
   Sharpness": https://doi.org/10.1111/j.1467-9868.2007.00587.x
7. Gneiting and Katzfuss, "Probabilistic Forecasting":
   https://doi.org/10.1146/annurev-statistics-062713-085831
8. Jolliffe and Stephenson, *Forecast Verification: A Practitioner's Guide*:
   https://doi.org/10.1002/9781119960003
9. WWRP/WGNE Joint Working Group on Forecast Verification Research:
   https://www.cawcr.gov.au/projects/verification/
10. Hyndman and Koehler, "Another Look at Measures of Forecast Accuracy":
    https://doi.org/10.1016/j.ijforecast.2006.03.001
11. Leonard J. Tashman, "Out-of-Sample Tests of Forecasting Accuracy":
    https://doi.org/10.1016/S0169-2070(00)00065-0
12. Makridakis, Spiliotis, and Assimakopoulos, "The M4 Competition":
    https://doi.org/10.1016/j.ijforecast.2019.04.014
13. Diebold and Mariano, "Comparing Predictive Accuracy":
    https://doi.org/10.1080/07350015.1995.10524599
14. Galit Shmueli, "To Explain or to Predict?":
    https://doi.org/10.1214/10-STS330
15. Basel Committee on Banking Supervision, "Supervisory Framework for the Use
    of 'Backtesting'": https://www.bis.org/publ/bcbs22.htm
16. Basel Committee on Banking Supervision, "Minimum Capital Requirements for
    Market Risk" (d457): https://www.bis.org/bcbs/publ/d457.htm
17. Paul H. Kupiec, "Techniques for Verifying the Accuracy of Risk Measurement
    Models": https://doi.org/10.3905/jod.1995.407942
18. Peter F. Christoffersen, "Evaluating Interval Forecasts":
    https://doi.org/10.2307/2527341
19. Stephenson, Casati, Ferro, and Wilson, "The Extreme Dependency Score":
    https://doi.org/10.1002/met.53
20. Ferro and Stephenson, "Extremal Dependence Indices":
    https://doi.org/10.1175/WAF-D-10-05030.1
21. Mellers et al., "Psychological Strategies for Winning a Geopolitical
    Forecasting Tournament": https://doi.org/10.1177/0956797614524255
22. ISO 3534-1, *Statistics — Vocabulary and symbols — Part 1*:
    https://www.iso.org/standard/40145.html

The source set supports a bounded anticipation-and-verification entry, not a
forecasting methodology, a scoring-rule catalog, or a claim that well-scored
prediction establishes mechanism.
