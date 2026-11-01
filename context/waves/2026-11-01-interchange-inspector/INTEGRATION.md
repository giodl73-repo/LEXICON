# Integration and baseline evidence

Public entry: `4c7b174035d04e2c085eb24e6be7add3502a81b0`.
Tracked entry: `6bd85bc6ed9323159bf308dd60a652975802935f`.
The tracked branch has two local-only commits; public main has 56 later commits.

Resolved README/attribute conflicts in favor of current published reference data
and identity, retaining the PITFALL principles, invariants, failure cases, stable
FRM IDs and identity-boundary test. Active doctrine files now use Lexicon names.
The dated Formarium doctrine result remains unchanged. Historical assurance
rewrites from the tracked branch were not carried forward. Native source, root
manifest/lock, reference files, tables, specs and founding artifacts remain equal
to public entry. Frozen relation fixture LF attributes are retained. Re-materialize
the affected ignored checkout bytes after attributes change; Git blobs stay exact.

Identity boundary test passes. Current generated contracts check passes with 21
contracts; candidate entry checks pass with 37 drafts/briefs/admitted families.

The complete native audit initially reports seven failed tests in four targets:
CLI, packet, reference_sidecar and relation_kind_fixtures. Some transport failures
come from working-tree CRLF bytes after an attribute update. Content/snapshot
failures remain: CLI expectations still name 101 entries/212 bindings while
current v4 has 133/244; frozen v0 source markers no longer match current Tables;
current assurance includes 35 source digests that match none of the LF/CRLF/BOM
transport variants and 21 that match CRLF rather than current LF sources.
No assurance digest or reviewed content was changed by this integration.

Current public Pages run 32642943588 failed at public entry. Its admission checks
require `target/proof-set-sim-75/manifest.json` before that artifact is generated;
the publication step still selects sim-69. The last successful Pages run is
32497305609 at `0526d86ff5629abbda26affb9bf8666e7bee7088`. Existing public
edition preservation and internal audit ordering need explicit qualification
before deploying the auxiliary inspector. This does not authorize an R5 edition.

These are retained findings, not waived gates. Keep draft work separate from
TRACKER pointers and live-release records until qualification is complete.

After materializing canonical LF bytes for 22 affected checkout files, the frozen
packet and relation-fixture targets pass (seven tests), with no Git blob changes.
The complete audit now passes 80 tests and retains four failures in CLI and
reference_sidecar. The frozen packet identity remains exactly
70190b6e53e8482b37a036f0945b095ac92235bb78333c27f42455c2b27010a9.
The public Pages log confirms the missing sim-75 manifest failure.
