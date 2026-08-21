"use strict";

const assert = require("node:assert/strict");
const crypto = require("node:crypto");
const fs = require("node:fs");
const path = require("node:path");

const root = path.resolve(__dirname, "..");
const site = path.join(root, "target", "proof-set-sim-74");
const read = (relative) => fs.readFileSync(path.join(root, relative), "utf8");
const sha256 = (text) =>
  crypto.createHash("sha256").update(text).digest("hex");
const manifest = JSON.parse(
  fs.readFileSync(path.join(site, "manifest.json"), "utf8"),
);

assert.equal(manifest.edition, "sim-74");
assert.equal(manifest.site_checks.missing_local_targets, 0);
assert.equal(manifest.site_checks.pointer_entry_pages, 270);
assert.equal(manifest.site_checks.tables_index_pointer_entries, 270);
assert.equal(manifest.site_checks.dictionary_sequence_pages, 403);
assert.equal(manifest.site_checks.dictionary_sequence_canonical_entries, 133);
assert.equal(manifest.site_checks.dictionary_sequence_pointer_entries, 270);
assert.equal(manifest.site_checks.dictionary_sequence_previous_links, 402);
assert.equal(manifest.site_checks.dictionary_sequence_next_links, 402);
assert.equal(manifest.site_checks.dictionary_sequence_finish_links, 1);
assert.equal(manifest.site_checks.dictionary_stream_pages, 1);
assert.equal(manifest.site_checks.dictionary_stream_records, 403);
assert.equal(manifest.site_checks.dictionary_stream_batch_size, 4);
assert.equal(manifest.site_checks.dictionary_book_pages, 1);
assert.equal(manifest.site_checks.dictionary_book_records, 403);
assert.equal(manifest.site_checks.dictionary_book_columns, 2);
assert.equal(
  manifest.site_checks.dictionary_book_screen_flow,
  "bounded-horizontal-pages",
);
assert.equal(
  manifest.site_checks.dictionary_book_mobile_flow,
  "single-column-vertical",
);
assert.equal(
  manifest.site_checks.dictionary_book_print_flow,
  "full-width-canonical-tables-then-two-column-pointer-index",
);
assert.equal(manifest.site_checks.dictionary_book_print_canonical_tables, 133);
assert.equal(manifest.site_checks.dictionary_book_print_pointer_records, 270);
assert.equal(manifest.site_checks.dictionary_book_print_provenance_sections, 133);
assert.equal(manifest.site_checks.reader_route_additional_records, 199);
assert.equal(manifest.site_checks.candidate_start_targets, 0);
assert.equal(
  manifest.status,
  "internally validated projection; not reader-outcome evidence",
);
assert.equal(manifest.rendering_checks.repository_source_links, 136);
assert.equal(
  manifest.site_checks.product_authority,
  "Lexicon canonical; Reader and Factor Guides are linked projections",
);
assert.equal(
  manifest.active_contracts.composition_lab_payload,
  "lexicon-composition-lab-payload-v0",
);
assert.equal(
  manifest.active_contracts.composition_reading_payload,
  "lexicon-composition-reading-payload-v0",
);
assert.equal(
  manifest.active_contracts.reader_profile_preference,
  "lexicon-reader-profile",
);
assert.equal(
  manifest.active_contracts.composition_starters,
  "lexicon-composition-starters-v0",
);
assert.equal(
  manifest.active_contracts.composition_guide_skeleton,
  "lexicon-composition-guide-skeleton-v0",
);
assert.equal(
  manifest.active_contracts.composition_evaluation_record,
  "lexicon-composition-evaluation-record-v0",
);

const sourcePaths = new Set(manifest.sources.map((source) => source.path));
for (const expected of [
  "tables/entries/lexicon-entry-publication.md",
  "tables/procedures/lexicon-entry-publication.md",
  "tables/scales/lexicon-editorial-maturity.md",
]) {
  assert.ok(sourcePaths.has(expected), `missing canonical source ${expected}`);
}
assert.ok(!sourcePaths.has("tables/entries/factorium-entry-publication.md"));

