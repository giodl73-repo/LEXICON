"use strict";

const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");

function normalizeAdmittedEntry(text) {
  return text
    .replaceAll("[Admission brief]", "[Editorial record]")
    .replaceAll("The admission brief", "The editorial record")
    .replaceAll("the admission brief", "the editorial record")
    .replaceAll("This descriptive candidate", "This Table")
    .replaceAll("This cross-domain candidate", "This Table")
    .replaceAll("This candidate", "This Table")
    .replaceAll("The candidate applies", "The Table applies")
    .replaceAll("This draft", "This Table")
    .replaceAll("this draft", "this Table")
    .replaceAll("other candidate drafts", "other canonical Tables")
    .replaceAll("Where other candidate drafts", "Where other canonical Tables")
    .replaceAll("another draft", "another Table")
    .replaceAll("current entry or candidate", "current Table")
    .replaceAll("existing or candidate owners", "existing canonical owners")
    .replaceAll("its own candidate", "its own Table")
    .replaceAll("Linguistic morphology now has its own Table", "Linguistic morphology now has its own canonical Table");
}

if (require.main === module) {
  const manifest = JSON.parse(
    fs.readFileSync(
      path.join(root, "reference", "lexicon-candidate-admissions-v1.json"),
      "utf8",
    ),
  );
  for (const admission of manifest.entries) {
    const target = path.join(root, "tables", "entries", `${admission.id}.md`);
    const before = fs.readFileSync(target, "utf8").replace(/\r\n?/g, "\n");
    const after = normalizeAdmittedEntry(before);
    fs.writeFileSync(target, after, "utf8");
  }
  console.log(`OK normalized=${manifest.entries.length}`);
}

module.exports = { normalizeAdmittedEntry };
