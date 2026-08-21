"use strict";

const assert = require("node:assert/strict");
const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const edition = process.argv.find((arg) => /^sim-[0-9]+$/.test(arg)) || "sim-75";
const read = (relative) => fs.readFileSync(path.join(root, relative), "utf8");
const tasks = JSON.parse(read("reference/lexicon-roadmap-ordinary-language-tasks-v1.json"));
const records = JSON.parse(read(`target/proof-set-${edition}/search-index.json`));
const search = require(path.join(root, "volumes/01-structure-quantity-choice/proof-set-search-families.js"));

assert.equal(tasks.contract, "lexicon-roadmap-ordinary-language-tasks-v1");
assert.equal(tasks.tasks.length, 18);
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

console.log(`OK ordinary_language_tasks=18 edition=${edition} canonical=133 primary_owner_top20=18 external_observations=0`);
