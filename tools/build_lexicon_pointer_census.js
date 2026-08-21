"use strict";

const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const read = (relative) =>
  fs.readFileSync(path.join(root, relative), "utf8").replace(/\r\n?/g, "\n");
const reference = read("reference/lexicon-reference-v4.lexicon");
const admissions = JSON.parse(
  read("reference/lexicon-candidate-admissions-v1.json"),
);
const admitted = new Set(admissions.entries.map((entry) => entry.id));
const existingPointers = new Set(
  read("volumes/01-structure-quantity-choice/lexicon-pointer-registry-v1.lexicon")
    .split("\n")
    .filter((line) => line.startsWith("pointer "))
    .map((line) => line.split(" | ")[1].toLowerCase()),
);
const stop = new Set(
  "and or the a an to of in on at by for from as is are be with without where when under over into versus vs exact selected declared named current other each any all not no per via between across after before than through its their this that these those use basis set type class state status scope role value values result results source sources subject owner owners factor factors context time identity evidence uncertainty method methods rule rules condition conditions boundary boundaries model models system systems record records".split(
    " ",
  ),
);

const entries = [...reference.matchAll(
  /^entry ([^ ]+) \| [^|]+ \| [^|]+ \| [^|]+ \| ([^|]+) \|/gm,
)].map((match) => ({ id: match[1], source: match[2].trim() }));
const owners = new Map();
for (const entry of entries) {
  const text = read(entry.source);
  const code = [...text.matchAll(/```(?:text)?\n([\s\S]*?)\n```/g)]
    .map((match) => match[1])
    .join("\n");
  const terms = new Set(
    [...code.toLowerCase().matchAll(/(?<![a-z0-9-])[a-z][a-z0-9-]{2,}(?![a-z0-9-])/g)]
      .map((match) => match[0])
      .filter((term) => !stop.has(term) && !existingPointers.has(term)),
  );
  for (const term of terms) {
    if (!owners.has(term)) owners.set(term, new Set());
    owners.get(term).add(entry.id);
  }
}

const rows = [...owners]
  .map(([term, ownerIds]) => ({
    term,
    owners: [...ownerIds].sort(),
    owner_count: ownerIds.size,
    admitted_owner_count: [...ownerIds].filter((id) => admitted.has(id)).length,
  }))
  .filter((row) => row.owner_count >= 2 && row.admitted_owner_count >= 1)
  .sort(
    (left, right) =>
      right.owner_count - left.owner_count || left.term.localeCompare(right.term),
  );

if (process.argv.includes("--json")) {
  process.stdout.write(`${JSON.stringify(rows, null, 2)}\n`);
} else {
  for (const row of rows) {
    console.log(
      `${row.term} | owners=${row.owner_count} | admitted=${row.admitted_owner_count} | ${row.owners.join(",")}`,
    );
  }
}
