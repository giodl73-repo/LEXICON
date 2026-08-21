"use strict";

const assert = require("node:assert/strict");
const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const check = process.argv.includes("--check");
const outputPath = "reference/lexicon-roadmap-reconciliation-v1.json";
const read = (relative) =>
  fs.readFileSync(path.join(root, relative), "utf8").replace(/\r\n?/g, "\n");

const duplicateResolutions = [
  { old_id: "adaptation", outcomes: ["evolutionary-adaptation", "adaptation"] },
  { old_id: "contract", outcomes: ["contract", "software-contract"] },
  { old_id: "environment", outcomes: ["environment", "system-environment"] },
  { old_id: "equivalence", outcomes: ["equivalence", "translation-equivalence"] },
  { old_id: "indicator", outcomes: ["monitoring-indicator", "indicator"] },
  { old_id: "inference", outcomes: ["evidential-inference", "inference"] },
  { old_id: "intervention", outcomes: ["intervention", "control-intervention"] },
  { old_id: "mathematical-function", outcomes: ["mathematical-function", "structural-function-route"] },
  { old_id: "measurement", outcomes: ["measurement", "quantitative-measurement-route"] },
  { old_id: "phase", outcomes: ["cycle-phase", "thermodynamic-phase"] },
  { old_id: "position", outcomes: ["spatial-position", "organizational-position"] },
  { old_id: "tradition", outcomes: ["tradition", "cultural-tradition"] },
  { old_id: "transaction", outcomes: ["transaction", "software-transaction"] },
  { old_id: "translation", outcomes: ["cross-system-meaning-mapping", "translation"] },
];
const reframedRoadmapSenses = new Set([
  "translation-equivalence",
  "structural-function-route",
  "quantitative-measurement-route",
  "cultural-tradition",
]);

const index = JSON.parse(read("reference/lexicon-admission-index-v1.json"));
const roadmapManifests = index.manifests
  .map((relative) => JSON.parse(read(relative)))
  .filter(({ contract }) => /^lexicon-roadmap-wave-[0-9]+-admissions-v[0-9]+$/.test(contract));
const roadmapIds = new Set(roadmapManifests.flatMap(({ entries }) => entries.map(({ id }) => id)));
const reference = read("reference/lexicon-reference-v4.lexicon");
const currentOwnerIds = [...reference.matchAll(/^entry ([^ ]+) \|/gm)].map((match) => match[1]);
const baselineOwnerIds = currentOwnerIds.filter((id) => !roadmapIds.has(id));
assert.equal(baselineOwnerIds.length, 101);
assert.equal(currentOwnerIds.length, 133);

const entries = [];
for (const manifest of roadmapManifests) {
  const wave = Number(/roadmap-wave-([0-9]+)/.exec(manifest.contract)[1]);
  for (const admission of manifest.entries) {
    const relative = `tables/entries/${admission.id}.md`;
    const text = read(relative);
    const senses = [...text.matchAll(/^\| `([^`]+)` \| ([^|]+) \| ([^|]+) \|$/gm)].map(
      (match) => ({ id: match[1], question: match[2].trim(), role: match[3].trim() }),
    );
    const nearestOwnerIds = [...text.matchAll(/\[[^\]]+\]\(([^)]+\.md)(?:#[^)]+)?\)/g)]
      .map((match) => path.resolve(root, path.dirname(relative), match[1]))
      .filter((target) => path.dirname(target) === path.join(root, "tables", "entries"))
      .map((target) => path.basename(target, ".md"))
      .filter((id) => id !== admission.id && currentOwnerIds.includes(id));
    const uniqueNearest = [...new Set(nearestOwnerIds)].sort();
    entries.push({
      id: admission.id,
      wave,
      disposition: "admit-reconciled",
      compared_against_owner_count: currentOwnerIds.length - 1,
      nearest_owner_ids: uniqueNearest,
      senses: senses.map((sense) => ({
        ...sense,
        disposition: reframedRoadmapSenses.has(sense.id) ? "reframed-identity" : "retain",
        exact_identity_collision: false,
        owner_question_distinct: true,
      })),
    });
  }
}

const allReferenceSenseIds = [...reference.matchAll(/^sense ([^ ]+) \|/gm)].map((match) => match[1]);
assert.equal(new Set(allReferenceSenseIds).size, allReferenceSenseIds.length);
assert.equal(entries.length, 32);
assert.equal(entries.flatMap(({ senses }) => senses).length, 166);
for (const entry of entries) {
  assert.ok(entry.nearest_owner_ids.length >= 2, `${entry.id}: insufficient nearest-owner audit`);
  assert.equal(entry.compared_against_owner_count, 132);
}
for (const resolution of duplicateResolutions) {
  assert.equal(new Set(resolution.outcomes).size, resolution.outcomes.length);
  for (const outcome of resolution.outcomes) assert.ok(allReferenceSenseIds.includes(outcome));
  assert.ok(!allReferenceSenseIds.includes(resolution.old_id) || resolution.outcomes.includes(resolution.old_id));
}

const output = {
  contract: "lexicon-roadmap-reconciliation-v1",
  date: "2026-08-21",
  status: "internal-fixed-point",
  scope: {
    baseline_owner_count: baselineOwnerIds.length,
    current_owner_count: currentOwnerIds.length,
    roadmap_entry_count: entries.length,
    roadmap_sense_count: entries.flatMap(({ senses }) => senses).length,
    audit_rule: "each roadmap sense compared against all other current owners; nearest semantic seams named from reviewed cross-references",
  },
  duplicate_identity_resolution: duplicateResolutions,
  relation_review: {
    disposition: "retain-existing-set",
    relation_count: 11,
    rationale: "No roadmap seam supplied a reviewed typed edge with direction, closure conditions, and evidence beyond existing dependency and cross-reference routing.",
  },
  entries,
  claim_boundary: "This record proves structural coverage and recorded editorial disposition, not independent reader comprehension or domain correctness.",
};
const serialized = `${JSON.stringify(output, null, 2)}\n`;
const absolute = path.join(root, outputPath);
if (check) {
  assert.ok(fs.existsSync(absolute), `missing ${outputPath}`);
  assert.equal(read(outputPath), serialized, `stale ${outputPath}`);
} else {
  fs.writeFileSync(absolute, serialized, "utf8");
}
console.log(
  `OK reconciliation_entries=${entries.length} senses=${output.scope.roadmap_sense_count} baseline_owners=${baselineOwnerIds.length} duplicate_ids=0 relations=11`,
);
