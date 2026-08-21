"use strict";

const assert = require("node:assert/strict");
const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const relativeResults = process.argv[2] ||
  "reference/lexicon-domain-gap-reader-round-2-results-v1.json";
const readJson = (relative) => JSON.parse(fs.readFileSync(path.join(root, relative), "utf8"));
const roundTwo = readJson("reference/lexicon-domain-gap-reader-round-2-v1.json");
const taskContract = readJson(roundTwo.task_and_acceptable_owner_map);
const results = readJson(relativeResults);

assert.equal(results.contract, "lexicon-domain-gap-reader-round-2-results-v1");
assert.equal(results.round_two_contract, "reference/lexicon-domain-gap-reader-round-2-v1.json");
assert.ok(["recruitment-pending", "collecting", "complete"].includes(results.status));
assert.ok(Array.isArray(results.participants));
assert.ok(Array.isArray(results.attempts));

const participantFields = ["id", "eligible", "authored_or_reviewed_tested_tables",
  "fresh_round_two_cohort", "professional_reference_user", "domain_familiarity", "proof_format"];
const attemptFields = ["participant_id", "task_id", "first_selected_owner", "final_selected_owner",
  "intended_sense_or_unresolved", "time_to_first_plausible_owner_seconds", "total_task_seconds",
  "search_query_or_index_route", "wrong_owner_selections", "backtracks", "confidence",
  "missing_or_misleading_terms", "outcome", "protocol_deviation", "safety_or_advice_misreading"];
assert.deepEqual(results.field_contract.participant, participantFields, "participant field contract drift");
assert.deepEqual(results.field_contract.attempt, attemptFields, "attempt field contract drift");
const participantIds = new Set();
const participants = new Map();
for (const participant of results.participants) {
  for (const field of participantFields) assert.ok(field in participant, `${participant.id || "participant"}: missing ${field}`);
  assert.match(participant.id, /^R2-P[0-9]{2}$/);
  assert.ok(!participantIds.has(participant.id), `duplicate participant ${participant.id}`);
  participantIds.add(participant.id);
  assert.equal(typeof participant.eligible, "boolean");
  assert.equal(typeof participant.authored_or_reviewed_tested_tables, "boolean");
  assert.equal(typeof participant.fresh_round_two_cohort, "boolean");
  assert.equal(typeof participant.professional_reference_user, "boolean");
  assert.equal(typeof participant.domain_familiarity, "string");
  assert.ok(["pdf", "site", "print"].includes(participant.proof_format));
  if (participant.eligible) {
    assert.equal(participant.authored_or_reviewed_tested_tables, false);
    assert.equal(participant.fresh_round_two_cohort, true);
  }
  participants.set(participant.id, participant);
}

const tasks = new Map(taskContract.tasks.map((task) => [task.id, task]));
const attemptKeys = new Set();
for (const attempt of results.attempts) {
  for (const field of attemptFields) assert.ok(field in attempt, `${attempt.participant_id || "attempt"}: missing ${field}`);
  assert.ok(participants.has(attempt.participant_id), `unknown participant ${attempt.participant_id}`);
  assert.ok(tasks.has(attempt.task_id), `unknown task ${attempt.task_id}`);
  const key = `${attempt.participant_id}:${attempt.task_id}`;
  assert.ok(!attemptKeys.has(key), `duplicate attempt ${key}`);
  attemptKeys.add(key);
  for (const field of ["first_selected_owner", "final_selected_owner", "intended_sense_or_unresolved", "protocol_deviation"])
    assert.ok(attempt[field] === null || typeof attempt[field] === "string", `${key}: invalid ${field}`);
  assert.ok(attempt.time_to_first_plausible_owner_seconds === null ||
    (Number.isInteger(attempt.time_to_first_plausible_owner_seconds) &&
      attempt.time_to_first_plausible_owner_seconds >= 0 && attempt.time_to_first_plausible_owner_seconds <= 300),
  `${key}: invalid time_to_first_plausible_owner_seconds`);
  assert.ok(Number.isInteger(attempt.total_task_seconds) && attempt.total_task_seconds >= 0 && attempt.total_task_seconds <= 300,
    `${key}: invalid total_task_seconds`);
  assert.equal(typeof attempt.search_query_or_index_route, "string");
  assert.ok(Array.isArray(attempt.wrong_owner_selections));
  assert.ok(Number.isInteger(attempt.backtracks) && attempt.backtracks >= 0);
  assert.ok(attempt.confidence === null || (Number.isInteger(attempt.confidence) && attempt.confidence >= 1 && attempt.confidence <= 5));
  assert.equal(typeof attempt.missing_or_misleading_terms, "string");
  assert.ok(["completed", "abandoned", "timeout", "access-failure"].includes(attempt.outcome));
  assert.equal(typeof attempt.safety_or_advice_misreading, "boolean");
}

