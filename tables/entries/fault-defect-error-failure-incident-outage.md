# Fault, Defect, Error, Failure, Incident, and Outage

Status: candidate anchor entry

Scope: dependability, quality, service management, and safety scope

## Orientation

In the dependability taxonomy of Avizienis et al., a fault is an adjudged or
hypothesized cause, present in or affecting an item, that could produce an
error once activation conditions are met; until then it is dormant. A
`dependability-error` is the part of the item's state that deviates from the
correct state; it may be detected, latent, or masked. That reading is not
universal: standards vocabularies also define `fault` as the *state* of
inability to perform as required, and `error` as a discrepancy between an
observed, computed, or measured value or condition and the correct one. A
defect is a nonconformity attributed to a work product under a criterion; the
use-relative reading taken here is the quality-vocabulary one, while software
standards define defect against requirements or specifications instead. A
failure is the loss of a required function or service against its criterion;
that sense is owned by the dependability entry and is referenced here, not
redefined. An incident is an occurrence that meets a named source's incident
criterion; some operational regimes also require formal declaration under a
rule and authority. An outage is a measured interval during which
a service or component is unavailable or significantly degraded under a
measurement contract; it may be planned or forced, and it does not presuppose a
fault, error, or failure.

These terms have no single cross-domain definition, and this entry does not
supply one. SEVOCAB, the free lookup for ISO/IEC/IEEE 24765, returns two
competing definitions of `fault`, several of `defect`, five of `problem`, and
no entry at all for `outage`; the NIST glossary carries several sourced
definitions of "incident" on one page; and 47 CFR 4.5 makes "outage" a
threshold set by a regulator. Every use must name its governing standard,
declaration rule, or measurement contract and that source's edition, including
uses of `fault` and `dependability-error`.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `fault-cause-condition` | Which adjudged or hypothesized cause, present in or affecting the item, could produce an error under which activation conditions, per which named source and edition? | latent or active cause condition |
| `fault-inability-state` | Which internal state makes the item unable to perform as required after which failure, per which named source and edition? | post-failure inability state |
| `dependability-error` | Which part of the item's state deviates from the correct state, and is it detected, latent, or masked? | deviant item state |
| `defect` | Which nonconformity relative to an intended or specified use is attributed to which work product and criterion, per which named source? | use-relative product nonconformity |
| `incident` | Which occurrence meets which named source's incident criterion and, where declaration applies, under which rule and authority, with what impact and response? | source-qualified occurrence record |
| `outage` | Over which interval was which service or component unavailable or significantly degraded for which population, under which measurement contract, and was it planned or forced? | measured unavailability interval |

`fault` is deliberately not proposed bare. The two qualified senses preserve
the incompatible cause-condition and post-failure inability-state readings
without presenting either as universal.

**Failure is not owned here.** `failure` remains a canonical sense of
[Reliability, Availability, Maintainability, Resilience, and Recovery](dependability-reliability-availability-resilience.md).
This entry states the propagation and declaration structure around it and
carries no local governing question, role, or criterion for it; the title
retains the word only because readers arrive asking how failure differs from
fault, error, incident, and outage.

**Problem is not owned here.** `problem` is deliberately not a sense: SEVOCAB
returns five competing standards definitions, from "root cause of one or more
incidents" to a life-cycle "undesirable condition that requires investigation".
Problem-management vocabulary is kept as factors and scoped notes only, and the
title scope is not extended to cover it.

## Root factorization

