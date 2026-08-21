# Distribution, Shape, Skewness, Tail, Outlier, and Extreme Value

Status: candidate anchor entry

Scope: distributional-description scope

## Orientation

A distribution assigns probability or observed frequency over the values a
variable can take, for a stated population and period. Its shape is the set of
features — support, bounds, modality, symmetry, tail weight — that describe that
assignment. Skewness reports asymmetry under a chosen definition. A tail is the
region beyond a stated cut. An outlier is an observation judged discrepant from
an assumed model or the data bulk under a declared rule. An extreme value is a
maximum, minimum, or threshold exceedance modeled under an extreme-value limit
law.

An outlier is a judgment about an observation; an extreme value is a modeled
quantity; neither is a decision boundary.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `distribution` | Which assignment of probability or frequency over which values, for which variable, population, and period? | value-spread assignment |
| `distribution-shape` | Which support, bounds, modality, symmetry, and tail-weight features characterize the assignment? | qualitative shape description |
| `skewness` | Which direction and degree of asymmetry does the distribution exhibit, and under which of the inequivalent diagnostics is that asymmetry claim measured? | asymmetry shape claim, measured by competing diagnostics |
| `tail` | Which region beyond which stated cut or quantile, under which tail-weight characterization? | far-region reference |
| `outlier` | Which observation is discrepant from the assumed model or bulk, under which rule, and with what authorized treatment? | model-relative discrepancy judgment |
| `extreme-value` | Which maximum, minimum, or exceedance is modeled under which limit law, block or threshold choice, and return level? | limit-law-modeled extreme |

## Root factorization