const eligible = results.participants.filter((participant) => participant.eligible);
const professional = eligible.filter((participant) => participant.professional_reference_user);
assert.ok(eligible.length <= roundTwo.participants.eligible_target_max, "eligible cohort exceeds frozen maximum");
if (results.status === "recruitment-pending") assert.equal(results.participants.length, 0,
  "recruitment-pending result must remain an empty template");
if (results.status === "collecting") assert.ok(results.participants.length > 0,
  "collecting result requires participant records");
if (results.status === "complete") {
  assert.ok(eligible.length >= roundTwo.participants.eligible_target_min, "complete result has too few eligible participants");
  assert.ok(professional.length >= 4, "complete result requires four professional reference users");
}

const median = (values) => {
  if (!values.length) return null;
  const ordered = [...values].sort((a, b) => a - b);
  const middle = Math.floor(ordered.length / 2);
  return ordered.length % 2 ? ordered[middle] : (ordered[middle - 1] + ordered[middle]) / 2;
};

const taskResults = [];
for (const task of taskContract.tasks) {
  const attempts = results.attempts.filter((attempt) =>
    attempt.task_id === task.id && participants.get(attempt.participant_id)?.eligible);
  const successes = attempts.filter((attempt) =>
    attempt.outcome === "completed" &&
    task.acceptable_owners.includes(attempt.final_selected_owner) &&
    attempt.time_to_first_plausible_owner_seconds !== null &&
    attempt.time_to_first_plausible_owner_seconds <= roundTwo.acceptance.time_seconds);
  const confidences = attempts.map((attempt) => attempt.confidence).filter((value) => value !== null);
  const safetyMisreadings = attempts.filter((attempt) => attempt.safety_or_advice_misreading).length;
  const completeCoverage = eligible.length >= roundTwo.participants.eligible_target_min && attempts.length === eligible.length;
  const successFraction = attempts.length ? successes.length / attempts.length : null;
  const medianConfidence = median(confidences);
  const pass = completeCoverage &&
    successFraction >= roundTwo.acceptance.owner_success_fraction &&
    medianConfidence >= roundTwo.acceptance.median_confidence &&
    safetyMisreadings < roundTwo.analysis.repeated_safety_or_advice_misreading_count;
  taskResults.push({ task_id: task.id, eligible_attempts: attempts.length, successes: successes.length,
    success_fraction: successFraction, median_confidence: medianConfidence,
    safety_or_advice_misreadings: safetyMisreadings, pass });
}

if (results.status === "complete") {
  for (const result of taskResults) assert.equal(result.eligible_attempts, eligible.length,
    `${result.task_id}: complete result lacks one attempt per eligible participant`);
}
const programPass = results.status === "complete" && taskResults.every((result) => result.pass);
const report = {
  contract: "lexicon-domain-gap-reader-round-2-analysis-v1",
  results_status: results.status,
  eligible_participants: eligible.length,
  professional_reference_users: professional.length,
  task_results: taskResults,
  program_pass: programPass,
  claim_boundary: "This is a bounded routing-mechanics result, not evidence of domain correctness, market demand, or professional outcomes."
};

if (process.argv.includes("--json")) process.stdout.write(`${JSON.stringify(report, null, 2)}\n`);
else console.log(`OK round_two_status=${results.status} eligible=${eligible.length} attempts=${results.attempts.length} task_passes=${taskResults.filter((result) => result.pass).length}/18 program_pass=${programPass}`);
