# Auxiliary interchange inspector

Status: draft implementation/qualification; no deployment or readiness claim.

Reader problem: a reference author or implementer currently needs the native CLI
to check a supplied interchange corpus and the source identities of a declared
Composition Query. An auxiliary browser inspector can run those same Rust checks
locally, show exact versions/digests and export inputs/canonical text without
installing the CLI. This is intended friction reduction, not observed reader value.

Scope: ReferenceCorpus::parse, RelationManifest::parse and
CompositionQuery::parse/validate_sources over supplied strings, with original
inputs, canonical outputs and hashes. Markdown/source files, review assurance,
automatic graph construction and editorial/publication approval remain separate.
The browser cannot call validate_workspace or follow source paths. The existing
books/site remain primary; R4/R5/R6 gates and human/practitioner evidence do not
change. No new canonical entries, relations, schemas, benchmark controls or
Formography/encoding/semantic/runtime advantage claims are introduced.

This auxiliary inspector is not interactive reference construction or the R6
Workbench. Strong packed/structured/one-hot/learned-factored controls and frozen
Factorium/Formarium imports remain unchanged. New helper contracts use Lexicon.

See [pulse 01](pulses/pulse-01.md), [plan review](PLAN-REVIEW.md), and
[integration and baseline audit](INTEGRATION.md). The funded domain roadmap
continues separately with its external-reader boundary intact.

[Pulse 02](pulses/pulse-02.md) qualifies local multi-document interaction.
[Pulse 03](pulses/pulse-03.md) adds source/legal staging and exact published-book
preservation checks; its hosted qualification and deployment gates remain open.