```text
fault-incident-outage-use
  := subject, item boundary, required service, and stakeholders
   x governing source, edition, and definitional reading selected for each of
     fault, error, defect, incident, and outage
   x cause-condition fault identity, class (design, production, operational,
     human, environmental), persistence, dormancy, and activation condition
   x inability-state fault, failed function, criterion, and onset
   x workload and exposure
   x error state, detection status, latency, masking, and propagation path
   x defect criterion, intended versus specified use, work product, and
     lifecycle phase of introduction
   x failure criterion, mode, severity, and boundary of manifestation
   x fault tolerance, redundancy, containment, and error-handling barriers
   x incident criterion and class (safety, security, service, occupational
     health and safety, aviation)
   x declaration rule, authority, and declaration time where applicable
   x impact population, function lost, geographic and data or security exposure
   x outage cause class: planned or scheduled, forced or unanticipated, and
     externally imposed
   x outage start and end determination, measurement contract, exclusions, and
     eligible time or requests
   x detection, triage, mitigation, workaround, resolution, and closure states
   x problem record, contributing causes, known error, and corrective action,
     each held under its named external vocabulary
   x reporting obligation, regulator, threshold, and deadline
   x evidence, uncertainty, revision, and blame or learning posture
```

## Propagation ladder (Avizienis-scoped; non-normative)

This ladder states the dependability-taxonomy reading only. It is not normative
under the standards vocabularies that define `fault` as an inability state or
`error` as a value discrepancy, and it is not required for every outage.

