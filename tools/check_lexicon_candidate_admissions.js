"use strict";

const assert = require("node:assert/strict");
const crypto = require("node:crypto");
const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const read = (relative) =>
  fs.readFileSync(path.join(root, relative), "utf8").replace(/\r\n?/g, "\n");
const sha256 = (text) =>
  crypto.createHash("sha256").update(text).digest("hex");
const admissions = JSON.parse(
  read("reference/lexicon-candidate-admissions-v1.json"),
);
assert.equal(admissions.contract, "lexicon-candidate-admissions-v1");
assert.equal(admissions.entries.length, 37);
assert.equal(new Set(admissions.entries.map((entry) => entry.id)).size, 37);

const requiredHeadings = [
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

function promotedText(source) {
  let text = source.replace(
    /^Status: noncanonical candidate entry draft; (.*?)\n\n## Orientation/ms,
    (_, scope) =>
      `Status: candidate anchor entry\n\nScope: ${scope.replace(/\s+/g, " ").trim()}\n\n## Orientation`,
  );
  text = text.replace(
    "Status: noncanonical candidate entry draft",
    "Status: candidate anchor entry",
  );
  return text
    .replaceAll("../../../tables/entries/", "")
    .replaceAll("../../../tables/", "../")
    .replaceAll("../literature/", "../../signals/discover/literature/")
    .replaceAll("Lexicon candidate delta", "Lexicon delta")
    .replaceAll("noncanonical synthesis", "candidate-maturity synthesis");
}

const reference = read("reference/lexicon-reference-v4.lexicon");
const assurance = read("reference/lexicon-assurance-v4.lexicon");
for (const admission of admissions.entries) {
  const historicalPath = `signals/discover/candidates/${admission.id}.md`;
  const canonicalPath = `tables/entries/${admission.id}.md`;
  const historical = read(historicalPath);
  const canonical = read(canonicalPath);
  assert.match(historical, /^Status: noncanonical candidate entry draft/m);
  assert.match(canonical, /^Status: candidate anchor entry$/m);
  assert.equal(canonical, promotedText(historical), `promotion drift: ${admission.id}`);
  for (const heading of requiredHeadings) {
    assert.ok(canonical.includes(`${heading}\n`), `${admission.id}: missing ${heading}`);
  }
  assert.match(
    reference,
    new RegExp(
      `^entry ${admission.id.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")} \\| [^\\n]+ \\| tables/entries/${admission.id.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")}\\.md \\|`,
      "m",
    ),
  );
  assert.match(
    assurance,
    new RegExp(
      `^review entry:${admission.id.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")} \\| ${sha256(canonical)} \\| ${admissions.admission_review.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")} \\| fixed-point \\| ${admissions.date}$`,
      "m",
    ),
  );
  for (const match of canonical.matchAll(/\[[^\]]+\]\(([^)]+)\)/g)) {
    const target = match[1].split("#")[0];
    if (!target || /^[a-z]+:/i.test(target)) continue;
    const resolved = path.resolve(root, path.dirname(canonicalPath), target);
    assert.ok(fs.existsSync(resolved), `${canonicalPath}: missing link ${target}`);
  }
}

assert.equal((reference.match(/^entry /gm) || []).length, 91);
assert.equal((reference.match(/^sense /gm) || []).length, 624);
assert.equal((reference.match(/^factor /gm) || []).length, 1090);
assert.equal((reference.match(/^view /gm) || []).length, 100);
assert.equal((assurance.match(/^review entry:/gm) || []).length, 91);

const pointerAdmissions = JSON.parse(
  read("reference/lexicon-pointer-admissions-v2.json"),
);
assert.equal(pointerAdmissions.pointers.length, 20);
const pointerRegistry = read(
  "volumes/01-structure-quantity-choice/lexicon-pointer-registry-v2.lexicon",
);
assert.equal((pointerRegistry.match(/^pointer /gm) || []).length, 270);
const site = path.join(root, "target", "proof-set-sim-68");
const siteManifest = JSON.parse(fs.readFileSync(path.join(site, "manifest.json")));
assert.equal(siteManifest.site_checks.pointer_entry_pages, 270);
for (const pointer of pointerAdmissions.pointers) {
  assert.match(
    pointerRegistry,
    new RegExp(`^pointer ${pointer.slug} \\| ${pointer.label} \\|`, "m"),
  );
  const page = fs.readFileSync(
    path.join(site, "pointers", `${pointer.slug}.html`),
    "utf8",
  );
  const ownerMatch = /<p class="pointer-page__counts">(\d+) owning Tables/.exec(page);
  assert.ok(ownerMatch, `${pointer.slug}: missing owner count`);
  assert.ok(Number(ownerMatch[1]) >= 2, `${pointer.slug}: insufficient owner recurrence`);
}

console.log(
  `OK admissions=37 entries=91 senses=624 factors=1090 views=100 pointers=270 reference=${sha256(reference)}`,
);
