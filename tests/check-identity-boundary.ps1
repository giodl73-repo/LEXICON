$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot

function Read-RepoFile {
    param([string]$Path)
    $fullPath = Join-Path $repoRoot $Path
    if (-not (Test-Path -LiteralPath $fullPath)) {
        throw "Missing required file: $Path"
    }
    Get-Content -LiteralPath $fullPath -Raw
}

function Assert-Contains {
    param(
        [string]$Content,
        [string]$Needle,
        [string]$Label
    )
    $normalizedContent = ($Content -split '\s+') -join ' '
    $normalizedNeedle = ($Needle -split '\s+') -join ' '
    if (-not $normalizedContent.Contains($normalizedNeedle)) {
        throw "$Label missing expected text: $Needle"
    }
}

$agents = Read-RepoFile "AGENTS.md"
$context = Read-RepoFile "CONTEXT.md"
$readme = Read-RepoFile "README.md"
$identity = Read-RepoFile "docs/IDENTITY-AND-CHECKOUT.md"
$pitfalls = Read-RepoFile ".pitfall/lexicon-pitfalls.md"
$invariants = Read-RepoFile ".pitfall/lexicon-invariants.md"
$roles = Read-RepoFile ".roles/ROLE.md"
$wave = Read-RepoFile "context/waves/2026-08-19-formarium-canonical/WAVE.md"
$doctrine = Read-RepoFile "context/waves/2026-08-19-formarium-canonical/FORMARIUM-PITFALL-DOCTRINE-RESULT.md"
$boundaries = Read-RepoFile "docs/pitfall-boundaries.v1.json"

foreach ($content in @($agents, $readme, $identity, $roles, $boundaries)) {
    Assert-Contains $content "LEXICON" "public repo name"
    Assert-Contains $content "Lexicon" "active product name"
    Assert-Contains $content "repos/knowledge-systems/factorium" "local checkout path"
    Assert-Contains $content "Factorium" "historical import name"
}

Assert-Contains $agents "IDENTITY-AND-CHECKOUT.md" "AGENTS identity route"
Assert-Contains $agents "before onboarding" "AGENTS identity route"
Assert-Contains $context "Frozen" "CONTEXT historical import boundary"
Assert-Contains $context "factorium-*" "CONTEXT historical import boundary"
Assert-Contains $context ".factorium" "CONTEXT historical import boundary"
Assert-Contains $context ".factorium-query" "CONTEXT historical import boundary"
Assert-Contains $context "historical imports but are not" "CONTEXT historical import boundary"
Assert-Contains $context "defaults for new work" "CONTEXT historical import boundary"
Assert-Contains $readme "Do not infer active schema, command, publication, or customer-preview targets from the local folder name" "README local path warning"
Assert-Contains $identity "Do not create new active" "identity safe edit rule"
Assert-Contains $identity ".factorium-query" "identity safe edit rule"
Assert-Contains $identity "factorium-*" "identity safe edit rule"
Assert-Contains $identity "Do not rename, move, or rewrite historical Factorium paths solely to make the checkout name match the public repository" "identity custody rule"
Assert-Contains $pitfalls "## FRM-PF-06: Public Name And Local Path Split Confuses Onboarding" "pitfall section"
Assert-Contains $pitfalls "**Status:** MITIGATED" "pitfall status"
Assert-Contains $pitfalls "tests/check-identity-boundary.ps1" "pitfall retained test"
Assert-Contains $invariants "Public Name, Product Name, Local Path, And Historical Imports Stay Separate" "identity invariant"
Assert-Contains $roles "LEXICON/Lexicon onboarding identity" "role PITFALL gate"
Assert-Contains $wave "read compatibility for frozen Factorium envelopes" "wave legacy compatibility"
Assert-Contains $doctrine "FRM-PF-06" "doctrine mitigation"
Assert-Contains $doctrine "is mitigated" "doctrine mitigation"
Assert-Contains $boundaries '"schema": "pitfall-boundaries.v1"' "boundary schema"
Assert-Contains $boundaries "public-name-local-path-and-historical-imports-stay-explicit" "boundary rule"
Assert-Contains $boundaries "Onboarding, simulation, preview, and portfolio handoff docs must present those four surfaces together" "boundary onboarding rule"

Write-Output "LEXICON/Lexicon identity boundary checks passed"
