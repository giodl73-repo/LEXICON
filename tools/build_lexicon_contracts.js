"use strict";

const crypto = require("node:crypto");
const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const check = process.argv.includes("--check");
const outputs = [];

function normalizeNewlines(text) {
  return text.replace(/\r\n?/g, "\n");
}

function read(relative) {
  return normalizeNewlines(
    fs.readFileSync(path.join(root, relative), "utf8"),
  );
}

function sha256(text) {
  return crypto.createHash("sha256").update(text).digest("hex");
}

function emit(relative, text) {
  const target = path.join(root, relative);
  if (check) {
    if (
      !fs.existsSync(target) ||
      normalizeNewlines(fs.readFileSync(target, "utf8")) !== text
    ) {
      throw new Error(`stale generated contract: ${relative}`);
    }
  } else {
    fs.mkdirSync(path.dirname(target), { recursive: true });
    fs.writeFileSync(target, text, "utf8");
  }
  outputs.push(relative);
}

const lexiconPublicationSource = read(
  "tables/entries/factorium-entry-publication.md",
)
  .replaceAll("Factorium", "Lexicon")
  .replace(
    "../procedures/entry-publication.md",
    "../procedures/lexicon-entry-publication.md",
  )
  .replace(
    "../scales/editorial-maturity.md",
    "../scales/lexicon-editorial-maturity.md",
  );
emit(
  "tables/entries/lexicon-entry-publication.md",
  lexiconPublicationSource,
);
const lexiconPublicationSourceSha256 = sha256(lexiconPublicationSource);
const lexiconProcedureSource = read("tables/procedures/entry-publication.md")
  .replaceAll("Factorium", "Lexicon")
  .replace(
    "../entries/factorium-entry-publication.md",
    "../entries/lexicon-entry-publication.md",
  );
emit(
  "tables/procedures/lexicon-entry-publication.md",
  lexiconProcedureSource,
);
const lexiconProcedureSourceSha256 = sha256(lexiconProcedureSource);
const lexiconScaleSource = read("tables/scales/editorial-maturity.md")
  .replaceAll("Factorium", "Lexicon")
  .replace(
    "../entries/factorium-entry-publication.md",
    "../entries/lexicon-entry-publication.md",
  );
emit("tables/scales/lexicon-editorial-maturity.md", lexiconScaleSource);
const lexiconScaleSourceSha256 = sha256(lexiconScaleSource);
emit(
  "specs/LEXICON-ENTRY-GRAPH.md",
  read("specs/FACTORIUM-ENTRY-GRAPH.md").replaceAll("Factorium", "Lexicon"),
);

const legacyReference = read("reference/factorium-reference-v2.factorium");
function sortReferenceRecords(text) {
  const lines = text.trimEnd().split("\n");
  const header = lines.shift();
  const end = lines.pop();
  const entries = [];
  const views = [];
  while (lines.length > 0) {
    const first = lines.shift();
    const type = first.startsWith("entry ")
      ? "entry"
      : first.startsWith("view ")
        ? "view"
        : null;
    if (!type) {
      throw new Error(`unexpected reference record: ${first}`);
    }
    const block = [first];
    const terminator = `end-${type}`;
    while (block.at(-1) !== terminator) {
      if (lines.length === 0) {
        throw new Error(`unterminated ${type} record`);
      }
      block.push(lines.shift());
    }
    (type === "entry" ? entries : views).push(block);
  }
  const byId = (left, right) => (left[0] < right[0] ? -1 : left[0] > right[0] ? 1 : 0);
  entries.sort(byId);
  views.sort(byId);
  return `${header}\n${[...entries, ...views].flat().join("\n")}\n${end}\n`;
}

function markdownSection(text, heading) {
  const marker = `${heading}\n`;
  const start = text.indexOf(marker);
  if (start < 0) {
    throw new Error(`missing Markdown section: ${heading}`);
  }
  const bodyStart = start + marker.length;
  const next = text.indexOf("\n## ", bodyStart);
  return text.slice(bodyStart, next < 0 ? text.length : next).trim();
}

