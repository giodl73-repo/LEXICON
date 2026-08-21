const fs = require("node:fs");
const path = require("node:path");

const repoRoot = path.resolve(__dirname, "..");
const candidateDir = path.join(repoRoot, "signals", "discover", "candidates");
const literatureDir = path.join(repoRoot, "signals", "discover", "literature");
const indexPath = path.join(candidateDir, "README.md");
const canonicalPath = path.join(
  repoRoot,
  "reference",
  "lexicon-reference-v4.lexicon",
);
const admissionsPath = path.join(
  repoRoot,
  "reference",
  "lexicon-candidate-admissions-v1.json",
);

const draftHeadings = [
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

const briefHeadings = [
  "## Decision question",
  "## Bounded thesis",
  "## Proposed senses",
  "## Candidate contract",
  "## Existing-owner audit",
  "## Source matrix",
  "## Admission gates",
  "## Disposition",
];

function fail(message) {
  throw new Error(message);
}

function markdownFiles(directory, predicate = () => true) {
  return fs
    .readdirSync(directory)
    .filter((name) => name.endsWith(".md") && predicate(name))
    .sort();
}

function read(relativePath) {
  return fs
    .readFileSync(path.join(repoRoot, relativePath), "utf8")
    .replace(/\r\n?/g, "\n");
}

function section(text, heading) {
  const start = text.indexOf(`${heading}\n`);
  if (start < 0) {
    return "";
  }
  const bodyStart = start + heading.length + 1;
  const next = text.indexOf("\n## ", bodyStart);
  return text.slice(bodyStart, next < 0 ? text.length : next);
}

function senses(text, heading) {
  return [...section(text, heading).matchAll(/^\| `([^`]+)` \|/gm)].map(
    (match) => match[1],
  );
}

function assertHeadings(relativePath, text, headings) {
  for (const heading of headings) {
    if (!text.includes(`${heading}\n`)) {
      fail(`${relativePath}: missing ${heading}`);
    }
    if (!section(text, heading).trim()) {
      fail(`${relativePath}: empty ${heading}`);
    }
  }
}

function checkRelativeLinks(relativePath, text) {
  const sourceDirectory = path.dirname(path.join(repoRoot, relativePath));
  for (const match of text.matchAll(/\[[^\]]+\]\(([^)]+)\)/g)) {
    const target = match[1].split("#", 1)[0];
    if (!target || /^[a-z]+:/i.test(target)) {
      continue;
    }
    const resolved = path.resolve(sourceDirectory, target);
    if (!fs.existsSync(resolved)) {
      fail(`${relativePath}: broken link ${target}`);
    }
  }
}

const drafts = markdownFiles(candidateDir, (name) => name !== "README.md");
const briefs = markdownFiles(literatureDir, (name) =>
  /-candidate-brief-\d{4}-\d{2}-\d{2}\.md$/.test(name),
);
const briefSet = new Set(briefs);
const legacyBriefsWithoutStandardLimitsHeading = new Set([
  "perception-appearance-candidate-brief-2026-08-19.md",
  "similarity-comparison-candidate-brief-2026-08-19.md",
  "trust-reliance-candidate-brief-2026-08-19.md",
]);
const candidateSenses = new Map();
const linkedBriefs = new Set();
const admittedCandidatePaths = new Set(
  JSON.parse(fs.readFileSync(admissionsPath, "utf8")).entries.map((entry) =>
    path.join("signals", "discover", "candidates", `${entry.id}.md`),
  ),
);

for (const draft of drafts) {
  const relativePath = path.join(
    "signals",
    "discover",
    "candidates",
    draft,
  );
  const text = read(relativePath);
  assertHeadings(relativePath, text, draftHeadings);
  checkRelativeLinks(relativePath, text);
  if (!text.includes("Status: noncanonical candidate entry draft")) {
    fail(`${relativePath}: missing noncanonical status`);
  }

  const admissionMatch = text.match(
    /\[Admission brief\]\(\.\.\/literature\/([^)]+)\)/,
  );
  if (!admissionMatch) {
    fail(`${relativePath}: missing admission brief link`);
  }
  const brief = admissionMatch[1];
  if (!briefSet.has(brief)) {
    fail(`${relativePath}: unknown admission brief ${brief}`);
  }
  if (linkedBriefs.has(brief)) {
    fail(`${relativePath}: admission brief reused by another candidate: ${brief}`);
  }
  linkedBriefs.add(brief);

  const draftSenses = senses(text, "## Sense table");
  if (draftSenses.length === 0) {
    fail(`${relativePath}: empty sense table`);
  }
  const briefRelativePath = path.join(
    "signals",
    "discover",
    "literature",
    brief,
  );
  const briefText = read(briefRelativePath);
  assertHeadings(briefRelativePath, briefText, briefHeadings);
  if (
    !legacyBriefsWithoutStandardLimitsHeading.has(brief) &&
    !briefText.includes("## Counterevidence and limits\n")
  ) {
    fail(`${briefRelativePath}: missing ## Counterevidence and limits`);
  }
  checkRelativeLinks(briefRelativePath, briefText);
  if (!briefText.includes("canonical_admission: false")) {
    fail(`${briefRelativePath}: missing noncanonical admission flag`);
  }
  const briefSenses = senses(briefText, "## Proposed senses");
  if (briefSenses.length === 0) {
    fail(`${briefRelativePath}: empty proposed senses`);
  }
  if (JSON.stringify(draftSenses) !== JSON.stringify(briefSenses)) {
    fail(
      `${relativePath}: senses differ from ${brief}: ` +
        `${draftSenses.join(", ")} != ${briefSenses.join(", ")}`,
    );
  }

  for (const sense of draftSenses) {
    const owner = candidateSenses.get(sense);
    if (owner) {
      fail(`${relativePath}: sense ${sense} already owned by ${owner}`);
    }
    candidateSenses.set(sense, relativePath);
  }
}

if (linkedBriefs.size !== briefs.length) {
  const unlinked = briefs.filter((brief) => !linkedBriefs.has(brief));
  fail(`admission briefs without candidate drafts: ${unlinked.join(", ")}`);
}

const canonicalSenses = new Set(
  [...read(path.relative(repoRoot, canonicalPath)).matchAll(/^sense ([^|]+) \|/gm)].map(
    (match) => match[1].trim(),
  ),
);
for (const [sense, owner] of candidateSenses) {
  if (canonicalSenses.has(sense) && !admittedCandidatePaths.has(owner)) {
    fail(`${owner}: sense ${sense} collides with the canonical reference`);
  }
}

const draftPaths = new Set(
  drafts.map((draft) => path.join("signals", "discover", "candidates", draft)),
);
if (
  admittedCandidatePaths.size !== draftPaths.size ||
  [...admittedCandidatePaths].some((candidatePath) => !draftPaths.has(candidatePath))
) {
  fail("candidate admission manifest does not cover every historical draft exactly once");
}

const indexRelativePath = path.join(
  "signals",
  "discover",
  "candidates",
  "README.md",
);
const indexText = read(indexRelativePath);
checkRelativeLinks(indexRelativePath, indexText);
const indexedDrafts = [
  ...indexText.matchAll(/^\s*-\s+\[[^\]]+\]\(([^)]+\.md)\)$/gm),
].map((match) => match[1]);
if (JSON.stringify(indexedDrafts.sort()) !== JSON.stringify([...drafts].sort())) {
  fail("candidate README does not list every draft exactly once");
}

console.log(
  `OK candidate_entries=${drafts.length} briefs=${briefs.length} ` +
    `senses=${candidateSenses.size} admitted=${admittedCandidatePaths.size} links=resolved`,
);
