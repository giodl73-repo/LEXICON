"use strict";

const assert = require("node:assert/strict");
const crypto = require("node:crypto");
const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const read = (relative) =>
  fs.readFileSync(path.join(root, relative), "utf8").replace(/\r\n?/g, "\n");
const sha256 = (text) => crypto.createHash("sha256").update(text).digest("hex");
const headings = [
  "## Orientation", "## Sense table", "## Root factorization",
  "## Decisive distinctions", "## Dependencies and stopping boundary",
  "## Selection procedure", "## Reference Delta", "## Failure signs",
  "## Cross-references", "## Sources and provenance",
];

const index = JSON.parse(read("reference/lexicon-admission-index-v1.json"));
assert.equal(index.contract, "lexicon-admission-index-v1");
assert.equal(new Set(index.manifests).size, index.manifests.length);
const manifests = index.manifests.map((relative) => JSON.parse(read(relative)));
const roadmap = manifests.filter(({ contract }) =>
  /^lexicon-roadmap-wave-[0-9]+-admissions-v[0-9]+$/.test(contract));
assert.ok(roadmap.length >= 1);

const reference = read("reference/lexicon-reference-v4.lexicon");
const assurance = read("reference/lexicon-assurance-v4.lexicon");
const seen = new Set();
let admitted = 0;
let senses = 0;
for (const manifest of roadmap) {
  assert.ok(fs.existsSync(path.join(root, manifest.admission_review)));
  assert.ok(fs.existsSync(path.join(root, manifest.literature_review)));
  for (const entry of manifest.entries) {
    assert.ok(!seen.has(entry.id), `duplicate roadmap admission: ${entry.id}`);
    seen.add(entry.id);
    const relative = `tables/entries/${entry.id}.md`;
    const text = read(relative);
    assert.match(text, /^Status: candidate anchor entry$/m);
    for (const heading of headings) {
      assert.ok(text.includes(`${heading}\n`), `${entry.id}: missing ${heading}`);
    }
    const rows = [...text.matchAll(/^\| `([^`]+)` \| ([^|]+) \| ([^|]+) \|$/gm)];
    assert.ok(rows.length >= 5, `${entry.id}: insufficient bounded senses`);
    assert.ok((text.match(/https:\/\//g) || []).length >= 2,
      `${entry.id}: insufficient source links`);
    senses += rows.length;
    admitted += 1;
    assert.match(reference, new RegExp(`^entry ${entry.id} \\| [^\\n]+ \\| ${entry.domain} \\| candidate \\| ${relative.replaceAll("/", "\\/")} \\|`, "m"));
    assert.match(assurance, new RegExp(`^review entry:${entry.id} \\| ${sha256(text)} \\| ${manifest.admission_review.replaceAll("/", "\\/")} \\| fixed-point \\| ${manifest.date}$`, "m"));
    for (const match of text.matchAll(/\[[^\]]+\]\(([^)]+)\)/g)) {
      const target = match[1].split("#")[0];
      if (!target || /^[a-z]+:/i.test(target)) continue;
      assert.ok(fs.existsSync(path.resolve(root, path.dirname(relative), target)),
        `${relative}: missing link ${target}`);
    }
  }
}

const totalEntries = (reference.match(/^entry /gm) || []).length;
const totalSenses = (reference.match(/^sense /gm) || []).length;
const totalFactors = (reference.match(/^factor /gm) || []).length;
const totalViews = (reference.match(/^view /gm) || []).length;
const totalReviews = (assurance.match(/^review /gm) || []).length;
const allSenseIds = [...reference.matchAll(/^sense ([^ ]+) \|/gm)].map((match) => match[1]);
assert.equal(new Set(allSenseIds).size, allSenseIds.length, "duplicate global sense identity");
assert.equal(totalEntries, 101 + admitted);
assert.equal(totalSenses, 680 + senses);
assert.equal(totalViews, 100);
assert.equal(totalReviews, 212 + admitted);
console.log(`OK roadmap_admissions=${admitted} roadmap_senses=${senses} entries=${totalEntries} senses=${totalSenses} factors=${totalFactors} views=${totalViews} assurance=${totalReviews}`);