function plainText(value) {
  return value
    .replace(/\[([^\]]+)\]\([^)]+\)/g, "$1")
    .replace(/[`*_]/g, "")
    .replace(/\s+/g, " ")
    .replaceAll("|", "/")
    .trim();
}

function stableId(value) {
  return plainText(value)
    .toLowerCase()
    .replaceAll("&", " and ")
    .replaceAll("/", " or ")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .replace(/-+/g, "-");
}

function promotedEntryRecord(admission) {
  const sourcePath = `tables/entries/${admission.id}.md`;
  const text = read(sourcePath);
  const titleMatch = /^# (.+)$/m.exec(text);
  if (!titleMatch) {
    throw new Error(`missing title: ${sourcePath}`);
  }
  if (!/^Status: candidate anchor entry$/m.test(text)) {
    throw new Error(`invalid promoted status: ${sourcePath}`);
  }
  const orientation = markdownSection(text, "## Orientation");
  const summary = plainText(orientation.split(/\n\s*\n/)[0]);
  const senseRows = [
    ...markdownSection(text, "## Sense table").matchAll(
      /^\| `([^`]+)` \| ([^|]+) \| ([^|]+) \|$/gm,
    ),
  ];
  if (senseRows.length === 0) {
    throw new Error(`missing promoted senses: ${sourcePath}`);
  }

  const factorSection = markdownSection(text, "## Root factorization");
  const codeMatch = /```text\n([\s\S]*?)\n```/.exec(factorSection);
  let factorLabels;
  if (codeMatch) {
    factorLabels = [];
    let current = "";
    for (const line of codeMatch[1].split("\n").slice(1)) {
      const start = /^\s*(?::=|x)\s+(.+)$/.exec(line);
      if (start) {
        if (current) factorLabels.push(plainText(current));
        current = start[1];
      }
    }
    if (current) factorLabels.push(plainText(current));
  } else {
    const firstSentenceLines = [];
    for (const line of factorSection.split(/\n\s*\n/)[0].split("\n")) {
      firstSentenceLines.push(line.split(".")[0]);
      if (line.includes(".")) break;
    }
    factorLabels = firstSentenceLines
      .flatMap((line) =>
        line.replace(/^Factor\s+/, "").split(/,\s+(?:and\s+)?|\s+and\s+/),
      )
      .map(plainText)
      .map((label) => label.replace(/\s+(?:and|or)$/i, ""))
      .filter(Boolean);
  }
  if (factorLabels.length === 0) {
    throw new Error(`missing promoted factors: ${sourcePath}`);
  }
  const factorIds = new Set();
  const factors = factorLabels.map((label) => {
    let id = stableId(label);
    let suffix = 2;
    while (factorIds.has(id)) id = `${stableId(label)}-${suffix++}`;
    factorIds.add(id);
    return `factor ${id} | ${label}`;
  });
  return [
    `entry ${admission.id} | ${plainText(titleMatch[1])} | ${admission.domain} | candidate | ${sourcePath} | ${summary}`,
    ...senseRows.map((row) => `sense ${row[1]} | ${row[1].replaceAll("-", " ")}`),
    ...factors,
    "end-entry",
  ].join("\n");
}

const admissionIndex = JSON.parse(read("reference/lexicon-admission-index-v1.json"));
if (
  admissionIndex.contract !== "lexicon-admission-index-v1" ||
  !Array.isArray(admissionIndex.manifests) ||
  admissionIndex.manifests.length < 2 ||
  new Set(admissionIndex.manifests).size !== admissionIndex.manifests.length
) {
  throw new Error("invalid Lexicon admission index");
}
const allAdmissionManifests = admissionIndex.manifests.map((relative) => {
  const manifest = JSON.parse(read(relative));
  if (
    !/^lexicon-(?:candidate|domain|roadmap-wave-[0-9]+)-admissions-v[0-9]+$/.test(
      manifest.contract,
    ) ||
    !/^\d{4}-\d{2}-\d{2}$/.test(manifest.date) ||
    manifest.maturity !== "candidate" ||
    typeof manifest.admission_review !== "string" ||
    (manifest.literature_review !== undefined &&
      typeof manifest.literature_review !== "string") ||
    !Array.isArray(manifest.entries) ||
    manifest.entries.length === 0
  ) {
    throw new Error(`invalid Lexicon admission manifest: ${relative}`);
  }
  if (!fs.existsSync(path.join(root, manifest.admission_review))) {
    throw new Error(`missing admission review: ${manifest.admission_review}`);
  }
  if (
    manifest.literature_review &&
    !fs.existsSync(path.join(root, manifest.literature_review))
  ) {
    throw new Error(`missing literature review: ${manifest.literature_review}`);
  }
  return manifest;
});
const allAdmissions = allAdmissionManifests.flatMap((manifest) =>
  manifest.entries.map((entry) => ({ ...entry, manifest })),
);
if (new Set(allAdmissions.map(({ id }) => id)).size !== allAdmissions.length) {
  throw new Error("duplicate Lexicon admission identity");
}
const admissionRecords = allAdmissions.map(promotedEntryRecord);

const migratedReference = legacyReference
  .replace(/^factorium-reference-v2\n/, "lexicon-reference-v4\n")
  .split("\n")
  .map((line) => {
    if (line.startsWith("entry factorium-entry-publication | ")) {
      return line
        .replace(
          "entry factorium-entry-publication | Factorium Entry Publication |",
          "entry lexicon-entry-publication | Lexicon Entry Publication |",
        )
        .replace(
          "tables/entries/factorium-entry-publication.md",
          "tables/entries/lexicon-entry-publication.md",
        )
        .replace(
          " | Factorium publication is ",
          " | Lexicon publication is ",
        );
    }
    if (
      line.startsWith("view procedure-entry-publication | ") ||
      line.startsWith("view scale-editorial-maturity | ")
    ) {
      const renamedOwner = line.replace(
        " | factorium-entry-publication | ",
        " | lexicon-entry-publication | ",
      );
      return renamedOwner
        .replace(
          "tables/procedures/entry-publication.md",
          "tables/procedures/lexicon-entry-publication.md",
        )
        .replace(
          "tables/scales/editorial-maturity.md",
          "tables/scales/lexicon-editorial-maturity.md",
        );
    }
    return line;
  })
  .join("\n");
const reference = sortReferenceRecords(
  migratedReference.replace(
    /\nend-reference\s*$/,
    `\n${admissionRecords.join("\n")}\nend-reference`,
  ),
);
emit("reference/lexicon-reference-v4.lexicon", reference);

const legacyRelations = read("reference/factorium-relations-v0.factorium");
const relations = legacyRelations.replace(
  /^factorium-relations-v0\n/,
  "lexicon-relations-v2\n",
);
emit("reference/lexicon-relations-v2.lexicon", relations);

const legacyRelationSha256 = sha256(legacyRelations);
const relationSha256 = sha256(relations);
const assuranceLines = read("reference/factorium-assurance-v2.factorium")
  .replace(/^factorium-assurance-v2\n/, "lexicon-assurance-v4\n")
  .replace(
    /^review entry:factorium-entry-publication /m,
    "review entry:lexicon-entry-publication ",
  )
  .split("\n")
  .map((line) =>
    line.startsWith("review relation:")
      ? line.replace(` | ${legacyRelationSha256} | `, ` | ${relationSha256} | `)
      : line.startsWith("review entry:lexicon-entry-publication ")
        ? line.replace(
            /^review entry:lexicon-entry-publication \| [a-f0-9]{64} \| /,
            `review entry:lexicon-entry-publication | ${lexiconPublicationSourceSha256} | `,
          )
        : line.startsWith("review view:procedure-entry-publication ")
          ? line.replace(
              /^review view:procedure-entry-publication \| [a-f0-9]{64} \| /,
              `review view:procedure-entry-publication | ${lexiconProcedureSourceSha256} | `,
            )
          : line.startsWith("review view:scale-editorial-maturity ")
            ? line.replace(
                /^review view:scale-editorial-maturity \| [a-f0-9]{64} \| /,
                `review view:scale-editorial-maturity | ${lexiconScaleSourceSha256} | `,
              )
            : line,
  )
  .filter((line) => line !== "lexicon-assurance-v4" && line !== "end-assurance" && line !== "")
  .concat(
    allAdmissions.map((admission) => {
      const sourcePath = `tables/entries/${admission.id}.md`;
      return `review entry:${admission.id} | ${sha256(read(sourcePath))} | ${admission.manifest.admission_review} | fixed-point | ${admission.manifest.date}`;
    }),
  )
  .sort();
const assurance = `lexicon-assurance-v4\n${assuranceLines.join("\n")}\nend-assurance\n`;
emit("reference/lexicon-assurance-v4.lexicon", assurance);

const referenceSha256 = sha256(reference);
const queryDirectory = path.join(root, "fixtures", "composition");
for (const name of fs
  .readdirSync(queryDirectory)
  .filter((candidate) => candidate.endsWith(".factorium-query"))
  .sort()) {
  const query = read(path.join("fixtures", "composition", name))
    .replace(
      /^factorium-composition-query-v0\n/,
      "lexicon-composition-query-v2\n",
    )
    .replace(
      /^source [a-f0-9]{64} \| [a-f0-9]{64}$/m,
      `source ${referenceSha256} | ${relationSha256}`,
    );
  emit(
    path.join(
      "fixtures",
      "composition",
      name.replace(/\.factorium-query$/, ".lexicon-query"),
    ),
    query,
  );
}

function pointerRows(relative, visited = new Set()) {
  if (visited.has(relative)) {
    throw new Error(`pointer registry inheritance cycle: ${relative}`);
  }
  visited.add(relative);
  const lines = read(relative).trimEnd().split(/\r?\n/);
  if (lines.at(-1) !== "end-factorium-pointer-registry") {
    throw new Error(`invalid legacy pointer registry: ${relative}`);
  }
  if (lines[0] === "factorium-pointer-registry-v0") {
    return lines.slice(1, -1);
  }
  if (lines[0] !== "factorium-pointer-registry-delta-v0") {
    throw new Error(`unknown legacy pointer registry: ${relative}`);
  }
  const match = /^extends (.+)$/.exec(lines[1]);
  if (!match) {
    throw new Error(`missing pointer registry base: ${relative}`);
  }
  return [
    ...pointerRows(path.join(path.dirname(relative), match[1]), visited),
    ...lines.slice(2, -1),
  ];
}

const pointers = pointerRows(
  "volumes/01-structure-quantity-choice/proof-set-pointer-registry-v12.factorium",
);
emit(
  "volumes/01-structure-quantity-choice/lexicon-pointer-registry-v1.lexicon",
  `lexicon-pointer-registry-v1\n${pointers.join("\n")}\nend-lexicon-pointer-registry\n`,
);
const pointerAdmissions = JSON.parse(
  read("reference/lexicon-pointer-admissions-v2.json"),
);
if (
  pointerAdmissions.contract !== "lexicon-pointer-admissions-v2" ||
  pointerAdmissions.base !== "lexicon-pointer-registry-v1" ||
  pointerAdmissions.pointers.length !== 20
) {
  throw new Error("invalid Lexicon pointer admission manifest");
}
const pointerAdmissionRows = pointerAdmissions.pointers.map((pointer) =>
  `pointer ${pointer.slug} | ${pointer.label} | ${pointer.orientation}`,
);
const pointerV2Rows = [...pointers, ...pointerAdmissionRows];
if (
  new Set(pointerV2Rows.map((row) => row.split(" | ")[0])).size !==
    pointerV2Rows.length ||
  new Set(pointerV2Rows.map((row) => row.split(" | ")[1].toLowerCase())).size !==
    pointerV2Rows.length
) {
  throw new Error("duplicate Lexicon pointer admission");
}
emit(
  "volumes/01-structure-quantity-choice/lexicon-pointer-registry-v2.lexicon",
  `lexicon-pointer-registry-v2\n${pointerV2Rows.join("\n")}\nend-lexicon-pointer-registry\n`,
);

const labAllowlist = read(
  "volumes/01-structure-quantity-choice/proof-set-composition-lab-relations.factorium",
)
  .replace(
    /^factorium-composition-lab-relations-v0\n/,
    "lexicon-composition-lab-relations-v1\n",
  );
emit(
  "volumes/01-structure-quantity-choice/lexicon-composition-lab-relations.lexicon",
  labAllowlist,
);

console.log(
  `${check ? "checked" : "generated"}=${outputs.length} reference=${referenceSha256} relations=${relationSha256} pointers=${pointerV2Rows.length}`,
);
