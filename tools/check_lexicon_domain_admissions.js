"use strict";

const assert = require("node:assert/strict");
const crypto = require("node:crypto");
const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const read = (relative) =>
  fs.readFileSync(path.join(root, relative), "utf8").replace(/\r\n?/g, "\n");
const sha256 = (text) => crypto.createHash("sha256").update(text).digest("hex");
const manifest = JSON.parse(read("reference/lexicon-domain-admissions-v1.json"));

assert.equal(manifest.contract, "lexicon-domain-admissions-v1");
assert.equal(manifest.entries.length, 10);
assert.equal(new Set(manifest.entries.map(({ id }) => id)).size, 10);
assert.ok(fs.existsSync(path.join(root, manifest.admission_review)));
assert.ok(fs.existsSync(path.join(root, manifest.literature_review)));

const headings = [
  "## Orientation",
  "## Sense table",
  "## Root factorization",
  "## Decisive distinctions",
  "## Dependencies and stopping boundary",
  "## Selection procedure",
  "## Reference Delta",
  "## Failure signs",
  "## Cross-references",
  "## Sources and provenance",
];
const reference = read("reference/lexicon-reference-v4.lexicon");
const assurance = read("reference/lexicon-assurance-v4.lexicon");
let admittedSenses = 0;

for (const entry of manifest.entries) {
  const relative = `tables/entries/${entry.id}.md`;
  const text = read(relative);
  assert.match(text, /^Status: candidate anchor entry$/m);
  for (const heading of headings) {
    assert.ok(text.includes(`${heading}\n`), `${entry.id}: missing ${heading}`);
  }
  const senses = [...text.matchAll(/^\| `([^`]+)` \| ([^|]+) \| ([^|]+) \|$/gm)];
  assert.ok(senses.length >= 5, `${entry.id}: insufficient bounded senses`);
  admittedSenses += senses.length;
  assert.match(
    reference,
    new RegExp(`^entry ${entry.id} \\| [^\\n]+ \\| ${entry.domain} \\| candidate \\| ${relative.replaceAll("/", "\\/")} \\|`, "m"),
  );
  assert.match(
    assurance,
    new RegExp(`^review entry:${entry.id} \\| ${sha256(text)} \\| ${manifest.admission_review.replaceAll("/", "\\/")} \\| fixed-point \\| ${manifest.date}$`, "m"),
  );
  for (const match of text.matchAll(/\[[^\]]+\]\(([^)]+)\)/g)) {
    const target = match[1].split("#")[0];
    if (!target || /^[a-z]+:/i.test(target)) continue;
    assert.ok(
      fs.existsSync(path.resolve(root, path.dirname(relative), target)),
      `${relative}: missing link ${target}`,
    );
  }
}

assert.equal(admittedSenses, 56);
assert.equal((reference.match(/^entry /gm) || []).length, 119);
assert.equal((reference.match(/^sense /gm) || []).length, 773);
assert.equal((reference.match(/^factor /gm) || []).length, 1314);
assert.equal((reference.match(/^view /gm) || []).length, 100);
assert.equal((assurance.match(/^review /gm) || []).length, 230);

const siteManifest = JSON.parse(
  read("target/proof-set-sim-72/manifest.json"),
);
assert.equal(siteManifest.selection_checks.canonical_entries, 119);
assert.equal(siteManifest.site_checks.dictionary_book_print_canonical_tables, 119);
assert.equal(siteManifest.site_checks.pointer_entry_pages, 270);
assert.equal(siteManifest.site_checks.missing_local_targets, 0);

console.log(
  `OK domain_admissions=10 senses=56 entries=119 total_senses=773 factors=1314 views=100 assurance=230`,
);