```text
distribution-shape-tail-use
  := variable, population, sample, period, and decision use
   x measurement scale, support, and bounds
   x empirical, fitted, or predictive status and estimation method
   x density, mass, or cumulative representation
   x shape features: modality, symmetry, and tail weight
   x skewness diagnostic, estimator owner, and sample-size sensitivity
   x kurtosis and tail-index diagnostics carried as tail factors, read as tail
     weight and never as peakedness
   x tail definition: side, cut or quantile convention, comparison distribution
   x outlier rule, pre-declaration status, and decision authority
   x outlier treatment: retained, flagged, accommodated, or excluded, with reason
   x analytic-sample change recorded with the sampling owner
   x extreme-value approach: block maxima or peaks over threshold
   x block size or threshold choice and sensitivity analysis
   x limit-law family, shape parameter, and moment-existence status
   x return level, return period, and stationarity assumption
   x dependence, clustering, and declustering treatment
   x estimation uncertainty, extrapolation range, and scope limits
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Distribution vs. sample | both concern observed values | the assignment over values vs. the selected units that were observed |
| Distribution vs. summary statistic | both describe data | the whole assignment vs. one reduction of it |
| Shape vs. moments | both describe form | the characterized feature — support, modality, symmetry, tail weight — vs. the moment or quantile estimators that measure it, which remain with [Statistical Summary and Interval](statistical-summary-interval.md) |
| Skewness vs. its estimators | both are called skewness | the asymmetry claim about the distribution vs. the third standardized moment, Bowley's quartile coefficient, Pearson's coefficients, or the L-moment ratio, which can disagree in magnitude and ordering on the same data |
| Skewness vs. asymmetry impression | both concern lopsidedness | a defined measure with an estimator vs. a visual reading of a plot |
| Skewness vs. kurtosis | both are called shape measures | asymmetry, admitted here as a sense, vs. tail and shoulder mass, which characterizes the region already scoped by `tail` and is therefore carried as a tail factor rather than as a peer sense; kurtosis is not peakedness |
| Tail vs. extreme value | both concern the far region | a region beyond a stated cut vs. a maximum, minimum, or exceedance under a limit law |
| Tail vs. outlier | both involve unusual values | an expected region of the distribution vs. a value judged discrepant from the model |
| Tail cut vs. threshold | both are levels | an analysis cut recorded with sensitivity vs. a decision boundary that triggers action |
| Outlier vs. measurement error | both explain surprising values | a discrepancy judgment vs. an established fault in measurement |
| Outlier vs. influential point | both affect results | discrepancy from the model vs. leverage on the fitted result |
| Outlier flagging vs. exclusion | both follow a rule | labeling a candidate vs. an authorized change to the analytic sample |
| Extreme value vs. extremum | both concern maxima | a modeled sample maximum or exceedance under extreme-value theory vs. the maximum or minimum of a function, which no canonical sense currently owns and which stays reserved; optimization problem structure sits under the [Choice and Alternative Selection](../mappings/optimization-problem-structure.md) mapping |
| Return level vs. forecast | both name a future-relevant magnitude | an extrapolated distributional level under stationarity vs. a claim issued for a stated valid time |
| Heavy tail vs. large observation | both involve big values | a tail-weight class supported by testing vs. one observed value |

## Dependencies and stopping boundary

- Variable, population, sample, period, measurement scale, support, and decision
  use are explicit before any distributional claim.
- The distribution's status — empirical, fitted, or predictive — and its
  estimation method are recorded.
- Shape claims are stated as explicit features rather than as an unqualified
  shape name; skewness carries the diagnostic used to measure it; kurtosis, if
  used, is read as tail weight and recorded as a tail factor.
- **Reciprocal boundary with the statistical-summary owner.** Moment-based and
  quantile-based estimators — mean, variance, standard deviation, standard
  error, quantile — remain the practice of
  [Statistical Summary and Interval](statistical-summary-interval.md)
  and are consumed here. This entry owns the characterization those estimators
  describe. That owner's procedure text already directs readers to inspect
  distribution shape, tails, and multimodality and to check tail sensitivity
  without a sense to record the result under; those instructions resolve to
  `distribution-shape`, `skewness`, `tail`, and `extreme-value` here, and every
  diagnostic named here resolves back to an estimator there.
- Tail claims state the side, the cut or quantile convention, and the comparison
  distribution used for any tail-weight characterization.
- Outlier claims state the rule, its pre-declaration status, the treatment
  decision, and the authority for that decision; any exclusion is recorded as a
  change to the analytic sample.
- Extreme-value claims state the approach, block size or threshold, threshold
  sensitivity, limit-law family, shape parameter with uncertainty,
  moment-existence status, and the extrapolation range.
- Return levels state stationarity, dependence, and declustering assumptions.

**Shared boundary with the neighboring analytical families.** `tail` and
`extreme-value` are distributional and belong here. Rare-event anticipation and
rare-event verification are temporal-evaluative and belong to
[Prediction, Forecast, Conditional Projection, Backtest, and Forecast Skill](prediction-forecast-conditional-projection-backtest-skill.md).
`tipping-point` and `critical-transition` are dynamical-structural and belong to
[Tipping Point, Critical Transition, Cascade, Contagion, and Spillover](tipping-point-critical-transition-cascade-contagion-spillover.md).
Decision boundaries that trigger classification, attention, or action remain
`threshold` in
[Objective, Control, Monitoring, and Response](control-monitoring-response.md).

**Predictive-distribution seam.** A predictive distribution is split by object
versus act: this entry owns the distributional object and its shape, tail, and
extreme-value characterization, and the forecast family owns issuance of that
object for a stated predictand and valid time and the verification that scores
it against what occurred.

This entry stops before distribution catalogs, density-estimation methods,
goodness-of-fit test selection, anomaly-detection algorithms, robust-estimator
theory, and risk-capital policy.

## Selection procedure

1. Identify the variable, population, sample, period, measurement scale, and
   decision use.
2. Select the exact question: distribution, shape, skewness, tail, outlier, or
   extreme value.
3. Record whether the distribution is empirical, fitted, or predictive, and how
   it was estimated.
4. Describe shape by explicit features: support, bounds, modality, symmetry, and
   tail weight.
5. Report skewness as an asymmetry claim, name the diagnostic used to measure it
   and that diagnostic's sample-size sensitivity, and attribute the estimator to
   the statistical-summary owner; report kurtosis, if at all, as a tail-weight
   factor under the tail or extreme-value senses.
6. Define the tail explicitly by side and cut, and name the comparison
   distribution behind any heavy-tail language.
7. Declare the outlier rule and decision authority before inspection where
   possible.
8. Classify each flagged value: retained, flagged, accommodated by a robust
   method, or excluded — with a reason and a recorded authority.
9. Record any exclusion as a change to the analytic sample with the sampling
   owner, and check for a measurement fault before assuming a genuine
   discrepancy.
10. For extremes, choose block maxima or peaks over threshold, record the block
    or threshold choice, and show sensitivity to that choice.
11. Report the limit-law family, shape parameter with uncertainty, and whether
    the fitted tail implies a finite mean and variance.
12. Report return levels only with stationarity, dependence, and declustering
    assumptions and with the extrapolation range stated.
13. Retain estimation uncertainty, alternatives, prohibited generalizations, and
    review state.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Dictionary | defines distribution, outlier, and extreme loosely | prevents the discrepancy judgment and the modeled extreme from merging |
| Statistics vocabulary standard | fixes distribution and moment terms | keeps shape vocabulary aligned with an external authority |
| Outlier-treatment standard | prescribes detection and treatment procedure | makes treatment authority and rationale explicit factors |
| Statistics handbook | supplies estimators for shape measures | keeps the asymmetry claim and the diagnostic that measures it distinct, with the estimator attributed to the statistical-summary owner |
| Extreme-value monograph | supplies limit laws and fitting practice | keeps block or threshold choice, shape parameter, and extrapolation limits auditable |
| Heavy-tail critique | tests power-law and fat-tail claims | keeps tail-class claims evidence-bound |

## Failure signs

- a distribution is described without variable, population, or period;
- an empirical histogram and a fitted model are used interchangeably;
- shape is asserted by name with no stated features;
- skewness is quoted with no definition or estimator, or two inequivalent
  skewness diagnostics are compared as if they were the same number;
- kurtosis is described as peakedness, or is promoted to a shape sense beside
  skewness instead of staying a tail factor;
- a moment estimator is re-owned here instead of being cited from the
  statistical-summary owner;
- "tail" is used with no stated side, cut, or comparison distribution;
- a heavy tail is claimed from one large observation;
- power-law claims are made without principled testing;
- outliers are deleted silently or without recorded authority;
- a flagged value is treated as an established measurement error;
- an exclusion is not reflected in the analytic sample;
- `extremum` is used for a sample extreme, or `extreme-value` for an
  optimization maximum that is currently unowned and reserved;
- threshold or block choice is unreported, or its sensitivity is untested;
- a return level is presented as a forecast, or as an acceptability judgment;
- moment-existence status is ignored while means and variances are quoted;
- a tail observation is presented as evidence of a regime change.

## Cross-references

- [Statistical Summary and Interval](statistical-summary-interval.md)
- [Probability, Risk, and Uncertainty](probability-risk-uncertainty.md)
- [Sampling, Estimation, and Generalization](sampling-generalization.md)
- [Measurement Quality](measurement-quality.md)
- [Mathematical Relation and Solving](mathematical-relation-solving.md)
- [Evaluation Frame, Measure, Scale, and Criterion](evaluation-measure-scale-criterion.md)
- [Objective, Control, Monitoring, and Response](control-monitoring-response.md)
- [Hazard, Exposure, Harm, Vulnerability, and Safety](hazard-exposure-harm-safety.md)
- [Prediction, Forecast, Conditional Projection, Backtest, and Forecast Skill](prediction-forecast-conditional-projection-backtest-skill.md)
- [Tipping Point, Critical Transition, Cascade, Contagion, and Spillover](tipping-point-critical-transition-cascade-contagion-spillover.md)
- [Admission brief](../../signals/discover/literature/distribution-shape-tail-extreme-value-candidate-brief-2026-08-20.md)

## Sources and provenance

1. ISO 3534-1, *Statistics — Vocabulary and symbols — Part 1*:
   https://www.iso.org/standard/40145.html
2. ISO 16269-4, *Statistical Interpretation of Data — Part 4: Detection and
   Treatment of Outliers*: https://www.iso.org/standard/44396.html
3. NIST/SEMATECH e-Handbook of Statistical Methods, "Measures of Skewness and
   Kurtosis": https://www.itl.nist.gov/div898/handbook/eda/section3/eda35b.htm
4. Fisher and Tippett, "Limiting Forms of the Frequency Distribution of the
   Largest or Smallest Member of a Sample":
   https://doi.org/10.1017/S0305004100015681
5. B. Gnedenko, "Sur la Distribution Limite du Terme Maximum d'une Série
   Aléatoire": https://doi.org/10.2307/1968974
6. James Pickands III, "Statistical Inference Using Extreme Order Statistics":
   https://doi.org/10.1214/aos/1176343003
7. Balkema and de Haan, "Residual Life Time at Great Age":
   https://doi.org/10.1214/aop/1176996548
8. Stuart Coles, *An Introduction to Statistical Modeling of Extreme Values*:
   https://doi.org/10.1007/978-1-4471-3675-0
9. Embrechts, Klüppelberg, and Mikosch, *Modelling Extremal Events*:
   https://doi.org/10.1007/978-3-642-33483-2
10. Douglas M. Hawkins, *Identification of Outliers*:
    https://doi.org/10.1007/978-94-015-3994-4
11. Frank E. Grubbs, "Procedures for Detecting Outlying Observations in
    Samples": https://doi.org/10.1080/00401706.1969.10490657
12. Hoaglin, Iglewicz, and Tukey, "Performance of Some Resistant Rules for
    Outlier Labeling": https://doi.org/10.1080/01621459.1986.10478363
13. Rousseeuw and Hubert, "Robust Statistics for Outlier Detection":
    https://doi.org/10.1002/widm.2
14. Clauset, Shalizi, and Newman, "Power-Law Distributions in Empirical Data":
    https://doi.org/10.1137/070710111
15. Peter H. Westfall, "Kurtosis as Peakedness, 1905–2014. R.I.P.":
    https://doi.org/10.1080/00031305.2014.917055
16. Groeneveld and Meeden, "Measuring Skewness and Kurtosis":
    https://doi.org/10.2307/2987742
17. D'Agostino, Belanger, and D'Agostino, "A Suggestion for Using Powerful and
    Informative Tests of Normality":
    https://doi.org/10.1080/00031305.1990.10475751
18. Artzner, Delbaen, Eber, and Heath, "Coherent Measures of Risk":
    https://doi.org/10.1111/1467-9965.00068
19. Basel Committee on Banking Supervision, "Minimum Capital Requirements for
    Market Risk" (d457): https://www.bis.org/bcbs/publ/d457.htm
20. Cirillo and Taleb, "Tail Risk of Contagious Diseases":
    https://doi.org/10.1038/s41567-020-0921-x

The source set supports a bounded distributional-description entry, not a
distribution catalog, an outlier-detection algorithm, or a licence to
extrapolate beyond the range the data and assumptions support.
