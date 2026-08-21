"use strict";

const assert = require("node:assert/strict");
const crypto = require("node:crypto");
const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const edition = process.argv.find((arg) => /^sim-[0-9]+$/.test(arg)) || "sim-75";
const read = (relative) => fs.readFileSync(path.join(root, relative), "utf8");
const tasks = JSON.parse(read("reference/lexicon-roadmap-ordinary-language-tasks-v1.json"));
const protocol = JSON.parse(read("reference/lexicon-domain-gap-reader-protocol-v1.json"));
const roundTwo = JSON.parse(read("reference/lexicon-domain-gap-reader-round-2-v1.json"));
const records = JSON.parse(read(`target/proof-set-${edition}/search-index.json`));
const search = require(path.join(root, "volumes/01-structure-quantity-choice/proof-set-search-families.js"));

assert.equal(tasks.contract, "lexicon-roadmap-ordinary-language-tasks-v1");
assert.equal(tasks.tasks.length, 18);
assert.equal(roundTwo.contract, "lexicon-domain-gap-reader-round-2-v1");
assert.equal(roundTwo.proof.edition, "sim-75");
assert.match(roundTwo.proof.source_commit, /^[a-f0-9]{40}$/);
assert.match(roundTwo.proof.pdf_sha256, /^[a-f0-9]{64}$/);
assert.equal(roundTwo.proof.workspace_dirty, false);
assert.equal(roundTwo.proof.collision_pages, 0);
assert.equal(roundTwo.proof.out_of_bounds_pages, 0);
assert.equal(roundTwo.participants.eligible_target_min, protocol.participant_target_min);
assert.equal(roundTwo.participants.eligible_target_max, protocol.participant_target_max);
assert.equal(roundTwo.participants.observed, 0);
assert.equal(roundTwo.acceptance.owner_success_fraction, protocol.round_two_owner_success_fraction);
assert.equal(roundTwo.acceptance.time_seconds, protocol.round_two_time_seconds);
assert.equal(roundTwo.acceptance.median_confidence, protocol.round_two_median_confidence);
assert.equal(roundTwo.results, "pending-external-participants");
assert.equal(roundTwo.results_template, "reference/lexicon-domain-gap-reader-round-2-results-v1.json");
assert.equal(
  crypto.createHash("sha256").update(fs.readFileSync(path.join(root, roundTwo.results_template))).digest("hex"),
  roundTwo.results_template_sha256,
  "round-two results template drift",
);
assert.equal(roundTwo.analysis.command, "node tools/analyze_lexicon_domain_gap_reader_round_2.js");
assert.equal(
  crypto.createHash("sha256").update(fs.readFileSync(path.join(root, roundTwo.analysis.source))).digest("hex"),
  roundTwo.analysis.source_sha256,
  "round-two analysis source drift",
);
const canonical = records.filter((record) => record.recordClass === "canonical-entry");
assert.equal(canonical.length, 133);
const recordByOwner = new Map(canonical.map((record) => [path.basename(record.path, ".md"), record]));

for (const task of tasks.tasks) {
  assert.ok(recordByOwner.has(task.primary_owner), `${task.id}: missing primary owner`);
  for (const owner of task.acceptable_owners) assert.ok(recordByOwner.has(owner), `${task.id}: missing ${owner}`);
  const ranked = search.searchRecords(records, task.query, "entry", "").slice(0, 20);
  const rankedOwners = new Set(ranked.map((record) => path.basename(record.path, ".md")));
  assert.ok(rankedOwners.has(task.primary_owner), `${task.id}: primary owner outside first 20 results`);
}

console.log(`OK ordinary_language_tasks=18 edition=${edition} canonical=133 primary_owner_top20=18 round_two=frozen external_observations=0`);
