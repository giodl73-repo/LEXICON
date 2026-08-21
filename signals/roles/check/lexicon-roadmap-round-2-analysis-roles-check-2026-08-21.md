---
skill: roles-check
topic: lexicon-roadmap-round-2-analysis
date: 2026-08-21
roles_used: 6
p1_count: 0
verdict: APPROVED
---

# Lexicon Roadmap Round-Two Analysis Role Check

Status: fixed point; external observations pending

## Artifact

The frozen round-two packet now binds the clean sim-75 proof, 18-task owner
map, empty participant/attempt schema, and exact analysis-program digest.

## Selected roles

| Role | Selection reason |
|---|---|
| Reference Lexicographer | Owner selection, unresolved senses, and wrong-owner paths. |
| Reference Architecture Editor | Frozen artifact identity, record uniqueness, and executable validation. |
| Concept & Taxonomy Boundary Editor | Mechanical routing success versus semantic or domain correctness. |
| Domain Source Reviewer | Safety/advice interpretation and expertise strata. |
| Research Integrity & Provenance | Empty baseline, adverse results, exclusions, and fixed analysis. |
| Product Owner | Cohort size, handoff completeness, and release boundary. |

## Review

### Reference Lexicographer

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 1 | Acceptable owners could drift after observation. | P1 closed | Round-two packet | Bind the existing 18-task map by path and validate it with the ordinary-language checker. Closed. |
| 2 | An unresolved sense could be forced into a false owner selection. | P2 closed | Attempt schema | Record `intended_sense_or_unresolved` separately from selected owners. Closed. |
| 3 | Final success could hide a difficult wrong-owner route. | P2 closed | Attempt schema | Preserve first owner, wrong-owner list, backtracks, route, and time. Closed. |

### Reference Architecture Editor

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 4 | Proof, schema, or scoring code could change independently. | P1 closed | Freeze contract | Bind proof, results-template, and analyzer SHA-256 values. Closed. |
| 5 | Duplicate participant-task attempts could bias a task. | P1 closed | Analyzer | Reject duplicate participant IDs and participant-task keys. Closed. |
| 6 | A clone without generated `target/` files must still validate the freeze. | P2 closed | Checker | Validate committed identities without requiring the ignored PDF to exist. Closed. |

### Concept & Taxonomy Boundary Editor

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 7 | Owner selection could be reported as domain correctness. | P1 closed | Analysis claim | Limit the report to routing mechanics. Closed. |
| 8 | A late correct owner could pass the time threshold. | P2 closed | Success rule | Require an acceptable final owner and first plausible-owner time at or below 180 seconds. Closed. |
| 9 | Abandonment or timeout could silently disappear. | P1 closed | Analysis denominator | Keep every eligible attempt and count only completed qualifying routes as successes. Closed. |

### Domain Source Reviewer

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 10 | Repeated health/legal safety misreadings could be averaged away. | P1 closed | Task gate | Make two or more safety/advice misreadings a task-level veto. Closed. |
| 11 | Expert-only performance could conceal novice failures. | P2 closed | Participant schema | Record domain familiarity for every participant. Closed. |
| 12 | The professional-reference-user stratum could vanish. | P2 closed | Complete-cohort check | Require at least four such eligible participants. Closed. |

### Research Integrity & Provenance

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 13 | A template could imply observations that never occurred. | P1 closed | Results template | Commit zero participants and zero attempts with recruitment-pending status. Closed. |
| 14 | Negative empirical results could be treated as an invalid file. | P1 closed | Analyzer output | Validate and report a valid failing result without converting it to a tooling error. Closed. |
| 15 | Technical failure could be converted into success or excluded silently. | P1 closed | Outcome enum | Preserve access-failure separately and never count it as route success. Closed. |

### Product Owner

| # | Finding | Severity | Section | Recommendation |
|---|---|---|---|---|
| 16 | Internal work might remain after recruitment begins. | P2 closed | Handoff | Supply schema, command, scoring, and digest before recruitment. Closed. |
| 17 | An undersized or oversized cohort could be presented as complete. | P1 closed | Cohort gate | Require 8-12 eligible adults for complete status. Closed. |
| 18 | Mechanical passage could be promoted into public release readiness. | P1 closed | Claim boundary | Retain controlled-testing status and explicitly exclude market and professional-outcome claims. Closed. |

## Product value statement

| Field | Statement |
|---|---|
| Reader | Fresh adult participants using the clean sim-75 proof. |
| Job | Record and score ordinary-language owner routing consistently. |
| Current friction | The protocol had no immutable result schema or executable analysis. |
| Product change | Frozen attempt schema plus digest-bound analyzer. |
| Evidence now | Empty-template validation, positive 144-attempt fixture pass, repeated-safety-misreading fixture fail. |
| Evidence later | Real eligible participant attempts, including nulls and failures. |
| Cost and displacement | Two small committed artifacts and one checker extension; no new Table or relation. |
| Continue/merge/stop | Proceed to external recruitment without changing proof, prompts, owner map, thresholds, or analyzer. |

## Synthesis

Roles reviewed: 6

P1 blockers: 0 | P2 issues: 0 | P3 notes: 0

Verdict: **APPROVED**

The external round is ready to execute. Its results remain unknown.