const reference = read("reference/lexicon-reference-v4.lexicon");
const relations = read("reference/lexicon-relations-v2.lexicon");
const assurance = read("reference/lexicon-assurance-v4.lexicon");
assert.match(read("tables/LEXICON-CATALOG.md"), /^# Lexicon Generated Catalog\n/);
assert.match(
  read("tables/LEXICON-UNRESOLVED.md"),
  /^# Lexicon Generated Unresolved Candidates\n/,
);
assert.match(reference, /^lexicon-reference-v4\n/);
assert.match(reference, /^entry lexicon-entry-publication \|/m);
assert.doesNotMatch(reference, /^entry factorium-entry-publication \|/m);
assert.match(relations, /^lexicon-relations-v2\n/);
assert.match(assurance, /^lexicon-assurance-v4\n/);
assert.match(assurance, /^review entry:lexicon-entry-publication \|/m);

const referenceSha256 = sha256(reference);
const relationSha256 = sha256(relations);
const queryDirectory = path.join(root, "fixtures", "composition");
const queries = fs
  .readdirSync(queryDirectory)
  .filter((name) => name.endsWith(".lexicon-query"));
assert.equal(queries.length, 11);
for (const name of queries) {
  const query = fs.readFileSync(path.join(queryDirectory, name), "utf8");
  assert.match(query, /^lexicon-composition-query-v2\n/);
  assert.match(
    query,
    new RegExp(`^source ${referenceSha256} \\| ${relationSha256}$`, "m"),
  );
}

const pointerRegistry = read(
  "volumes/01-structure-quantity-choice/lexicon-pointer-registry-v2.lexicon",
);
assert.match(pointerRegistry, /^lexicon-pointer-registry-v2\n/);
assert.equal(
  pointerRegistry.split(/\r?\n/).filter((line) => line.startsWith("pointer "))
    .length,
  270,
);

const generatedFiles = fs
  .readdirSync(site, { recursive: true, withFileTypes: true })
  .filter(
    (entry) =>
      entry.isFile() && /\.(?:html|js|json)$/.test(entry.name),
  )
  .map((entry) => path.join(entry.parentPath, entry.name));
for (const file of generatedFiles) {
  const text = fs.readFileSync(file, "utf8");
  const activeIdentityText = text.replaceAll(
    "Factorium and Formarium identifiers remain readable historical imports.",
    "",
  );
  assert.doesNotMatch(
    activeIdentityText,
    /\b(?:Factorium|Formarium)\b|(?:FACTORIUM|FORMARIUM)_|\/(?:FACTORIUM|FORMARIUM)\b/,
  );
  if (file.endsWith(".html")) {
    assert.match(
      text,
      /rel="license" href="https:\/\/creativecommons\.org\/licenses\/by-nc\/4\.0\/"/,
      `missing content license notice in ${file}`,
    );
    const primaryNav = text.match(
      /<nav class="site-nav"[^>]*>([\s\S]*?)<\/nav>/,
    );
    if (primaryNav) {
      const labels = [...primaryNav[1].matchAll(/<a [^>]*>([^<]+)<\/a>/g)]
        .map((match) => match[1]);
      assert.deepEqual(
        labels,
        ["Tables", "Reader", "Work with a question", "Search", "Contents"],
        `unstable primary navigation in ${file}`,
      );
    }
    assert.doesNotMatch(text, />Terms<\/a>/, `ambiguous Terms label in ${file}`);
  }
}

const home = fs.readFileSync(path.join(site, "index.html"), "utf8");
const reader = fs.readFileSync(path.join(site, "reader.html"), "utf8");
const tables = fs.readFileSync(path.join(site, "tables.html"), "utf8");
const dictionary = fs.readFileSync(path.join(site, "dictionary.html"), "utf8");
const book = fs.readFileSync(path.join(site, "book.html"), "utf8");
const screenBook = book.split('<section class="dictionary-book__print-body"')[0];
const siteSearchRecords = JSON.parse(
  fs.readFileSync(path.join(site, "search-index.json"), "utf8"),
);
const familySearch = require(path.join(
  root,
  "volumes/01-structure-quantity-choice/proof-set-search-families.js",
));
const surpriseCandidates = siteSearchRecords.filter(
  (record) => record.recordClass === "canonical-entry",
);
assert.equal(familySearch.pickSurprise(siteSearchRecords, () => 0), surpriseCandidates[0]);
assert.equal(
  familySearch.pickSurprise(siteSearchRecords, () => 0.999999),
  surpriseCandidates[surpriseCandidates.length - 1],
);
assert.match(home, /<a class="site-brand"[^>]*>Lexicon<\/a>/);
assert.doesNotMatch(home, /identity-preview|feedback preview/i);
assert.match(home, /data-lexicon-handoff/);
assert.match(
  home,
  /Content &copy; 2026 Gio Della-Libera.+CC BY-NC 4\.0/,
);
assert.match(reader, /Lexicon schemas and file formats are canonical/);
assert.match(
  reader,
  /Factorium and Formarium identifiers remain readable historical imports/,
);
assert.match(reader, /other 199 records/);
assert.doesNotMatch(reader, /other 151 records|Factor Tables/);
assert.doesNotMatch(home, /id="reader" class="site-start site-candidate/);
assert.equal((home.match(/<nav class="site-nav"[\s\S]*?<\/nav>/) || [""])[0]
  .match(/<a /g)?.length, 5);
assert.equal(
  (home.match(/<a href="tables\.html">Tables<\/a>/g) || []).length,
  1,
);
assert.match(home, /href="compose\.html">Work with a question<\/a>/);
assert.match(home, /<h2 id="site-discovery-heading">“Force” is not one thing<\/h2>/);
assert.match(home, /data-surprise-entry href="entries\/tables-entries-force\.html"/);
assert.match(home, /<section id="contents" class="site-contents site-contents--compact">/);
assert.match(home, /Two books · one connected reference/);
assert.match(home, /Search the source Tables and clearly labelled examples/);
assert.doesNotMatch(
  home,
  /id="problems"|id="compose"|id="start"|id="compare-searches"|class="site-chapter-grid"/,
);
assert.doesNotMatch(
  home,
  /canonical Tables|bounded|typed closure|factorization|specialized views/i,
);
assert.doesNotMatch(home, />Terms<\/a>|not reader evidence or preview-01/);
assert.match(home, /href="manifest\.json">sim-74<\/a>/);
assert.match(home, /software: MIT/);
assert.match(tables, /href="dictionary\.html">Continuous A-Z<\/a>/);
assert.match(tables, /href="book\.html">Condensed book<\/a>/);
assert.match(tables, /href="terms\.html">Pointer index<\/a>/);
assert.match(dictionary, /<h1>Continuous Dictionary A-Z<\/h1>/);
assert.match(dictionary, /data-dictionary-stream data-batch-size="4"/);
assert.match(dictionary, /src="assets\/dictionary-stream\.js"/);
const streamDataMatch = dictionary.match(
  /<script id="dictionary-stream-data" type="application\/json">([^<]+)<\/script>/,
);
assert.ok(streamDataMatch);
const streamRecords = JSON.parse(streamDataMatch[1]);
assert.equal(streamRecords.length, 403);
assert.deepEqual(streamRecords.slice(0, 3), [
  {
    title:
      "Abstract Work, Notational Specification, Performance Instance, Compliance Condition, and Autographic/Allographic Distinction",
    kind: "table",
    href:
      "entries/tables-entries-abstract-work-notational-specification-performance-instance-compliance-condition-autographic-allographic.html",
  },
  { title: "Access", kind: "pointer", href: "pointers/access.html" },
  {
    title: "Access, Permission, Authorization, and Entitlement",
    kind: "table",
    href:
      "entries/tables-entries-access-permission-authorization-entitlement.html",
  },
]);
assert.match(book, /<title>Lexicon<\/title>/);
assert.match(book, /<h1>Lexicon<\/h1>/);
assert.doesNotMatch(book, /The Lexicon Dictionary/);
assert.match(book, /Start with a familiar word\./);
assert.match(book, /133 canonical Tables · 270 pointer-index records/);
assert.match(book, /Internal proof · internally validated projection · not reader-outcome evidence/);
assert.match(book, /<h2 id="book-use-heading">How to use this proof<\/h2>/);
assert.match(book, /<h2 id="print-canonical-heading">Canonical Tables<\/h2>/);
assert.match(book, /<h2 id="print-pointer-heading">Pointer index<\/h2>/);
assert.match(book, /<h2 id="book-colophon-heading">Colophon<\/h2>/);
assert.equal(
  (book.match(/class="dictionary-book__print-table-item"/g) || []).length,
  133,
);
assert.equal(
  (book.match(/class="dictionary-book__print-pointer-item"/g) || []).length,
  270,
);
assert.equal(
  (book.match(/class="dictionary-book__print-provenance"/g) || []).length,
  133,
);
assert.equal(
  (book.match(/class="dictionary-book__print-maturity"/g) || []).length,
  133,
);
assert.equal(
  (book.match(/class="dictionary-book__maturity"/g) || []).length,
  133,
);
assert.doesNotMatch(book, /<p>Status:\s*/);
assert.match(
  book,
  /data-book-supplement="sources_provenance"[\s\S]*?<p class="dictionary-book__maturity"><strong>Publication status<\/strong>/,
);
assert.match(book, /class="site-skip" href="#main-content"/);
assert.match(book, /href="index\.html">Lexicon home<\/a>/);
assert.match(book, /href="reader\.html">Reader<\/a>/);
assert.match(book, /data-book-page-previous/);
assert.match(book, /data-book-page-next/);
assert.match(book, /data-book-pages tabindex="0"/);
assert.match(book, /class="dictionary-book__edition"/);
assert.match(book, /LEXICON\/manifest\.json/);
assert.match(book, /github\.com\/giodl73-repo\/LEXICON\/tree\//);
assert.equal(
  (book.match(/class="dictionary-book__item"/g) || []).length,
  403,
);
assert.equal(
  (book.match(/data-dictionary-kind="pointer"/g) || []).length,
  270,
);
assert.equal(
  (book.match(/data-dictionary-kind="table"/g) || []).length,
  133,
);
assert.equal(
  (screenBook.match(/class="dictionary-book__pointer-parents"/g) || []).length,
  270,
);
assert.equal(
  [...screenBook.matchAll(/<div class="dictionary-book__pointer-parents">([\s\S]*?)<\/div>/g)]
    .reduce((total, match) => total + (match[1].match(/<a /g) || []).length, 0),
  3590,
);
assert.doesNotMatch(book, /class="dictionary-book__(?:item-heading|meta)"/);
assert.doesNotMatch(book, />Item \d+ · (?:Pointer|Canonical Table)</);
assert.equal(
  (book.match(/class="dictionary-book__supplement"/g) || []).length,
  420,
);
assert.equal(
  (book.match(/data-book-supplement="specialized"/g) || []).length,
  41,
);
assert.equal(
  (book.match(/data-book-supplement="reference_delta"/g) || []).length,
  113,
);
assert.equal(
  (book.match(/data-book-supplement="cross_references"/g) || []).length,
  133,
);
assert.equal(
  (book.match(/data-book-supplement="sources_provenance"/g) || []).length,
  133,
);
assert.doesNotMatch(book, /<details class="dictionary-book__supplement"[^>]*\sopen(?:\s|>)/);
assert.doesNotMatch(
  book,
  /<h2[^>]*>(?:Specialized\s+views?|Reference\s+Delta|Cross-references|Sources\s+and\s+provenance)<\/h2>/i,
);
assert.match(
  book,
  /data-dictionary-position="2"[\s\S]*?<h2 id="book-pointer-access">Access<\/h2>[\s\S]*?<p>Appears in<\/p><ul>[\s\S]*?<a href="entries\//,
);
assert.match(
  book,
  /data-dictionary-position="1" data-dictionary-title="Abstract Work, Notational Specification, Performance Instance, Compliance Condition, and Autographic\/Allographic Distinction"/,
);
assert.match(
  book,
  /data-book-running-head aria-live="polite" aria-atomic="true" hidden/,
);
assert.doesNotMatch(
  book,
  /dictionary-sequence|class="pointer-owner"|table-navigator|lexicon-handoff|class="site-header"/,
);
const siteCss = fs.readFileSync(path.join(site, "assets", "site.css"), "utf8");
assert.match(
  siteCss,
  /\.dictionary-book__entries\s*\{[\s\S]*?column-count:\s*2;/,
);
assert.match(
  siteCss,
  /\.dictionary-book__entries\s*\{[\s\S]*?block-size:\s*min\(76vh,\s*50rem\);[\s\S]*?column-fill:\s*auto;[\s\S]*?overflow-x:\s*auto;/,
);
assert.match(
  siteCss,
  /\.dictionary-book__item\s*\{[^}]*break-inside:\s*auto;/,
);
assert.doesNotMatch(
  siteCss,
  /\.dictionary-book__item\s*\{[^}]*break-inside:\s*avoid-column;/,
);
assert.match(
  siteCss,
  /@media print\s*\{[\s\S]*?\.dictionary-book__reader\s*\{[\s\S]*?display:\s*none !important;/,
);
assert.match(
  siteCss,
  /\.dictionary-book__print-table-item \.dictionary-book__content table\s*\{[\s\S]*?table-layout:\s*fixed;/,
);
assert.match(
  siteCss,
  /\.dictionary-book__print-pointer-columns\s*\{[\s\S]*?column-count:\s*2;/,
);
assert.match(
  siteCss,
  /@media print\s*\{[\s\S]*?\.dictionary-book__edition a::after\s*\{[\s\S]*?content:\s*none;/,
);
const dictionaryRecords = [
  ...tables.matchAll(
    /<li data-dictionary-kind="(table|pointer)" (?:data-index-path|data-pointer-slug)="([^"]+)"><a href="([^"]+)">([^<]+)<\/a>/g,
  ),
].map((match) => ({
  kind: match[1],
  key: match[2],
  href: match[3],
  title: match[4],
}));
assert.equal(dictionaryRecords.length, 403);
assert.equal(
  dictionaryRecords.filter((record) => record.kind === "table").length,
  133,
);
assert.equal(
  dictionaryRecords.filter((record) => record.kind === "pointer").length,
  270,
);
assert.deepEqual(
  dictionaryRecords.map((record) => record.href),
  [...dictionaryRecords]
    .sort(
      (left, right) =>
        left.title.toLowerCase().localeCompare(right.title.toLowerCase()) ||
        left.href.localeCompare(right.href),
    )
    .map((record) => record.href),
);
assert.deepEqual(
  dictionaryRecords.slice(0, 3).map((record) => [
    record.title,
    record.kind,
  ]),
  [
    [
      "Abstract Work, Notational Specification, Performance Instance, Compliance Condition, and Autographic/Allographic Distinction",
      "table",
    ],
    ["Access", "pointer"],
    ["Access, Permission, Authorization, and Entitlement", "table"],
  ],
);
assert.equal(
  manifest.site_checks.dictionary_index_letters,
  new Set(dictionaryRecords.map((record) => record.title[0].toUpperCase())).size,
);
assert.match(
  tables,
  new RegExp(`data-dictionary-start href="${dictionaryRecords[0].href}"`),
);
for (const [index, record] of dictionaryRecords.entries()) {
  const entry = fs.readFileSync(path.join(site, ...record.href.split("/")), "utf8");
  assert.match(entry, new RegExp(`data-dictionary-step="${index + 1}"`));
  assert.match(entry, new RegExp(`data-dictionary-kind="${record.kind}"`));
  if (index > 0) {
    const previousHref = path.posix.relative(
      path.posix.dirname(record.href),
      dictionaryRecords[index - 1].href,
    );
    assert.match(
      entry,
      new RegExp(
        `data-dictionary-direction="previous" href="${previousHref}"`,
      ),
    );
  }
  if (index < dictionaryRecords.length - 1) {
    const nextHref = path.posix.relative(
      path.posix.dirname(record.href),
      dictionaryRecords[index + 1].href,
    );
    assert.match(
      entry,
      new RegExp(
        `data-dictionary-direction="next" href="${nextHref}"`,
      ),
    );
  } else {
    assert.match(
      entry,
      /data-dictionary-direction="finish" href="\.\.\/tables\.html"/,
    );
  }
}
assert.match(
  fs.readFileSync(path.join(site, "assets", "handoff.js"), "utf8"),
  /\[data-lexicon-handoff\]/,
);

console.log(
  `OK sim74=Lexicon-native reference=${referenceSha256} relations=${relationSha256} queries=${queries.length} pointers=270 missing=0`,
);
