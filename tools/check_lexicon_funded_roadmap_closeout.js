"use strict";

const assert = require("node:assert/strict");
const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const waveRoot = "context/waves/2026-08-21-funded-domain-gap-roadmap";
const read = (relative) => fs.readFileSync(path.join(root, relative), "utf8").replace(/\r\n?/g, "\n");
const json = (relative) => JSON.parse(read(relative));

const roadmap = read(`${waveRoot}/LEXICON-FUNDED-DOMAIN-GAP-ROADMAP.md`);
const wave = read(`${waveRoot}/WAVE.md`);
assert.match(roadmap, /^Status: internally implemented; fully funded external reader round pending$/m);
assert.match(wave, /^Status: internal implementation complete; external reader round pending$/m);

const expectedAdmissions = [6, 6, 6, 5, 9];
let admissions = 0;
for (let number = 1; number <= 5; number += 1) {
  const manifest = json(`reference/lexicon-roadmap-wave-${number}-admissions-v1.json`);
  assert.equal(manifest.entries.length, expectedAdmissions[number - 1], `Wave ${number} admission count`);
  admissions += manifest.entries.length;
}
assert.equal(admissions, 32);

const plans = [
  "WAVE-1-SOCIAL-NORMATIVE-PLAN.md",
  "WAVE-2-POLITICS-LAW-PLAN.md",
  "WAVE-3-FORMAL-REASONING-PLAN.md",
  "WAVE-4-HEALTH-DISABILITY-CARE-PLAN.md",
  "WAVE-5-LANGUAGE-CULTURE-ARTS-AESTHETICS-PLAN.md",
];
for (const plan of plans) assert.match(read(`${waveRoot}/${plan}`), /^Status: executed;/m, `${plan}: stale status`);

const results = [
  "WAVE-1-SOCIAL-NORMATIVE-RESULT.md",
  "WAVE-2-POLITICS-LAW-RESULT.md",
  "WAVE-3-FORMAL-REASONING-RESULT.md",
  "WAVE-4-HEALTH-DISABILITY-CARE-RESULT.md",
  "WAVE-5-LANGUAGE-CULTURE-ARTS-AESTHETICS-RESULT.md",
  "WAVE-6-RECONCILIATION-RESULT.md",
].map((relative) => read(`${waveRoot}/${relative}`));
for (const result of results) assert.match(result, /Status: .*clean-source proof pass(?:ed)?/);
assert.match(results[0], /six primary slots are `admit`/);
assert.match(results[0], /optional collective-identity slot is\s+`defer`/);
assert.match(results[1], /All six authorized Tables are admitted/);
assert.match(results[2], /Six Tables are admitted/);
assert.match(results[2], /optional Axiom\/Definition\/Theorem slot is held/);
assert.match(results[3], /Five primary Tables are admitted/);
assert.match(results[3], /optional\s+screening\/testing slot is held/);
assert.match(results[4], /Nine primary Tables are admitted/);
assert.match(results[4], /optional\s+criticism\/canon\/influence\/legacy slot is held/);
assert.match(results[5], /Wave 6 admits zero new Tables and zero relations/);

const reconciliation = json("reference/lexicon-roadmap-reconciliation-v1.json");
assert.equal(reconciliation.scope.roadmap_entry_count, 32);
assert.equal(reconciliation.scope.roadmap_sense_count, 166);
assert.equal(reconciliation.entries.length, 32);
const reference = read("reference/lexicon-reference-v4.lexicon");
const senseIds = [...reference.matchAll(/^sense ([^ ]+) \|/gm)].map((match) => match[1]);
assert.equal(new Set(senseIds).size, senseIds.length, "duplicate global sense identity");

const roundTwo = json("reference/lexicon-domain-gap-reader-round-2-v1.json");
const readerResults = json(roundTwo.results_template);
assert.equal(roundTwo.status, "frozen-round-two-recruitment-pending");
assert.equal(readerResults.status, "recruitment-pending");
assert.equal(readerResults.participants.length, 0);
assert.equal(readerResults.attempts.length, 0);

console.log(`OK roadmap_waves=6 admissions=${admissions} senses=${reconciliation.scope.roadmap_sense_count} duplicate_sense_ids=0 internal_gates=closed external_readers=0`);