```text
latent fault in or affecting the item
  + activation condition met
  -- produces --> error in the item's state

error
  + not masked, corrected, or contained
  -- propagates to the service interface --> failure of a required function

failure or other qualifying occurrence
  + incident criterion, and declaration rule where applicable
  -- classified or declared as --> incident, with response and closure states

failure or degradation
  + measurement contract, start and end determination, exclusions
  -- measured as --> outage interval

one or more incidents
  + investigation under an externally owned problem vocabulary
  -- recorded as --> problem record, possibly a known error (not owned here)
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Fault vs. dependability error | either precedes failure | adjudged or hypothesized cause in the item vs. the deviant part of the item's state |
| Fault as cause condition vs. fault as state | either is called a fault | "situation that can cause errors to occur in an object" vs. "inability to perform as required, due to an internal state"; the second reading places the fault after, not before, loss of required performance |
| Latent fault vs. active fault | either is the same cause condition | dormant and not yet activated vs. activated and producing an error |
| Dependability error vs. failure | either is a deviation | internal state deviation, which may be masked, vs. delivered service deviating from the required function |
| Dependability error vs. value discrepancy | either is called an error | deviant part of the item's state vs. difference between a computed, observed, or measured value or condition and the correct one |
| Dependability error vs. measurement error | either is a discrepancy | item-state deviation vs. the signed difference between a measured value and a reference value, owned by the measurement entry |
| Dependability error vs. standard error | either is a numeric "error" | item-state deviation vs. the standard deviation of an estimator's sampling distribution, owned by the statistical entry |
| Dependability error vs. human error | either is called an error | state of the item vs. an action of a person, which standards route to a design fault rather than to an item state |
| Fault vs. defect | either names a problem in the product | dependability cause condition vs. nonconformity relative to an intended or specified use |
| Defect vs. nonconformity | either is a negative finding | intended or specified use relation vs. any unfulfilled specified criterion, owned by the requirements entry |
| Defect (quality reading) vs. defect (software reading) | either is called a defect | nonconformity related to intended or specified use vs. imperfection or deficiency that does not meet requirements or specifications |
| Failure vs. incident | a failure can trigger an incident | criterion-relative functional loss vs. an occurrence meeting a named incident criterion, with declaration only where its governing source requires it |
| Incident vs. event | either is an occurrence | source-qualified operational record, optionally declared, vs. a generic time-located occurrence |
| Incident vs. accident | either is a governed aviation occurrence | in EU 996/2010 an accident is an occurrence, bounded by the boarding-to-disembarking window, in which a person is fatally or seriously injured, the aircraft sustains specified damage, or the aircraft is missing; an incident is an occurrence *other than* an accident that affects or could affect safety; a serious incident is an incident whose circumstances indicate a high probability of an accident |
| Incident vs. severity | severity classifies an incident | source-qualified occurrence record and any applicable declaration vs. a derived classification under a versioned policy |
| Incident vs. problem record | either persists after mitigation | the occurrence and its response, owned here, vs. an investigated underlying cause under an external problem vocabulary that this entry does not own |
| Outage vs. failure | either interrupts service | measured unavailability interval under a measurement contract vs. criterion-relative functional loss |
| Planned outage vs. forced outage | either removes a facility from service | shutdown for inspection or maintenance on an advance schedule vs. shutdown for emergency reasons or unanticipated breakdown |
| Outage vs. down time | either bounds unavailable time | interval determined by a stated measurement contract with its own exclusions vs. the dependability time-category vocabulary owned by IEC 60050-192 and the dependability entry |
| Outage vs. interruption | either is a service loss | component out of service vs. loss of service to the end customer, in the distribution-reliability convention |
| Outage vs. degradation | either reduces service | significant degradation can itself be a reportable outage; the boundary is set by regulator or contract, not by physics |
| Outage vs. availability | either concerns usable service | bounded unavailability interval vs. the ratio, denominator, and window owned by the dependability entry |
| Cascading outage vs. cascade | either spreads across components | successive outage intervals recorded under their measurement contracts vs. the propagation dynamics owned by the tipping-point family |
| Fault vs. root cause | either is causal | activation-conditioned cause in the item vs. an attribution conclusion about a realized outcome |
| Incident vs. service-level-objective breach | either signals degraded service | declared under a declaration rule vs. a target missed over a compliance window |

## Dependencies and stopping boundary

- Subject, item boundary, required service, and stakeholders are explicit.
- Every fault, error, defect, incident, and outage claim names its governing
  standard, definitional reading, declaration rule, or measurement contract,
  including edition or version. `fault` and `dependability-error` are not
  exempt: the source that supplies the cause-condition and item-state readings
  must be named, because other sources define the same words as an inability
  state and as a value discrepancy.
- Where standards disagree, the disagreement and the selected source are
  recorded; no definition is presented as universal, and the propagation ladder
  is used as a scoped reading rather than as a rule.
- `fault-cause-condition` claims record class, persistence, dormancy, and
  activation condition, and stay distinguishable from the error they may
  produce.
- `fault-inability-state` claims record the failed function, criterion, onset,
  and preceding failure, and do not enter the Avizienis cause-condition ladder.
- `dependability-error` claims record detection status, latency, masking, and
  propagation path, and do not imply failure. Measurement error, standard
  error, and human error are not this sense and are routed to their owners.
- Defect claims name the work product, the criterion, the lifecycle phase of
  introduction, and the intended or specified use relation, and cross-link
  `nonconformity` rather than redefining it. Where the governing source is a
  software standard that defines defect against requirements or specifications,
  that reading is recorded instead of being silently converted.
- `failure` is referenced from the dependability entry; its criterion, modes,
  and measures are not restated here, and it has no local sense row.
- Incident claims record the declaration rule, declaring authority, declaration
  time, impact population, function lost, and response and closure states.
  Severity is derived elsewhere.
- Outage claims record whether the outage is planned or forced, plus start and
  end determination, exclusions, and eligible time or requests, and stop before
  availability arithmetic and before the IEC down-time vocabulary. An outage
  does not presuppose a fault, an error, or a failure.
- Problem and known-error vocabulary is used only as factors under a named
  external owner; contributing causes are recorded without asserting an
  attribution conclusion, and no `problem` sense is claimed here.

This entry stops before reliability, availability, maintainability, resilience,
and recovery measures and their denominators and windows and the IEC
dependability time categories; generic requirement, specification,
verification, validation, and nonconformity semantics; generic state, event,
transition, and process semantics; indicator, threshold, alert, and
service-level objective semantics; measurement error, bias, and estimator
variability; cascade, contagion, and critical-transition dynamics; causal
attribution method and root-cause determination; hazard, harm, vulnerability,
and safety acceptability; derived severity classification; audit findings and
dispositions; risk quantification; incident-response procedures; named severity
scales; fault-tolerance architecture catalogs; regulator-specific reporting
thresholds as canonical values; and blame or liability apportionment.

## Selection procedure

1. Name the subject, item boundary, required service, and stakeholders.
2. Select the exact question: fault, dependability error, defect, incident, or
   outage; if the question is loss of required function, use the `failure`
   sense in the dependability entry.
3. Name the governing standard, definitional reading, declaration rule, or
   measurement contract and record its edition or version.
4. For a fault, record class, persistence, dormancy, and the activation
   condition that would produce an error, and state whether the source's
   reading is a cause condition or an inability state.
5. For a dependability error, record the deviant state, detection status,
   latency, masking, and propagation path, and state whether a failure
   followed. Reject value discrepancies, estimator variability, and human
   actions as instances of this sense.
6. For a defect, record the work product, criterion, lifecycle phase of
   introduction, and the intended or specified use that is defeated; link the
   corresponding nonconformity if one exists.
7. For an incident, record the governing criterion, class, impact population,
   function lost, and exposure. Where the source requires declaration, also
   record the declaration rule, authority, and time. Then record detection,
   triage, mitigation, workaround, resolution, and closure. Derive severity
   elsewhere.
8. For an outage, record whether it is planned or forced, then start and end
   determination, the affected service or component, the affected population,
   exclusions, and eligible time or requests; stop before computing
   availability. Do not require a fault, error, or failure.
9. Where problem and known-error records are used, name the external
   vocabulary that governs them and keep them outside this entry's senses.
10. Record reporting obligations, regulators, thresholds, and deadlines as
    external constraints, not as canonical values.
11. Retain evidence, uncertainty, revisions, and a learning rather than blame
    posture.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Dependability taxonomy | supplies the fault, error, and failure chain | keeps the chain from collapsing into one "failure" field, and keeps the chain itself scoped rather than normative |
| Software anomaly standard | classifies anomaly, defect, error, fault, failure, and problem | keeps software definitions from being read as universal |
| Consolidated vocabulary standard | aggregates definitions across many standards | forces the governing source, edition, and definitional reading to be named |
| Quality vocabulary standard | separates nonconformity from use-relative defect | keeps defect from absorbing generic nonconformity |
| Service management standard | separates incident from problem | keeps root cause out of the incident record while leaving problem unowned here |
| Security or safety incident guidance | supplies occurrence criteria and handling expectations | keeps incident source-relative rather than universally declaration-dependent |
| Regulatory outage rule | supplies thresholds and reporting duties | keeps outage from becoming a universal physical boundary |
| Sector reliability glossary | separates scheduled from forced outages | keeps planned work inside the outage sense without implying a fault |
| Measurement or statistical reference | defines measurement error and standard error | keeps numeric "error" out of the item-state sense |
| Site reliability practice | supplies incident command and postmortem norms | keeps one organization's practice from becoming a standard |

## Failure signs

- fault, error, and failure share one field, so latency and masking disappear;
- a latent fault is reported as a failure before any activation condition;
- a fault defined as an inability state by the governing source is read as a
  pre-failure cause condition, or the reverse, without naming the source;
- a masked or corrected error is reported as a service failure;
- a human action is recorded as a `dependability-error` instead of as a person
  action that may have introduced a design fault;
- individual human error is named as the cause of an incident in place of the
  latent conditions and barriers that permitted it;
- a measurement error, bias, or standard error is recorded in the
  `dependability-error` field;
- defect is used for any unfulfilled specified criterion, absorbing
  nonconformity;
- every failure is assumed to be an incident, or every incident is assumed to
  follow a failure;
- an incident record carries no governing criterion, or omits declaration rule,
  authority, or time where its source requires declaration;
- an aviation occurrence is labeled an incident when the accident criteria are
  met, or a serious incident is recorded as an ordinary incident;
- a breached service-level objective is auto-declared an incident;
- severity is treated as an observed property of the incident;
- a scheduled maintenance outage is recorded as a failure, or is excluded from
  the outage sense altogether;
- an outage is reported without start and end determination, exclusions, or an
  eligible-time or request basis;
- outage duration is converted into an availability claim inside this entry, or
  is presented as IEC down time;
- a component outage is reported as a customer interruption without evidence;
- successive outages are narrated as a cascade with propagation dynamics this
  entry does not own;
- root cause is recorded as a field of the incident rather than as an
  attribution claim;
- a problem or known-error record is treated as a sense of this entry;
- a definition from one standard is presented as the universal definition;
- incident records are used to apportion blame or liability.

## Cross-references

- [Reliability, Availability, Maintainability, Resilience, and Recovery](dependability-reliability-availability-resilience.md)
  owns `failure` and every dependability measure; this entry has no local
  `failure` sense.
- [Requirement, Specification, Verification, and Validation](requirement-specification-verification-validation.md)
- [State, Event, Transition, Process, and Lifecycle](state-event-transition-process-lifecycle.md)
- [Objective, Control, Monitoring, and Response](control-monitoring-response.md)
- [Association, Causal Effect, Influence, Mechanism, Intervention, and Attribution](causal-reasoning.md)
- [Hazard, Exposure, Harm, Vulnerability, and Safety](hazard-exposure-harm-safety.md)
- [Assurance, Assessment, Audit, Certification, and Accreditation](assurance-assessment-audit-certification.md)
- [Probability, Risk, and Uncertainty](probability-risk-uncertainty.md)
- [Error, Bias, Accuracy, Trueness, Precision, Resolution, and Calibration](measurement-quality.md)
  owns `measurement-error` and `measurement-bias`.
- [Mean, Median, Quantile, Variance, Standard Deviation, Standard Error, and Confidence Interval](statistical-summary-interval.md)
  owns `standard-error`.
- [Tipping Point, Critical Transition, Cascade, Contagion, and Spillover](tipping-point-critical-transition-cascade-contagion-spillover.md)
  owns `cascade` and `contagion`; cascading outages are recorded here only as
  successive intervals.
- [Incident Severity](../examples/incident-severity.md)
- [Dependability Failure Diagnostic](../diagnostics/dependability-failures.md)
- [Editorial record](../../signals/discover/literature/fault-error-defect-incident-outage-candidate-brief-2026-08-20.md)

## Sources and provenance

1. Avizienis, Laprie, Randell, and Landwehr, "Basic Concepts and Taxonomy of
   Dependable and Secure Computing," *IEEE Transactions on Dependable and
   Secure Computing* 1(1):11-33 (2004):
   https://doi.org/10.1109/TDSC.2004.2
2. IEEE Std 1044-2009, *Standard Classification for Software Anomalies*:
   https://doi.org/10.1109/IEEESTD.2010.5399061
3. ISO/IEC/IEEE 24765:2017, *Systems and software engineering — Vocabulary*:
   https://www.iso.org/standard/71952.html
4. SEVOCAB, *Software and Systems Engineering Vocabulary* (IEEE Computer
   Society and ISO/IEC JTC 1/SC 7): https://sevocab.computer.org/ — the free
   lookup used here for the competing definitions of `fault` (cause-condition
   reading attributed to ISO/IEC 10746-2:2009, 13.6.3; inability-state reading
   attributed to ISO/IEC/IEEE 15026-1:2025, 3.4.8), `error` (value or condition
   discrepancy, ISO/IEC/IEEE 15026-1:2025, 3.4.5), `defect` (three
   requirement- or specification-relative readings), `problem` (five readings,
   including "root cause of one or more incidents", ISO/IEC 23531:2020, 3.4),
   `known error` (ISO/IEC/IEEE 24765c:2014), and the absence of any `outage`
   entry.
5. IEC 60050-192:2015, *International Electrotechnical Vocabulary, Part 192:
   Dependability*:
   https://www.electropedia.org/iev/iev.nsf/index?openform&part=192
6. IEC 61508-4:2010, *Functional safety of electrical/electronic/programmable
   electronic safety-related systems — Part 4: Definitions and abbreviations*:
   https://webstore.iec.ch/en/publication/22273
7. ISO 26262-1, *Road vehicles — Functional safety — Part 1: Vocabulary*:
   https://www.iso.org/standard/68383.html
8. ISO 9000:2026, *Quality management systems — Fundamentals and vocabulary*:
   https://www.iso.org/standard/9000 (catalogue entry for the current edition),
   superseding ISO 9000:2015 at https://www.iso.org/standard/45481.html, whose
   catalogue page states the supersession. The use-relative reading of `defect`
   is attributed to this vocabulary; its clause text is paywalled and is not
   quoted or claimed as verified here.
9. ISO/IEC 20000-1:2018, *Information technology — Service management —
   Part 1: Service management system requirements*:
   https://www.iso.org/standard/70636.html
10. NIST SP 800-61 Rev. 3 (April 2025), *Incident Response Recommendations and
    Considerations for Cybersecurity Risk Management*:
    https://csrc.nist.gov/pubs/sp/800/61/r3/final
11. NIST Computer Security Resource Center Glossary, "incident":
    https://csrc.nist.gov/glossary/term/incident
12. ISO 22300:2021, *Security and resilience — Vocabulary*:
    https://www.iso.org/standard/77008.html
13. 47 CFR 4.5, *Definitions of outage, special offices and facilities, and
     1911 call*: https://www.law.cornell.edu/cfr/text/47/4.5
14. IEEE Std 1366, *Guide for Electric Power Distribution Reliability
    Indices*: https://standards.ieee.org/ieee/1366/12323
15. Google SRE Book, "Managing Incidents":
    https://sre.google/sre-book/managing-incidents/
16. Google SRE Book, "Postmortem Culture: Learning from Failure":
    https://sre.google/sre-book/postmortem-culture/
17. Google SRE Book, "Service Level Objectives":
    https://sre.google/sre-book/service-level-objectives/
18. James Reason, "Human error: models and management," *BMJ* 320:768-770
    (2000): https://doi.org/10.1136/bmj.320.7237.768
19. Regulation (EU) No 996/2010 on the investigation and prevention of
    accidents and incidents in civil aviation, Article 2 and recital 4:
    https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32010R0996
20. ISO 45001:2018, *Occupational health and safety management systems —
    Requirements with guidance for use*:
    https://www.iso.org/standard/63787.html
21. U.S. Energy Information Administration, *Glossary*, entries "Forced outage"
    and "Scheduled outage": https://www.eia.gov/tools/glossary/index.php?id=F
    and https://www.eia.gov/tools/glossary/index.php?id=S

Provenance notes. Sources 4, 10, 11, 13, 15, 16, 17, 19, 20, and 21 were
retrieved directly on 2026-08-20; the SEVOCAB definitions above and the
47 CFR 4.5 and EIA glossary wordings were read from the retrieved pages.
Sources 1, 2, and 18 were confirmed through resolver or Crossref metadata with
paywalled bodies. Sources 3, 6, 7, 8, 9, and 12 were confirmed through their
catalogue pages only; their clause text is paywalled and is neither quoted nor
claimed as verified, and where a definition attributed to them is used it is
sourced through SEVOCAB instead. The ISO 9000 edition claim rests on the
retrieved ISO catalogue pages for /standard/45481.html and /standard/9000. The
IEC 60050-192 Electropedia entry (source 5) resolves but returns no
machine-readable definition text, and the published edition page for IEEE Std
1366-2022 (source 14) was not directly retrievable; both are cited by their
stable identifiers, with the IEEE 1366 project page given as the reachable
locator, and no wording is quoted from either. ISO/IEC 20000-10 and ISO 14050
were not cited because their catalogue identifiers could not be confirmed.
ITIL was not cited because it has no stable free normative glossary; the
problem and known-error vocabulary used as factors is instead attributed to the
SEVOCAB entries above. Comparator access date: 2026-08-20.

The source set supports a bounded propagation-and-declaration entry that forces
each use to name its governing source. It does not establish a universal
definition of fault, defect, error, failure, incident, or outage, does not make
the Avizienis chain normative, and does not license availability, severity,
risk, or root-cause claims inside this entry.
