param(
    [ValidateSet("sim-01", "sim-02", "sim-03", "sim-04", "sim-05", "sim-06", "sim-07", "sim-08", "sim-09", "sim-10", "sim-11", "sim-12", "sim-13", "sim-14", "sim-15", "sim-16", "sim-17", "sim-18", "sim-19", "sim-20", "sim-21", "sim-22", "sim-23", "sim-24", "sim-25", "sim-26", "sim-27", "sim-28", "sim-29", "sim-30", "sim-31", "sim-32", "sim-33", "sim-34", "sim-35", "sim-36", "sim-37", "sim-38", "sim-39", "sim-40", "sim-41", "sim-42", "sim-43", "sim-44", "sim-45", "sim-46", "sim-47", "sim-48", "sim-49", "sim-50", "sim-51", "sim-52", "sim-53", "sim-54", "sim-55", "sim-56", "sim-57", "sim-58", "sim-59", "sim-60", "sim-61", "sim-62", "sim-63", "sim-64", "sim-65", "sim-66", "sim-67", "sim-68", "sim-69", "sim-70", "sim-71", "sim-72", "sim-73", "sim-74", "sim-75")]
    [string]$Edition = "sim-01",
    [string]$OutputDirectory = ""
)

$ErrorActionPreference = "Stop"
$editionNumber = [int]$Edition.Substring(4)

function Get-PointerRegistryRows {
    param(
        [Parameter(Mandatory = $true)]
        [string]$RegistryPath,
        [System.Collections.Generic.HashSet[string]]$Visited = $null
    )

    if ($null -eq $Visited) {
        $Visited = [System.Collections.Generic.HashSet[string]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
    }
    $resolvedRegistry = (Resolve-Path -LiteralPath $RegistryPath).Path
    if (-not $Visited.Add($resolvedRegistry)) {
        throw "Pointer registry inheritance cycle: $resolvedRegistry"
    }
    $registryLines = @((Get-Content -LiteralPath $resolvedRegistry -Raw).TrimEnd() -split '\r?\n')
    if ($registryLines.Count -lt 3) {
        throw "Invalid pointer registry envelope: $resolvedRegistry"
    }
    $expectedEnd = switch ($registryLines[0]) {
        "factorium-pointer-registry-v0" { "end-factorium-pointer-registry" }
        "factorium-pointer-registry-delta-v0" { "end-factorium-pointer-registry" }
        "formarium-pointer-registry-v1" { "end-formarium-pointer-registry" }
        "lexicon-pointer-registry-v1" { "end-lexicon-pointer-registry" }
        "lexicon-pointer-registry-v2" { "end-lexicon-pointer-registry" }
        default { throw "Invalid pointer registry header: $resolvedRegistry" }
    }
    if ($registryLines[-1] -ne $expectedEnd) {
        throw "Invalid pointer registry envelope: $resolvedRegistry"
    }
    if ($registryLines[0] -in @("formarium-pointer-registry-v1", "lexicon-pointer-registry-v1", "lexicon-pointer-registry-v2")) {
        return @($registryLines[1..($registryLines.Count - 2)])
    }
    if ($registryLines[0] -eq "factorium-pointer-registry-v0") {
        return @($registryLines[1..($registryLines.Count - 2)])
    }
    if ($registryLines[0] -ne "factorium-pointer-registry-delta-v0" -or $registryLines.Count -lt 4) {
        throw "Invalid pointer registry header: $resolvedRegistry"
    }
    $extendsMatch = [regex]::Match(
        $registryLines[1],
        '^extends (proof-set-pointer-registry(?:-v[0-9]+)?\.factorium)$'
    )
    if (-not $extendsMatch.Success) {
        throw "Invalid pointer registry extension: $resolvedRegistry"
    }
    $baseRegistry = Join-Path (Split-Path $resolvedRegistry) $extendsMatch.Groups[1].Value
    $baseRows = @(Get-PointerRegistryRows -RegistryPath $baseRegistry -Visited $Visited)
    return @($baseRows) + @($registryLines[2..($registryLines.Count - 2)])
}

$workspace = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$volume = Join-Path $workspace "volumes\01-structure-quantity-choice\VOLUME.md"
$supplement = Join-Path $workspace "volumes\01-structure-quantity-choice\FACTOR-FORGE-SIM-SUPPLEMENT.md"
$v1Supplement = Join-Path $workspace "volumes\01-structure-quantity-choice\GPC-09-V1-SIM-SUPPLEMENT.md"
$v1Tasks = Join-Path $workspace "volumes\01-structure-quantity-choice\GPC-09-V1-SIM-TASKS.md"
$v1Rubric = Join-Path $workspace "volumes\01-structure-quantity-choice\GPC-09-V1-SIM-RUBRIC.md"
$v2Supplement = Join-Path $workspace "volumes\01-structure-quantity-choice\V2-ROLLING-SIM-SUPPLEMENT.md"
$v2Tasks = Join-Path $workspace "volumes\01-structure-quantity-choice\V2-ROLLING-SIM-TASKS.md"
$v2Rubric = Join-Path $workspace "volumes\01-structure-quantity-choice\V2-ROLLING-SIM-RUBRIC.md"
$candidateAdmissionSupplement = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-CANDIDATE-ADMISSION-SUPPLEMENT.md"
$candidateAdmissionTasks = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-CANDIDATE-ADMISSION-TASKS.md"
$candidateAdmissionRubric = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-CANDIDATE-ADMISSION-RUBRIC.md"
$domainExpansionSupplement = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-DOMAIN-EXPANSION-SUPPLEMENT.md"
$domainExpansionTasks = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-DOMAIN-EXPANSION-TASKS.md"
$domainExpansionRubric = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-DOMAIN-EXPANSION-RUBRIC.md"
$roadmapWave1Supplement = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-1-SUPPLEMENT.md"
$roadmapWave1Tasks = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-1-TASKS.md"
$roadmapWave1Rubric = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-1-RUBRIC.md"
$roadmapWave2Supplement = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-2-SUPPLEMENT.md"
$roadmapWave2Tasks = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-2-TASKS.md"
$roadmapWave2Rubric = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-2-RUBRIC.md"
$roadmapWave3Supplement = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-3-SUPPLEMENT.md"
$roadmapWave3Tasks = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-3-TASKS.md"
$roadmapWave3Rubric = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-3-RUBRIC.md"
$roadmapWave4Supplement = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-4-SUPPLEMENT.md"
$roadmapWave4Tasks = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-4-TASKS.md"
$roadmapWave4Rubric = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-4-RUBRIC.md"
$roadmapWave5Supplement = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-5-SUPPLEMENT.md"
$roadmapWave5Tasks = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-5-TASKS.md"
$roadmapWave5Rubric = Join-Path $workspace "volumes\01-structure-quantity-choice\LEXICON-ROADMAP-WAVE-5-RUBRIC.md"
$pointerRegistryV0 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry.factorium"
$pointerRegistryV1 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v1.factorium"
$pointerRegistryV2 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v2.factorium"
$pointerRegistryV3 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v3.factorium"
$pointerRegistryV4 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v4.factorium"
$pointerRegistryV5 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v5.factorium"
$pointerRegistryV6 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v6.factorium"
$pointerRegistryV7 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v7.factorium"
$pointerRegistryV8 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v8.factorium"
$pointerRegistryV9 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v9.factorium"
$pointerRegistryV10 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v10.factorium"
$pointerRegistryV11 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v11.factorium"
$pointerRegistryV12 = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointer-registry-v12.factorium"
$formariumPointerRegistryV1 = Join-Path $workspace "volumes\01-structure-quantity-choice\formarium-pointer-registry-v1.formarium"
$lexiconPointerRegistryV1 = Join-Path $workspace "volumes\01-structure-quantity-choice\lexicon-pointer-registry-v1.lexicon"
$lexiconPointerRegistryV2 = Join-Path $workspace "volumes\01-structure-quantity-choice\lexicon-pointer-registry-v2.lexicon"
$pointerRegistry = if ($editionNumber -ge 68) {
    $lexiconPointerRegistryV2
}
elseif ($editionNumber -ge 67) {
    $lexiconPointerRegistryV1
}
elseif ($editionNumber -ge 66) {
    $formariumPointerRegistryV1
}
elseif ($editionNumber -ge 64) {
    $pointerRegistryV12
}
elseif ($editionNumber -ge 63) {
    $pointerRegistryV11
}
elseif ($editionNumber -ge 62) {
    $pointerRegistryV10
}
elseif ($editionNumber -ge 61) {
    $pointerRegistryV9
}
elseif ($editionNumber -ge 60) {
    $pointerRegistryV8
}
elseif ($editionNumber -ge 59) {
    $pointerRegistryV7
}
elseif ($editionNumber -ge 58) {
    $pointerRegistryV6
}
elseif ($editionNumber -ge 57) {
    $pointerRegistryV5
}
elseif ($editionNumber -ge 56) {
    $pointerRegistryV4
}
elseif ($editionNumber -ge 55) {
    $pointerRegistryV3
}
elseif ($editionNumber -ge 54) {
    $pointerRegistryV2
}
elseif ($editionNumber -ge 53) {
    $pointerRegistryV1
}
else {
    $pointerRegistryV0
}
$expectedPointerCount = if ($editionNumber -ge 68) { 270 } elseif ($editionNumber -ge 64) { 250 } elseif ($editionNumber -ge 63) { 240 } elseif ($editionNumber -ge 62) { 220 } elseif ($editionNumber -ge 61) { 200 } elseif ($editionNumber -ge 60) { 180 } elseif ($editionNumber -ge 59) { 160 } elseif ($editionNumber -ge 58) { 140 } elseif ($editionNumber -ge 57) { 120 } elseif ($editionNumber -ge 56) { 100 } elseif ($editionNumber -ge 55) { 80 } elseif ($editionNumber -ge 54) { 60 } elseif ($editionNumber -ge 53) { 40 } else { 20 }
$factorForgeTasks = Join-Path $workspace "volumes\01-structure-quantity-choice\FACTOR-FORGE-SIM-TASKS.md"
$factorForgeRubric = Join-Path $workspace "volumes\01-structure-quantity-choice\FACTOR-FORGE-SIM-RUBRIC.md"
$quickstart = Join-Path $workspace "volumes\01-structure-quantity-choice\PROOF-SET-SIM-QUICKSTART.md"
$bookOneGuide = Join-Path $workspace "guides\bounded-question-composition-book-one.md"
$bookOneQuickstart = Join-Path $workspace "volumes\01-structure-quantity-choice\BOOK-ONE-SIM-QUICKSTART.md"
$bookOneTasks = Join-Path $workspace "volumes\01-structure-quantity-choice\BOOK-ONE-SIM-TASKS.md"
$bookOneFeedback = Join-Path $workspace "volumes\01-structure-quantity-choice\BOOK-ONE-PREVIEW-FEEDBACK-TEMPLATE.md"
$bookOneCandidateManifest = Join-Path $workspace "volumes\01-structure-quantity-choice\book-one-sim-candidate-v0.factorium"
$compositionWorksheet = Join-Path $workspace "guides\system-dependency-composition-worksheet.md"
$evidenceWorksheet = Join-Path $workspace "guides\latency-evidence-composition-worksheet.md"
$feedbackWorksheet = Join-Path $workspace "guides\alert-feedback-composition-worksheet.md"
$conflictWorksheet = Join-Path $workspace "guides\dependency-exclusion-conflict-worksheet.md"
$frontierWorksheet = Join-Path $workspace "guides\delegated-compliance-frontier-worksheet.md"
$decisionChoiceGuide = Join-Path $workspace "guides\evidence-informed-intervention-choice.md"
$queryExtension = if ($editionNumber -ge 67) { "lexicon-query" } elseif ($editionNumber -ge 66) { "formarium-query" } else { "factorium-query" }
$decisionCombinedTrace = Join-Path $workspace "fixtures\composition\decision-bridge-closure.$queryExtension"
$compositionLabAllowlist = if ($editionNumber -ge 67) {
    Join-Path $workspace "volumes\01-structure-quantity-choice\lexicon-composition-lab-relations.lexicon"
}
elseif ($editionNumber -ge 66) {
    Join-Path $workspace "volumes\01-structure-quantity-choice\formarium-composition-lab-relations.formarium"
}
else {
    Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-lab-relations.factorium"
}
$compositionLabSpec = Join-Path $workspace "specs\COMPOSITION-LAB.md"
$compositionReadingSpec = Join-Path $workspace "specs\COMPOSITION-READING-ROUTE.md"
$compositionFocusSpec = Join-Path $workspace "specs\COMPOSITION-FACTOR-FOCUS.md"
$compositionPaletteSpec = Join-Path $workspace "specs\COMPOSITION-PALETTE.md"
$compositionViewsSpec = Join-Path $workspace "specs\COMPOSITION-READER-VIEWS.md"
$compositionMapSpec = Join-Path $workspace "specs\COMPOSITION-CLOSURE-MAP.md"
$compositionStartersSpec = Join-Path $workspace "specs\COMPOSITION-AUTHORED-STARTERS.md"
$compositionQueryPlanSpec = Join-Path $workspace "specs\COMPOSITION-QUERY-PLAN.md"
$compositionWorkBudgetSpec = Join-Path $workspace "specs\COMPOSITION-WORK-BUDGET.md"
$compositionReconciliationSpec = Join-Path $workspace "specs\COMPOSITION-RESULT-RECONCILIATION.md"
$compositionContinuationsSpec = Join-Path $workspace "specs\COMPOSITION-EXPLICIT-CONTINUATIONS.md"
$compositionRerunComparisonSpec = Join-Path $workspace "specs\COMPOSITION-RERUN-COMPARISON.md"
$compositionGuideSpec = Join-Path $workspace "specs\COMPOSITION-GUIDE-SKELETON.md"
$compositionEvaluationSpec = Join-Path $workspace "specs\COMPOSITION-EVALUATION-RECORD.md"
$decisionEvidenceReadingSpec = Join-Path $workspace "specs\DECISION-EVIDENCE-READING-ROUTE.md"
$decisionCombinedClosureSpec = Join-Path $workspace "specs\DECISION-BRIDGE-COMBINED-CLOSURE.md"
$compositionTraces = @(
    (Join-Path $workspace "fixtures\composition\system-dependency.$queryExtension"),
    (Join-Path $workspace "fixtures\composition\latency-evidence.$queryExtension"),
    (Join-Path $workspace "fixtures\composition\alert-feedback.$queryExtension"),
    (Join-Path $workspace "fixtures\composition\dependency-exclusion-conflict.$queryExtension"),
    (Join-Path $workspace "fixtures\composition\delegated-compliance-frontier.$queryExtension")
)
$compositionStarterTitles = @(
    "System dependency",
    "Claim and evidence",
    "Feedback and outcome",
    "Required-interface conflict",
    "Delegated compliance frontier"
)
$style = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set.css"
$searchStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-search.css"
$searchScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-search.js"
$candidateSearchScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-search-candidate.js"
$familySearchScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-search-families.js"
$familySearchStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-search-families.css"
$searchCueScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-search-cue.js"
$searchCueStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-search-cue.css"
$lookupAliasesScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-lookup-aliases.js"
$lookupAliasesStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-lookup-aliases.css"
$scaleChooserScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-scale-chooser.js"
$scaleChooserStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-scale-chooser.css"
if ($editionNumber -ge 30) {
    $searchScript = $candidateSearchScript
}
if ($editionNumber -ge 33) {
    $searchScript = $familySearchScript
}
$readerStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-reader.css"
$readerScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-reader.js"
$contextStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-context.css"
$contextScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-context.js"
$siteStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-site.css"
$candidateSiteStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-candidate.css"
$twoBookSiteStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-two-book.css"
$intentRouterStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-intent-router.css"
$handoffStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-handoff.css"
$handoffScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-handoff.js"
$dualLookupStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-dual-lookup.css"
$dualLookupScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-dual-lookup.js"
$tableNavigatorStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-table-navigator.css"
$tableFamilyContentsStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-table-family-contents.css"
$tablesIndexStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-tables-index.css"
$readerRouteStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-reader-route.css"
$readerSequenceStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-reader-sequence.css"
$pointerStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointers.css"
$pointerScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-pointers.js"
$dictionaryStreamScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-dictionary-stream.js"
$compositionStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition.css"
$conflictStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-conflict.css"
$frontierStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-frontier.css"
$explorerStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-explorer.css"
$labStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-lab.css"
$labScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-lab.js"
$compositionReadingStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-reading.css"
$compositionReadingScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-reading.js"
$compositionFocusStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-focus.css"
$compositionPaletteStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-palette.css"
$compositionPaletteScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-palette.js"
$compositionViewsStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-views.css"
$compositionViewsScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-views.js"
$compositionMapStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-map.css"
$compositionMapScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-map.js"
$compositionStartersStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-starters.css"
$compositionStartersScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-starters.js"
$compositionQueryPlanStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-query-plan.css"
$compositionQueryPlanScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-query-plan.js"
$compositionReconciliationStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-reconciliation.css"
$compositionReconciliationScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-reconciliation.js"
$compositionContinuationsStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-continuations.css"
$compositionContinuationsScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-continuations.js"
$compositionRerunComparisonStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-rerun-comparison.css"
$compositionRerunComparisonScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-rerun-comparison.js"
$compositionGuideStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-guide.css"
$compositionGuideScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-guide.js"
$compositionEvaluationStyle = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-evaluation.css"
$compositionEvaluationScript = Join-Path $workspace "volumes\01-structure-quantity-choice\proof-set-composition-evaluation.js"
$contextBindings = Join-Path $workspace "volumes\01-structure-quantity-choice\CONTEXT-PROFILE-SIM-BINDINGS.md"
$contextProfileSources = @(
    (Join-Path $workspace "tables\context-profiles\newtonian-mechanics.md"),
    (Join-Path $workspace "tables\context-profiles\governed-organization.md"),
    (Join-Path $workspace "tables\context-profiles\versioned-software-system.md")
)
$volumeDirectory = Split-Path $volume
$artifactName = "proof-set-$Edition"
$artifactTitle = switch ($Edition) {
    "sim-01" { "Factorium Proof Set Simulation 01" }
    "sim-02" { "Factorium Proof Set Expanded Simulation 02" }
    "sim-03" { "Factorium Proof Set Factor Forge Task Simulation 03" }
    "sim-04" { "Factorium Proof Set Search Simulation 04" }
    "sim-05" { "Factorium Proof Set Adaptive Reader Simulation 05" }
    "sim-06" { "Factorium Proof Set Context Profile Simulation 06" }
    "sim-07" { "Factorium Proof Set Book Site Simulation 07" }
    "sim-08" { "Factorium Proof Set Reader Journey Simulation 08" }
    "sim-09" { "Factorium Proof Set Composition Worksheet Simulation 09" }
    "sim-10" { "Factorium Proof Set Cross-Domain Composition Simulation 10" }
    "sim-11" { "Factorium Proof Set Incomplete Feedback Composition Simulation 11" }
    "sim-12" { "Factorium Proof Set Problem-Led Reading Simulation 12" }
    "sim-13" { "Factorium Proof Set Subtract Conflict Simulation 13" }
    "sim-14" { "Factorium Proof Set Truncated Frontier Simulation 14" }
    "sim-15" { "Factorium Proof Set Composition Explorer Simulation 15" }
    "sim-16" { "Factorium Proof Set Bounded Composition Lab Simulation 16" }
    "sim-17" { "Factorium Proof Set Closure Reading Route Simulation 17" }
    "sim-18" { "Factorium Proof Set Exact Factor Focus Simulation 18" }
    "sim-19" { "Factorium Proof Set Progressive Concept Palette Simulation 19" }
    "sim-20" { "Factorium Proof Set Composition Reader Views Simulation 20" }
    "sim-21" { "Factorium Proof Set Composition Closure Map Simulation 21" }
    "sim-22" { "Factorium Proof Set Authored Composition Starters Simulation 22" }
    "sim-23" { "Factorium Proof Set Composition Query Plan Simulation 23" }
    "sim-24" { "Factorium Proof Set Composition Work Budget Simulation 24" }
    "sim-25" { "Factorium Proof Set Result Reconciliation Simulation 25" }
    "sim-26" { "Factorium Proof Set Explicit Continuations Simulation 26" }
    "sim-27" { "Factorium Proof Set Composition Rerun Comparison Simulation 27" }
    "sim-28" { "Factorium Proof Set Factor Guide Skeleton Simulation 28" }
    "sim-29" { "Factorium Proof Set Local Evaluation Record Simulation 29" }
    "sim-30" { "Factorium Book One Internal Preview Simulation 30" }
    "sim-31" { "Factorium Two-Book Product Architecture Simulation 31" }
    "sim-32" { "Factorium Tables Navigator Simulation 32" }
    "sim-33" { "Factorium Canonical-Family Search Simulation 33" }
    "sim-34" { "Factorium Canonical-Family Contents Simulation 34" }
    "sim-35" { "Factorium Tables Alphabetical Index Simulation 35" }
    "sim-36" { "Factorium Reader Route Simulation 36" }
    "sim-37" { "Factorium Reader Sequence Simulation 37" }
    "sim-38" { "Factorium Reader Primary Start Simulation 38" }
    "sim-39" { "Factorium Reader Terminal Handoff Simulation 39" }
    "sim-40" { "Factorium Everyday Search Cue Simulation 40" }
    "sim-41" { "Factorium Subject-Object Canonical Depth Simulation 41" }
    "sim-42" { "Factorium Query-Led Limiting Condition Simulation 42" }
    "sim-43" { "Factorium Task-Shaped Intent Router Simulation 43" }
    "sim-44" { "Factorium Ephemeral Handoff Note Simulation 44" }
    "sim-45" { "Factorium Dual Literal Lookup Simulation 45" }
    "sim-46" { "Factorium Reciprocal Table Connections Simulation 46" }
    "sim-47" { "Factorium Lexical Lookup Aliases Simulation 47" }
    "sim-48" { "Factorium Scale Meaning Chooser Simulation 48" }
    "sim-49" { "Factorium Meaning and Custody V1 Integration Simulation 49" }
    "sim-50" { "Factorium Rolling V2 Content Integration Simulation 50" }
    "sim-51" { "Tabula Facta Reversible Identity Preview Simulation 51" }
    "sim-52" { "Factorium Pointer Entry Concordance Simulation 52" }
    "sim-53" { "Factorium Pointer Entry Expansion Simulation 53" }
    "sim-54" { "Factorium Pointer Entry Expansion Simulation 54" }
    "sim-55" { "Factorium Pointer Entry Expansion Simulation 55" }
    "sim-56" { "Factorium Pointer Entry Expansion Simulation 56" }
    "sim-57" { "Factorium Pointer Entry Expansion Simulation 57" }
    "sim-58" { "Factorium Pointer Entry Expansion Simulation 58" }
    "sim-59" { "Factorium Pointer Entry Expansion Simulation 59" }
    "sim-60" { "Factorium Pointer Entry Expansion Simulation 60" }
    "sim-61" { "Factorium Pointer Entry Expansion Simulation 61" }
    "sim-62" { "Factorium Pointer Entry Expansion Simulation 62" }
    "sim-63" { "Factorium Pointer Entry Expansion Simulation 63" }
    "sim-64" { "Factorium Pointer Entry Concordance Closeout Simulation 64" }
    "sim-65" { "Formarium Public Identity Feedback Simulation 65" }
    "sim-66" { "Formarium Canonical Contract Simulation 66" }
    "sim-67" { "Lexicon Canonical Rename Simulation 67" }
    "sim-68" { "Lexicon Candidate Canonical Merge Simulation 68" }
    "sim-69" { "Lexicon Editorial Domain Expansion Simulation 69" }
    "sim-70" { "Lexicon Social and Normative Foundations Simulation 70" }
    "sim-71" { "Lexicon Politics Government and Law Simulation 71" }
    "sim-72" { "Lexicon Formal Reasoning and Mathematics Simulation 72" }
    "sim-73" { "Lexicon Health Disability Treatment and Care Simulation 73" }
    "sim-74" { "Lexicon Language Culture Arts and Aesthetics Simulation 74" }
    "sim-75" { "Lexicon Funded Domain Reconciliation Simulation 75" }
}

$tabulaIdentityPreview = $editionNumber -eq 51
$formariumIdentityPreview = $editionNumber -eq 65
$lexiconIdentity = $editionNumber -ge 67
$formariumIdentity = ($editionNumber -ge 65) -and (-not $lexiconIdentity)
$identityPreview = $tabulaIdentityPreview -or $formariumIdentityPreview
$publicationName = if ($lexiconIdentity) { "Lexicon" } elseif ($formariumIdentity) { "Formarium" } elseif ($tabulaIdentityPreview) { "Tabula Facta" } else { "Factorium" }
$tablesPublicationName = if ($lexiconIdentity) { "Lexicon" } elseif ($formariumIdentity) { "Formarium Tables" } elseif ($tabulaIdentityPreview) { "Tabula Facta" } else { "Factorium Tables" }
$readerPublicationName = if ($lexiconIdentity) { "Lexicon Reader" } elseif ($formariumIdentity) { "The Formarium Reader" } else { "The Factorium Reader" }
$repositoryName = if ($lexiconIdentity) { "LEXICON" } elseif ($formariumIdentity) { "FORMARIUM" } else { "FACTORIUM" }
$readerAdditionalRecordCount = if ($editionNumber -ge 74) { 199 } elseif ($editionNumber -ge 73) { 190 } elseif ($editionNumber -ge 72) { 185 } elseif ($editionNumber -ge 71) { 179 } elseif ($editionNumber -ge 70) { 173 } elseif ($editionNumber -ge 69) { 167 } elseif ($editionNumber -ge 50) { 157 } elseif ($editionNumber -ge 49) { 154 } else { 151 }
$contentLicenseNotice = if ($editionNumber -ge 66) {
    ' · Content &copy; 2026 Gio Della-Libera · <a rel="license" href="https://creativecommons.org/licenses/by-nc/4.0/">CC BY-NC 4.0</a>'
}
else {
    ""
}
$siteBrand = if ($lexiconIdentity) {
    'Lexicon'
}
elseif ($formariumIdentityPreview) {
    'Formarium <span class="identity-candidate">feedback preview</span>'
}
elseif ($formariumIdentity) {
    'Formarium'
}
elseif ($tabulaIdentityPreview) {
    'Tabula Facta <span class="identity-candidate">candidate</span>'
}
else {
    'Factorium'
}
$identityPreviewStyle = if ($identityPreview) {
    @'
<style>
.identity-candidate{display:inline-block;margin-left:.45rem;padding:.12rem .4rem;border:1px solid currentColor;border-radius:999px;font:600 .62rem/1.2 system-ui,sans-serif;letter-spacing:.08em;text-transform:uppercase;vertical-align:.15rem}
.identity-preview{margin:0;padding:.7rem max(1rem,calc((100vw - 72rem)/2));background:#f4ead7;border-bottom:1px solid #ceb98e;color:#493b25;font:600 .78rem/1.4 system-ui,sans-serif;letter-spacing:.025em;text-align:center}
</style>
'@
}
else {
    ''
}
$identityPreviewBanner = if ($formariumIdentityPreview) {
    '<aside class="identity-preview" aria-label="Public identity feedback status"><strong>Formarium</strong> is the public feedback identity. Factorium schema names, file formats, and canonical IDs remain compatibility internals.</aside>'
}
elseif ($tabulaIdentityPreview) {
    '<aside class="identity-preview" aria-label="Candidate identity status">Identity preview - <strong>Tabula Facta</strong> is a candidate name for Factorium Tables, not a locked rename.</aside>'
}
else {
    ''
}

function ConvertTo-Sim23CompositionAsset {
    param([string]$Name, [string]$Text)
    if ($Name -eq "lab") {
        $Text = $Text.Replace('[["depth", 1, 6], ["edges", 1, 6], ["nodes", 3, 24]' + "`n" +
            '      // SIM24-WORK-RULE' + "`n" + '      , ["work", 3, 64]' + "`n" + '    ].forEach',
            '[["depth", 1, 6], ["edges", 1, 6], ["nodes", 3, 24]].forEach')
        $Text = $Text.Replace('budget: { depth: budget.depth, edges: budget.edges, nodes: budget.nodes,' + "`n" +
            '        // SIM24-WORK-NORMALIZED' + "`n" + '        work: budget.work },',
            'budget: { depth: budget.depth, edges: budget.edges, nodes: budget.nodes },')
        $Text = [regex]::Replace($Text, '(?s)\n    // SIM24-WORK-SEED-FLOOR.*?\n    }\n\n    var admitted', "`n`n    var admitted")
        $Text = [regex]::Replace($Text, '(?s)          // SIM24-WORK-FRONTIER\n.*?          frontiers\.push', '          frontiers.push')
        $Text = [regex]::Replace($Text, '(?s)\n        // SIM24-WORK-ATOMIC\n.*?\n        admitted\.add', "`n        admitted.add")
        $Text = $Text.Replace("`n    // SIM24-WORK-ASSERT`n    assert(work <= normalized.budget.work, `"Work budget exceeded`");", "")
        $Text = $Text.Replace('nodes: Number(form.elements.nodes.value),' + "`n" +
            '            // SIM24-WORK-FORM' + "`n" + '            work: Number(form.elements.work.value)',
            'nodes: Number(form.elements.nodes.value)')
        $Text = $Text.Replace('["Edges", result.graph.edges.length],' + "`n" +
            '      // SIM24-WORK-DISPLAY' + "`n" +
            '      ["Work used / cap", result.work + " / " + result.request.budget.work]',
            '["Edges", result.graph.edges.length], ["Work", result.work]')
    }
    elseif ($Name -eq "plan") {
        $Text = [regex]::Replace($Text, '\n    // SIM24-WORK-DIAGNOSTIC\n    if \(!Number\.isInteger\(budget\.work\).*?;', '')
        $Text = $Text.Replace('nodes: budget.nodes,' + "`n" + '        // SIM24-WORK-BOUND' + "`n" + '        work: budget.work', 'nodes: budget.nodes')
        $Text = $Text.Replace('" · edges " + plan.bound.edges + " · nodes " + plan.bound.nodes +' + "`n" +
            '        // SIM24-WORK-DISPLAY' + "`n" + '        " · work " + plan.bound.work',
            '" · edges " + plan.bound.edges + " · nodes " + plan.bound.nodes')
        $Text = $Text.Replace('nodes: Number(form.elements.nodes.value),' + "`n" +
            '            // SIM24-WORK-FORM' + "`n" + '            work: Number(form.elements.work.value)',
            'nodes: Number(form.elements.nodes.value)')
    }
    elseif ($Name -eq "starters") {
        $Text = [regex]::Replace($Text, '(?s)\n      // SIM24-WORK-VALIDATION\n      if \(Object\.prototype.*?\n      }', '')
        $Text = [regex]::Replace($Text, '(?s)\n      // SIM24-WORK-LOAD\n      if \(form\.elements\.work.*?\n      }', '')
    }
    return $Text
}
if ([string]::IsNullOrWhiteSpace($OutputDirectory)) {
    $OutputDirectory = "target\$artifactName"
}
$output = [System.IO.Path]::GetFullPath((Join-Path $workspace $OutputDirectory))
$html = Join-Path $output "$artifactName.html"
$manifest = Join-Path $output "manifest.json"
$searchIndexOutput = Join-Path $output "search-index.json"

$pandoc = Get-Command pandoc -ErrorAction Stop
$excludedNames = [System.Collections.Generic.HashSet[string]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)
@(
    "USABILITY-PROTOCOL.md",
    "READER-PACKET.md",
    "EVALUATOR-RUBRIC.md",
    "OBSERVATIONS.md",
    "FACTOR-FORGE-SIM-RUBRIC.md"
) | ForEach-Object { [void]$excludedNames.Add($_) }

$sources = [System.Collections.Generic.List[string]]::new()
$seen = [System.Collections.Generic.HashSet[string]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)

function Add-ProofSource {
    param([string]$Path)

    $fullPath = [System.IO.Path]::GetFullPath($Path)
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        throw "Missing proof source: $fullPath"
    }
    if ($seen.Add($fullPath)) {
        $sources.Add($fullPath)
    }
}

function Get-CompositionTraceSummary {
    param(
        [string]$Path,
        [string]$Worksheet
    )

    $text = Get-Content -LiteralPath $Path -Raw
    if ($text.Contains("`r") -or -not $text.EndsWith("`n")) {
        throw "Composition trace is not canonical LF text: $Path"
    }
    $lines = @($text.TrimEnd("`n").Split("`n"))
    $expectedQueryHeader = if ($editionNumber -ge 67) {
        "lexicon-composition-query-v2"
    }
    elseif ($editionNumber -ge 66) {
        "formarium-composition-query-v1"
    }
    else {
        "factorium-composition-query-v0"
    }
    if ($lines[0] -ne $expectedQueryHeader -or $lines[-1] -ne "end-query") {
        throw "Composition trace has an invalid envelope: $Path"
    }

    function Single-Record {
        param([string]$Prefix)

        $matches = @($lines | Where-Object { $_.StartsWith($Prefix, [System.StringComparison]::Ordinal) })
        if ($matches.Count -ne 1) {
            throw "Composition trace requires one '$Prefix' record: $Path"
        }
        return $matches[0].Substring($Prefix.Length)
    }

    function Repeated-Records {
        param([string]$Prefix)

        return @($lines |
            Where-Object { $_.StartsWith($Prefix, [System.StringComparison]::Ordinal) } |
            ForEach-Object { $_.Substring($Prefix.Length) })
    }

    $budget = [ordered]@{}
    foreach ($pair in (Single-Record "budget ").Split(",")) {
        $parts = $pair.Split("=", 2)
        if ($parts.Count -ne 2) {
            throw "Composition trace has an invalid budget pair: $Path"
        }
        $budget[$parts[0]] = [int]$parts[1]
    }
    foreach ($key in @("depth", "edges", "nodes", "work")) {
        if (-not $budget.Contains($key)) {
            throw "Composition trace budget omits '$key': $Path"
        }
    }

    $policy = [ordered]@{}
    foreach ($pair in (Single-Record "policy ").Split(",")) {
        $parts = $pair.Split("=", 2)
        if ($parts.Count -ne 2) {
            throw "Composition trace has an invalid policy pair: $Path"
        }
        $policy[$parts[0]] = $parts[1]
    }

    $source = (Single-Record "source ") -split ' \| '
    if ($source.Count -ne 2) {
        throw "Composition trace has an invalid source record: $Path"
    }
    $referencePath = if ($editionNumber -ge 67) {
        Join-Path $workspace "reference\lexicon-reference-v4.lexicon"
    }
    elseif ($editionNumber -ge 66) {
        Join-Path $workspace "reference\formarium-reference-v3.formarium"
    }
    else {
        Join-Path $workspace "reference\factorium-reference-v0.factorium"
    }
    $relationsPath = if ($editionNumber -ge 67) {
        Join-Path $workspace "reference\lexicon-relations-v2.lexicon"
    }
    elseif ($editionNumber -ge 66) {
        Join-Path $workspace "reference\formarium-relations-v1.formarium"
    }
    else {
        Join-Path $workspace "reference\factorium-relations-v0.factorium"
    }
    $referenceHash = (Get-FileHash -LiteralPath $referencePath -Algorithm SHA256).Hash.ToLowerInvariant()
    $relationsHash = (Get-FileHash -LiteralPath $relationsPath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($source[0] -ne $referenceHash -or $source[1] -ne $relationsHash) {
        throw "Composition trace source digest drift: $Path"
    }

    $seeds = @(Repeated-Records "seed ")
    $nodes = @(Repeated-Records "node ")
    $edges = @(Repeated-Records "edge ")
    $frontiers = @(Repeated-Records "frontier ")
    $conflicts = @(Repeated-Records "conflict ")
    $checks = @(Repeated-Records "check ")
    $projections = @(Repeated-Records "projection ")
    $actualWork = $seeds.Count + $nodes.Count + $edges.Count + $frontiers.Count +
        $conflicts.Count + $checks.Count + $projections.Count
    if ($actualWork -ne $budget.work -or $nodes.Count -gt $budget.nodes -or $edges.Count -gt $budget.edges) {
        throw "Composition trace budget accounting drift: $Path"
    }

    $worksheetTracePath = if ($editionNumber -ge 67) {
        $Path.Replace(".lexicon-query", ".factorium-query")
    }
    elseif ($editionNumber -ge 66) {
        $Path.Replace(".formarium-query", ".factorium-query")
    }
    else {
        $Path
    }
    $worksheetTraceSha256 = (Get-FileHash -LiteralPath $worksheetTracePath -Algorithm SHA256).Hash.ToLowerInvariant()
    if (-not (Get-Content -LiteralPath $Worksheet -Raw).Contains($worksheetTraceSha256)) {
        throw "Composition worksheet omits exact trace identity: $Worksheet"
    }

    return [ordered]@{
        path = [System.IO.Path]::GetFullPath($Path)
        worksheet = [System.IO.Path]::GetFullPath($Worksheet)
        id = Single-Record "query "
        problem = Single-Record "problem "
        context = Single-Record "context "
        direction = $policy.direction
        budget = $budget
        seeds = $seeds
        nodes = $nodes
        edges = $edges
        frontiers = $frontiers
        conflicts = $conflicts
        checks = $checks
        projections = $projections
        state = Single-Record "state "
        sha256 = $sha256
    }
}

function Get-WorkspaceMarkdownPathSet {
    param([string]$Document)

    $documentDirectory = Split-Path $Document
    $documentText = Get-Content -LiteralPath $Document -Raw
    $paths = [System.Collections.Generic.HashSet[string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    [regex]::Matches($documentText, '\[[^\]]+\]\(([^)#]+\.md)(?:#[^)]+)?\)') |
        ForEach-Object {
            $target = [System.IO.Path]::GetFullPath(
                (Join-Path $documentDirectory $_.Groups[1].Value)
            )
            if ($target.StartsWith($workspace, [System.StringComparison]::OrdinalIgnoreCase)) {
                $relativeTarget = [System.IO.Path]::GetRelativePath($workspace, $target).Replace("\", "/")
                [void]$paths.Add($relativeTarget)
            }
        }
    return ,$paths
}

function Get-NumberedSelections {
    param([string]$Document)

    $documentDirectory = Split-Path $Document
    $documentText = Get-Content -LiteralPath $Document -Raw
    foreach ($match in [regex]::Matches(
        $documentText,
        '(?m)^\d+\. \[([^\]]+)\]\(([^)#]+\.md)(?:#[^)]+)?\)'
    )) {
        [ordered]@{
            title = $match.Groups[1].Value
            path = [System.IO.Path]::GetFullPath(
                (Join-Path $documentDirectory $match.Groups[2].Value)
            )
        }
    }
}

function Get-GuideSelections {
    $volumeText = Get-Content -LiteralPath $volume -Raw
    foreach ($match in [regex]::Matches(
        $volumeText,
        '(?m)^- \[([^\]]+ Guide)\]\((\.\./\.\./guides/[^)#]+\.md)\)'
    )) {
        [ordered]@{
            title = $match.Groups[1].Value
            path = [System.IO.Path]::GetFullPath(
                (Join-Path $volumeDirectory $match.Groups[2].Value)
            )
        }
    }
    if ($editionNumber -ge 9) {
        [ordered]@{
            title = "Report Generator Dependency Composition Worksheet"
            path = [System.IO.Path]::GetFullPath($compositionWorksheet)
        }
    }
    if ($editionNumber -ge 10) {
        [ordered]@{
            title = "Latency Claim Evidence Composition Worksheet"
            path = [System.IO.Path]::GetFullPath($evidenceWorksheet)
        }
    }
    if ($editionNumber -ge 11) {
        [ordered]@{
            title = "Alert and Outcome Feedback Composition Worksheet"
            path = [System.IO.Path]::GetFullPath($feedbackWorksheet)
        }
    }
    if ($editionNumber -ge 13) {
        [ordered]@{
            title = "Dependency Exclusion Conflict Composition Worksheet"
            path = [System.IO.Path]::GetFullPath($conflictWorksheet)
        }
    }
    if ($editionNumber -ge 14) {
        [ordered]@{
            title = "Delegated Compliance Frontier Composition Worksheet"
            path = [System.IO.Path]::GetFullPath($frontierWorksheet)
        }
    }
    if ($editionNumber -ge 29) {
        [ordered]@{
            title = "Evidence-Informed Intervention Choice Guide"
            path = [System.IO.Path]::GetFullPath($decisionChoiceGuide)
        }
    }
    if ($editionNumber -ge 30) {
        [ordered]@{
            title = if ($editionNumber -ge 31) { "$readerPublicationName Quickstart" } else { "Book One Candidate Quickstart" }
            path = [System.IO.Path]::GetFullPath($bookOneQuickstart)
        }
    }
}

function Get-SiteChapterSelections {
    param([string]$Document)

    $documentDirectory = Split-Path $Document
    $documentText = Get-Content -LiteralPath $Document -Raw
    $chapterMatches = [regex]::Matches(
        $documentText,
        '(?m)^## Part ([IVX]+) - (.+)$'
    )
    for ($chapterIndex = 0; $chapterIndex -lt $chapterMatches.Count; $chapterIndex++) {
        $chapterMatch = $chapterMatches[$chapterIndex]
        $chapterEnd = if ($chapterIndex -lt $chapterMatches.Count - 1) {
            $chapterMatches[$chapterIndex + 1].Index
        }
        else {
            $documentText.Length
        }
        $chapterText = $documentText.Substring($chapterMatch.Index, $chapterEnd - $chapterMatch.Index)
        $selectionPattern = '(?m)^\d+\. \[[^\]]+\]\(([^)#]+\.md)(?:#[^)]+)?\)'
        $chapterPaths = @(
            foreach ($selectionMatch in [regex]::Matches($chapterText, $selectionPattern)) {
                [System.IO.Path]::GetFullPath(
                    (Join-Path $documentDirectory $selectionMatch.Groups[1].Value)
                )
            }
        )
        $chapterGroups = [System.Collections.Generic.List[object]]::new()
        $groupMatches = [regex]::Matches($chapterText, '(?m)^### (.+)$')
        if ($groupMatches.Count -eq 0) {
            $chapterGroups.Add([ordered]@{
                title = "Chapter records"
                paths = $chapterPaths
            })
        }
        else {
            $firstGroupText = $chapterText.Substring(0, $groupMatches[0].Index)
            $ungroupedPaths = @(
                foreach ($selectionMatch in [regex]::Matches($firstGroupText, $selectionPattern)) {
                    [System.IO.Path]::GetFullPath(
                        (Join-Path $documentDirectory $selectionMatch.Groups[1].Value)
                    )
                }
            )
            if ($ungroupedPaths.Count -gt 0) {
                $chapterGroups.Add([ordered]@{
                    title = "Chapter records"
                    paths = $ungroupedPaths
                })
            }
            for ($groupIndex = 0; $groupIndex -lt $groupMatches.Count; $groupIndex++) {
                $groupMatch = $groupMatches[$groupIndex]
                $groupEnd = if ($groupIndex -lt $groupMatches.Count - 1) {
                    $groupMatches[$groupIndex + 1].Index
                }
                else {
                    $chapterText.Length
                }
                $groupText = $chapterText.Substring($groupMatch.Index, $groupEnd - $groupMatch.Index)
                $groupPaths = @(
                    foreach ($selectionMatch in [regex]::Matches($groupText, $selectionPattern)) {
                        [System.IO.Path]::GetFullPath(
                            (Join-Path $documentDirectory $selectionMatch.Groups[1].Value)
                        )
                    }
                )
                if ($groupPaths.Count -gt 0) {
                    $chapterGroups.Add([ordered]@{
                        title = $groupMatch.Groups[1].Value.Trim()
                        paths = $groupPaths
                    })
                }
            }
        }
        [ordered]@{
            key = "part-$($chapterMatch.Groups[1].Value.ToLowerInvariant())"
            title = $chapterMatch.Groups[2].Value.Trim()
            paths = $chapterPaths
            groups = @($chapterGroups)
        }
    }
}

function ConvertTo-SearchText {
    param([string]$Markdown)

    $plain = $Markdown
    $plain = [regex]::Replace($plain, '(?s)```.*?```', ' ')
    $plain = [regex]::Replace($plain, '!?(?:\[([^\]]*)\])\([^)]*\)', '$1')
    $plain = [regex]::Replace($plain, '[#*`_|>~-]', ' ')
    $plain = [regex]::Replace($plain, '\s+', ' ').Trim()
    return $plain
}

function Get-SearchSummary {
    param([string]$Markdown)

    $titlePattern = [regex]::new('(?m)^# .*$\r?\n?')
    $withoutTitle = $titlePattern.Replace($Markdown, '', 1)
    foreach ($block in [regex]::Split($withoutTitle, '(?:\r?\n){2,}')) {
        $plain = ConvertTo-SearchText $block
        if ($plain.Length -ge 35 -and -not $block.TrimStart().StartsWith('|')) {
            if ($plain.Length -gt 280) {
                return $plain.Substring(0, 277).TrimEnd() + '...'
            }
            return $plain
        }
    }
    return "Open this record in the generated proof."
}

function ConvertTo-SitePageName {
    param([string]$RelativePath)

    $stem = [System.IO.Path]::ChangeExtension($RelativePath.Replace("\", "/"), $null)
    $slug = [regex]::Replace($stem.ToLowerInvariant(), '[^a-z0-9]+', '-').Trim('-')
    if ([string]::IsNullOrWhiteSpace($slug)) {
        throw "Could not derive site page name from: $RelativePath"
    }
    return "$slug.html"
}

$selectionChecks = [ordered]@{
    mode = "base volume path selection"
}
$canonicalMetadata = [System.Collections.Generic.Dictionary[string, object]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)
$canonicalEntryPathById = [System.Collections.Generic.Dictionary[string, string]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)
$canonicalEntryTitleById = [System.Collections.Generic.Dictionary[string, string]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)
$canonicalOwnerByPath = [System.Collections.Generic.Dictionary[string, string]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)
$canonicalClassByPath = [System.Collections.Generic.Dictionary[string, string]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)
$canonicalViewsByOwnerPath = [System.Collections.Generic.Dictionary[string, object]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)
if ($Edition -ne "sim-01") {
    $canonicalKinds = [System.Collections.Generic.Dictionary[string, string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    $entryDomains = [System.Collections.Generic.Dictionary[string, string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    $currentReference = if ($editionNumber -ge 67) {
        Join-Path $workspace "reference\lexicon-reference-v4.lexicon"
    }
    elseif ($editionNumber -ge 66) {
        Join-Path $workspace "reference\formarium-reference-v3.formarium"
    }
    elseif ($editionNumber -ge 50) {
        Join-Path $workspace "reference\factorium-reference-v2.factorium"
    }
    elseif ($editionNumber -ge 49) {
        Join-Path $workspace "reference\factorium-reference-v1.factorium"
    }
    else {
        Join-Path $workspace "reference\factorium-reference-v0.factorium"
    }
    foreach ($line in Get-Content -LiteralPath $currentReference) {
        if ($line.StartsWith("entry ", [System.StringComparison]::Ordinal)) {
            $parts = $line -split ' \| '
            $entryId = $parts[0].Substring("entry ".Length)
            $entryDomains[$entryId] = $parts[2]
            $canonicalKinds[$parts[4]] = "entry"
            $canonicalEntryPathById[$entryId] = $parts[4]
            $canonicalEntryTitleById[$entryId] = $parts[1]
            $canonicalOwnerByPath[$parts[4]] = $parts[4]
            $canonicalClassByPath[$parts[4]] = "entry"
            $canonicalViewsByOwnerPath[$parts[4]] = [System.Collections.Generic.List[object]]::new()
            $canonicalMetadata[$parts[4]] = [ordered]@{
                kind = "entry"
                domain = $parts[2]
                maturity = $parts[3]
                summary = ConvertTo-SearchText $parts[5]
            }
        }
        elseif ($line.StartsWith("view ", [System.StringComparison]::Ordinal)) {
            $parts = $line -split ' \| '
            if (-not $canonicalEntryPathById.ContainsKey($parts[1])) {
                throw "Canonical view has unknown owner: $($parts[0]) -> $($parts[1])"
            }
            $canonicalKinds[$parts[5]] = "view"
            $canonicalOwnerByPath[$parts[5]] = $canonicalEntryPathById[$parts[1]]
            $canonicalClassByPath[$parts[5]] = $parts[3]
            $canonicalViewsByOwnerPath[$canonicalEntryPathById[$parts[1]]].Add([ordered]@{
                kind = $parts[3]
                path = $parts[5]
            })
            $canonicalMetadata[$parts[5]] = [ordered]@{
                kind = $parts[3]
                domain = $entryDomains[$parts[1]]
                maturity = ""
                summary = if ($editionNumber -lt 42 -and
                    $parts[5] -eq "tables/diagnostics/dependency-critical-path.md") {
                    "Diagnoses start failures, stalls, bottlenecks, blockers, enablers, and critical paths while retaining direction, graph, lags, resources, uncertainty, ties, alternate paths, and result-relative scope."
                }
                else { $parts[6] }
            }
        }
    }

    $volumePaths = Get-WorkspaceMarkdownPathSet $volume
    $supplementPaths = Get-WorkspaceMarkdownPathSet $supplement
    if ($editionNumber -ge 49) {
        $v1SupplementPaths = Get-WorkspaceMarkdownPathSet $v1Supplement
        foreach ($v1Path in $v1SupplementPaths) {
            [void]$supplementPaths.Add($v1Path)
        }
    }
    if ($editionNumber -ge 50) {
        $v2SupplementPaths = Get-WorkspaceMarkdownPathSet $v2Supplement
        foreach ($v2Path in $v2SupplementPaths) {
            [void]$supplementPaths.Add($v2Path)
        }
    }
    if ($editionNumber -ge 68) {
        $candidateAdmissionPaths = Get-WorkspaceMarkdownPathSet $candidateAdmissionSupplement
        foreach ($candidateAdmissionPath in $candidateAdmissionPaths) {
            [void]$supplementPaths.Add($candidateAdmissionPath)
        }
    }
    if ($editionNumber -ge 69) {
        $domainExpansionPaths = Get-WorkspaceMarkdownPathSet $domainExpansionSupplement
        foreach ($domainExpansionPath in $domainExpansionPaths) {
            [void]$supplementPaths.Add($domainExpansionPath)
        }
    }
    if ($editionNumber -ge 70) {
        $roadmapWave1Paths = Get-WorkspaceMarkdownPathSet $roadmapWave1Supplement
        foreach ($roadmapWave1Path in $roadmapWave1Paths) {
            [void]$supplementPaths.Add($roadmapWave1Path)
        }
    }
    if ($editionNumber -ge 71) {
        $roadmapWave2Paths = Get-WorkspaceMarkdownPathSet $roadmapWave2Supplement
        foreach ($roadmapWave2Path in $roadmapWave2Paths) {
            [void]$supplementPaths.Add($roadmapWave2Path)
        }
    }
    if ($editionNumber -ge 72) {
        $roadmapWave3Paths = Get-WorkspaceMarkdownPathSet $roadmapWave3Supplement
        foreach ($roadmapWave3Path in $roadmapWave3Paths) {
            [void]$supplementPaths.Add($roadmapWave3Path)
        }
    }
    if ($editionNumber -ge 73) {
        $roadmapWave4Paths = Get-WorkspaceMarkdownPathSet $roadmapWave4Supplement
        foreach ($roadmapWave4Path in $roadmapWave4Paths) { [void]$supplementPaths.Add($roadmapWave4Path) }
    }
    if ($editionNumber -ge 74) {
        $roadmapWave5Paths = Get-WorkspaceMarkdownPathSet $roadmapWave5Supplement
        foreach ($roadmapWave5Path in $roadmapWave5Paths) { [void]$supplementPaths.Add($roadmapWave5Path) }
    }
    if ($editionNumber -ge 67) {
        foreach ($rename in @(
            @("tables/entries/factorium-entry-publication.md", "tables/entries/lexicon-entry-publication.md"),
            @("tables/procedures/entry-publication.md", "tables/procedures/lexicon-entry-publication.md"),
            @("tables/scales/editorial-maturity.md", "tables/scales/lexicon-editorial-maturity.md")
        )) {
            if ($supplementPaths.Remove($rename[0])) {
                [void]$supplementPaths.Add($rename[1])
            }
            if ($volumePaths.Remove($rename[0])) {
                [void]$volumePaths.Add($rename[1])
            }
        }
    }
    elseif ($editionNumber -ge 66) {
        foreach ($rename in @(
            @("tables/entries/factorium-entry-publication.md", "tables/entries/formarium-entry-publication.md"),
            @("tables/procedures/entry-publication.md", "tables/procedures/formarium-entry-publication.md"),
            @("tables/scales/editorial-maturity.md", "tables/scales/formarium-editorial-maturity.md")
        )) {
            if ($supplementPaths.Remove($rename[0])) {
                [void]$supplementPaths.Add($rename[1])
            }
            if ($volumePaths.Remove($rename[0])) {
                [void]$volumePaths.Add($rename[1])
            }
        }
    }
    $expectedDelta = [System.Collections.Generic.HashSet[string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    foreach ($canonicalPath in $canonicalKinds.Keys) {
        if (-not $volumePaths.Contains($canonicalPath)) {
            [void]$expectedDelta.Add($canonicalPath)
        }
    }

    $missingDelta = @($expectedDelta | Where-Object { -not $supplementPaths.Contains($_) })
    $extraDelta = @($supplementPaths | Where-Object { -not $expectedDelta.Contains($_) })
    if ($missingDelta.Count -ne 0 -or $extraDelta.Count -ne 0) {
        throw "Factor Forge supplement mismatch: missing=$($missingDelta -join ',') extra=$($extraDelta -join ',')"
    }

    $deltaEntries = @($expectedDelta | Where-Object { $canonicalKinds[$_] -eq "entry" }).Count
    $deltaViews = @($expectedDelta | Where-Object { $canonicalKinds[$_] -eq "view" }).Count
    $selectionChecks = [ordered]@{
        mode = "exact current canonical delta from base volume paths"
        canonical_entries = @($canonicalKinds.Values | Where-Object { $_ -eq "entry" }).Count
        canonical_views = @($canonicalKinds.Values | Where-Object { $_ -eq "view" }).Count
        delta_entries = $deltaEntries
        delta_views = $deltaViews
        delta_records = $expectedDelta.Count
        combined_projection_records = 78 + $expectedDelta.Count
        missing_delta_paths = $missingDelta.Count
        extra_delta_paths = $extraDelta.Count
    }

    if ($editionNumber -ge 3) {
        $rubricText = Get-Content -LiteralPath $factorForgeRubric -Raw
        $taskCoverage = [System.Collections.Generic.HashSet[string]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
        [regex]::Matches($rubricText, '`(tables/[^`]+\.md)`') | ForEach-Object {
            [void]$taskCoverage.Add($_.Groups[1].Value)
        }
        if ($editionNumber -ge 49) {
            $v1RubricText = Get-Content -LiteralPath $v1Rubric -Raw
            [regex]::Matches($v1RubricText, '`(tables/[^`]+\.md)`') | ForEach-Object {
                [void]$taskCoverage.Add($_.Groups[1].Value)
            }
        }
        if ($editionNumber -ge 50) {
            $v2RubricText = Get-Content -LiteralPath $v2Rubric -Raw
            [regex]::Matches($v2RubricText, '`(tables/[^`]+\.md)`') | ForEach-Object {
                [void]$taskCoverage.Add($_.Groups[1].Value)
            }
        }
        if ($editionNumber -ge 68) {
            $candidateAdmissionRubricText = Get-Content -LiteralPath $candidateAdmissionRubric -Raw
            [regex]::Matches($candidateAdmissionRubricText, '`(tables/[^`]+\.md)`') | ForEach-Object {
                [void]$taskCoverage.Add($_.Groups[1].Value)
            }
        }
        if ($editionNumber -ge 69) {
            $domainExpansionRubricText = Get-Content -LiteralPath $domainExpansionRubric -Raw
            [regex]::Matches($domainExpansionRubricText, '`(tables/[^`]+\.md)`') | ForEach-Object {
                [void]$taskCoverage.Add($_.Groups[1].Value)
            }
        }
        if ($editionNumber -ge 70) {
            $roadmapWave1RubricText = Get-Content -LiteralPath $roadmapWave1Rubric -Raw
            [regex]::Matches($roadmapWave1RubricText, '`(tables/[^`]+\.md)`') | ForEach-Object {
                [void]$taskCoverage.Add($_.Groups[1].Value)
            }
        }
        if ($editionNumber -ge 71) {
            $roadmapWave2RubricText = Get-Content -LiteralPath $roadmapWave2Rubric -Raw
            [regex]::Matches($roadmapWave2RubricText, '`(tables/[^`]+\.md)`') | ForEach-Object {
                [void]$taskCoverage.Add($_.Groups[1].Value)
            }
        }
        if ($editionNumber -ge 72) {
            $roadmapWave3RubricText = Get-Content -LiteralPath $roadmapWave3Rubric -Raw
            [regex]::Matches($roadmapWave3RubricText, '`(tables/[^`]+\.md)`') | ForEach-Object {
                [void]$taskCoverage.Add($_.Groups[1].Value)
            }
        }
        if ($editionNumber -ge 73) {
            $roadmapWave4RubricText = Get-Content -LiteralPath $roadmapWave4Rubric -Raw
            [regex]::Matches($roadmapWave4RubricText, '`(tables/[^`]+\.md)`') | ForEach-Object { [void]$taskCoverage.Add($_.Groups[1].Value) }
        }
        if ($editionNumber -ge 74) {
            $roadmapWave5RubricText = Get-Content -LiteralPath $roadmapWave5Rubric -Raw
            [regex]::Matches($roadmapWave5RubricText, '`(tables/[^`]+\.md)`') | ForEach-Object { [void]$taskCoverage.Add($_.Groups[1].Value) }
        }
        $missingTaskCoverage = @($expectedDelta | Where-Object { -not $taskCoverage.Contains($_) })
        $extraTaskCoverage = @($taskCoverage | Where-Object { -not $expectedDelta.Contains($_) })
        if ($missingTaskCoverage.Count -ne 0 -or $extraTaskCoverage.Count -ne 0) {
            throw "Factor Forge task coverage mismatch: missing=$($missingTaskCoverage -join ',') extra=$($extraTaskCoverage -join ',')"
        }
        $selectionChecks.task_count = if ($editionNumber -ge 74) { 101 } elseif ($editionNumber -ge 73) { 92 } elseif ($editionNumber -ge 72) { 87 } elseif ($editionNumber -ge 71) { 82 } elseif ($editionNumber -ge 70) { 77 } elseif ($editionNumber -ge 69) { 72 } elseif ($editionNumber -ge 68) { 67 } elseif ($editionNumber -ge 50) { 59 } elseif ($editionNumber -ge 49) { 56 } else { 53 }
        $selectionChecks.task_coverage_records = $taskCoverage.Count
        $selectionChecks.missing_task_coverage_paths = $missingTaskCoverage.Count
        $selectionChecks.extra_task_coverage_paths = $extraTaskCoverage.Count
    }
    if ($editionNumber -ge 30) {
        $selectionChecks.book_one_candidate_path = [System.IO.Path]::GetRelativePath($workspace, $bookOneCandidateManifest).Replace("\", "/")
        $selectionChecks.book_one_candidate_sha256 = (Get-FileHash -LiteralPath $bookOneCandidateManifest -Algorithm SHA256).Hash.ToLowerInvariant()
        $selectionChecks.book_one_spine_records = 24
        $selectionChecks.book_one_specialized_depth_records = $readerAdditionalRecordCount
        $selectionChecks.book_one_route_strategies = 4
    }
}

Add-ProofSource $quickstart
Add-ProofSource $volume

$selectionDocuments = [System.Collections.Generic.List[string]]::new()
$selectionDocuments.Add($volume)
if ($Edition -ne "sim-01") {
    Add-ProofSource $supplement
    $selectionDocuments.Add($supplement)
}
if ($editionNumber -ge 49) {
    Add-ProofSource $v1Supplement
    $selectionDocuments.Add($v1Supplement)
    Add-ProofSource $v1Tasks
}
if ($editionNumber -ge 50) {
    Add-ProofSource $v2Supplement
    $selectionDocuments.Add($v2Supplement)
    Add-ProofSource $v2Tasks
}
if ($editionNumber -ge 68) {
    Add-ProofSource $candidateAdmissionSupplement
    $selectionDocuments.Add($candidateAdmissionSupplement)
    Add-ProofSource $candidateAdmissionTasks
}
if ($editionNumber -ge 69) {
    Add-ProofSource $domainExpansionSupplement
    $selectionDocuments.Add($domainExpansionSupplement)
    Add-ProofSource $domainExpansionTasks
}
if ($editionNumber -ge 70) {
    Add-ProofSource $roadmapWave1Supplement
    $selectionDocuments.Add($roadmapWave1Supplement)
    Add-ProofSource $roadmapWave1Tasks
}
if ($editionNumber -ge 71) {
    Add-ProofSource $roadmapWave2Supplement
    $selectionDocuments.Add($roadmapWave2Supplement)
    Add-ProofSource $roadmapWave2Tasks
}
if ($editionNumber -ge 72) {
    Add-ProofSource $roadmapWave3Supplement
    $selectionDocuments.Add($roadmapWave3Supplement)
    Add-ProofSource $roadmapWave3Tasks
}
if ($editionNumber -ge 73) {
    Add-ProofSource $roadmapWave4Supplement
    $selectionDocuments.Add($roadmapWave4Supplement)
    Add-ProofSource $roadmapWave4Tasks
}
if ($editionNumber -ge 74) {
    Add-ProofSource $roadmapWave5Supplement
    $selectionDocuments.Add($roadmapWave5Supplement)
    Add-ProofSource $roadmapWave5Tasks
}
if ($editionNumber -ge 3) {
    Add-ProofSource $factorForgeTasks
}
if ($editionNumber -ge 6) {
    foreach ($contextProfileSource in $contextProfileSources) {
        Add-ProofSource $contextProfileSource
    }
}
if ($editionNumber -ge 9) {
    Add-ProofSource $compositionWorksheet
}
if ($editionNumber -ge 10) {
    Add-ProofSource $evidenceWorksheet
}
if ($editionNumber -ge 11) {
    Add-ProofSource $feedbackWorksheet
}
if ($editionNumber -ge 13) {
    Add-ProofSource $conflictWorksheet
}
if ($editionNumber -ge 14) {
    Add-ProofSource $frontierWorksheet
}
if ($editionNumber -ge 29) {
    Add-ProofSource $decisionChoiceGuide
    Add-ProofSource $decisionEvidenceReadingSpec
    Add-ProofSource $decisionCombinedClosureSpec
}
if ($editionNumber -ge 16) {
    Add-ProofSource $compositionLabSpec
}
if ($editionNumber -ge 17) {
    Add-ProofSource $compositionReadingSpec
}
if ($editionNumber -ge 18) {
    Add-ProofSource $compositionFocusSpec
}
if ($editionNumber -ge 19) {
    Add-ProofSource $compositionPaletteSpec
}
if ($editionNumber -ge 20) {
    Add-ProofSource $compositionViewsSpec
}
if ($editionNumber -ge 21) {
    Add-ProofSource $compositionMapSpec
}
if ($editionNumber -ge 22) {
    Add-ProofSource $compositionStartersSpec
}
if ($editionNumber -ge 23) {
    Add-ProofSource $compositionQueryPlanSpec
}
if ($editionNumber -ge 24) {
    Add-ProofSource $compositionWorkBudgetSpec
}
if ($editionNumber -ge 25) {
    Add-ProofSource $compositionReconciliationSpec
}
if ($editionNumber -ge 26) {
    Add-ProofSource $compositionContinuationsSpec
}
if ($editionNumber -ge 27) {
    Add-ProofSource $compositionRerunComparisonSpec
}
if ($editionNumber -ge 28) {
    Add-ProofSource $compositionGuideSpec
}
if ($editionNumber -ge 29) {
    Add-ProofSource $compositionEvaluationSpec
}
if ($editionNumber -ge 30) {
    Add-ProofSource $bookOneQuickstart
    Add-ProofSource $bookOneTasks
    Add-ProofSource $bookOneFeedback
}

foreach ($selectionDocument in $selectionDocuments) {
    $selectionDirectory = Split-Path $selectionDocument
    $selectionText = Get-Content -LiteralPath $selectionDocument -Raw
    $links = [regex]::Matches($selectionText, '\[[^\]]+\]\(([^)#]+)(?:#[^)]+)?\)')
    foreach ($link in $links) {
        $relative = $link.Groups[1].Value
        if (-not $relative.EndsWith(".md", [System.StringComparison]::OrdinalIgnoreCase)) {
            continue
        }
        if ($excludedNames.Contains([System.IO.Path]::GetFileName($relative))) {
            continue
        }
        $selectedSource = Join-Path $selectionDirectory $relative
        if ($editionNumber -ge 67) {
            $workspaceRelativeSource = [System.IO.Path]::GetRelativePath(
                $workspace,
                [System.IO.Path]::GetFullPath($selectedSource)
            ).Replace("\", "/")
            $selectedSource = switch ($workspaceRelativeSource) {
                "tables/entries/factorium-entry-publication.md" {
                    Join-Path $workspace "tables\entries\lexicon-entry-publication.md"
                }
                "tables/procedures/entry-publication.md" {
                    Join-Path $workspace "tables\procedures\lexicon-entry-publication.md"
                }
                "tables/scales/editorial-maturity.md" {
                    Join-Path $workspace "tables\scales\lexicon-editorial-maturity.md"
                }
                "tables/CATALOG.md" {
                    Join-Path $workspace "tables\LEXICON-CATALOG.md"
                }
                "tables/formulas/INDEX.md" {
                    Join-Path $workspace "tables\formulas\LEXICON-INDEX.md"
                }
                "tables/UNRESOLVED.md" {
                    Join-Path $workspace "tables\LEXICON-UNRESOLVED.md"
                }
                default { $selectedSource }
            }
        }
        elseif ($editionNumber -ge 66) {
            $workspaceRelativeSource = [System.IO.Path]::GetRelativePath(
                $workspace,
                [System.IO.Path]::GetFullPath($selectedSource)
            ).Replace("\", "/")
            $selectedSource = switch ($workspaceRelativeSource) {
                "tables/entries/factorium-entry-publication.md" {
                    Join-Path $workspace "tables\entries\formarium-entry-publication.md"
                }
                "tables/procedures/entry-publication.md" {
                    Join-Path $workspace "tables\procedures\formarium-entry-publication.md"
                }
                "tables/scales/editorial-maturity.md" {
                    Join-Path $workspace "tables\scales\formarium-editorial-maturity.md"
                }
                "tables/CATALOG.md" {
                    Join-Path $workspace "tables\FORMARIUM-CATALOG.md"
                }
                "tables/formulas/INDEX.md" {
                    Join-Path $workspace "tables\formulas\FORMARIUM-INDEX.md"
                }
                "tables/UNRESOLVED.md" {
                    Join-Path $workspace "tables\FORMARIUM-UNRESOLVED.md"
                }
                default { $selectedSource }
            }
        }
        Add-ProofSource $selectedSource
    }
}

New-Item -ItemType Directory -Force -Path $output | Out-Null

$pandocSources = foreach ($source in $sources) {
    [System.IO.Path]::GetRelativePath($workspace, $source).Replace("\", "/")
}
$relativeStyle = [System.IO.Path]::GetRelativePath($workspace, $style).Replace("\", "/")
$pandocArguments = @(
    "--from=gfm",
    "--to=html5",
    "--standalone",
    "--file-scope",
    "--toc",
    "--toc-depth=3",
    "--embed-resources",
    "--css=$relativeStyle",
    "--metadata=title:$artifactTitle",
    "--output=$html"
) + $pandocSources

Push-Location $workspace
try {
    & $pandoc.Source @pandocArguments
    if ($LASTEXITCODE -ne 0) {
        throw "Pandoc failed with exit code $LASTEXITCODE"
    }
}
finally {
    Pop-Location
}

$htmlText = Get-Content -LiteralPath $html -Raw
if ($editionNumber -lt 30) {
    # The Book One guide was added to guides/INDEX.md after sim-29 was frozen.
    # Keep historical editions reproducible while sim-30 adopts that index row.
    $bookOneIndexPattern = '(?s)<li><a [^>]*>Bounded-Question\s*Composition and Evaluation</a>\s*<ul>.*?exact 24-record candidate\s*Book One spine</li>\s*</ul></li>\s*'
    $htmlText = [regex]::Replace($htmlText, $bookOneIndexPattern, '')
}
$headingMatches = [regex]::Matches($htmlText, '<h1 id="([^"]+)"')
if ($headingMatches.Count -ne $sources.Count) {
    throw "Expected one top-level heading per source; found $($headingMatches.Count) for $($sources.Count) sources"
}

$headingBySource = [System.Collections.Generic.Dictionary[string, string]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)
for ($index = 0; $index -lt $sources.Count; $index++) {
    $headingBySource[$sources[$index]] = $headingMatches[$index].Groups[1].Value
}
$quickstartHeading = $headingBySource[$quickstart]
$sourceCommit = (git -C $workspace rev-parse HEAD).Trim()
$sourceCommitShort = $sourceCommit.Substring(0, 8)
$sourceCommitDate = (git -C $workspace show -s --format=%cs HEAD).Trim()
$rootPublicationStatus = if ($editionNumber -ge 66) {
    "Edition <a href=`"manifest.json`">$Edition</a> · internally validated projection, not reader-outcome evidence · <a href=`"https://github.com/giodl73-repo/$repositoryName/tree/$sourceCommit`">source $sourceCommitShort</a> · <a href=`"https://github.com/giodl73-repo/$repositoryName/blob/main/LICENSE`">software: MIT</a>"
}
else {
    "Internal deterministic simulation · not reader evidence or preview-01"
}
$nestedPublicationStatus = if ($editionNumber -ge 66) {
    "Edition <a href=`"../manifest.json`">$Edition</a> · internally validated projection, not reader-outcome evidence · <a href=`"https://github.com/giodl73-repo/$repositoryName/tree/$sourceCommit`">source $sourceCommitShort</a> · <a href=`"https://github.com/giodl73-repo/$repositoryName/blob/main/LICENSE`">software: MIT</a>"
}
else {
    "Internal deterministic simulation · not reader evidence or preview-01"
}
$renderedSegmentBySource = [System.Collections.Generic.Dictionary[string, string]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)

for ($index = $sources.Count - 1; $index -ge 0; $index--) {
    $start = $headingMatches[$index].Index
    $end = if ($index -eq $sources.Count - 1) {
        $htmlText.LastIndexOf('</body>', [System.StringComparison]::Ordinal)
    }
    else {
        $headingMatches[$index + 1].Index
    }
    if ($end -lt $start) {
        throw "Could not identify rendered segment for $($sources[$index])"
    }

    $segment = $htmlText.Substring($start, $end - $start)
    $currentDirectory = Split-Path $sources[$index]
    $segment = [regex]::Replace(
        $segment,
        'href="([^"#?]+\.md)(#[^"]*)?"',
        {
            param($match)

            $rawTarget = [System.Net.WebUtility]::HtmlDecode($match.Groups[1].Value)
            if ([System.Uri]::IsWellFormedUriString($rawTarget, [System.UriKind]::Absolute)) {
                return $match.Value
            }

            $target = [System.IO.Path]::GetFullPath((Join-Path $currentDirectory $rawTarget))
            if ($headingBySource.ContainsKey($target)) {
                if ($match.Groups[2].Success) {
                    $relativeTarget = [System.IO.Path]::GetRelativePath($workspace, $target)
                    $scope = $relativeTarget.ToLowerInvariant().Replace("\", "__").Replace("/", "__").Replace(".", "") + "__"
                    return 'href="#' + $scope + $match.Groups[2].Value.Substring(1) + '"'
                }
                return 'href="#' + $headingBySource[$target] + '"'
            }

            if ($excludedNames.Contains([System.IO.Path]::GetFileName($target))) {
                return 'href="#' + $quickstartHeading + '"'
            }

            if ($target.StartsWith($workspace, [System.StringComparison]::OrdinalIgnoreCase)) {
                $relativeTarget = [System.IO.Path]::GetRelativePath($workspace, $target).Replace("\", "/")
                return "href=`"https://github.com/giodl73-repo/$repositoryName/blob/main/" + $relativeTarget + $match.Groups[2].Value + '"'
            }

            return $match.Value
        }
    )
    if ($editionNumber -ge 31 -and
        $sources[$index] -eq [System.IO.Path]::GetFullPath($bookOneQuickstart)) {
        $segment = $segment.Replace("Book One Candidate Quickstart", "$readerPublicationName Quickstart")
        $segment = $segment.Replace("internal <code>sim-30</code> candidate surface", "internal <code>sim-31</code> Reader projection")
        $segment = $segment.Replace("Question first:</strong> use the candidate guide", "Question first:</strong> use the Reader guide")
        $segment = $segment.Replace("five-part candidate spine", "five-part Reader spine")
    }
    if ($lexiconIdentity) {
        $segment = $segment.Replace("Factorium Tables", $tablesPublicationName)
        $segment = $segment.Replace("The Factorium Reader", $readerPublicationName)
    }
    elseif ($formariumIdentity) {
        $segment = $segment.Replace("Factorium Tables", $tablesPublicationName)
        $segment = $segment.Replace("The Factorium Reader", $readerPublicationName)
    }
    if ($lexiconIdentity) {
        $segment = $segment.Replace("Factorium", "Lexicon")
    }
    elseif ($editionNumber -ge 66) {
        $segment = $segment.Replace("Factorium", "Formarium")
    }
    if ($editionNumber -lt 41 -and
        $sources[$index] -eq [System.IO.Path]::GetFullPath(
            (Join-Path $workspace "tables\primes\subject-object-relationship.md")
        )) {
        $segment = [regex]::Replace(
            $segment,
            '(?s)<h2 id="[^"]*cross-references">Cross-references</h2>.*?(?=<p><strong>Maturity:)',
            ''
        )
    }
    if ($editionNumber -lt 42 -and
        $sources[$index] -eq [System.IO.Path]::GetFullPath(
            (Join-Path $workspace "tables\diagnostics\dependency-critical-path.md")
        )) {
        $segment = [regex]::Replace(
            $segment,
            '(?s)<h2 id="[^"]*limit-owner-test">Limit owner test</h2>.*?(?=<h2 id="[^"]*sources-and-provenance">)',
            ''
        )
    }
    $renderedSegmentBySource[$sources[$index]] = $segment
    $htmlText = $htmlText.Substring(0, $start) + $segment + $htmlText.Substring($end)
}
if ($editionNumber -lt 41) {
    $subjectObjectCrossReferenceId =
        "tables__primes__subject-object-relationshipmd__cross-references"
    $htmlText = [regex]::Replace(
        $htmlText,
        '<li><a href="#' + $subjectObjectCrossReferenceId +
            '" id="toc-' + $subjectObjectCrossReferenceId +
            '">Cross-references</a></li>\r?\n',
        ''
    )
    $subjectObjectHeadingId =
        "tables__primes__subject-object-relationshipmd__subject-object-relationship"
    $htmlText = [regex]::Replace(
        $htmlText,
        '(<li><a href="#' + $subjectObjectHeadingId +
            '" id="toc-' + $subjectObjectHeadingId +
            '">Subject-Object\r?\nRelationship</a>)\r?\n<ul>\r?\n</ul></li>',
        '$1</li>'
    )
}
if ($editionNumber -lt 42) {
    $limitOwnerTestId =
        "tables__diagnostics__dependency-critical-pathmd__limit-owner-test"
    $htmlText = [regex]::Replace(
        $htmlText,
        '(?s)<li><a href="#' + $limitOwnerTestId +
            '" id="toc-' + $limitOwnerTestId +
            '">Limit owner test</a>\s*<ul>.*?</ul>\s*</li>\s*',
        ''
    )
}

$searchChecks = $null
$searchAssets = @()
$readerChecks = $null
$contextChecks = $null
$contextAssets = @()
$siteChecks = $null
$siteAssets = @()
$siteIndex = $null
$compositionChecks = $null
$compositionLabChecks = $null
$compositionReadingChecks = $null
$compositionFocusChecks = $null
$compositionPaletteChecks = $null
$compositionViewsChecks = $null
$compositionMapChecks = $null
$compositionStarterChecks = $null
$compositionQueryPlanChecks = $null
$compositionFocusRecords = @()
if ($editionNumber -ge 4) {
    $requiredSearchAssets = @($searchStyle, $searchScript)
    if ($editionNumber -ge 40) {
        $requiredSearchAssets += @($searchCueStyle, $searchCueScript)
    }
    if ($editionNumber -ge 47) {
        $requiredSearchAssets += @($lookupAliasesStyle, $lookupAliasesScript)
    }
    if ($editionNumber -ge 48) {
        $requiredSearchAssets += @($scaleChooserStyle, $scaleChooserScript)
    }
    foreach ($asset in $requiredSearchAssets) {
        if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
            throw "Missing search asset: $asset"
        }
    }

    $numberedSelections = @(
        Get-NumberedSelections $volume
        Get-NumberedSelections $supplement
        if ($editionNumber -ge 49) {
            Get-NumberedSelections $v1Supplement
        }
        if ($editionNumber -ge 50) {
            Get-NumberedSelections $v2Supplement
        }
        if ($editionNumber -ge 68) {
            Get-NumberedSelections $candidateAdmissionSupplement
        }
        if ($editionNumber -ge 69) {
            Get-NumberedSelections $domainExpansionSupplement
        }
        if ($editionNumber -ge 70) {
            Get-NumberedSelections $roadmapWave1Supplement
        }
        if ($editionNumber -ge 71) {
            Get-NumberedSelections $roadmapWave2Supplement
        }
        if ($editionNumber -ge 72) {
            Get-NumberedSelections $roadmapWave3Supplement
        }
        if ($editionNumber -ge 73) {
            Get-NumberedSelections $roadmapWave4Supplement
        }
        if ($editionNumber -ge 74) {
            Get-NumberedSelections $roadmapWave5Supplement
        }
    )
    if ($editionNumber -ge 67) {
        $selectionRenames = @{
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\entries\factorium-entry-publication.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\entries\lexicon-entry-publication.md"))
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\procedures\entry-publication.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\procedures\lexicon-entry-publication.md"))
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\scales\editorial-maturity.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\scales\lexicon-editorial-maturity.md"))
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\CATALOG.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\LEXICON-CATALOG.md"))
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\formulas\INDEX.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\formulas\LEXICON-INDEX.md"))
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\UNRESOLVED.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\LEXICON-UNRESOLVED.md"))
        }
        foreach ($selection in $numberedSelections) {
            if ($selectionRenames.ContainsKey($selection.path)) {
                $selection.path = $selectionRenames[$selection.path]
                $selection.title = $selection.title.Replace("Factorium", "Lexicon")
            }
        }
    }
    elseif ($editionNumber -ge 66) {
        $selectionRenames = @{
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\entries\factorium-entry-publication.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\entries\formarium-entry-publication.md"))
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\procedures\entry-publication.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\procedures\formarium-entry-publication.md"))
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\scales\editorial-maturity.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\scales\formarium-editorial-maturity.md"))
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\CATALOG.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\FORMARIUM-CATALOG.md"))
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\formulas\INDEX.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\formulas\FORMARIUM-INDEX.md"))
            ([System.IO.Path]::GetFullPath((Join-Path $workspace "tables\UNRESOLVED.md"))) =
                [System.IO.Path]::GetFullPath((Join-Path $workspace "tables\FORMARIUM-UNRESOLVED.md"))
        }
        foreach ($selection in $numberedSelections) {
            if ($selectionRenames.ContainsKey($selection.path)) {
                $selection.path = $selectionRenames[$selection.path]
                $selection.title = $selection.title.Replace("Factorium", "Formarium")
            }
        }
    }
    $guideSelections = @(Get-GuideSelections)
    $expectedGuideCount = if ($editionNumber -ge 30) {
        10
    }
    elseif ($editionNumber -ge 29) {
        9
    }
    elseif ($editionNumber -ge 14) {
        7
    }
    elseif ($editionNumber -ge 13) {
        6
    }
    elseif ($editionNumber -ge 11) {
        5
    }
    elseif ($editionNumber -eq 10) {
        4
    }
    elseif ($editionNumber -eq 9) {
        3
    }
    else {
        2
    }
    $expectedNumberedCount = if ($editionNumber -ge 74) { 260 } elseif ($editionNumber -ge 73) { 251 } elseif ($editionNumber -ge 72) { 246 } elseif ($editionNumber -ge 71) { 240 } elseif ($editionNumber -ge 70) { 234 } elseif ($editionNumber -ge 69) { 228 } elseif ($editionNumber -ge 68) { 218 } elseif ($editionNumber -ge 50) { 181 } elseif ($editionNumber -ge 49) { 178 } else { 175 }
    if ($numberedSelections.Count -ne $expectedNumberedCount -or $guideSelections.Count -ne $expectedGuideCount) {
        throw "Search selection mismatch: numbered=$($numberedSelections.Count) guides=$($guideSelections.Count)"
    }

    $searchRecords = [System.Collections.Generic.List[object]]::new()
    $searchPaths = [System.Collections.Generic.HashSet[string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    $searchTitleByPath = [System.Collections.Generic.Dictionary[string, string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    foreach ($selectedRecord in @($numberedSelections) + @($guideSelections)) {
        $selectedRelativePath = [System.IO.Path]::GetRelativePath(
            $workspace,
            $selectedRecord.path
        ).Replace("\", "/")
        $searchTitleByPath[$selectedRelativePath] = $selectedRecord.title
    }
    $missingSearchTargets = [System.Collections.Generic.List[string]]::new()
    foreach ($selection in @($numberedSelections) + @($guideSelections)) {
        if (-not $searchPaths.Add($selection.path)) {
            throw "Duplicate search selection: $($selection.path)"
        }
        if (-not $headingBySource.ContainsKey($selection.path)) {
            $missingSearchTargets.Add($selection.path)
            continue
        }

        $relativePath = [System.IO.Path]::GetRelativePath($workspace, $selection.path).Replace("\", "/")
        $markdown = Get-Content -LiteralPath $selection.path -Raw
        if ($editionNumber -lt 41 -and
            $relativePath -eq "tables/primes/subject-object-relationship.md") {
            $markdown = [regex]::Replace(
                $markdown,
                '(?ms)^## Cross-references\r?\n.*?(?=^\*\*Maturity:)',
                ''
            )
        }
        if ($editionNumber -lt 42 -and
            $relativePath -eq "tables/diagnostics/dependency-critical-path.md") {
            $markdown = [regex]::Replace(
                $markdown,
                '(?ms)^## Limit owner test\r?\n.*?(?=^## Sources and provenance)',
                ''
            )
        }
        $plainText = ConvertTo-SearchText $markdown
        if ($plainText.Length -gt 12000) {
            $plainText = $plainText.Substring(0, 12000)
        }
        $metadata = if ($canonicalMetadata.ContainsKey($relativePath)) {
            $canonicalMetadata[$relativePath]
        }
        else {
            $directoryKind = ([System.IO.Path]::GetDirectoryName($relativePath).Replace("\", "/").Split('/') | Select-Object -Last 1)
            $derivedKind = switch ($directoryKind) {
                "roots" { "root" }
                "roles" { "role" }
                "composites" { "composite" }
                "primes" { "prime" }
                "guides" { "guide" }
                default { $directoryKind.TrimEnd('s') }
            }
            $derivedDomain = switch ($derivedKind) {
                "root" { "structure" }
                "role" { "structure" }
                "composite" { "security" }
                "prime" { "security" }
                "guide" { "application" }
                default { "" }
            }
            [ordered]@{
                kind = $derivedKind
                domain = $derivedDomain
                maturity = ""
                summary = (Get-SearchSummary $markdown)
            }
        }

        $searchRecord = [ordered]@{
            title = $selection.title
            kind = $metadata.kind
            domain = $metadata.domain
            maturity = $metadata.maturity
            path = $relativePath
            anchor = $headingBySource[$selection.path]
            summary = $metadata.summary
            text = $plainText
        }
        if ($editionNumber -ge 7) {
            $searchRecord.href = "entries/$(ConvertTo-SitePageName $relativePath)"
        }
        if ($editionNumber -ge 33) {
            if ($canonicalClassByPath.ContainsKey($relativePath)) {
                $ownerPath = $canonicalOwnerByPath[$relativePath]
                if (-not $searchTitleByPath.ContainsKey($ownerPath)) {
                    throw "Canonical-family search owner is not selected: $relativePath -> $ownerPath"
                }
                $searchRecord.familyKey = $ownerPath
                $searchRecord.familyKind = "canonical"
                $searchRecord.familyTitle = $searchTitleByPath[$ownerPath]
                $searchRecord.familyHref = "entries/$(ConvertTo-SitePageName $ownerPath)"
                $searchRecord.recordClass = if ($canonicalClassByPath[$relativePath] -eq "entry") {
                    "canonical-entry"
                }
                else { "specialized-view" }
            }
            else {
                $searchRecord.familyKey = $relativePath
                $searchRecord.familyKind = if ($relativePath.StartsWith("guides/")) {
                    "guide"
                }
                elseif ($relativePath.StartsWith("tables/")) { "curated" }
                else { "reader" }
                $searchRecord.familyTitle = $selection.title
                $searchRecord.familyHref = $searchRecord.href
                $searchRecord.recordClass = if ($relativePath.StartsWith("guides/")) {
                    "guide"
                }
                elseif ($relativePath.StartsWith("tables/")) { "curated-record" }
                else { "reader-record" }
            }
        }
        $searchRecords.Add($searchRecord)
    }
    if ($missingSearchTargets.Count -ne 0) {
        throw "Search index has $($missingSearchTargets.Count) missing rendered targets"
    }

    $searchJson = $searchRecords | ConvertTo-Json -Depth 4 -Compress
    $searchJson = $searchJson.Replace('</', '<\/')
    [System.IO.File]::WriteAllText(
        $searchIndexOutput,
        ($searchRecords | ConvertTo-Json -Depth 4),
        [System.Text.UTF8Encoding]::new($false)
    )
    $searchCss = Get-Content -LiteralPath $searchStyle -Raw
    if ($editionNumber -ge 33) {
        $searchCss += "`n" + (Get-Content -LiteralPath $familySearchStyle -Raw)
    }
    $searchJavaScript = Get-Content -LiteralPath $searchScript -Raw
    if ($editionNumber -ge 40) {
        $searchCss += "`n" + (Get-Content -LiteralPath $searchCueStyle -Raw)
        $searchJavaScript += "`n" + (Get-Content -LiteralPath $searchCueScript -Raw)
    }
    if ($editionNumber -ge 47) {
        $searchCss += "`n" + (Get-Content -LiteralPath $lookupAliasesStyle -Raw)
        $searchJavaScript += "`n" + (Get-Content -LiteralPath $lookupAliasesScript -Raw)
    }
    if ($editionNumber -ge 48) {
        $searchCss += "`n" + (Get-Content -LiteralPath $scaleChooserStyle -Raw)
        $searchJavaScript += "`n" + (Get-Content -LiteralPath $scaleChooserScript -Raw)
    }
    $searchShell = @'
<section class="proof-search" aria-labelledby="proof-search-heading">
<h2 id="proof-search-heading">Search this proof</h2>
<p>Search the selected records and application guides. Results open the canonical book projection below.</p>
<div class="proof-search__controls">
<label for="proof-search-query">Search terms
<input id="proof-search-query" type="search" autocomplete="off" placeholder="Try force, sample, balance, workflow, or contract">
</label>
<label for="proof-search-kind">Record kind
<select id="proof-search-kind"><option value="">All kinds</option></select>
</label>
<label for="proof-search-domain">Domain
<select id="proof-search-domain"><option value="">All domains</option></select>
</label>
</div>
<p id="proof-search-status" class="proof-search__status" role="status" aria-live="polite"></p>
<ol id="proof-search-results" class="proof-search__results"></ol>
<noscript><p>Search needs JavaScript. Every destination remains available in Browse the book.</p></noscript>
</section>
'@
    if ($editionNumber -ge 33) {
        $searchShell = $searchShell.Replace(
            '<div class="proof-search__controls">',
            '<div class="proof-search__controls proof-search__controls--families">'
        ).Replace(
            '</div>' + "`n" + '<p id="proof-search-status"',
            @'
<label for="proof-search-view">Result view
<select id="proof-search-view"><option value="families">Table families</option><option value="records">All records</option></select>
</label>
</div>
<p class="proof-search__families-boundary">Table families show exact publication ownership, not broader/narrower, synonym, relatedness, dependency, or closure.</p>
<p id="proof-search-status"
'@
        )
    }
    $htmlText = $htmlText.Replace('</head>', "<style>`n$searchCss`n</style>`n</head>")
    $navigationIndex = $htmlText.IndexOf('<nav id="TOC"', [System.StringComparison]::Ordinal)
    if ($navigationIndex -lt 0) {
        throw "Could not locate proof navigation for search shell"
    }
    $htmlText = $htmlText.Insert($navigationIndex, $searchShell)
    $searchBootstrap = "<script>window.FACTORIUM_SEARCH_INDEX=$searchJson;</script>`n<script>$searchJavaScript</script>`n"
    $htmlText = $htmlText.Replace('</body>', $searchBootstrap + '</body>')

    $searchAssetPaths = @($searchStyle, $searchScript)
    if ($editionNumber -ge 33) {
        $searchAssetPaths += $familySearchStyle
    }
    if ($editionNumber -ge 40) {
        $searchAssetPaths += @($searchCueStyle, $searchCueScript)
    }
    if ($editionNumber -ge 47) {
        $searchAssetPaths += @($lookupAliasesStyle, $lookupAliasesScript)
    }
    if ($editionNumber -ge 48) {
        $searchAssetPaths += @($scaleChooserStyle, $scaleChooserScript)
    }
    $searchAssets = foreach ($asset in $searchAssetPaths) {
        [ordered]@{
            path = [System.IO.Path]::GetRelativePath($workspace, $asset).Replace("\", "/")
            sha256 = (Get-FileHash -LiteralPath $asset -Algorithm SHA256).Hash.ToLowerInvariant()
        }
    }
    $searchChecks = [ordered]@{
        numbered_records = $numberedSelections.Count
        application_guides = $guideSelections.Count
        indexed_records = $searchRecords.Count
        indexed_domains = @($searchRecords.domain | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Sort-Object -Unique).Count
        duplicate_paths = $searchRecords.Count - $searchPaths.Count
        missing_rendered_targets = $missingSearchTargets.Count
        result_limit = 20
        execution = "static in-browser; no server or alternate content authority"
    }
    if ($editionNumber -ge 33) {
        $familyKeys = @($searchRecords.familyKey | Sort-Object -Unique)
        $familyOwnerRecords = @($searchRecords | Where-Object { $_.familyKind -eq "canonical" })
        $familySpecializedViews = @($familyOwnerRecords | Where-Object { $_.recordClass -eq "specialized-view" })
        $expectedFamilyViews = if ($editionNumber -ge 50) { 100 } elseif ($editionNumber -ge 49) { 97 } else { 95 }
        if ($familySpecializedViews.Count -ne $expectedFamilyViews -or
            @($familyOwnerRecords | Where-Object { [string]::IsNullOrWhiteSpace($_.familyHref) }).Count -ne 0) {
            throw "Canonical-family search ownership mismatch"
        }
        $searchChecks.result_views = @("families", "records")
        $searchChecks.default_result_view = "families"
        $searchChecks.ownership_groups = $familyKeys.Count
        $searchChecks.specialized_view_owners = $familySpecializedViews.Count
        $searchChecks.family_semantics = "exact-publication-ownership-only"
    }
    if ($editionNumber -ge 40) {
        $cueTargets = @($searchRecords | Where-Object {
            $_.path -eq "tables/entries/geometric-measure.md"
        })
        if ($cueTargets.Count -ne 1) {
            throw "Everyday search cue target must resolve exactly once"
        }
        $searchChecks.navigation_cue_phrases = @("size", "how big", "how large")
        $searchChecks.navigation_cue_target = $cueTargets[0].path
        $searchChecks.navigation_cue_semantics = "conditional-route-not-synonym-or-classification"
    }
    if ($editionNumber -ge 47) {
        $aliasTargetPaths = @(
            "tables/entries/electrical-quantity.md",
            "tables/entries/geometric-reference-structure.md",
            "tables/entries/matter-load-measure.md",
            "tables/entries/organization-role-authority.md"
        )
        foreach ($aliasTargetPath in $aliasTargetPaths) {
            if (@($searchRecords | Where-Object { $_.path -eq $aliasTargetPath }).Count -ne 1) {
                throw "Lookup alias target must resolve exactly once: $aliasTargetPath"
            }
        }
        $searchChecks.lookup_alias_phrases = @("electric power", "field of force", "force field", "frame of reference", "organisation")
        $searchChecks.lookup_alias_routes = 7
        $searchChecks.lookup_alias_targets = $aliasTargetPaths
        $searchChecks.lookup_alias_semantics = "language-route-to-existing-owner-not-equivalence-or-closure"
    }
    if ($editionNumber -ge 48) {
        $scaleTargetPaths = @(
            "tables/entries/evaluation-measure-scale-criterion.md",
            "tables/entries/quantity-value-unit-conversion.md",
            "tables/entries/geometric-reference-structure.md"
        )
        foreach ($scaleTargetPath in $scaleTargetPaths) {
            if (@($searchRecords | Where-Object { $_.path -eq $scaleTargetPath }).Count -ne 1) {
                throw "Scale chooser target must resolve exactly once: $scaleTargetPath"
            }
        }
        $searchChecks.scale_chooser_query = "scale"
        $searchChecks.scale_chooser_routes = 3
        $searchChecks.scale_chooser_targets = $scaleTargetPaths
        $searchChecks.scale_chooser_semantics = "explicit-meaning-choice-not-classification-or-equivalence"
    }
}

if ($editionNumber -ge 5) {
    foreach ($asset in @($readerStyle, $readerScript)) {
        if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
            throw "Missing reader asset: $asset"
        }
    }
    $sourceIndex = foreach ($source in $sources) {
        [ordered]@{
            path = [System.IO.Path]::GetRelativePath($workspace, $source).Replace("\", "/")
            anchor = $headingBySource[$source]
        }
    }
    $sourceIndexJson = ($sourceIndex | ConvertTo-Json -Depth 3 -Compress).Replace('</', '<\/')
    $readerCss = Get-Content -LiteralPath $readerStyle -Raw
    $readerJavaScript = Get-Content -LiteralPath $readerScript -Raw
    $readerShell = @'
<section class="reader-toolbar" aria-labelledby="reader-toolbar-heading" hidden>
<div class="reader-toolbar__heading">
<div>
<h2 id="reader-toolbar-heading">Reading view</h2>
<p id="reader-profile-status" class="reader-toolbar__status" role="status" aria-live="polite"></p>
</div>
<button id="reader-toc-toggle" type="button" aria-controls="TOC" aria-expanded="false">Show contents</button>
</div>
<div class="reader-toolbar__profiles" role="group" aria-label="Reading profile">
<button type="button" data-reader-profile="compact" aria-pressed="false" title="Titles and orientations, minimal metadata, tight spacing">Compact</button>
<button type="button" data-reader-profile="abbreviated" aria-pressed="false" title="Core reference content, minimal metadata, tight spacing">Abbreviated</button>
<button type="button" data-reader-profile="book" aria-pressed="true" title="Core reference content, essential metadata, comfortable spacing">Book</button>
<button type="button" data-reader-profile="full" aria-pressed="false" title="All content, metadata, provenance, and supporting sources">Full</button>
</div>
<details class="reader-toolbar__advanced">
<summary>Customize this view</summary>
<div class="reader-toolbar__controls">
<label for="reader-detail">Content detail
<select id="reader-detail">
<option value="summary">Summary</option><option value="core">Core</option><option value="full">All</option>
</select></label>
<label for="reader-metadata">Metadata
<select id="reader-metadata">
<option value="minimal">Minimal</option><option value="essential">Essential</option><option value="full">All</option>
</select></label>
<label for="reader-density">Spacing
<select id="reader-density">
<option value="tight">Tight</option><option value="comfortable">Comfortable</option>
</select></label>
<label for="reader-qualifiers">Context notation
<select id="reader-qualifiers">
<option value="folded">Fold repeated qualifier</option><option value="explicit">Show @ context</option>
</select></label>
</div>
</details>
</section>
'@
    $htmlText = $htmlText.Replace('</head>', "<style>`n$readerCss`n</style>`n</head>")
    $navigationIndex = $htmlText.IndexOf('<nav id="TOC"', [System.StringComparison]::Ordinal)
    if ($navigationIndex -lt 0) {
        throw "Could not locate proof navigation for reader controls"
    }
    $htmlText = $htmlText.Insert($navigationIndex, $readerShell)
    $readerBootstrap = "<script>window.FACTORIUM_SOURCE_INDEX=$sourceIndexJson;</script>`n<script>$readerJavaScript</script>`n"
    $htmlText = $htmlText.Replace('</body>', $readerBootstrap + '</body>')
    $searchAssets = @($searchAssets) + @(
        foreach ($asset in @($readerStyle, $readerScript)) {
            [ordered]@{
                path = [System.IO.Path]::GetRelativePath($workspace, $asset).Replace("\", "/")
                sha256 = (Get-FileHash -LiteralPath $asset -Algorithm SHA256).Hash.ToLowerInvariant()
            }
        }
    )
    $readerChecks = [ordered]@{
        profiles = @("compact", "abbreviated", "book", "full")
        default_profile = "book"
        detail_levels = @("summary", "core", "full")
        metadata_levels = @("minimal", "essential", "full")
        density_levels = @("tight", "comfortable")
        context_qualifier_modes = @("folded", "explicit")
        default_context_qualifiers = "folded"
        indexed_sources = @($sourceIndex).Count
        indexed_records = $searchChecks.indexed_records
        per_entry_full_override = $true
        deep_link_reveal = $true
    }
}

if ($editionNumber -ge 6) {
    foreach ($asset in @($contextStyle, $contextScript, $contextBindings)) {
        if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
            throw "Missing context-profile asset: $asset"
        }
    }

    $profileRecords = [System.Collections.Generic.List[object]]::new()
    $profilesById = [System.Collections.Generic.Dictionary[string, object]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    foreach ($profileSource in $contextProfileSources) {
        $profileText = Get-Content -LiteralPath $profileSource -Raw
        $profileIdMatch = [regex]::Match($profileText, '(?m)^Profile ID: `([^`]+)`$')
        $profileNameMatch = [regex]::Match($profileText, '(?m)^# (.+?) Context Profile$')
        $profileSummaryMatch = [regex]::Match($profileText, '(?m)^Summary: (.+)$')
        $profileDefaultsMatch = [regex]::Match($profileText, '(?m)^Defaults: (.+)$')
        $profileRequiresMatch = [regex]::Match($profileText, '(?m)^Requires: (.+)$')
        if (-not $profileIdMatch.Success -or -not $profileNameMatch.Success -or
            -not $profileSummaryMatch.Success -or -not $profileDefaultsMatch.Success -or
            -not $profileRequiresMatch.Success) {
            throw "Incomplete context profile contract: $profileSource"
        }
        $profileId = $profileIdMatch.Groups[1].Value
        if ($profilesById.ContainsKey($profileId)) {
            throw "Duplicate context profile ID: $profileId"
        }
        $profileRecord = [ordered]@{
            id = $profileId
            name = $profileNameMatch.Groups[1].Value
            summary = $profileSummaryMatch.Groups[1].Value
            defaults = @($profileDefaultsMatch.Groups[1].Value -split '; ' | ForEach-Object { $_.Trim('`') })
            requires = @($profileRequiresMatch.Groups[1].Value -split '; ' | ForEach-Object { $_.Trim('`') })
            path = [System.IO.Path]::GetRelativePath($workspace, $profileSource).Replace("\", "/")
            anchor = $headingBySource[$profileSource]
        }
        if ($editionNumber -ge 7) {
            $profileRelativePath = [System.IO.Path]::GetRelativePath($workspace, $profileSource).Replace("\", "/")
            $profileRecord.href = ConvertTo-SitePageName $profileRelativePath
        }
        $profilesById[$profileId] = $profileRecord
        $profileRecords.Add($profileRecord)
    }

    $selectedSearchPaths = [System.Collections.Generic.HashSet[string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    foreach ($record in $searchRecords) {
        [void]$selectedSearchPaths.Add($record.path)
    }
    $bindingText = Get-Content -LiteralPath $contextBindings -Raw
    $bindingMatches = [regex]::Matches(
        $bindingText,
        '(?m)^\| \[([^\]]+)\]\(([^)]+\.md)\) \| `([^`]+)` \| ([^|]+) \|$'
    )
    $bindingRecords = [System.Collections.Generic.List[object]]::new()
    $bindingKeys = [System.Collections.Generic.HashSet[string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    $bindingDirectory = Split-Path $contextBindings
    foreach ($bindingMatch in $bindingMatches) {
        $bindingPath = [System.IO.Path]::GetFullPath(
            (Join-Path $bindingDirectory $bindingMatch.Groups[2].Value)
        )
        $relativeBindingPath = [System.IO.Path]::GetRelativePath($workspace, $bindingPath).Replace("\", "/")
        $bindingProfileId = $bindingMatch.Groups[3].Value
        $bindingAppliesTo = $bindingMatch.Groups[4].Value.Trim()
        if (-not $profilesById.ContainsKey($bindingProfileId)) {
            throw "Unknown context profile binding: $bindingProfileId"
        }
        if (-not $selectedSearchPaths.Contains($relativeBindingPath)) {
            throw "Context profile binds unselected record: $relativeBindingPath"
        }
        $bindingKey = "$relativeBindingPath|$bindingProfileId|$bindingAppliesTo"
        if (-not $bindingKeys.Add($bindingKey)) {
            throw "Duplicate context profile binding: $bindingKey"
        }
        $bindingRecords.Add([ordered]@{
            title = $bindingMatch.Groups[1].Value
            path = $relativeBindingPath
            profileId = $bindingProfileId
            appliesTo = $bindingAppliesTo
        })
    }
    if ($profileRecords.Count -ne 3 -or $bindingRecords.Count -ne 16) {
        throw "Context profile shape mismatch: profiles=$($profileRecords.Count) bindings=$($bindingRecords.Count)"
    }

    $contextPayload = [ordered]@{
        profiles = $profileRecords
        bindings = $bindingRecords
    }
    $contextJson = ($contextPayload | ConvertTo-Json -Depth 5 -Compress).Replace('</', '<\/')
    $contextCss = Get-Content -LiteralPath $contextStyle -Raw
    $contextJavaScript = Get-Content -LiteralPath $contextScript -Raw
    $htmlText = $htmlText.Replace('</head>', "<style>`n$contextCss`n</style>`n</head>")
    $contextBootstrap = "<script>window.FACTORIUM_CONTEXT_PROFILES=$contextJson;</script>`n<script>$contextJavaScript</script>`n"
    $htmlText = $htmlText.Replace('</body>', $contextBootstrap + '</body>')

    $contextAssets = foreach ($asset in @($contextStyle, $contextScript, $contextBindings)) {
        [ordered]@{
            path = [System.IO.Path]::GetRelativePath($workspace, $asset).Replace("\", "/")
            sha256 = (Get-FileHash -LiteralPath $asset -Algorithm SHA256).Hash.ToLowerInvariant()
        }
    }
    $contextChecks = [ordered]@{
        profiles = $profileRecords.Count
        bindings = $bindingRecords.Count
        selected_binding_paths = $bindingKeys.Count
        missing_profile_ids = 0
        unselected_binding_paths = 0
        duplicate_bindings = 0
        canonical_interchange_changed = $false
    }
}

if ($contentLicenseNotice) {
    if (-not $htmlText.Contains('</body>')) {
        throw "Rendered proof has no body for the content-license notice"
    }
    $htmlText = $htmlText.Replace(
        '</body>',
        "<footer class=`"site-footer`">Formarium publication$contentLicenseNotice</footer>`n</body>"
    )
}

[System.IO.File]::WriteAllText(
    $html,
    $htmlText,
    [System.Text.UTF8Encoding]::new($false)
)

$ids = [System.Collections.Generic.HashSet[string]]::new(
    [System.StringComparer]::Ordinal
)
[regex]::Matches($htmlText, ' id="([^"]+)"') | ForEach-Object {
    [void]$ids.Add($_.Groups[1].Value)
}
$fragmentLinks = [regex]::Matches($htmlText, 'href="#([^"]+)"')
$missingFragments = [System.Collections.Generic.List[string]]::new()
foreach ($fragmentLink in $fragmentLinks) {
    if (-not $ids.Contains($fragmentLink.Groups[1].Value)) {
        $missingFragments.Add($fragmentLink.Groups[1].Value)
    }
}
$localFileLinks = [regex]::Matches(
    $htmlText,
    'href="(?!#|https?://|mailto:|data:)[^"]+"'
)
$repositorySourcePattern = 'href="https://github\.com/giodl73-repo/{0}/blob/[^"]+"' -f
    [regex]::Escape($repositoryName)
$repositorySourceLinks = [regex]::Matches($htmlText, $repositorySourcePattern)
if ($missingFragments.Count -ne 0) {
    throw "Rendered proof has $($missingFragments.Count) unresolved fragment links"
}
if ($localFileLinks.Count -ne 0) {
    throw "Rendered proof has $($localFileLinks.Count) filesystem-dependent links"
}

if ($editionNumber -ge 7) {
    if (-not (Test-Path -LiteralPath $siteStyle -PathType Leaf)) {
        throw "Missing proof-site asset: $siteStyle"
    }
    if ($editionNumber -ge 16) {
        foreach ($asset in @($labStyle, $labScript, $compositionLabSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-lab asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 17) {
        foreach ($asset in @($compositionReadingStyle, $compositionReadingScript, $compositionReadingSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-reading asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 18) {
        foreach ($asset in @($compositionFocusStyle, $compositionFocusSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-focus asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 19) {
        foreach ($asset in @($compositionPaletteStyle, $compositionPaletteScript, $compositionPaletteSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-palette asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 20) {
        foreach ($asset in @($compositionViewsStyle, $compositionViewsScript, $compositionViewsSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-reader-views asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 21) {
        foreach ($asset in @($compositionMapStyle, $compositionMapScript, $compositionMapSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-closure-map asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 22) {
        foreach ($asset in @($compositionStartersStyle, $compositionStartersScript, $compositionStartersSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-starters asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 23) {
        foreach ($asset in @($compositionQueryPlanStyle, $compositionQueryPlanScript, $compositionQueryPlanSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-query-plan asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 24) {
        if (-not (Test-Path -LiteralPath $compositionWorkBudgetSpec -PathType Leaf)) {
            throw "Missing composition work-budget specification: $compositionWorkBudgetSpec"
        }
    }
    if ($editionNumber -ge 25) {
        foreach ($asset in @($compositionReconciliationStyle, $compositionReconciliationScript, $compositionReconciliationSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-reconciliation asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 26) {
        foreach ($asset in @($compositionContinuationsStyle, $compositionContinuationsScript, $compositionContinuationsSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-continuations asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 27) {
        foreach ($asset in @($compositionRerunComparisonStyle, $compositionRerunComparisonScript, $compositionRerunComparisonSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition-rerun-comparison asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 28) {
        foreach ($asset in @($compositionGuideStyle, $compositionGuideScript, $compositionGuideSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition guide-skeleton asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 29) {
        foreach ($asset in @($compositionEvaluationStyle, $compositionEvaluationScript, $compositionEvaluationSpec)) {
            if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) {
                throw "Missing composition evaluation-record asset: $asset"
            }
        }
    }
    if ($editionNumber -ge 66 -and
        -not (Test-Path -LiteralPath $dictionaryStreamScript -PathType Leaf)) {
        throw "Missing dictionary stream asset: $dictionaryStreamScript"
    }

    $siteIndex = Join-Path $output "index.html"
    $siteCompose = if ($editionNumber -ge 16) { Join-Path $output "compose.html" } else { $null }
    $siteTablesIndex = if ($editionNumber -ge 35) { Join-Path $output "tables.html" } else { $null }
    $siteReader = if ($editionNumber -ge 36) { Join-Path $output "reader.html" } else { $null }
    $sitePointerIndex = if ($editionNumber -ge 52) { Join-Path $output "terms.html" } else { $null }
    $siteDictionaryStream = if ($editionNumber -ge 66) { Join-Path $output "dictionary.html" } else { $null }
    $siteDictionaryBook = if ($editionNumber -ge 66) { Join-Path $output "book.html" } else { $null }
    $siteEntryDirectory = Join-Path $output "entries"
    $siteChapterDirectory = Join-Path $output "chapters"
    $sitePointerDirectory = Join-Path $output "pointers"
    $siteAssetDirectory = Join-Path $output "assets"
    $siteDirectories = @($siteEntryDirectory, $siteChapterDirectory, $siteAssetDirectory)
    if ($editionNumber -ge 52) {
        $siteDirectories += $sitePointerDirectory
    }
    New-Item -ItemType Directory -Force -Path $siteDirectories | Out-Null

    $pageBySource = [System.Collections.Generic.Dictionary[string, string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    $pageNames = [System.Collections.Generic.HashSet[string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    foreach ($source in $sources) {
        $relativeSource = [System.IO.Path]::GetRelativePath($workspace, $source).Replace("\", "/")
        $pageName = ConvertTo-SitePageName $relativeSource
        if (-not $pageNames.Add($pageName)) {
            throw "Duplicate site page name: $pageName"
        }
        $pageBySource[$source] = $pageName
    }

    $sourceByRenderedId = [System.Collections.Generic.Dictionary[string, string]]::new(
        [System.StringComparer]::Ordinal
    )
    foreach ($source in $sources) {
        foreach ($idMatch in [regex]::Matches($renderedSegmentBySource[$source], ' id="([^"]+)"')) {
            $renderedId = $idMatch.Groups[1].Value
            if ($sourceByRenderedId.ContainsKey($renderedId)) {
                throw "Duplicate rendered site ID: $renderedId"
            }
            $sourceByRenderedId[$renderedId] = $source
        }
    }

    $searchRecordByPath = [System.Collections.Generic.Dictionary[string, object]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    $searchRecordIndexByPath = [System.Collections.Generic.Dictionary[string, int]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    for ($recordIndex = 0; $recordIndex -lt $searchRecords.Count; $recordIndex++) {
        $searchRecord = $searchRecords[$recordIndex]
        $searchRecordByPath[$searchRecord.path] = $searchRecord
        $searchRecordIndexByPath[$searchRecord.path] = $recordIndex
    }

    $pointerRecords = [System.Collections.Generic.List[object]]::new()
    $pointerByTerm = [System.Collections.Generic.Dictionary[string, object]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    $pointerOccurrenceCount = 0
    $pointerOwnerCount = 0
    $pointerClientJson = "[]"
    if ($editionNumber -ge 52) {
        if (-not (Test-Path -LiteralPath $pointerRegistry -PathType Leaf)) {
            throw "Missing pointer registry: $pointerRegistry"
        }
        $pointerLines = @(Get-PointerRegistryRows -RegistryPath $pointerRegistry)
        $pointerSlugs = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
        foreach ($pointerLine in $pointerLines) {
            $pointerMatch = [regex]::Match($pointerLine, '^pointer ([a-z0-9]+(?:-[a-z0-9]+)*) \| ([^|]+) \| (.+)$')
            if (-not $pointerMatch.Success) {
                throw "Invalid pointer registry row: $pointerLine"
            }
            $pointerSlug = $pointerMatch.Groups[1].Value
            $pointerLabel = $pointerMatch.Groups[2].Value.Trim()
            $pointerTerm = $pointerLabel.ToLowerInvariant()
            if (-not $pointerSlugs.Add($pointerSlug) -or $pointerByTerm.ContainsKey($pointerTerm)) {
                throw "Duplicate pointer identity: $pointerSlug/$pointerTerm"
            }
            $pointerRecord = [ordered]@{
                slug = $pointerSlug
                label = $pointerLabel
                term = $pointerTerm
                orientation = $pointerMatch.Groups[3].Value.Trim()
                occurrences = [System.Collections.Generic.List[object]]::new()
                occurrenceKeys = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
            }
            $pointerRecords.Add($pointerRecord)
            $pointerByTerm[$pointerTerm] = $pointerRecord
        }
        if ($pointerRecords.Count -ne $expectedPointerCount) {
            throw "Pointer registry count mismatch: $($pointerRecords.Count)"
        }

        $pointerPatternParts = @($pointerRecords | Sort-Object { $_.term.Length } -Descending | ForEach-Object {
            [regex]::Escape($_.term)
        })
        $pointerTokenPattern = '(?i)(?<![a-z0-9-])(' + ($pointerPatternParts -join '|') + ')(?![a-z0-9-])'
        foreach ($source in $sources) {
            $relativeSource = [System.IO.Path]::GetRelativePath($workspace, $source).Replace("\", "/")
            if (-not $relativeSource.StartsWith("tables/", [System.StringComparison]::OrdinalIgnoreCase) -or
                -not $searchRecordByPath.ContainsKey($relativeSource)) {
                continue
            }
            $segment = $renderedSegmentBySource[$source]
            foreach ($codeMatch in [regex]::Matches($segment, '(?s)<code>(.*?)</code>')) {
                $codeHtml = $codeMatch.Groups[1].Value
                $expression = [System.Net.WebUtility]::HtmlDecode(
                    [regex]::Replace($codeHtml, '<[^>]+>', '')
                ).Trim()
                $matchedTerms = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
                foreach ($termMatch in [regex]::Matches($expression, $pointerTokenPattern)) {
                    [void]$matchedTerms.Add($termMatch.Groups[1].Value.ToLowerInvariant())
                }
                foreach ($matchedTerm in $matchedTerms) {
                    $matchedPointer = $pointerByTerm[$matchedTerm]
                    $occurrenceKey = "$relativeSource|$expression"
                    if ($matchedPointer.occurrenceKeys.Add($occurrenceKey)) {
                        $matchedPointer.occurrences.Add([ordered]@{
                            path = $relativeSource
                            title = $searchRecordByPath[$relativeSource].title
                            page = $pageBySource[$source]
                            anchor = $headingBySource[$source]
                            expression = $expression
                        })
                    }
                }
            }
            $segment = [regex]::Replace(
                $segment,
                '(?s)<code>(.*?)</code>',
                {
                    param($codeMatch)

                    $codeHtml = $codeMatch.Groups[1].Value
                    $linkedCode = [regex]::Replace(
                        $codeHtml,
                        $pointerTokenPattern,
                        {
                            param($termMatch)
                            $pointerRecord = $pointerByTerm[$termMatch.Groups[1].Value.ToLowerInvariant()]
                            return '<a class="pointer-link" href="../pointers/' + $pointerRecord.slug + '.html">' + $termMatch.Groups[1].Value + '</a>'
                        }
                    )
                    return '<code>' + $linkedCode + '</code>'
                }
            )
            $renderedSegmentBySource[$source] = $segment
        }
        foreach ($pointerRecord in $pointerRecords) {
            if ($pointerRecord.occurrences.Count -eq 0) {
                throw "Registered pointer has no structural occurrence: $($pointerRecord.slug)"
            }
            $pointerOccurrenceCount += $pointerRecord.occurrences.Count
            $pointerOwnerCount += @($pointerRecord.occurrences.path | Sort-Object -Unique).Count
        }
        $pointerClientJson = @($pointerRecords | ForEach-Object {
            [ordered]@{ term = $_.term; slug = $_.slug }
        }) | ConvertTo-Json -Compress
    }

    $siteChapters = [System.Collections.Generic.List[object]]::new()
    $selectedSiteChapters = @(Get-SiteChapterSelections $volume) + @(Get-SiteChapterSelections $supplement)
    if ($editionNumber -ge 49) {
        $selectedSiteChapters += @(Get-SiteChapterSelections $v1Supplement)
    }
    if ($editionNumber -ge 50) {
        $selectedSiteChapters += @(Get-SiteChapterSelections $v2Supplement)
    }
    if ($editionNumber -ge 68) {
        $selectedSiteChapters += @(Get-SiteChapterSelections $candidateAdmissionSupplement)
    }
    if ($editionNumber -ge 69) {
        $selectedSiteChapters += @(Get-SiteChapterSelections $domainExpansionSupplement)
    }
    if ($editionNumber -ge 70) {
        $selectedSiteChapters += @(Get-SiteChapterSelections $roadmapWave1Supplement)
    }
    if ($editionNumber -ge 71) {
        $selectedSiteChapters += @(Get-SiteChapterSelections $roadmapWave2Supplement)
    }
    if ($editionNumber -ge 72) {
        $selectedSiteChapters += @(Get-SiteChapterSelections $roadmapWave3Supplement)
    }
    if ($editionNumber -ge 73) {
        $selectedSiteChapters += @(Get-SiteChapterSelections $roadmapWave4Supplement)
    }
    if ($editionNumber -ge 74) {
        $selectedSiteChapters += @(Get-SiteChapterSelections $roadmapWave5Supplement)
    }
    if ($editionNumber -ge 66) {
        foreach ($chapter in $selectedSiteChapters) {
            $chapter.paths = @($chapter.paths | ForEach-Object {
                if ($selectionRenames.ContainsKey($_)) { $selectionRenames[$_] } else { $_ }
            })
            foreach ($group in $chapter.groups) {
                $group.paths = @($group.paths | ForEach-Object {
                    if ($selectionRenames.ContainsKey($_)) { $selectionRenames[$_] } else { $_ }
                })
            }
        }
    }
    foreach ($chapter in $selectedSiteChapters) {
        $siteChapters.Add($chapter)
    }
    $siteChapters.Add([ordered]@{
        key = "applications"
        title = "Applications"
        paths = @($guideSelections | ForEach-Object { $_.path })
        groups = @([ordered]@{
            title = "Factor Guides"
            paths = @($guideSelections | ForEach-Object { $_.path })
        })
    })
    $chapterBySearchPath = [System.Collections.Generic.Dictionary[string, object]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    foreach ($chapter in $siteChapters) {
        $groupPathSet = [System.Collections.Generic.HashSet[string]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
        foreach ($group in $chapter.groups) {
            foreach ($groupPath in $group.paths) {
                if (-not $groupPathSet.Add($groupPath)) {
                    throw "Chapter subsection repeats a record: $($chapter.key) $groupPath"
                }
            }
        }
        $missingGroupPaths = @($chapter.paths | Where-Object { -not $groupPathSet.Contains($_) })
        $extraGroupPaths = @($groupPathSet | Where-Object { $_ -notin $chapter.paths })
        if ($missingGroupPaths.Count -ne 0 -or $extraGroupPaths.Count -ne 0) {
            throw "Chapter subsection coverage mismatch: chapter=$($chapter.key) missing=$($missingGroupPaths -join ',') extra=$($extraGroupPaths -join ',')"
        }
        foreach ($chapterPath in $chapter.paths) {
            $chapterRelativePath = [System.IO.Path]::GetRelativePath($workspace, $chapterPath).Replace("\", "/")
            if (-not $searchRecordByPath.ContainsKey($chapterRelativePath)) {
                throw "Chapter contains an unindexed record: $chapterRelativePath"
            }
            if ($chapterBySearchPath.ContainsKey($chapterRelativePath)) {
                throw "Record appears in more than one site chapter: $chapterRelativePath"
            }
            $chapterBySearchPath[$chapterRelativePath] = $chapter
        }
    }
    $expectedSiteChapterCount = if ($editionNumber -ge 74) { 27 } elseif ($editionNumber -ge 73) { 26 } elseif ($editionNumber -ge 72) { 25 } elseif ($editionNumber -ge 71) { 24 } elseif ($editionNumber -ge 70) { 23 } elseif ($editionNumber -ge 69) { 22 } elseif ($editionNumber -ge 68) { 21 } elseif ($editionNumber -ge 50) { 20 } elseif ($editionNumber -ge 49) { 19 } else { 18 }
    if ($siteChapters.Count -ne $expectedSiteChapterCount -or $chapterBySearchPath.Count -ne $searchRecords.Count) {
        throw "Site chapter coverage mismatch: chapters=$($siteChapters.Count) records=$($chapterBySearchPath.Count)"
    }

    $siteCssParts = @(
        (Get-Content -LiteralPath $style -Raw),
        (Get-Content -LiteralPath $searchStyle -Raw),
        (Get-Content -LiteralPath $readerStyle -Raw),
        (Get-Content -LiteralPath $contextStyle -Raw),
        (Get-Content -LiteralPath $siteStyle -Raw)
    )
    if ($editionNumber -ge 12) {
        $siteCssParts += (Get-Content -LiteralPath $compositionStyle -Raw)
    }
    if ($editionNumber -ge 13) {
        $siteCssParts += (Get-Content -LiteralPath $conflictStyle -Raw)
    }
    if ($editionNumber -ge 14) {
        $siteCssParts += (Get-Content -LiteralPath $frontierStyle -Raw)
    }
    if ($editionNumber -ge 15) {
        $siteCssParts += (Get-Content -LiteralPath $explorerStyle -Raw)
    }
    if ($editionNumber -ge 16) {
        $siteCssParts += (Get-Content -LiteralPath $labStyle -Raw)
    }
    if ($editionNumber -ge 17) {
        $siteCssParts += (Get-Content -LiteralPath $compositionReadingStyle -Raw)
    }
    if ($editionNumber -ge 18) {
        $siteCssParts += (Get-Content -LiteralPath $compositionFocusStyle -Raw)
    }
    if ($editionNumber -ge 19) {
        $siteCssParts += (Get-Content -LiteralPath $compositionPaletteStyle -Raw)
    }
    if ($editionNumber -ge 20) {
        $siteCssParts += (Get-Content -LiteralPath $compositionViewsStyle -Raw)
    }
    if ($editionNumber -ge 21) {
        $siteCssParts += (Get-Content -LiteralPath $compositionMapStyle -Raw)
    }
    if ($editionNumber -ge 22) {
        $siteCssParts += (Get-Content -LiteralPath $compositionStartersStyle -Raw)
    }
    if ($editionNumber -ge 23) {
        $siteCssParts += (Get-Content -LiteralPath $compositionQueryPlanStyle -Raw)
    }
    if ($editionNumber -ge 25) {
        $siteCssParts += (Get-Content -LiteralPath $compositionReconciliationStyle -Raw)
    }
    if ($editionNumber -ge 26) {
        $siteCssParts += (Get-Content -LiteralPath $compositionContinuationsStyle -Raw)
    }
    if ($editionNumber -ge 27) {
        $siteCssParts += (Get-Content -LiteralPath $compositionRerunComparisonStyle -Raw)
    }
    if ($editionNumber -ge 28) {
        $siteCssParts += (Get-Content -LiteralPath $compositionGuideStyle -Raw)
    }
    if ($editionNumber -ge 29) {
        $siteCssParts += (Get-Content -LiteralPath $compositionEvaluationStyle -Raw)
    }
    if ($editionNumber -ge 30) {
        $siteCssParts += (Get-Content -LiteralPath $candidateSiteStyle -Raw)
    }
    if ($editionNumber -ge 31) {
        $siteCssParts += (Get-Content -LiteralPath $twoBookSiteStyle -Raw)
    }
    if ($editionNumber -ge 43) {
        $siteCssParts += (Get-Content -LiteralPath $intentRouterStyle -Raw)
    }
    if ($editionNumber -ge 44) {
        $siteCssParts += (Get-Content -LiteralPath $handoffStyle -Raw)
    }
    if ($editionNumber -ge 45) {
        $siteCssParts += (Get-Content -LiteralPath $dualLookupStyle -Raw)
    }
    if ($editionNumber -ge 32) {
        $siteCssParts += (Get-Content -LiteralPath $tableNavigatorStyle -Raw)
    }
    if ($editionNumber -ge 33) {
        $siteCssParts += (Get-Content -LiteralPath $familySearchStyle -Raw)
    }
    if ($editionNumber -ge 40) {
        $siteCssParts += (Get-Content -LiteralPath $searchCueStyle -Raw)
    }
    if ($editionNumber -ge 47) {
        $siteCssParts += (Get-Content -LiteralPath $lookupAliasesStyle -Raw)
    }
    if ($editionNumber -ge 48) {
        $siteCssParts += (Get-Content -LiteralPath $scaleChooserStyle -Raw)
    }
    if ($editionNumber -ge 52) {
        $siteCssParts += (Get-Content -LiteralPath $pointerStyle -Raw)
    }
    if ($editionNumber -ge 34) {
        $siteCssParts += (Get-Content -LiteralPath $tableFamilyContentsStyle -Raw)
    }
    if ($editionNumber -ge 35) {
        $siteCssParts += (Get-Content -LiteralPath $tablesIndexStyle -Raw)
    }
    if ($editionNumber -ge 36) {
        if (-not (Test-Path -LiteralPath $readerRouteStyle -PathType Leaf)) {
            throw "Missing Reader route style: $readerRouteStyle"
        }
        $siteCssParts += (Get-Content -LiteralPath $readerRouteStyle -Raw)
    }
    if ($editionNumber -ge 37) {
        if (-not (Test-Path -LiteralPath $readerSequenceStyle -PathType Leaf)) {
            throw "Missing Reader sequence style: $readerSequenceStyle"
        }
        $siteCssParts += (Get-Content -LiteralPath $readerSequenceStyle -Raw)
    }
    $siteCss = $siteCssParts -join "`n"
    [System.IO.File]::WriteAllText(
        (Join-Path $siteAssetDirectory "site.css"),
        $siteCss,
        [System.Text.UTF8Encoding]::new($false)
    )
    [System.IO.File]::WriteAllText(
        (Join-Path $siteAssetDirectory "search.js"),
        $searchJavaScript,
        [System.Text.UTF8Encoding]::new($false)
    )
    [System.IO.File]::WriteAllText(
        (Join-Path $siteAssetDirectory "reader.js"),
        (Get-Content -LiteralPath $readerScript -Raw),
        [System.Text.UTF8Encoding]::new($false)
    )
    [System.IO.File]::WriteAllText(
        (Join-Path $siteAssetDirectory "context.js"),
        (Get-Content -LiteralPath $contextScript -Raw),
        [System.Text.UTF8Encoding]::new($false)
    )
    if ($editionNumber -ge 44) {
        $handoffScriptText = Get-Content -LiteralPath $handoffScript -Raw
        if ($lexiconIdentity) {
            $handoffScriptText = $handoffScriptText.Replace("Current Factorium page", "Current Lexicon page")
        }
        elseif ($formariumIdentity) {
            $handoffScriptText = $handoffScriptText.Replace("Current Factorium page", "Current Formarium page")
        }
        if ($lexiconIdentity) {
            $handoffScriptText = $handoffScriptText.Replace("factorium-handoff", "lexicon-handoff")
        }
        elseif ($editionNumber -ge 66) {
            $handoffScriptText = $handoffScriptText.Replace("factorium-handoff", "formarium-handoff")
        }
        [System.IO.File]::WriteAllText(
            (Join-Path $siteAssetDirectory "handoff.js"),
            $handoffScriptText,
            [System.Text.UTF8Encoding]::new($false)
        )
    }
    if ($editionNumber -ge 66) {
        [System.IO.File]::WriteAllText(
            (Join-Path $siteAssetDirectory "dictionary-stream.js"),
            (Get-Content -LiteralPath $dictionaryStreamScript -Raw),
            [System.Text.UTF8Encoding]::new($false)
        )
    }
    if ($editionNumber -ge 52) {
        [System.IO.File]::WriteAllText(
            (Join-Path $siteAssetDirectory "pointers.js"),
            (Get-Content -LiteralPath $pointerScript -Raw),
            [System.Text.UTF8Encoding]::new($false)
        )
    }
    if ($editionNumber -ge 45) {
        [System.IO.File]::WriteAllText(
            (Join-Path $siteAssetDirectory "dual-lookup.js"),
            (Get-Content -LiteralPath $dualLookupScript -Raw),
            [System.Text.UTF8Encoding]::new($false)
        )
    }
    $compositionLabJson = "null"
    $compositionReadingJson = "null"
    $compositionStartersJson = "null"
    $compositionStarterCards = ""
    if ($editionNumber -ge 16) {
        $relationManifestPath = if ($editionNumber -ge 67) {
            Join-Path $workspace "reference\lexicon-relations-v2.lexicon"
        }
        elseif ($editionNumber -ge 66) {
            Join-Path $workspace "reference\formarium-relations-v1.formarium"
        }
        else {
            Join-Path $workspace "reference\factorium-relations-v0.factorium"
        }
        $referenceManifestPath = if ($editionNumber -ge 67) {
            Join-Path $workspace "reference\lexicon-reference-v4.lexicon"
        }
        elseif ($editionNumber -ge 66) {
            Join-Path $workspace "reference\formarium-reference-v3.formarium"
        }
        else {
            Join-Path $workspace "reference\factorium-reference-v0.factorium"
        }
        $allowlistLines = @(Get-Content -LiteralPath $compositionLabAllowlist)
        $expectedAllowlistHeader = if ($editionNumber -ge 67) {
            "lexicon-composition-lab-relations-v1"
        }
        elseif ($editionNumber -ge 66) {
            "formarium-composition-lab-relations-v1"
        }
        else {
            "factorium-composition-lab-relations-v0"
        }
        if ($allowlistLines[0] -ne $expectedAllowlistHeader -or $allowlistLines[-1] -ne "end-relations") {
            throw "Composition Lab allowlist framing drift"
        }
        $labRelationIds = @($allowlistLines[1..($allowlistLines.Count - 2)] | ForEach-Object {
            if (-not $_.StartsWith("relation ", [System.StringComparison]::Ordinal)) {
                throw "Composition Lab allowlist record drift: $_"
            }
            $_.Substring("relation ".Length)
        })
        if ($labRelationIds.Count -ne 6 -or @($labRelationIds | Sort-Object -Unique).Count -ne 6) {
            throw "Composition Lab allowlist requires six unique relation IDs"
        }
        $canonicalRelationCount = @(Get-Content -LiteralPath $relationManifestPath | Where-Object {
            $_.StartsWith("relation ", [System.StringComparison]::Ordinal)
        }).Count
        $labRelations = @(
            foreach ($line in Get-Content -LiteralPath $relationManifestPath) {
                if (-not $line.StartsWith("relation ", [System.StringComparison]::Ordinal)) {
                    continue
                }
                $fields = $line.Substring("relation ".Length) -split ' \| '
                if ($fields.Count -ne 7) {
                    throw "Composition Lab relation field drift: $line"
                }
                if ($fields[0] -notin $labRelationIds) {
                    continue
                }
                $scopeSource = [System.IO.Path]::GetFullPath((Join-Path $workspace $fields[6]))
                if (-not $pageBySource.ContainsKey($scopeSource)) {
                    throw "Composition Lab scope source is absent from site: $scopeSource"
                }
                [ordered]@{
                    id = $fields[0]
                    verb = $fields[1]
                    source = $fields[2]
                    target = $fields[3]
                    scope = $fields[4]
                    qualifiers = $fields[5]
                    scopeHref = "entries/$($pageBySource[$scopeSource])"
                }
            }
        )
        if ($labRelations.Count -ne 6 -or @($labRelations.id | Sort-Object -Unique).Count -ne 6) {
            throw "Composition Lab requires six unique reviewed relations"
        }
        $compositionLabPayload = [ordered]@{
            schema = if ($lexiconIdentity) { "lexicon-composition-lab-payload-v0" } else { "factorium-composition-lab-payload-v0" }
            referenceSha256 = (Get-FileHash -LiteralPath $referenceManifestPath -Algorithm SHA256).Hash.ToLowerInvariant()
            relationsSha256 = (Get-FileHash -LiteralPath $relationManifestPath -Algorithm SHA256).Hash.ToLowerInvariant()
            relations = $labRelations
        }
        $compositionLabJson = $compositionLabPayload | ConvertTo-Json -Depth 5 -Compress
        $labRuntimeText = Get-Content -LiteralPath $labScript -Raw
        if ($editionNumber -lt 24) {
            $labRuntimeText = ConvertTo-Sim23CompositionAsset -Name "lab" -Text $labRuntimeText
        }
        $readingHookLine = '          if (root && typeof root.FACTORIUM_COMPOSITION_READING_ROUTE_RENDER === "function") root.FACTORIUM_COMPOSITION_READING_ROUTE_RENDER(identified);'
        if (-not $labRuntimeText.Contains($readingHookLine)) {
            throw "Composition Lab runtime omits the reading-route extension hook"
        }
        if ($editionNumber -eq 16) {
            $labRuntimeText = $labRuntimeText.Replace("$readingHookLine`r`n", "").Replace("$readingHookLine`n", "")
            if ($labRuntimeText.Contains($readingHookLine)) {
                throw "Composition Lab sim-16 hook removal failed"
            }
        }
        [System.IO.File]::WriteAllText(
            (Join-Path $siteAssetDirectory "composition-lab.js"),
            $labRuntimeText,
            [System.Text.UTF8Encoding]::new($false)
        )
        $compositionLabChecks = [ordered]@{
            mode = "local bounded closure over explicit reviewed relation allowlist"
            canonical_relation_records = $canonicalRelationCount
            relation_records = $labRelations.Count
            allowlist_path = [System.IO.Path]::GetRelativePath($workspace, $compositionLabAllowlist).Replace("\", "/")
            allowlist_sha256 = (Get-FileHash -LiteralPath $compositionLabAllowlist -Algorithm SHA256).Hash.ToLowerInvariant()
            seed_artifacts = @($labRelations.source + $labRelations.target | Sort-Object -Unique).Count
            scope_views = @($labRelations.scope | Sort-Object -Unique).Count
            automatic_relation_discovery = $false
            natural_language_semantic_selection = $false
            check_outcomes = "unresolved-only"
            persistence = "none"
            specification = "specs/COMPOSITION-LAB.md"
        }
        if ($editionNumber -ge 17) {
            $readingArtifacts = @($labRelations.source + $labRelations.target + $labRelations.scope | Sort-Object -Unique)
            $readingArtifactSet = [System.Collections.Generic.HashSet[string]]::new(
                [System.StringComparer]::Ordinal
            )
            foreach ($artifact in $readingArtifacts) { [void]$readingArtifactSet.Add($artifact) }
            $factorBindings = [System.Collections.Generic.Dictionary[string, object]]::new(
                [System.StringComparer]::Ordinal
            )
            $viewBindings = [System.Collections.Generic.Dictionary[string, object]]::new(
                [System.StringComparer]::Ordinal
            )
            $currentEntry = $null
            foreach ($line in Get-Content -LiteralPath $referenceManifestPath) {
                if ($line.StartsWith("entry ", [System.StringComparison]::Ordinal)) {
                    $fields = $line -split ' \| '
                    if ($fields.Count -ne 6) { throw "Composition reading entry field drift: $line" }
                    $currentEntry = [ordered]@{
                        id = $fields[0].Substring("entry ".Length)
                        title = $fields[1]
                        source = [System.IO.Path]::GetFullPath((Join-Path $workspace $fields[4]))
                    }
                }
                elseif ($line.StartsWith("factor ", [System.StringComparison]::Ordinal)) {
                    if ($null -eq $currentEntry) { throw "Composition reading factor has no entry: $line" }
                    $fields = $line -split ' \| '
                    if ($fields.Count -ne 2) { throw "Composition reading factor field drift: $line" }
                    $artifact = "factor:$($currentEntry.id)/$($fields[0].Substring("factor ".Length))"
                    if (-not $readingArtifactSet.Contains($artifact)) { continue }
                    if ($factorBindings.ContainsKey($artifact)) {
                        throw "Duplicate composition reading factor binding: $artifact"
                    }
                    if (-not $pageBySource.ContainsKey($currentEntry.source)) {
                        throw "Composition reading anchor page is absent: $($currentEntry.source)"
                    }
                    $factorBinding = [ordered]@{
                        artifact = $artifact
                        label = $fields[1]
                        pageTitle = $currentEntry.title
                        kind = "anchor"
                        href = "entries/$($pageBySource[$currentEntry.source])"
                    }
                    if ($editionNumber -ge 18) {
                        $focusId = "factor-focus-$($artifact.Substring("factor:".Length).Replace("/", "-"))"
                        if ($focusId -notmatch '^factor-focus-[a-z0-9]+(?:-[a-z0-9]+)*$') {
                            throw "Composition factor focus ID is invalid: $focusId"
                        }
                        $factorBinding.focusHref = "$($factorBinding.href)#$focusId"
                        $compositionFocusRecords += [ordered]@{
                            artifact = $artifact
                            label = $fields[1]
                            entryTitle = $currentEntry.title
                            source = $currentEntry.source
                            page = $factorBinding.href
                            focusId = $focusId
                            focusHref = $factorBinding.focusHref
                        }
                    }
                    $factorBindings[$artifact] = $factorBinding
                }
                elseif ($line -eq "end-entry") {
                    $currentEntry = $null
                }
                elseif ($line.StartsWith("view ", [System.StringComparison]::Ordinal)) {
                    $fields = $line -split ' \| '
                    if ($fields.Count -ne 7) { throw "Composition reading view field drift: $line" }
                    $artifact = "view:$($fields[0].Substring("view ".Length))"
                    if (-not $readingArtifactSet.Contains($artifact)) { continue }
                    if ($viewBindings.ContainsKey($artifact)) {
                        throw "Duplicate composition reading view binding: $artifact"
                    }
                    $viewSource = [System.IO.Path]::GetFullPath((Join-Path $workspace $fields[5]))
                    if (-not $pageBySource.ContainsKey($viewSource)) {
                        throw "Composition reading view page is absent: $viewSource"
                    }
                    $viewBindings[$artifact] = [ordered]@{
                        artifact = $artifact
                        label = $fields[4]
                        pageTitle = $fields[4]
                        kind = "view"
                        href = "entries/$($pageBySource[$viewSource])"
                    }
                }
            }
            $readingBindings = @(
                foreach ($artifact in $readingArtifacts) {
                    if ($factorBindings.ContainsKey($artifact)) { $factorBindings[$artifact] }
                    elseif ($viewBindings.ContainsKey($artifact)) { $viewBindings[$artifact] }
                    else { throw "Composition reading artifact has no exact reference binding: $artifact" }
                }
            )
            if ($readingBindings.Count -ne 18 -or
                @($readingBindings.artifact | Sort-Object -Unique).Count -ne 18 -or
                @($readingBindings | Where-Object { $_.kind -eq "anchor" }).Count -ne 12 -or
                @($readingBindings | Where-Object { $_.kind -eq "view" }).Count -ne 6) {
                throw "Composition reading requires 12 endpoint and 6 scope bindings"
            }
            $compositionReadingPayload = [ordered]@{
                schema = if ($lexiconIdentity) { "lexicon-composition-reading-payload-v0" } else { "factorium-composition-reading-payload-v0" }
                referenceSha256 = $compositionLabPayload.referenceSha256
                relationsSha256 = $compositionLabPayload.relationsSha256
                bindings = $readingBindings
            }
            $compositionReadingJson = $compositionReadingPayload | ConvertTo-Json -Depth 5 -Compress
            $readingRuntimeText = Get-Content -LiteralPath $compositionReadingScript -Raw
            $focusValidationLine = '      if (binding.focusHref !== undefined) assert(/^entries\/[a-z0-9-]+\.html#factor-focus-[a-z0-9-]+$/.test(binding.focusHref), "Reading binding has invalid factor focus destination");'
            $orderedNodesLine = '    var orderedNodes = result.graph.nodes.slice().sort(function (left, right) { return left.artifact.localeCompare(right.artifact); });'
            $orderedLoopLine = '    orderedNodes.forEach(function (node) {'
            $focusCreateLine = '        if (binding.focusHref) page.focusHref = binding.focusHref;'
            $focusUpdateLine = '          if (binding.focusHref) page.focusHref = binding.focusHref;'
            foreach ($marker in @($focusValidationLine, $orderedNodesLine, $orderedLoopLine, $focusCreateLine, $focusUpdateLine, 'page.focusHref || page.href')) {
                if (-not $readingRuntimeText.Contains($marker)) {
                    throw "Composition reading runtime extension marker drift: $marker"
                }
            }
            if ($editionNumber -eq 17) {
                foreach ($line in @($focusValidationLine, $orderedNodesLine, $focusUpdateLine, $focusCreateLine)) {
                    $readingRuntimeText = $readingRuntimeText.Replace("$line`r`n", "").Replace("$line`n", "")
                }
                $readingRuntimeText = $readingRuntimeText.Replace($orderedLoopLine, '    result.graph.nodes.forEach(function (node) {')
                $readingRuntimeText = $readingRuntimeText.Replace('page.focusHref || page.href', 'page.href')
                foreach ($marker in @($focusValidationLine, $orderedNodesLine, $orderedLoopLine, $focusCreateLine, $focusUpdateLine, 'page.focusHref || page.href')) {
                    if ($readingRuntimeText.Contains($marker)) {
                        throw "Composition Reading sim-17 extension removal failed: $marker"
                    }
                }
            }
            [System.IO.File]::WriteAllText(
                (Join-Path $siteAssetDirectory "composition-reading.js"),
                $readingRuntimeText,
                [System.Text.UTF8Encoding]::new($false)
            )
            $compositionReadingChecks = [ordered]@{
                mode = "deterministic admitted-closure reading projection"
                artifact_bindings = $readingBindings.Count
                endpoint_bindings = @($readingBindings | Where-Object { $_.kind -eq "anchor" }).Count
                scope_bindings = @($readingBindings | Where-Object { $_.kind -eq "view" }).Count
                projection_scope = "admitted graph nodes only"
                ordering = "start, continue, evaluate; then title, destination, artifact"
                deduplication = "local destination with all artifact bindings retained"
                authority = "existing book pages"
                persistence = "none"
                specification = "specs/COMPOSITION-READING-ROUTE.md"
            }
            if ($editionNumber -ge 18) {
                if ($compositionFocusRecords.Count -ne 12 -or
                    @($compositionFocusRecords.focusId | Sort-Object -Unique).Count -ne 12 -or
                    @($compositionFocusRecords.source | Sort-Object -Unique).Count -ne 6) {
                    throw "Composition factor focus requires 12 unique factors across 6 anchor pages"
                }
                $compositionFocusChecks = [ordered]@{
                    factor_focus_records = $compositionFocusRecords.Count
                    anchor_pages = @($compositionFocusRecords.source | Sort-Object -Unique).Count
                    scope_focus_records = 0
                    target_behavior = "CSS :target; JavaScript not required"
                    source_handoff = "existing Root factorization heading"
                    canonical_source_mutation = $false
                    specification = "specs/COMPOSITION-FACTOR-FOCUS.md"
                }
            }
            if ($editionNumber -ge 19) {
                $paletteGroupCounts = @{}
                foreach ($binding in $readingBindings | Where-Object { $_.kind -eq "anchor" }) {
                    if (-not $paletteGroupCounts.ContainsKey($binding.href)) {
                        $paletteGroupCounts[$binding.href] = 0
                    }
                    $paletteGroupCounts[$binding.href] += 1
                }
                if ($paletteGroupCounts.Count -ne 6 -or
                    @($paletteGroupCounts.Values | Where-Object { $_ -ne 2 }).Count -ne 0) {
                    throw "Composition palette requires six anchor groups of two exact factors"
                }
                [System.IO.File]::WriteAllText(
                    (Join-Path $siteAssetDirectory "composition-palette.js"),
                    (Get-Content -LiteralPath $compositionPaletteScript -Raw),
                    [System.Text.UTF8Encoding]::new($false)
                )
                $compositionPaletteChecks = [ordered]@{
                    concept_groups = $paletteGroupCounts.Count
                    concept_controls = @($readingBindings | Where-Object { $_.kind -eq "anchor" }).Count
                    relation_readiness_records = $labRelations.Count
                    readiness_inputs = "explicit seeds, selected relation allowlist, direction"
                    natural_language_semantic_selection = $false
                    automatic_selection = $false
                    disabled_relations = 0
                    persistence = "none"
                    specification = "specs/COMPOSITION-PALETTE.md"
                }
            }
            if ($editionNumber -ge 20) {
                [System.IO.File]::WriteAllText(
                    (Join-Path $siteAssetDirectory "composition-views.js"),
                    (Get-Content -LiteralPath $compositionViewsScript -Raw),
                    [System.Text.UTF8Encoding]::new($false)
                )
                $compositionViewsChecks = [ordered]@{
                    profiles = @("compact", "abbreviated", "book", "full")
                    default_profile = "book"
                    shared_preference_key = if ($lexiconIdentity) { "lexicon-reader-profile" } else { "factorium-reader-profile" }
                    profile_inputs_to_closure = 0
                    hidden_query_controls = 0
                    exact_metadata_retained = $true
                    query_storage = "none"
                    result_storage = "none"
                    preference_storage = "profile name only"
                    specification = "specs/COMPOSITION-READER-VIEWS.md"
                }
            }
            if ($editionNumber -ge 21) {
                [System.IO.File]::WriteAllText(
                    (Join-Path $siteAssetDirectory "composition-map.js"),
                    (Get-Content -LiteralPath $compositionMapScript -Raw),
                    [System.Text.UTF8Encoding]::new($false)
                )
                $compositionMapChecks = [ordered]@{
                    projection_input = "identified composition result"
                    identity = "inherits local result SHA-256"
                    unique_node_records = $true
                    semantic_edges = "admitted typed traversals only"
                    scope_connectors = "non-semantic evaluation ownership"
                    svg_alternative = "complete HTML records"
                    removed_stage_records = 0
                    storage = "none"
                    specification = "specs/COMPOSITION-CLOSURE-MAP.md"
                }
            }
            if ($editionNumber -ge 22) {
                $starterRuntimeText = Get-Content -LiteralPath $compositionStartersScript -Raw
                if ($editionNumber -lt 24) {
                    $starterRuntimeText = ConvertTo-Sim23CompositionAsset -Name "starters" -Text $starterRuntimeText
                }
                [System.IO.File]::WriteAllText(
                    (Join-Path $siteAssetDirectory "composition-starters.js"),
                    $starterRuntimeText,
                    [System.Text.UTF8Encoding]::new($false)
                )
                $starterWorksheets = @(
                    $compositionWorksheet, $evidenceWorksheet, $feedbackWorksheet,
                    $conflictWorksheet, $frontierWorksheet
                )
                $knownRelationIds = [System.Collections.Generic.HashSet[string]]::new(
                    [System.StringComparer]::Ordinal
                )
                $knownArtifacts = [System.Collections.Generic.HashSet[string]]::new(
                    [System.StringComparer]::Ordinal
                )
                foreach ($relation in $labRelations) {
                    [void]$knownRelationIds.Add($relation.id)
                    [void]$knownArtifacts.Add($relation.source)
                    [void]$knownArtifacts.Add($relation.target)
                    [void]$knownArtifacts.Add($relation.scope)
                }
                $starterIds = [System.Collections.Generic.HashSet[string]]::new(
                    [System.StringComparer]::Ordinal
                )
                $starterStates = [System.Collections.Generic.HashSet[string]]::new(
                    [System.StringComparer]::Ordinal
                )
                $starterRecords = @(
                    for ($starterIndex = 0; $starterIndex -lt $compositionTraces.Count; $starterIndex++) {
                        $trace = Get-CompositionTraceSummary -Path $compositionTraces[$starterIndex] -Worksheet $starterWorksheets[$starterIndex]
                        if (-not $starterIds.Add($trace.id)) {
                            throw "Composition starter repeats trace ID: $($trace.id)"
                        }
                        [void]$starterStates.Add($trace.state)
                        $contextFields = $trace.context -split ' \| ', 2
                        if ($contextFields.Count -ne 2 -or $contextFields[1] -notmatch '(^|,)reference-frame=[a-z0-9-]+($|,)') {
                            throw "Composition starter context drift: $($trace.id)"
                        }
                        $relationSet = [System.Collections.Generic.HashSet[string]]::new(
                            [System.StringComparer]::Ordinal
                        )
                        foreach ($edge in $trace.edges) {
                            if (-not $knownRelationIds.Contains($edge)) {
                                throw "Composition starter has unknown admitted relation: $edge"
                            }
                            [void]$relationSet.Add($edge)
                        }
                        foreach ($frontier in $trace.frontiers) {
                            $frontierFields = $frontier -split ' \| '
                            if ($frontierFields.Count -ne 2 -or
                                $frontierFields[1] -notmatch '^(?:edge|depth|node)-budget-before-(.+)$') {
                                throw "Composition starter frontier reason drift: $frontier"
                            }
                            $frontierRelation = $Matches[1]
                            if (-not $knownRelationIds.Contains($frontierRelation)) {
                                throw "Composition starter frontier has unknown relation: $frontierRelation"
                            }
                            [void]$relationSet.Add($frontierRelation)
                        }
                        $exclusions = @(
                            foreach ($conflict in $trace.conflicts) {
                                $conflictFields = $conflict -split ' \| '
                                if ($conflictFields.Count -ne 3 -or -not $knownArtifacts.Contains($conflictFields[1])) {
                                    throw "Composition starter conflict drift: $conflict"
                                }
                                $conflictFields[1]
                            }
                        )
                        foreach ($seed in $trace.seeds) {
                            if (-not $knownArtifacts.Contains($seed)) {
                                throw "Composition starter has unknown seed: $seed"
                            }
                        }
                        $guidePage = $pageBySource[[System.IO.Path]::GetFullPath($starterWorksheets[$starterIndex])]
                        $starterRecord = [ordered]@{
                            id = $trace.id
                            title = $compositionStarterTitles[$starterIndex]
                            problem = $trace.problem
                            contextId = $contextFields[0]
                            contextSelections = $contextFields[1]
                            direction = $trace.direction
                            budget = [ordered]@{
                                depth = $trace.budget.depth
                                edges = $trace.budget.edges
                                nodes = $trace.budget.nodes
                            }
                            seeds = @($trace.seeds)
                            relations = @($relationSet | Sort-Object)
                            exclusions = @($exclusions | Sort-Object -Unique)
                            traceState = $trace.state
                            traceSha256 = $trace.sha256
                            guideHref = "entries/$guidePage"
                        }
                        if ($editionNumber -ge 24) {
                            $starterRecord.budget.work = $trace.budget.work
                        }
                        $starterRecord
                    }
                )
                if ($starterRecords.Count -ne 5 -or $starterStates.Count -ne 4) {
                    throw "Composition starter trace/state coverage mismatch"
                }
                $compositionStartersPayload = [ordered]@{
                    schema = if ($lexiconIdentity) { "lexicon-composition-starters-v0" } else { "factorium-composition-starters-v0" }
                    referenceSha256 = $compositionLabPayload.referenceSha256
                    relationsSha256 = $compositionLabPayload.relationsSha256
                    starters = $starterRecords
                }
                $compositionStartersJson = $compositionStartersPayload | ConvertTo-Json -Depth 6 -Compress
                $starterCardBuilder = [System.Text.StringBuilder]::new()
                foreach ($starter in $starterRecords) {
                    $encodedStarterId = [System.Net.WebUtility]::HtmlEncode($starter.id)
                    $encodedStarterTitle = [System.Net.WebUtility]::HtmlEncode($starter.title)
                    $encodedStarterProblem = [System.Net.WebUtility]::HtmlEncode($starter.problem)
                    $encodedStarterState = [System.Net.WebUtility]::HtmlEncode($starter.traceState)
                    [void]$starterCardBuilder.AppendLine(@"
<article id="starter-$encodedStarterId" class="composition-starter" data-starter-id="$encodedStarterId" data-active="false">
<span class="composition-starter__state">$encodedStarterState reviewed trace</span>
<h3>$encodedStarterTitle</h3><p>$encodedStarterProblem</p>
<p><small>Loads explicit controls only; the lab recomputes an unresolved draft.</small></p>
<div class="composition-starter__actions"><button type="button" data-load-starter="$encodedStarterId">Load explicit controls</button><a href="$($starter.guideHref)">Read reviewed guide</a></div>
</article>
"@)
                }
                $compositionStarterCards = $starterCardBuilder.ToString()
                $compositionStarterChecks = [ordered]@{
                    starters = $starterRecords.Count
                    source = "five exact reviewed composition traces"
                    relation_derivation = "admitted edges plus exact budget-frontier relation IDs"
                    prose_semantic_selection = $false
                    auto_run = $false
                    url_state = "fixed authored starter ID only"
                    query_storage = "none"
                    specification = "specs/COMPOSITION-AUTHORED-STARTERS.md"
                }
            }
            if ($editionNumber -ge 23) {
                $queryPlanRuntimeText = Get-Content -LiteralPath $compositionQueryPlanScript -Raw
                if ($editionNumber -lt 24) {
                    $queryPlanRuntimeText = ConvertTo-Sim23CompositionAsset -Name "plan" -Text $queryPlanRuntimeText
                }
                [System.IO.File]::WriteAllText(
                    (Join-Path $siteAssetDirectory "composition-query-plan.js"),
                    $queryPlanRuntimeText,
                    [System.Text.UTF8Encoding]::new($false)
                )
                $compositionQueryPlanChecks = [ordered]@{
                    projection_input = "visible explicit controls plus digest-bound payloads"
                    control_states = @("control-complete", "needs-explicit-controls")
                    result_alignment = @("not-run", "matches-displayed-result", "controls-changed")
                    closure_execution = $false
                    result_prediction = $false
                    plan_identity = "none"
                    problem_semantic_selection = $false
                    storage = "none"
                    specification = "specs/COMPOSITION-QUERY-PLAN.md"
                }
            }
            if ($editionNumber -ge 24) {
                $compositionLabChecks.work_accounting = "canonical-record-count"
                $compositionLabChecks.work_enforcement = "hard-cap"
                $compositionLabChecks.work_range = "3-64"
            }
            if ($editionNumber -ge 25) {
                [System.IO.File]::WriteAllText(
                    (Join-Path $siteAssetDirectory "composition-reconciliation.js"),
                    (Get-Content -LiteralPath $compositionReconciliationScript -Raw),
                    [System.Text.UTF8Encoding]::new($false)
                )
                $compositionReconciliationChecks = [ordered]@{
                    projection_input = "identified local result plus digest-bound payloads"
                    relation_decisions = @("admitted", "stopped", "capacity-limited", "predecessor-unreached")
                    exclusion_decisions = @("conflict", "inactive")
                    budget_ledgers = @("depth", "edges", "nodes", "work")
                    partition = "exhaustive and disjoint over selected controls"
                    identity = "inherits local result SHA-256"
                    closure_execution = $false
                    semantic_evaluation = $false
                    storage = "none"
                    specification = "specs/COMPOSITION-RESULT-RECONCILIATION.md"
                }
            }
            if ($editionNumber -ge 26) {
                [System.IO.File]::WriteAllText(
                    (Join-Path $siteAssetDirectory "composition-continuations.js"),
                    (Get-Content -LiteralPath $compositionContinuationsScript -Raw),
                    [System.Text.UTF8Encoding]::new($false)
                )
                $compositionContinuationsChecks = [ordered]@{
                    projection_input = "identified local result plus digest-bound payloads"
                    action_kinds = @("raise-budget", "add-seed", "remove-exclusion")
                    target_controls = @("depth", "edges", "nodes", "work", "seeds", "exclusions")
                    application = "one explicit control edit per activation"
                    stale_precondition = "exact before-value"
                    auto_run = $false
                    result_prediction = $false
                    identity = "inherits local result SHA-256"
                    storage = "none"
                    specification = "specs/COMPOSITION-EXPLICIT-CONTINUATIONS.md"
                }
            }
            if ($editionNumber -ge 27) {
                [System.IO.File]::WriteAllText(
                    (Join-Path $siteAssetDirectory "composition-rerun-comparison.js"),
                    (Get-Content -LiteralPath $compositionRerunComparisonScript -Raw),
                    [System.Text.UTF8Encoding]::new($false)
                )
                $compositionRerunComparisonChecks = [ordered]@{
                    projection_input = "previous and current identified local results plus exact applied continuation actions"
                    action_dispositions = @("present-in-executed-request", "superseded-before-run")
                    request_change_sources = @("continuation-action", "additional-control-edit")
                    result_dimensions = @("state", "work", "nodes", "relations", "exclusions", "checks")
                    retention = "one pending source and one consumed comparison in page memory"
                    auto_run = $false
                    causal_attribution = $false
                    comparison_identity = "none; inherits previous and current result SHA-256"
                    storage = "none"
                    specification = "specs/COMPOSITION-RERUN-COMPARISON.md"
                }
            }
            if ($editionNumber -ge 28) {
                [System.IO.File]::WriteAllText(
                    (Join-Path $siteAssetDirectory "composition-guide.js"),
                    (Get-Content -LiteralPath $compositionGuideScript -Raw),
                    [System.Text.UTF8Encoding]::new($false)
                )
                $compositionGuideChecks = [ordered]@{
                    schema = if ($lexiconIdentity) { "lexicon-composition-guide-skeleton-v0" } else { "factorium-composition-guide-skeleton-v0" }
                    projection_input = "identified local result plus digest-bound lab and reading payloads"
                    placement = "after closure map and before canonical reading route"
                    required_missing_work_records = 8
                    check_outcomes = "unresolved-only"
                    profiles = @("compact", "abbreviated", "book", "full")
                    default_profile = "book"
                    identity = "inherits local result SHA-256"
                    canonical_guide = $false
                    recommendation = $false
                    storage = "none"
                    specification = "specs/COMPOSITION-GUIDE-SKELETON.md"
                }
            }
            if ($editionNumber -ge 29) {
                [System.IO.File]::WriteAllText(
                    (Join-Path $siteAssetDirectory "composition-evaluation.js"),
                    (Get-Content -LiteralPath $compositionEvaluationScript -Raw),
                    [System.Text.UTF8Encoding]::new($false)
                )
                $compositionEvaluationChecks = [ordered]@{
                    schema = if ($lexiconIdentity) { "lexicon-composition-evaluation-record-v0" } else { "factorium-composition-evaluation-record-v0" }
                    projection_input = "identified local result plus explicit user-declared check records"
                    outcomes = @("pass", "fail", "unresolved")
                    evidence_status = "user-declared-unverified"
                    placement = "after Factor Guide Skeleton and before canonical reading route"
                    identity = "separate SHA-256 over canonical evaluation JSON; bound to result SHA-256"
                    base_result_mutation = $false
                    outcome_scoring = $false
                    retrieval = $false
                    storage = "none"
                    specification = "specs/COMPOSITION-EVALUATION-RECORD.md"
                }
            }
        }
    }
    $siteData = "window.FACTORIUM_SEARCH_INDEX=$searchJson;`n" +
        "window.FACTORIUM_SOURCE_INDEX=$sourceIndexJson;`n" +
        "window.FACTORIUM_CONTEXT_PROFILES=$contextJson;`n"
    if ($editionNumber -ge 16) {
        $siteData += "window.FACTORIUM_COMPOSITION_LAB=$compositionLabJson;`n"
    }
    if ($editionNumber -ge 17) {
        $siteData += "window.FACTORIUM_COMPOSITION_READING=$compositionReadingJson;`n"
    }
    if ($editionNumber -ge 22) {
        $siteData += "window.FACTORIUM_COMPOSITION_STARTERS=$compositionStartersJson;`n"
    }
    if ($editionNumber -ge 52) {
        $siteData += "window.FACTORIUM_POINTERS=$pointerClientJson;`n"
    }
    [System.IO.File]::WriteAllText(
        (Join-Path $siteAssetDirectory "site-data.js"),
        $siteData,
        [System.Text.UTF8Encoding]::new($false)
    )

    $firstJourney = @(
        [ordered]@{
            label = "Step 1"
            title = "Choose a coordinate"
            description = "Use the Root Table to decide which recurring question organizes the problem."
            source = (Join-Path $workspace "tables\foundations\ROOT-TABLE.md")
        },
        [ordered]@{
            label = "Step 2"
            title = "Name the structural job"
            description = "Use Factor Roles to distinguish pivots, components, contexts, constraints, and derived views."
            source = (Join-Path $workspace "tables\foundations\FACTOR-ROLES.md")
        },
        [ordered]@{
            label = "Step 3"
            title = "Judge a decomposition"
            description = "Check whether the proposed factors preserve meaning, alternatives, and usable boundaries."
            source = (Join-Path $workspace "tables\entries\factorization-quality.md")
        },
        [ordered]@{
            label = "Step 4"
            title = "Recognize a failure"
            description = "Use the diagnostic to separate the failure's owner from its visible symptom."
            source = (Join-Path $workspace "tables\diagnostics\factorization-failures.md")
        },
        [ordered]@{
            label = "Step 5"
            title = "See the method applied"
            description = "Follow a complete Factor Guide from local question through selected relation and controls."
            source = (Join-Path $workspace "guides\aqueous-solution-amount-concentration.md")
        }
    )
    $firstJourneySources = [System.Collections.Generic.HashSet[string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    $firstJourneyItems = [System.Text.StringBuilder]::new()
    foreach ($step in $firstJourney) {
        $stepSource = [System.IO.Path]::GetFullPath($step.source)
        if (-not $firstJourneySources.Add($stepSource)) {
            throw "First journey repeats a source: $stepSource"
        }
        if (-not $pageBySource.ContainsKey($stepSource)) {
            throw "First journey source is absent from the proof selection: $stepSource"
        }
        $encodedLabel = [System.Net.WebUtility]::HtmlEncode($step.label)
        $encodedTitle = [System.Net.WebUtility]::HtmlEncode($step.title)
        $encodedDescription = [System.Net.WebUtility]::HtmlEncode($step.description)
        [void]$firstJourneyItems.AppendLine(
            "<li><span>$encodedLabel</span><a href=`"entries/$($pageBySource[$stepSource])`">$encodedTitle</a><p>$encodedDescription</p></li>"
        )
    }
    if ($firstJourneySources.Count -ne 5) {
        throw "First journey target count mismatch: $($firstJourneySources.Count)"
    }

    $problemLedTargets = 0
    $candidateStartTargets = 0
    $candidateSection = ""
    $librarySection = ""
    $intentSection = ""
    $intentRouterTargets = 0
    $productBooks = 0
    $tablesStartTargets = 0
    $readerStartTargets = 0
    $problemSection = ""
    $compositionSection = ""
    $homeProblemNav = ""
    $nestedProblemNav = ""
    $homeComposeNav = ""
    $homeCandidateNav = ""
    $nestedCandidateNav = ""
    $nestedComposeNav = ""
    $compositionTraceTargets = 0
    $heroDeck = "A linked reference for selecting senses, comparing decompositions, choosing bounded relations, and recognizing structures that fail."
    if ($editionNumber -ge 30) {
        foreach ($candidateSource in @($bookOneGuide, $bookOneQuickstart, $bookOneTasks, $bookOneFeedback)) {
            $candidateSource = [System.IO.Path]::GetFullPath($candidateSource)
            if (-not $pageBySource.ContainsKey($candidateSource)) {
                throw "Book One candidate source is absent from the proof: $candidateSource"
            }
        }
        $candidateGuidePage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($bookOneGuide)])"
        $candidateQuickstartPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($bookOneQuickstart)])"
        $candidateTasksPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($bookOneTasks)])"
        $candidateFeedbackPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($bookOneFeedback)])"
        $candidateStartTargets = 3
        if ($editionNumber -ge 31) {
            $candidateSection = @"

<section id="reader" class="site-start site-candidate site-reader" aria-labelledby="site-reader-heading">
<p class="site-kicker">$readerPublicationName · teaching companion</p>
<h2 id="site-reader-heading">Learn how to use the Tables</h2>
<p>Follow a selected 24-record teaching spine, then hand off to any of $readerAdditionalRecordCount additional $(if ($editionNumber -ge 66) { 'selected' } else { 'canonical' }) Tables when the question needs specialized depth. The Reader explains a method; it does not redefine the reference or claim a universal order.</p>
<div class="site-candidate__actions">
<a class="site-candidate__primary" href="$candidateQuickstartPage">Start the Reader</a>
<a href="$candidateGuidePage">Open the Reader route</a>
<a href="$candidateFeedbackPage">Inspect the future feedback path</a>
</div>
<ol class="site-candidate__brief">
<li><strong>Question</strong><span>What exact distinction, decision, comparison, or explanation is needed?</span></li>
<li><strong>Working concepts</strong><span>Which concepts may matter, and which senses remain unresolved?</span></li>
<li><strong>Decisive constraints</strong><span>What can invalidate an attractive answer?</span></li>
<li><strong>Result state</strong><span>Complete, incomplete, contradictory, or truncated?</span></li>
<li><strong>Unresolved frontier</strong><span>What concept, evidence, condition, or authority is still missing?</span></li>
<li><strong>Next action</strong><span>Inspect, obtain evidence, revise, reconcile, defer, or decide under authority.</span></li>
</ol>
</section>
"@
        }
        else {
            $candidateSection = @"

<section id="candidate" class="site-start site-candidate" aria-labelledby="site-candidate-heading">
<p class="site-kicker">Book One · internal candidate</p>
<h2 id="site-candidate-heading">Bring one bounded question</h2>
<p>Begin with a 24-record teaching spine, then open any of $readerAdditionalRecordCount additional canonical records as specialized depth. The spine is a route through the reference, not a second authority or completeness claim.</p>
<div class="site-candidate__actions">
<a class="site-candidate__primary" href="$candidateQuickstartPage">Start the candidate</a>
<a href="$candidateGuidePage">Read the bounded-question guide</a>
<a href="$candidateFeedbackPage">Inspect the future feedback path</a>
</div>
<ol class="site-candidate__brief">
<li><strong>Question</strong><span>What exact distinction, decision, comparison, or explanation is needed?</span></li>
<li><strong>Working concepts</strong><span>Which concepts may matter, and which senses remain unresolved?</span></li>
<li><strong>Decisive constraints</strong><span>What can invalidate an attractive answer?</span></li>
<li><strong>Result state</strong><span>Complete, incomplete, contradictory, or truncated?</span></li>
<li><strong>Unresolved frontier</strong><span>What concept, evidence, condition, or authority is still missing?</span></li>
<li><strong>Next action</strong><span>Inspect, obtain evidence, revise, reconcile, defer, or decide under authority.</span></li>
</ol>
</section>
"@
        }
        if ($editionNumber -ge 31) {
            $productBooks = 2
            $tablesStartTargets = 2
            $readerStartTargets = 2
            $librarySection = @"

<section id="library" class="site-library" aria-labelledby="site-library-heading">
<p class="site-kicker">Choose how you want to enter</p>
<h2 id="site-library-heading">Two books, one reference</h2>
<div class="site-library__grid">
<article class="site-book-card site-book-card--tables" data-book="tables">
<p class="site-book-card__kind">Primary reference · dictionary and thesaurus</p>
<h3>$tablesPublicationName</h3>
$(if ($formariumIdentityPreview) { '<p><strong>Public feedback name for Factorium Tables.</strong> Canonical IDs and compatibility formats are unchanged.</p>' } elseif ($tabulaIdentityPreview) { '<p><strong>Candidate name for Factorium Tables.</strong> The reference authority and records are unchanged.</p>' } else { '' })
<p>Look up a concept, separate its meanings, compare nearby ideas, and follow the Tables that explain it.</p>
<div class="site-book-card__actions"><a class="site-book-card__primary" href="#search">Search the Tables</a><a href="$(if ($editionNumber -ge 35) { 'tables.html' } else { '#contents' })">Browse the Tables</a></div>
</article>
<article class="site-book-card site-book-card--reader" data-book="reader">
<p class="site-book-card__kind">Teaching companion · selected route</p>
<h3>$readerPublicationName</h3>
<p>Learn the method through a selected route and worked questions with clear limits, then return to the owning Tables whenever more depth is needed.</p>
<div class="site-book-card__actions"><a class="site-book-card__primary" href="$(if ($editionNumber -ge 36) { 'reader.html' } else { '#reader' })">$(if ($editionNumber -ge 36) { 'Open the Reader' } else { 'Read the Guide' })</a><a href="compose.html">See worked questions</a></div>
</article>
</div>
<p class="site-library__authority"><strong>The Tables define and distinguish.</strong> The Reader teaches and demonstrates. Factor Guides apply selected Tables to one question with clear limits.</p>
</section>
"@
            $homeCandidateNav = if ($editionNumber -ge 36) { '<a href="tables.html">Tables</a><a href="reader.html">Reader</a>' } else { '<a href="#library">Tables</a><a href="#reader">Reader</a>' }
            $nestedCandidateNav = if ($editionNumber -ge 36) { '<a href="../tables.html">Tables</a><a href="../reader.html">Reader</a>' } else { '<a href="../index.html#library">Tables</a><a href="../index.html#reader">Reader</a>' }
            if ($editionNumber -ge 43) {
                $intentRouterTargets = 3
                $intentSection = @"

<section id="choose" class="site-intent" aria-labelledby="site-intent-heading">
<p class="site-kicker">Start with what you are trying to do</p>
<h2 id="site-intent-heading">What brings you to ${publicationName}?</h2>
<div class="site-intent__grid">
<article><p class="site-intent__eyebrow">Direct lookup</p><h3>I know the term</h3><p>Find its meanings, compare nearby ideas, and see the parts, limits, and deeper views connected to it.</p><a href="#search">Search the Tables <span aria-hidden="true">&rarr;</span></a></article>
<article><p class="site-intent__eyebrow">Work through a problem</p><h3>I have a question</h3><p>Choose the ideas that matter, test what an answer must satisfy, and keep missing information visible.</p><a href="compose.html">Work with the question <span aria-hidden="true">&rarr;</span></a></article>
<article><p class="site-intent__eyebrow">Guided learning</p><h3>I want to learn or explore</h3><p>Follow the Reader's selected teaching route, then move into the owning Tables when you want depth.</p><a href="reader.html">Open the Reader <span aria-hidden="true">&rarr;</span></a></article>
</div>
<p class="site-intent__note">Not sure? Start with Search. Every path returns to the same source Tables.</p>
</section>
"@
            }
        }
        else {
            $homeCandidateNav = '<a href="#candidate">Candidate</a>'
            $nestedCandidateNav = '<a href="../index.html#candidate">Candidate</a>'
        }
        $heroDeck = "Bring a bounded question. Start with the 24-record Book One teaching spine, retain decisive constraints and unresolved frontier, and open the larger reference only when the question requires more depth."
    }
    if ($editionNumber -ge 66) {
        $candidateSection = ""
        $candidateStartTargets = 0
    }
    if ($editionNumber -ge 12) {
        $problemJourneys = @(
            [ordered]@{
                state = "Complete trace · structural review"
                title = "Review a system dependency"
                description = "Join dependency and interface concepts, run a structural constraint, and retain the exact closure trace."
                source = $compositionWorksheet
                trace = $compositionTraces[0]
            },
            [ordered]@{
                state = "Complete trace · unresolved claim"
                title = "Evaluate a performance claim"
                description = "Separate observations from inference and see why complete graph custody does not settle a causal claim."
                source = $evidenceWorksheet
                trace = $compositionTraces[1]
            },
            [ordered]@{
                state = "Incomplete trace · unresolved decision"
                title = "Trace an alert to user outcomes"
                description = "Traverse feedback in reverse and preserve the missing outcome evidence instead of inventing an answer."
                source = $feedbackWorksheet
                trace = $compositionTraces[2]
            }
        )
        if ($editionNumber -ge 13) {
            $problemJourneys += [ordered]@{
                state = "Contradictory trace · repair required"
                title = "Subtract a required interface"
                description = "See why a requested exclusion stays visible as a conflict when an admitted dependency still requires that node."
                source = $conflictWorksheet
                trace = $compositionTraces[3]
            }
        }
        if ($editionNumber -ge 14) {
            $problemJourneys += [ordered]@{
                state = "Truncated trace · frontier visible"
                title = "Review delegated compliance"
                description = "Resolve delegated authority first, then stop at the declared edge budget with obligation satisfaction still visible as a frontier."
                source = $frontierWorksheet
                trace = $compositionTraces[4]
            }
        }
        if ($editionNumber -ge 29) {
            $problemJourneys += [ordered]@{
                state = "Incomplete trace · five checks unresolved"
                title = "Evaluate an intervention choice across concepts"
                description = "Join evidence, causal scope, consequences, value, and constraints in one bounded working set without inventing a ranking or final choice."
                source = $decisionChoiceGuide
                trace = $decisionCombinedTrace
                starter = $false
            }
        }
        $problemSources = [System.Collections.Generic.HashSet[string]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
        $problemItems = [System.Text.StringBuilder]::new()
        foreach ($problem in $problemJourneys) {
            $problemSource = [System.IO.Path]::GetFullPath($problem.source)
            if (-not $problemSources.Add($problemSource)) {
                throw "Problem-led route repeats a source: $problemSource"
            }
            if (-not $pageBySource.ContainsKey($problemSource)) {
                throw "Problem-led route source is absent from the proof selection: $problemSource"
            }
            $encodedState = [System.Net.WebUtility]::HtmlEncode($problem.state)
            $encodedTitle = [System.Net.WebUtility]::HtmlEncode($problem.title)
            $encodedDescription = [System.Net.WebUtility]::HtmlEncode($problem.description)
            $starterLink = ""
            $starterAvailable = -not $problem.Contains("starter") -or $problem.starter
            if ($editionNumber -ge 22 -and $starterAvailable) {
                $starterTrace = Get-CompositionTraceSummary -Path $problem.trace -Worksheet $problem.source
                $starterLink = "<a class=`"site-problem-try`" href=`"compose.html#starter-$([System.Net.WebUtility]::HtmlEncode($starterTrace.id))`">Try these explicit controls in Compose</a>"
            }
            elseif ($editionNumber -ge 22) {
                $starterLink = '<span class="site-problem-state">Read-only trace · not available in Compose</span>'
            }
            [void]$problemItems.AppendLine(
                "<li><span class=`"site-problem-state`">$encodedState</span><a href=`"entries/$($pageBySource[$problemSource])`">$encodedTitle</a><p>$encodedDescription</p>$starterLink</li>"
            )
        }
        $problemLedTargets = $problemSources.Count
        $expectedProblemTargetCount = if ($editionNumber -ge 29) { 6 } elseif ($editionNumber -ge 14) { 5 } elseif ($editionNumber -ge 13) { 4 } else { 3 }
        if ($problemLedTargets -ne $expectedProblemTargetCount) {
            throw "Problem-led target count mismatch: $problemLedTargets"
        }
        $problemSectionClass = if ($problemLedTargets -eq 6) { "site-problems site-problems--six" } else { "site-problems" }
        $problemSection = @"

<section id="problems" class="$problemSectionClass" aria-labelledby="site-problems-heading">
<p class="site-kicker">Problem-led reading</p>
<h2 id="site-problems-heading">Start with what you need to decide</h2>
<p class="site-problems__intro">Each worked Composition Query selects several concepts and senses, follows a bounded typed closure, runs declared checks, and flattens the graph into a traceable guide.</p>
<ul class="site-problem-grid">$problemItems</ul>
<p class="site-problem-note"><strong>Worked examples, not a live builder.</strong> Choose one to inspect its declared graph, exclusions, Evaluation, state, and projection. Interactive construction remains later Workbench scope.</p>
</section>
"@
        $homeProblemNav = '<a href="#problems">Problems</a>'
        $nestedProblemNav = '<a href="../index.html#problems">Problems</a>'
        $heroDeck = "Start from a question you need to answer, follow its bounded concept closure, or look up one entry at a time. The tables remain the authority; worked guides show how several concepts combine."

        if ($editionNumber -ge 15) {
            $traceSummaries = @(
                foreach ($problem in $problemJourneys) {
                    Get-CompositionTraceSummary -Path $problem.trace -Worksheet $problem.source
                }
            )
            $traceIds = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
            $traceStates = [ordered]@{
                complete = 0
                incomplete = 0
                contradictory = 0
                truncated = 0
            }
            $traceItems = [System.Text.StringBuilder]::new()
            for ($traceIndex = 0; $traceIndex -lt $traceSummaries.Count; $traceIndex++) {
                $trace = $traceSummaries[$traceIndex]
                $problem = $problemJourneys[$traceIndex]
                if (-not $traceIds.Add($trace.id)) {
                    throw "Composition explorer repeats trace ID: $($trace.id)"
                }
                if ($trace.worksheet -ne [System.IO.Path]::GetFullPath($problem.source)) {
                    throw "Composition explorer worksheet mismatch: $($trace.id)"
                }
                if (-not $problem.state.ToLowerInvariant().StartsWith($trace.state)) {
                    throw "Composition explorer state/card mismatch: $($trace.id)"
                }
                if (-not $traceStates.Contains($trace.state)) {
                    throw "Composition explorer has an unknown state: $($trace.state)"
                }
                $traceStates[$trace.state] += 1

                $encodedTraceId = [System.Net.WebUtility]::HtmlEncode($trace.id)
                $encodedProblem = [System.Net.WebUtility]::HtmlEncode($trace.problem)
                $encodedState = [System.Net.WebUtility]::HtmlEncode($trace.state)
                $encodedContext = [System.Net.WebUtility]::HtmlEncode($trace.context)
                $encodedDirection = [System.Net.WebUtility]::HtmlEncode($trace.direction)
                $encodedDigest = [System.Net.WebUtility]::HtmlEncode($trace.sha256)
                $guidePage = $pageBySource[[System.IO.Path]::GetFullPath($problem.source)]

                $seedItems = [System.Text.StringBuilder]::new()
                foreach ($seed in $trace.seeds) {
                    [void]$seedItems.AppendLine("<li><code>$([System.Net.WebUtility]::HtmlEncode($seed))</code></li>")
                }
                $edgeItems = [System.Text.StringBuilder]::new()
                foreach ($edge in $trace.edges) {
                    [void]$edgeItems.AppendLine("<li><code>$([System.Net.WebUtility]::HtmlEncode($edge))</code><span>admitted relation</span></li>")
                }
                foreach ($node in $trace.nodes) {
                    $nodeFields = $node -split ' \| '
                    if ($nodeFields[0] -notin $trace.seeds) {
                        [void]$edgeItems.AppendLine(
                            "<li><code>$([System.Net.WebUtility]::HtmlEncode($nodeFields[0]))</code><span>$([System.Net.WebUtility]::HtmlEncode($nodeFields[1])) · depth $([System.Net.WebUtility]::HtmlEncode($nodeFields[2]))</span></li>"
                        )
                    }
                }
                $checkItems = [System.Text.StringBuilder]::new()
                foreach ($check in $trace.checks) {
                    $checkFields = $check -split ' \| '
                    [void]$checkItems.AppendLine(
                        "<li><code>$([System.Net.WebUtility]::HtmlEncode($checkFields[0]))</code><span>$([System.Net.WebUtility]::HtmlEncode($checkFields[1])) · <strong>$([System.Net.WebUtility]::HtmlEncode($checkFields[3]))</strong></span></li>"
                    )
                }
                $stopItems = [System.Text.StringBuilder]::new()
                foreach ($frontier in $trace.frontiers) {
                    $fields = $frontier -split ' \| '
                    [void]$stopItems.AppendLine("<li><span>Frontier</span><code>$([System.Net.WebUtility]::HtmlEncode($fields[0]))</code><small>$([System.Net.WebUtility]::HtmlEncode($fields[1]))</small></li>")
                }
                foreach ($conflict in $trace.conflicts) {
                    $fields = $conflict -split ' \| '
                    [void]$stopItems.AppendLine("<li><span>Conflict</span><code>$([System.Net.WebUtility]::HtmlEncode($fields[1]))</code><small>$([System.Net.WebUtility]::HtmlEncode($fields[2]))</small></li>")
                }
                if ($trace.frontiers.Count -eq 0 -and $trace.conflicts.Count -eq 0) {
                    [void]$stopItems.AppendLine("<li><span>Stop</span><strong>No frontier or conflict</strong><small>State follows the declared checks and working graph.</small></li>")
                }

                $seedLabel = if ($trace.seeds.Count -eq 1) { "seed" } else { "seeds" }
                $nodeLabel = if ($trace.nodes.Count -eq 1) { "node" } else { "nodes" }
                $edgeLabel = if ($trace.edges.Count -eq 1) { "join" } else { "joins" }
                $projectionLabel = if ($trace.projections.Count -eq 1) { "row" } else { "rows" }
                [void]$traceItems.AppendLine(@"
<details class="site-trace" data-trace-id="$encodedTraceId" data-trace-state="$encodedState"$(if ($traceIndex -eq 0) { " open" })>
<summary><span class="site-trace__state">$encodedState</span><strong>$encodedProblem</strong><span class="site-trace__counts">$($trace.seeds.Count) $seedLabel · $($trace.nodes.Count) $nodeLabel · $($trace.edges.Count) $edgeLabel</span></summary>
<div class="site-trace__body">
<div class="site-trace__policy"><span><strong>Context</strong> $encodedContext</span><span><strong>Policy</strong> $encodedDirection · evaluative-required · stable-identity</span><span><strong>Budget</strong> depth $($trace.budget.depth) · edges $($trace.budget.edges) · nodes $($trace.budget.nodes) · work $($trace.budget.work)</span></div>
<div class="site-trace__stages">
<section><p>Add</p><h3>Selected seeds</h3><ul>$seedItems</ul></section>
<section><p>Multiply</p><h3>Join and admitted nodes</h3><ul>$edgeItems</ul></section>
<section><p>Evaluate</p><h3>Declared checks</h3><ul>$checkItems</ul></section>
<section><p>Stop</p><h3>Closure boundary</h3><ul>$stopItems</ul></section>
</div>
<div class="site-trace__footer"><span><strong>Flatten</strong> $($trace.projections.Count) loss-declared projection $projectionLabel</span><a href="entries/$guidePage">Read the full Factor Guide</a><code title="Exact trace SHA-256">$encodedDigest</code></div>
</div>
</details>
"@)
            }
            $expectedTraceCount = if ($editionNumber -ge 29) { 6 } else { 5 }
            $expectedIncompleteCount = if ($editionNumber -ge 29) { 2 } else { 1 }
            if ($traceSummaries.Count -ne $expectedTraceCount -or $traceStates.complete -ne 2 -or
                $traceStates.incomplete -ne $expectedIncompleteCount -or $traceStates.contradictory -ne 1 -or
                $traceStates.truncated -ne 1) {
                throw "Composition explorer trace/state coverage mismatch"
            }
            $compositionTraceTargets = $traceSummaries.Count
            $compositionChecks = [ordered]@{
                mode = "read-only exact trace inspection; no discovery or graph mutation"
                trace_count = $traceSummaries.Count
                worksheet_targets = $traceSummaries.Count
                unique_trace_ids = $traceIds.Count
                states = $traceStates
                records = @(
                    foreach ($trace in $traceSummaries) {
                        [ordered]@{
                            id = $trace.id
                            state = $trace.state
                            seeds = $trace.seeds.Count
                            nodes = $trace.nodes.Count
                            edges = $trace.edges.Count
                            frontiers = $trace.frontiers.Count
                            conflicts = $trace.conflicts.Count
                            checks = $trace.checks.Count
                            projections = $trace.projections.Count
                            work = $trace.budget.work
                            sha256 = $trace.sha256
                        }
                    }
                )
            }
            $compositionSection = @"

<section id="compose" class="site-compose" aria-labelledby="site-compose-heading">
<p class="site-kicker">Read-only composition explorer</p>
<h2 id="site-compose-heading">Compare how the working graphs close</h2>
<p class="site-compose__intro">These panels are generated from $($traceSummaries.Count) exact trace manifests. Open them to compare what was added, which typed join was admitted, what was evaluated, where closure stopped, and how many rows survive flattening.</p>
<div class="site-trace-list">$traceItems</div>
<p class="site-compose__note"><strong>Exact traces, not automatic closure.</strong> This view inspects reviewed examples; it cannot add concepts, discover edges, change a policy, or infer a domain answer.</p>
</section>
"@
            $homeComposeNav = '<a href="#compose">Compose</a>'
            $nestedComposeNav = '<a href="../index.html#compose">Compose</a>'
        }
        if ($editionNumber -ge 16) {
            $homeComposeNav = '<a href="compose.html">Compose</a><a href="#compose">Traces</a>'
            $nestedComposeNav = '<a href="../compose.html">Compose</a><a href="../index.html#compose">Traces</a>'
        }
    }

    $chapterItems = [System.Text.StringBuilder]::new()
    foreach ($chapter in $siteChapters) {
        $encodedChapterTitle = [System.Net.WebUtility]::HtmlEncode($chapter.title)
        $chapterLabel = if ($chapter.key.StartsWith("part-")) {
            $chapter.key.Replace("part-", "Part ").ToUpperInvariant()
        }
        else {
            "Guided use"
        }
        [void]$chapterItems.AppendLine(
            "<li><span>$chapterLabel</span><a href=`"chapters/$($chapter.key).html`">$encodedChapterTitle</a><p>$($chapter.paths.Count) records</p></li>"
        )
    }
    $homeSearchShell = $searchShell.Replace(
        "Results open the canonical book projection below.",
        "Results open dedicated reading pages generated from the canonical book sources."
    )
    $homeSearchShell = $homeSearchShell.Replace("Search this proof", "Search the book")
    if ($editionNumber -ge 31) {
        $homeSearchShell = $homeSearchShell.Replace("Search the book", "Search the Tables")
        $homeSearchShell = $homeSearchShell.Replace(
            "Search the selected records and application guides.",
            "Search canonical Tables and clearly labelled application guides. Rankings do not change authority."
        )
        $heroDeck = "Use Factorium as a dictionary and thesaurus when you know what you need to distinguish, or open the Reader when you want to learn the method through worked questions. Both lead back to the same canonical Tables."
    }
    if ($editionNumber -ge 43) {
        $heroDeck = "Bring a term, a question, or simple curiosity. Choose the route that matches your task; every path stays connected to the same canonical Tables."
    }
    $discoverySection = ""
    $compactContentsSection = ""
    if ($editionNumber -ge 66) {
        $heroDeck = "Bring a word, a question, or simple curiosity. Separate its meanings, see what each one is made of, and follow the Tables that explain it."
        $homeSearchShell = $homeSearchShell.Replace(
            "Search canonical Tables and clearly labelled application guides. Rankings do not change authority. Results open dedicated reading pages generated from the canonical book sources.",
            "Search the source Tables and clearly labelled examples. Results open dedicated reading pages."
        )
        $discoverySection = @"

<section class="site-start site-discovery" aria-labelledby="site-discovery-heading">
<p class="site-kicker">One familiar word</p>
<h2 id="site-discovery-heading">“Force” is not one thing</h2>
<p>It can name a physical interaction, coercion, an organized body, influence, or a rule taking effect. Formarium keeps those senses apart before showing how each one is structured.</p>
<div class="site-candidate__actions">
<a class="site-candidate__primary" href="entries/tables-entries-force.html">See how Force separates</a>
<a data-surprise-entry href="entries/tables-entries-force.html">Surprise me</a>
</div>
</section>
"@
        $compactContentsSection = @"

<section id="contents" class="site-contents site-contents--compact">
<h2>Keep exploring</h2>
<p>Browse all 304 A-Z entries, read the condensed book, or open the Pointer index.</p>
<div class="site-book-card__actions">
<a class="site-book-card__primary" href="tables.html">Browse A-Z</a>
<a href="book.html">Read The Formarium</a>
<a href="terms.html">Open Pointer index</a>
</div>
</section>
"@
    }
    $dualLookupSection = ""
    $dualLookupScriptTag = ""
    if ($editionNumber -ge 45 -and $editionNumber -lt 66) {
        $dualLookupSection = @'
<section id="compare-searches" class="dual-lookup" aria-labelledby="dual-lookup-heading">
<p class="site-kicker">Two literal routes · no semantic merge</p>
<h2 id="dual-lookup-heading">Compare two ways of searching</h2>
<p class="dual-lookup__boundary">Try two independent phrasings when one lookup finds only part of the question. $publicationName preserves both rankings and compares exact Table-family identities; it does not split the question, choose concepts, infer relations, or compute closure.</p>
<form id="dual-lookup-form">
<div class="dual-lookup__queries">
<label for="dual-lookup-query-one">Literal search 1<input id="dual-lookup-query-one" type="search" autocomplete="off" maxlength="180" required></label>
<label for="dual-lookup-query-two">Literal search 2<input id="dual-lookup-query-two" type="search" autocomplete="off" maxlength="180" required></label>
</div>
<div class="dual-lookup__actions"><button type="submit">Compare literal results</button><button id="dual-lookup-clear" type="button">Clear</button></div>
</form>
<p id="dual-lookup-status" class="dual-lookup__status" role="status" aria-live="polite">Enter two literal searches to compare their independent Table-family results.</p>
<div class="dual-lookup__panels">
<section class="dual-lookup__panel" aria-labelledby="dual-lookup-one-heading"><h3 id="dual-lookup-one-heading">Literal search 1 ranking</h3><ol id="dual-lookup-results-one"></ol></section>
<section class="dual-lookup__panel" aria-labelledby="dual-lookup-two-heading"><h3 id="dual-lookup-two-heading">Literal search 2 ranking</h3><ol id="dual-lookup-results-two"></ol></section>
</div>
<section class="dual-lookup__comparison" aria-labelledby="dual-lookup-comparison-heading"><h3 id="dual-lookup-comparison-heading">Family identity comparison · not a merged ranking</h3><ul id="dual-lookup-comparison"></ul></section>
<noscript><p>Dual lookup needs JavaScript. Ordinary Search and every Table destination remain available.</p></noscript>
</section>
'@
        $dualLookupScriptTag = '<script src="assets/dual-lookup.js"></script>'
    }
    $homeStartNav = if ($editionNumber -ge 43) { '<a href="#choose">Choose</a>' } else { '<a href="#start">Start</a>' }
    $nestedStartNav = if ($editionNumber -ge 43) { '<a href="../index.html#choose">Choose</a>' } else { '<a href="../index.html#start">Start</a>' }
    $quickstartPage = "entries/$($pageBySource[$quickstart])"
    $homeTablesIndexNav = if ($editionNumber -ge 35) { '<a href="tables.html">Index</a>' } else { '' }
    $nestedTablesIndexNav = if ($editionNumber -ge 35) { '<a href="../tables.html">Index</a>' } else { '' }
    $homePointerNav = if ($editionNumber -ge 66) { '<a href="terms.html">Pointers</a>' } elseif ($editionNumber -ge 52) { '<a href="terms.html">Terms</a>' } else { '' }
    $nestedPointerNav = if ($editionNumber -ge 66) { '<a href="../terms.html">Pointers</a>' } elseif ($editionNumber -ge 52) { '<a href="../terms.html">Terms</a>' } else { '' }
    $homeStableNav = '<a href="tables.html">Tables</a><a href="reader.html">Reader</a><a href="compose.html">Work with a question</a><a href="#search">Search</a><a href="#contents">Contents</a>'
    $rootStableNav = '<a href="tables.html">Tables</a><a href="reader.html">Reader</a><a href="compose.html">Work with a question</a><a href="index.html#search">Search</a><a href="index.html#contents">Contents</a>'
    $nestedStableNav = '<a href="../tables.html">Tables</a><a href="../reader.html">Reader</a><a href="../compose.html">Work with a question</a><a href="../index.html#search">Search</a><a href="../index.html#contents">Contents</a>'
    $homeSections = "$intentSection$librarySection$candidateSection$problemSection$compositionSection"
    $homeTail = @"
<section id="start" class="site-start" aria-labelledby="site-start-heading">
<p class="site-kicker">First journey</p>
<h2 id="site-start-heading">From a vague problem to a bounded factorization</h2>
<p>Follow the method once, then search directly or enter any chapter.</p>
<ol class="site-journey">$firstJourneyItems</ol>
</section>
<div id="search">$homeSearchShell</div>$dualLookupSection
<section id="contents" class="site-contents">
<h2>$(if ($editionNumber -ge 36) { 'All contents and applications' } elseif ($editionNumber -ge 35) { 'Book contents and guided use' } elseif ($editionNumber -ge 31) { 'Browse the Tables' } else { 'Browse the book' })</h2>
<p class="site-contents__intro">$(if ($editionNumber -ge 36) { "$($siteChapters.Count) parts organize all $($searchRecords.Count) indexed destinations. Use the Tables Index for canonical headwords or the Reader for its selected 24-record teaching route." } elseif ($editionNumber -ge 35) { "$($siteChapters.Count) parts retain the ordered Reader and guided-use route across $($searchRecords.Count) indexed destinations. Use the Tables Index for alphabetical headword browse." } elseif ($editionNumber -ge 31) { "$($siteChapters.Count) chapters organize $($searchRecords.Count) indexed records and guides. Every destination has a dedicated lookup page; record-kind labels keep canonical Tables distinct from Guides." } else { "$($siteChapters.Count) chapters organize $($searchRecords.Count) indexed records and guides. Every destination also has a dedicated lookup page." })</p>
<ol class="site-chapter-grid">$chapterItems</ol>
</section>
"@
    if ($editionNumber -ge 66) {
        $homeSections = "$intentSection$librarySection$discoverySection"
        $homeTail = "<div id=`"search`">$homeSearchShell</div>$compactContentsSection"
    }
    $homeHtml = @"
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="$(if ($formariumIdentityPreview) { 'A Formarium public-identity feedback preview with Formarium Tables and The Formarium Reader.' } elseif ($formariumIdentity) { 'A searchable Formarium Tables reference with The Formarium Reader companion.' } elseif ($tabulaIdentityPreview) { 'A reversible Tabula Facta identity preview with The Factorium Reader.' } elseif ($editionNumber -ge 31) { 'A searchable Factorium Tables reference with an explanatory Reader companion.' } else { 'A searchable, table-first Factorium book simulation.' })">
<title>Structure, Quantity, and Choice · $publicationName</title>
<link rel="stylesheet" href="assets/site.css">
$identityPreviewStyle
</head>
<body class="proof-site reader-ready">
<a class="site-skip" href="#main-content">Skip to content</a>
<header class="site-header"><div class="site-header__inner">
<a class="site-brand" href="index.html">$siteBrand</a>
<nav class="site-nav" aria-label="Primary">$(if ($editionNumber -ge 66) { $homeStableNav } else { "$homeCandidateNav$homeProblemNav$homeComposeNav$homeTablesIndexNav$homePointerNav$homeStartNav<a href=`"#search`">Search</a><a href=`"#contents`">Contents</a><a href=`"$quickstartPage`">Quickstart</a>" })</nav>
</div></header>$identityPreviewBanner
<main id="main-content" class="site-main">
<section class="site-hero">
<p class="site-kicker">$(if ($editionNumber -ge 66) { 'Two books · one connected reference' } elseif ($formariumIdentityPreview) { 'Public identity feedback · two books · one canonical reference' } elseif ($formariumIdentity) { 'Two books · one Formarium-native reference' } elseif ($tabulaIdentityPreview) { 'Candidate identity · two books · one canonical reference' } elseif ($editionNumber -ge 31) { 'Two books · one canonical reference' } elseif ($editionNumber -ge 30) { 'Book One · internal preview simulation' } else { 'Proof Set · book-site simulation' })</p>
<h1>$publicationName</h1>
<p class="site-hero__deck">$heroDeck</p>
</section>$homeSections$homeTail
</main>
<footer class="site-footer">$rootPublicationStatus$contentLicenseNotice</footer>
<script src="assets/site-data.js"></script>
<script src="assets/search.js"></script>
$dualLookupScriptTag
</body>
</html>
"@
    [System.IO.File]::WriteAllText($siteIndex, $homeHtml, [System.Text.UTF8Encoding]::new($false))

    $tablesIndexCanonicalCount = 0
    $tablesIndexCuratedCount = 0
    $tablesIndexLetterCount = 0
    $tablesIndexOwnedViewCount = 0
    $tablesIndexPointerCount = 0
    if ($editionNumber -ge 35) {
        $canonicalIndexRecords = @($searchRecords | Where-Object { $_.recordClass -eq "canonical-entry" } |
            Sort-Object @{ Expression = { $_.title.ToLowerInvariant() } }, @{ Expression = { $_.path } })
        $curatedIndexRecords = @($searchRecords | Where-Object { $_.recordClass -eq "curated-record" } |
            Sort-Object @{ Expression = { $_.title.ToLowerInvariant() } }, @{ Expression = { $_.path } })
        $canonicalLetterGroups = [ordered]@{}
        foreach ($indexRecord in $canonicalIndexRecords) {
            $letterMatch = [regex]::Match($indexRecord.title, '[A-Za-z0-9]')
            if (-not $letterMatch.Success) {
                throw "Tables index title has no sortable character: $($indexRecord.path)"
            }
            $indexLetter = $letterMatch.Value.ToUpperInvariant()
            if (-not $canonicalLetterGroups.Contains($indexLetter)) {
                $canonicalLetterGroups[$indexLetter] = [System.Collections.Generic.List[object]]::new()
            }
            $canonicalLetterGroups[$indexLetter].Add($indexRecord)
        }
        $letterLinks = [System.Text.StringBuilder]::new()
        $letterSections = [System.Text.StringBuilder]::new()
        foreach ($indexLetter in $canonicalLetterGroups.Keys) {
            $letterId = "tables-index-letter-$($indexLetter.ToLowerInvariant())"
            [void]$letterLinks.Append("<a href=`"#$letterId`">$indexLetter</a>")
            $letterRows = [System.Text.StringBuilder]::new()
            foreach ($indexRecord in $canonicalLetterGroups[$indexLetter]) {
                $ownedViewCount = @($canonicalViewsByOwnerPath[$indexRecord.path]).Count
                $tablesIndexOwnedViewCount += $ownedViewCount
                $encodedTitle = [System.Net.WebUtility]::HtmlEncode($indexRecord.title)
                $encodedDomain = [System.Net.WebUtility]::HtmlEncode($indexRecord.domain)
                [void]$letterRows.Append(
                    "<li data-index-path=`"$($indexRecord.path)`"><a href=`"$($indexRecord.href)`">$encodedTitle</a><span>$encodedDomain · $ownedViewCount $(if ($ownedViewCount -eq 1) { 'specialized view' } else { 'specialized views' })</span></li>"
                )
                $tablesIndexCanonicalCount += 1
            }
            [void]$letterSections.Append(
                "<section class=`"tables-index__letter`" id=`"$letterId`"><h2>$indexLetter <span>$($canonicalLetterGroups[$indexLetter].Count) Tables</span></h2><ol>$letterRows</ol></section>"
            )
            $tablesIndexLetterCount += 1
        }
        $curatedRows = [System.Text.StringBuilder]::new()
        foreach ($indexRecord in $curatedIndexRecords) {
            $encodedTitle = [System.Net.WebUtility]::HtmlEncode($indexRecord.title)
            $encodedMeta = [System.Net.WebUtility]::HtmlEncode(
                (@($indexRecord.kind, $indexRecord.domain) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }) -join " · "
            )
            [void]$curatedRows.Append(
                "<li data-index-path=`"$($indexRecord.path)`"><a href=`"$($indexRecord.href)`">$encodedTitle</a><span>$encodedMeta</span></li>"
            )
            $tablesIndexCuratedCount += 1
        }
        $pointerIndexRows = [System.Text.StringBuilder]::new()
        $pointerIndexSection = ""
        $dictionaryRecords = @()
        $dictionaryIndexByCanonicalPath = [System.Collections.Generic.Dictionary[string, int]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
        $dictionaryIndexByPointerSlug = [System.Collections.Generic.Dictionary[string, int]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
        $dictionaryLetterCount = 0
        if ($editionNumber -ge 52) {
            $dictionaryRecords = @($canonicalIndexRecords | ForEach-Object {
                $ownedViewCount = @($canonicalViewsByOwnerPath[$_.path]).Count
                [ordered]@{
                    key = "table:$($_.path)"
                    kind = "table"
                    title = $_.title
                    href = $_.href
                    path = $_.path
                    meta = "Canonical Table · $($_.domain) · $ownedViewCount $(if ($ownedViewCount -eq 1) { 'specialized view' } else { 'specialized views' })"
                }
            })
            foreach ($pointerRecord in $pointerRecords | Sort-Object { $_.label.ToLowerInvariant() }) {
                $pointerOwners = @($pointerRecord.occurrences.path | Sort-Object -Unique).Count
                $encodedPointerLabel = [System.Net.WebUtility]::HtmlEncode($pointerRecord.label)
                [void]$pointerIndexRows.Append(
                    "<li data-pointer-slug=`"$($pointerRecord.slug)`"><a href=`"pointers/$($pointerRecord.slug).html`">$encodedPointerLabel</a><span>$pointerOwners owning Tables · $($pointerRecord.occurrences.Count) expressions</span></li>"
                )
                $tablesIndexPointerCount += 1
                $dictionaryRecords += [ordered]@{
                    key = "pointer:$($pointerRecord.slug)"
                    kind = "pointer"
                    title = $pointerRecord.label
                    href = "pointers/$($pointerRecord.slug).html"
                    slug = $pointerRecord.slug
                    meta = "Pointer · $pointerOwners owning Tables · $($pointerRecord.occurrences.Count) expressions"
                }
            }
            $dictionaryRecords = @($dictionaryRecords |
                Sort-Object @{ Expression = { $_.title.ToLowerInvariant() } }, @{ Expression = { $_.href } })
            for ($dictionaryIndex = 0; $dictionaryIndex -lt $dictionaryRecords.Count; $dictionaryIndex++) {
                $dictionaryRecord = $dictionaryRecords[$dictionaryIndex]
                if ($dictionaryRecord.kind -eq "table") {
                    $dictionaryIndexByCanonicalPath[$dictionaryRecord.path] = $dictionaryIndex
                }
                else {
                    $dictionaryIndexByPointerSlug[$dictionaryRecord.slug] = $dictionaryIndex
                }
            }
            $dictionaryStartHref = $dictionaryRecords[0].href
            $dictionaryLetterGroups = [ordered]@{}
            foreach ($dictionaryRecord in $dictionaryRecords) {
                $letterMatch = [regex]::Match($dictionaryRecord.title, '[A-Za-z0-9]')
                if (-not $letterMatch.Success) {
                    throw "Dictionary title has no sortable character: $($dictionaryRecord.key)"
                }
                $dictionaryLetter = $letterMatch.Value.ToUpperInvariant()
                if (-not $dictionaryLetterGroups.Contains($dictionaryLetter)) {
                    $dictionaryLetterGroups[$dictionaryLetter] = [System.Collections.Generic.List[object]]::new()
                }
                $dictionaryLetterGroups[$dictionaryLetter].Add($dictionaryRecord)
            }
            $dictionaryLetterLinks = [System.Text.StringBuilder]::new()
            $dictionaryLetterSections = [System.Text.StringBuilder]::new()
            foreach ($dictionaryLetter in $dictionaryLetterGroups.Keys) {
                $dictionaryLetterId = "dictionary-letter-$($dictionaryLetter.ToLowerInvariant())"
                [void]$dictionaryLetterLinks.Append("<a href=`"#$dictionaryLetterId`">$dictionaryLetter</a>")
                $dictionaryRows = [System.Text.StringBuilder]::new()
                foreach ($dictionaryRecord in $dictionaryLetterGroups[$dictionaryLetter]) {
                    $encodedDictionaryTitle = [System.Net.WebUtility]::HtmlEncode($dictionaryRecord.title)
                    $encodedDictionaryMeta = [System.Net.WebUtility]::HtmlEncode($dictionaryRecord.meta)
                    $identityAttribute = if ($dictionaryRecord.kind -eq "table") {
                        "data-index-path=`"$($dictionaryRecord.path)`""
                    }
                    else {
                        "data-pointer-slug=`"$($dictionaryRecord.slug)`""
                    }
                    [void]$dictionaryRows.Append(
                        "<li data-dictionary-kind=`"$($dictionaryRecord.kind)`" $identityAttribute><a href=`"$($dictionaryRecord.href)`">$encodedDictionaryTitle</a><span>$encodedDictionaryMeta</span></li>"
                    )
                }
                [void]$dictionaryLetterSections.Append(
                    "<section class=`"tables-index__letter`" id=`"$dictionaryLetterId`"><h2>$dictionaryLetter <span>$($dictionaryLetterGroups[$dictionaryLetter].Count) items</span></h2><ol>$dictionaryRows</ol></section>"
                )
                $dictionaryLetterCount += 1
            }
            $pointerIndexSection = @"
<section class="tables-index__pointers" aria-labelledby="tables-index-pointers-heading">
<p class="site-kicker">Structural entry points · generated concordance</p>
<h2 id="tables-index-pointers-heading">Pointer entry points</h2>
<p>Enter the Tables through any of these $tablesIndexPointerCount admitted structural terms. Each pointer opens the exact Table expressions and owning entries where it occurs.</p>
<ol>$pointerIndexRows</ol>
</section>
"@
        }
        $tablesIndexHtml = @"
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="An alphabetical index of canonical families in $tablesPublicationName.">
<title>$tablesPublicationName A-Z · $publicationName</title>
<link rel="stylesheet" href="assets/site.css">
$identityPreviewStyle
</head>
<body class="proof-site reader-ready tables-index-page">
<a class="site-skip" href="#main-content">Skip to content</a>
<header class="site-header"><div class="site-header__inner">
<a class="site-brand" href="index.html">$siteBrand</a>
<nav class="site-nav" aria-label="Primary">$(if ($editionNumber -ge 66) { '<a href="tables.html" aria-current="page">Tables</a><a href="reader.html">Reader</a><a href="compose.html">Work with a question</a><a href="index.html#search">Search</a><a href="index.html#contents">Contents</a>' } else { '<a href="tables.html" aria-current="page">Tables</a><a href="' + $(if ($editionNumber -ge 36) { 'reader.html' } else { 'index.html#reader' }) + '">Reader</a>' + $homePointerNav + '<a href="index.html#search">Search</a><a href="index.html#contents">Contents</a><a href="' + $quickstartPage + '">Quickstart</a>' })</nav>
</div></header>$identityPreviewBanner
<main id="main-content" class="site-main tables-index">
<nav class="site-breadcrumbs" aria-label="Breadcrumb"><a href="index.html">$publicationName</a> / Tables A-Z</nav>
<section class="tables-index__heading">
<p class="site-kicker">Primary reference · alphabetical browse$(if ($identityPreview) { ' · candidate publication name' } else { '' })</p>
<h1>$tablesPublicationName A-Z</h1>
<p>$(if ($editionNumber -ge 66) { "Read one merged dictionary of $($dictionaryRecords.Count) alphabetized items: $tablesIndexPointerCount structural pointers interleaved with $tablesIndexCanonicalCount canonical Table families." } else { "Scan $(if ($editionNumber -ge 49) { 54 } else { 53 }) canonical Table families by selected headword. Open an entry to read its definition and exact specialized views." })</p>
$(if ($editionNumber -ge 66) { '<label class="dictionary-view-switcher">View <select data-dictionary-view><option value="tables.html" selected>Index A-Z</option><option value="dictionary.html">Continuous A-Z</option><option value="book.html">Condensed Book</option></select></label>' })
<div class="tables-index__actions">$(if ($editionNumber -ge 66) { '<a href="dictionary.html">Continuous A-Z</a><a href="book.html">Condensed book</a><a data-dictionary-start href="' + $dictionaryStartHref + '">Read page by page</a><a href="terms.html">Pointer index</a>' })<a href="index.html#search">Search the Tables</a><a href="index.html#contents">Use book contents</a></div>
<p class="tables-index__boundary">Alphabetical adjacency is presentation only; it does not assert relatedness, hierarchy, synonymy, dependency, recommendation, or closure.</p>
</section>
$(if ($editionNumber -ge 66) {
    '<nav class="tables-index__letters" aria-label="Dictionary initial letters">' + $dictionaryLetterLinks + '</nav>' +
    '<div class="tables-index__canonical tables-index__dictionary">' + $dictionaryLetterSections + '</div>'
} else {
    '<nav class="tables-index__letters" aria-label="Canonical Table initial letters">' + $letterLinks + '</nav>' +
    '<div class="tables-index__canonical">' + $letterSections + '</div>' + $pointerIndexSection
})
<section class="tables-index__curated" aria-labelledby="tables-index-curated-heading">
<p class="site-kicker">Edition selection · separate from canonical families</p>
<h2 id="tables-index-curated-heading">Curated Table records</h2>
<p>These 27 useful foundations and examples are selected into this edition but are not relabelled canonical entries.</p>
<ol>$curatedRows</ol>
</section>
</main>
<footer class="site-footer">$rootPublicationStatus$contentLicenseNotice</footer>
$(if ($editionNumber -ge 66) { '<script src="assets/dictionary-stream.js"></script>' })
</body>
</html>
"@
        [System.IO.File]::WriteAllText($siteTablesIndex, $tablesIndexHtml, [System.Text.UTF8Encoding]::new($false))
    }

    if ($editionNumber -ge 66) {
        $dictionaryStreamData = @($dictionaryRecords | ForEach-Object {
            [ordered]@{
                title = $_.title
                kind = $_.kind
                href = $_.href
            }
        }) | ConvertTo-Json -Compress
        $dictionaryStreamData = $dictionaryStreamData.Replace('</', '<\/')
        $dictionaryStreamHtml = @"
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="A continuous alphabetical reading view of Formarium pointer terms and canonical Table families.">
<title>Continuous Dictionary A-Z · $publicationName</title>
<link rel="stylesheet" href="assets/site.css">
</head>
<body class="proof-site dictionary-stream-page">
<a class="site-skip" href="#main-content">Skip to content</a>
<header class="site-header"><div class="site-header__inner">
<a class="site-brand" href="index.html">$siteBrand</a>
<nav class="site-nav" aria-label="Primary">$rootStableNav</nav>
</div></header>
<main id="main-content" class="site-main dictionary-stream">
<nav class="site-breadcrumbs" aria-label="Breadcrumb"><a href="index.html">$publicationName</a> / <a href="tables.html">Dictionary A-Z</a> / Continuous view</nav>
<section class="dictionary-stream__heading">
<p class="site-kicker">Continuous reading · mixed A-Z dictionary</p>
<h1>Continuous Dictionary A-Z</h1>
<p>Keep scrolling through all $($dictionaryRecords.Count) alphabetized items. Entries load progressively in small batches: $tablesIndexPointerCount pointers remain visibly distinct from $tablesIndexCanonicalCount canonical Table families.</p>
<label class="dictionary-view-switcher">View <select data-dictionary-view><option value="tables.html">Index A-Z</option><option value="dictionary.html" selected>Continuous A-Z</option><option value="book.html">Condensed Book</option></select></label>
<div class="tables-index__actions"><a href="tables.html">Back to the complete index</a><a href="book.html">Open condensed book</a><a data-dictionary-start href="$dictionaryStartHref">Use page-by-page reading</a></div>
<p class="tables-index__boundary">Continuous proximity is presentation only; it does not assert synonymy, hierarchy, dependency, recommendation, or another semantic relation.</p>
</section>
<section data-dictionary-stream data-batch-size="4" aria-label="Continuous dictionary entries">
<div class="dictionary-stream__items" data-dictionary-stream-items></div>
<div class="dictionary-stream__loader">
<button type="button" data-dictionary-stream-load>Load next entries</button>
<p role="status" aria-live="polite" data-dictionary-stream-status>Preparing the first dictionary entries…</p>
</div>
</section>
</main>
<footer class="site-footer">Progressive projection of the Formarium Dictionary A-Z · pointer and canonical authority labels remain explicit · $rootPublicationStatus$contentLicenseNotice</footer>
<script id="dictionary-stream-data" type="application/json">$dictionaryStreamData</script>
<script src="assets/dictionary-stream.js"></script>
</body>
</html>
"@
        [System.IO.File]::WriteAllText(
            $siteDictionaryStream,
            $dictionaryStreamHtml,
            [System.Text.UTF8Encoding]::new($false)
        )

        $pointerRecordBySlug = [System.Collections.Generic.Dictionary[string, object]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
        foreach ($pointerRecord in $pointerRecords) {
            $pointerRecordBySlug[$pointerRecord.slug] = $pointerRecord
        }
        $canonicalBookPaths = [System.Collections.Generic.HashSet[string]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
        foreach ($canonicalRecord in $canonicalIndexRecords) {
            [void]$canonicalBookPaths.Add($canonicalRecord.path)
        }
        $bookSupplementCounts = [ordered]@{
            specialized = 0
            reference_delta = 0
            cross_references = 0
            sources_provenance = 0
        }
        $dictionaryBookItems = [System.Text.StringBuilder]::new()
        $dictionaryBookTableItems = [System.Text.StringBuilder]::new()
        $dictionaryBookPointerItems = [System.Text.StringBuilder]::new()
        for ($bookIndex = 0; $bookIndex -lt $dictionaryRecords.Count; $bookIndex++) {
            $bookRecord = $dictionaryRecords[$bookIndex]
            $bookPosition = $bookIndex + 1
            $encodedBookTitle = [System.Net.WebUtility]::HtmlEncode($bookRecord.title)
            $bookContent = ""
            $bookMaturityHtml = ""
            if ($bookRecord.kind -eq "pointer") {
                $pointerRecord = $pointerRecordBySlug[$bookRecord.slug]
                $encodedOrientation = [System.Net.WebUtility]::HtmlEncode($pointerRecord.orientation)
                $pointerOwnerItems = [System.Text.StringBuilder]::new()
                $pointerOwnerGroups = @(
                    $pointerRecord.occurrences |
                        Group-Object -Property { $_.path } |
                        Sort-Object { $_.Group[0].title.ToLowerInvariant() }
                )
                foreach ($pointerOwnerGroup in $pointerOwnerGroups) {
                    $pointerOwner = $pointerOwnerGroup.Group[0]
                    $encodedPointerOwnerTitle = [System.Net.WebUtility]::HtmlEncode(
                        $pointerOwner.title
                    )
                    [void]$pointerOwnerItems.AppendLine(
                        '<li><a href="entries/' + $pointerOwner.page + '#' +
                            $pointerOwner.anchor + '">' + $encodedPointerOwnerTitle + '</a></li>'
                    )
                }
                $bookContent = '<h2 id="book-pointer-' + $bookRecord.slug + '">' +
                    $encodedBookTitle + '</h2><p>' + $encodedOrientation +
                    '.</p><div class="dictionary-book__pointer-parents"><p>Appears in</p><ul>' +
                    $pointerOwnerItems.ToString() + '</ul></div>'
            }
            else {
                $bookSource = [System.IO.Path]::GetFullPath((Join-Path $workspace $bookRecord.path))
                $bookContent = $renderedSegmentBySource[$bookSource]
                $bookStatusMatch = [regex]::Match(
                    $bookContent,
                    '(?is)<p>Status:\s*(.*?)</p>'
                )
                if ($bookStatusMatch.Success) {
                    $bookMaturityHtml = '<p class="dictionary-book__maturity"><strong>Publication status</strong> ' +
                        $bookStatusMatch.Groups[1].Value + '</p>'
                    $bookContent = $bookContent.Remove(
                        $bookStatusMatch.Index,
                        $bookStatusMatch.Length
                    )
                }
                $bookContent = [regex]::Replace(
                    $bookContent,
                    'href="#([^"]+)"',
                    {
                        param($match)

                        $targetId = $match.Groups[1].Value
                        if (-not $sourceByRenderedId.ContainsKey($targetId)) {
                            return $match.Value
                        }
                        $targetSource = $sourceByRenderedId[$targetId]
                        $targetRelative = [System.IO.Path]::GetRelativePath($workspace, $targetSource).Replace("\", "/")
                        if ($canonicalBookPaths.Contains($targetRelative)) {
                            return $match.Value
                        }
                        return 'href="entries/' + $pageBySource[$targetSource] + '#' + $targetId + '"'
                    }
                )
                $bookContent = $bookContent.Replace('href="../pointers/', 'href="pointers/')
                $bookContent = [regex]::new('<h1([^>]*)>').Replace($bookContent, '<h2$1>', 1)
                $bookContent = [regex]::new('</h1>').Replace($bookContent, '</h2>', 1)
                $bookContent = [regex]::Replace(
                    $bookContent,
                    '(?is)<h2 id="([^"]+)">(Specialized\s+views?|Reference\s+Delta|Cross-references|Sources\s+and\s+provenance)</h2>(.*?)(?=<h2\b|$)',
                    {
                        param($match)

                        $supplementId = $match.Groups[1].Value
                        $supplementHeading = $match.Groups[2].Value
                        $normalizedHeading = [regex]::Replace(
                            [System.Net.WebUtility]::HtmlDecode($supplementHeading),
                            '\s+',
                            ' '
                        ).Trim().ToLowerInvariant()
                        $supplementKind = if ($normalizedHeading.StartsWith("specialized")) {
                            "specialized"
                        }
                        elseif ($normalizedHeading -eq "reference delta") {
                            "reference_delta"
                        }
                        elseif ($normalizedHeading -eq "cross-references") {
                            "cross_references"
                        }
                        else {
                            "sources_provenance"
                        }
                        $bookSupplementCounts[$supplementKind] += 1
                        $supplementBody = $match.Groups[3].Value
                        if ($supplementKind -eq "sources_provenance") {
                            $supplementBody = $bookMaturityHtml + $supplementBody
                        }
                        return '<details class="dictionary-book__supplement" data-book-supplement="' +
                            $supplementKind + '"><summary id="' + $supplementId + '">' +
                            $supplementHeading + '</summary><div>' + $supplementBody +
                            '</div></details>'
                    }
                )
            }
            [void]$dictionaryBookItems.AppendLine(@"
<article class="dictionary-book__item" data-dictionary-kind="$($bookRecord.kind)" data-dictionary-position="$bookPosition" data-dictionary-title="$encodedBookTitle">
<div class="dictionary-book__content">$bookContent</div>
</article>
"@)
            if ($bookRecord.kind -eq "pointer") {
                [void]$dictionaryBookPointerItems.AppendLine(@"
<article class="dictionary-book__print-pointer-item" data-print-pointer="$($bookRecord.slug)">
<div class="dictionary-book__content">$bookContent</div>
</article>
"@)
            }
            else {
                $printBookContent = [regex]::Replace(
                    $bookContent,
                    '(?is)<details class="dictionary-book__supplement" data-book-supplement="([^"]+)"><summary id="([^"]+)">(.*?)</summary><div>(.*?)</div></details>',
                    {
                        param($match)

                        if ($match.Groups[1].Value -ne "sources_provenance") {
                            return ""
                        }
                        return '<section class="dictionary-book__print-provenance" aria-labelledby="print-' +
                            $match.Groups[2].Value + '"><h3 id="print-' +
                            $match.Groups[2].Value + '">' + $match.Groups[3].Value +
                            '</h3>' + $match.Groups[4].Value + '</section>'
                    }
                )
                $printBookContent = $printBookContent.Replace(
                    'class="dictionary-book__maturity"',
                    'class="dictionary-book__print-maturity"'
                )
                [void]$dictionaryBookTableItems.AppendLine(@"
<article class="dictionary-book__print-table-item" data-print-table-position="$bookPosition" data-print-table-title="$encodedBookTitle">
<div class="dictionary-book__content">$printBookContent</div>
</article>
"@)
            }
        }
        $dictionaryBookHtml = @"
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Gio Della-Libera">
<meta name="description" content="An internal proof of the Formarium canonical Tables with a subordinate pointer index.">
<title>The Formarium</title>
<link rel="stylesheet" href="assets/site.css">
</head>
<body class="proof-site dictionary-book-page">
<a class="site-skip" href="#main-content">Skip to content</a>
<nav class="dictionary-book__tools" aria-label="Book view controls">
<a href="index.html">Formarium home</a>
<a href="reader.html">Reader</a>
<a href="tables.html">Back to Dictionary A-Z</a>
<label class="dictionary-view-switcher">View <select data-dictionary-view><option value="tables.html">Index A-Z</option><option value="dictionary.html">Continuous A-Z</option><option value="book.html" selected>Condensed Book</option></select></label>
<button type="button" data-dictionary-print>Print or save PDF</button>
</nav>
<main id="main-content" class="dictionary-book">
<header class="dictionary-book__title">
<p>Formarium Tables</p>
<h1>The Formarium</h1>
<p>Start with a familiar word. See where its meanings separate, what structures each sense requires, and which Tables carry it further.</p>
<p class="dictionary-book__proof-status">Internal proof · internally validated projection · not reader-outcome evidence</p>
<p class="dictionary-book__edition">Edition <a href="https://giodl73-repo.github.io/$repositoryName/manifest.json">$Edition</a> · $tablesIndexCanonicalCount canonical Tables · $tablesIndexPointerCount pointer-index records · source <a href="https://github.com/giodl73-repo/$repositoryName/tree/$sourceCommit">$sourceCommitShort</a> ($sourceCommitDate) · online companion at <a href="https://giodl73-repo.github.io/$repositoryName/book.html">the Lexicon book</a></p>
<div class="dictionary-book__front-matter">
<section aria-labelledby="book-use-heading"><h2 id="book-use-heading">How to use this proof</h2><ol><li>Look up a familiar concept and select the intended sense.</li><li>Compare the available factorizations, decisive distinctions, and failure signs.</li><li>Follow named factors through the pointer index or the online graph.</li></ol></section>
<section aria-labelledby="book-inventory-heading"><h2 id="book-inventory-heading">Edition inventory</h2><dl><div><dt>Canonical body</dt><dd>$tablesIndexCanonicalCount Tables</dd></div><div><dt>Navigation appendix</dt><dd>$tablesIndexPointerCount pointer records</dd></div><div><dt>Detailed online supplements</dt><dd>$($bookSupplementCounts.specialized) specialized sections and $($bookSupplementCounts.reference_delta) Reference Deltas</dd></div><div><dt>Evidence boundary</dt><dd>Internal mechanics and editorial validation only</dd></div></dl></section>
</div>
</header>
<section class="dictionary-book__reader" aria-label="Paged condensed dictionary">
<nav class="dictionary-book__page-controls" aria-label="Book pages">
<button type="button" data-book-page-previous>Previous page</button>
<p data-book-page-status role="status" aria-live="polite">Preparing pages…</p>
<button type="button" data-book-page-next>Next page</button>
<p class="dictionary-book__running-head" data-book-running-head aria-live="polite" aria-atomic="true" hidden></p>
</nav>
<div class="dictionary-book__entries" data-book-pages tabindex="0">$dictionaryBookItems</div>
<p class="dictionary-book__page-hint">Read down the left column, then down the right. Use the page buttons or horizontal scrollbar to continue.</p>
</section>
<section class="dictionary-book__print-body" aria-labelledby="print-canonical-heading">
<header class="dictionary-book__print-section-heading"><p>Part I</p><h2 id="print-canonical-heading">Canonical Tables</h2><p>These $tablesIndexCanonicalCount Tables are the substantive Lexicon reference. Each retains its governing questions, competing structures, constraints, failure signs, and minimum source custody.</p></header>
$dictionaryBookTableItems
</section>
<section class="dictionary-book__print-pointer-index" aria-labelledby="print-pointer-heading">
<header class="dictionary-book__print-section-heading"><p>Part II</p><h2 id="print-pointer-heading">Pointer index</h2><p>These $tablesIndexPointerCount navigation records are not additional canonical Tables. They route reusable labels to their owning Tables without asserting a new semantic relation.</p></header>
<div class="dictionary-book__print-pointer-columns">$dictionaryBookPointerItems</div>
</section>
<section class="dictionary-book__colophon" aria-labelledby="book-colophon-heading">
<h2 id="book-colophon-heading">Colophon</h2>
<p><strong>Edition:</strong> $Edition · <strong>Source:</strong> $sourceCommit · <strong>Source date:</strong> $sourceCommitDate.</p>
<p>This is an internal proof, not reader-outcome evidence and not authorization for public R5 release. Canonical authority remains in the repository Markdown and Lexicon reference contracts. Detailed specialized views, Reference Deltas, cross-references, and complete provenance remain available in the edition-specific online companion and manifest.</p>
<p><strong>Content:</strong> Copyright 2026 Gio Della-Libera, licensed CC BY-NC 4.0. <strong>Software:</strong> MIT.</p>
</section>
</main>
<footer class="site-footer">Condensed A-Z projection of Formarium Tables · pointer and canonical authority labels remain explicit · $rootPublicationStatus$contentLicenseNotice</footer>
<script src="assets/dictionary-stream.js"></script>
</body>
</html>
"@
        [System.IO.File]::WriteAllText(
            $siteDictionaryBook,
            $dictionaryBookHtml,
            [System.Text.UTF8Encoding]::new($false)
        )
    }

    $readerRouteRecordCount = 0
    $readerRoutePartCount = 0
    $readerRoutePartSizes = @()
    if ($editionNumber -ge 36) {
        $candidateManifestText = Get-Content -LiteralPath $bookOneCandidateManifest -Raw
        $candidateRecordMatches = [regex]::Matches(
            $candidateManifestText,
            '(?m)^record\s+(\d{2})\s+\|\s+(tables/[^\r\n]+)$'
        )
        if ($candidateRecordMatches.Count -ne 24) {
            throw "Reader route manifest record mismatch: $($candidateRecordMatches.Count)"
        }
        $candidateRecordPaths = [System.Collections.Generic.List[string]]::new()
        $candidateRecordIndexByPath = [System.Collections.Generic.Dictionary[string, int]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
        for ($candidateIndex = 0; $candidateIndex -lt $candidateRecordMatches.Count; $candidateIndex++) {
            $expectedOrdinal = $candidateIndex + 1
            $actualOrdinal = [int]$candidateRecordMatches[$candidateIndex].Groups[1].Value
            if ($actualOrdinal -ne $expectedOrdinal) {
                throw "Reader route manifest ordinal mismatch: $actualOrdinal/$expectedOrdinal"
            }
            $candidateRecordPath = $candidateRecordMatches[$candidateIndex].Groups[2].Value.Trim()
            if (-not $searchRecordByPath.ContainsKey($candidateRecordPath)) {
                throw "Reader route record is absent from selected search custody: $candidateRecordPath"
            }
            $candidateRecordPaths.Add($candidateRecordPath)
            $candidateRecordIndexByPath[$candidateRecordPath] = $candidateIndex
        }
        if (@($candidateRecordPaths | Sort-Object -Unique).Count -ne 24) {
            throw "Reader route manifest repeats a record"
        }

        $candidateGuideText = Get-Content -LiteralPath $bookOneGuide -Raw
        $candidatePartMatches = [regex]::Matches(
            $candidateGuideText,
            '(?ms)^###\s+([IVX]+)\.\s+([^\r\n]+)\r?\n(.*?)(?=^###\s+|^##\s+Fixed boundary)'
        )
        if ($candidatePartMatches.Count -ne 5) {
            throw "Reader route authored part mismatch: $($candidatePartMatches.Count)"
        }
        $authoredRecordPaths = [System.Collections.Generic.List[string]]::new()
        $readerPartNumberByPath = [System.Collections.Generic.Dictionary[string, int]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
        $readerPartTitleByPath = [System.Collections.Generic.Dictionary[string, string]]::new(
            [System.StringComparer]::OrdinalIgnoreCase
        )
        $readerPartSections = [System.Text.StringBuilder]::new()
        $readerSequence = 0
        foreach ($candidatePartMatch in $candidatePartMatches) {
            $partRoman = $candidatePartMatch.Groups[1].Value
            $partTitle = $candidatePartMatch.Groups[2].Value.Trim()
            $partLinkMatches = [regex]::Matches(
                $candidatePartMatch.Groups[3].Value,
                '\]\(\.\./(tables/[^\)]+)\)'
            )
            $partSize = $partLinkMatches.Count
            $readerRoutePartSizes += $partSize
            $partRows = [System.Text.StringBuilder]::new()
            foreach ($partLinkMatch in $partLinkMatches) {
                $recordPath = $partLinkMatch.Groups[1].Value
                $authoredRecordPaths.Add($recordPath)
                $readerPartNumberByPath[$recordPath] = $readerRoutePartCount + 1
                $readerPartTitleByPath[$recordPath] = $partTitle
                $record = $searchRecordByPath[$recordPath]
                $readerSequence += 1
                $encodedSequence = $readerSequence.ToString("00")
                $encodedRecordTitle = [System.Net.WebUtility]::HtmlEncode($record.title)
                $encodedRecordMeta = [System.Net.WebUtility]::HtmlEncode(
                    (@($record.kind, $record.domain) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }) -join " · "
                )
                [void]$partRows.Append(
                    "<li data-reader-path=`"$recordPath`"><span class=`"reader-route__number`">$encodedSequence</span><a href=`"$($record.href)`">$encodedRecordTitle</a><span class=`"reader-route__meta`">$encodedRecordMeta</span></li>"
                )
                $readerRouteRecordCount += 1
            }
            $encodedPartTitle = [System.Net.WebUtility]::HtmlEncode($partTitle)
            $readerRoutePartCount += 1
            [void]$readerPartSections.Append(
                "<section class=`"reader-route__part`" id=`"reader-part-$readerRoutePartCount`"><p class=`"reader-route__part-number`">Part $partRoman · $partSize records</p><h2>$encodedPartTitle</h2><ol>$partRows</ol></section>"
            )
        }
        if ($authoredRecordPaths.Count -ne $candidateRecordPaths.Count) {
            throw "Reader route authored record count mismatch: $($authoredRecordPaths.Count)/$($candidateRecordPaths.Count)"
        }
        for ($candidateIndex = 0; $candidateIndex -lt $candidateRecordPaths.Count; $candidateIndex++) {
            if (-not $candidateRecordPaths[$candidateIndex].Equals(
                    $authoredRecordPaths[$candidateIndex],
                    [System.StringComparison]::OrdinalIgnoreCase
                )) {
                throw "Reader route manifest/guide order mismatch at $($candidateIndex + 1): $($candidateRecordPaths[$candidateIndex])/$($authoredRecordPaths[$candidateIndex])"
            }
        }
        if (($readerRoutePartSizes -join ",") -ne "6,6,5,4,3") {
            throw "Reader route part sizes mismatch: $($readerRoutePartSizes -join ',')"
        }

        $readerStartRecord = $searchRecordByPath[$candidateRecordPaths[0]]
        $readerStartTitle = [System.Net.WebUtility]::HtmlEncode($readerStartRecord.title)
        $readerPrimaryActions = if ($editionNumber -ge 38) {
            "<a class=`"reader-route__primary`" data-reader-start=`"sequence`" href=`"$($readerStartRecord.href)`">Begin with $readerStartTitle</a><a data-reader-start=`"quickstart`" href=`"$candidateQuickstartPage`">Read the quickstart</a>"
        }
        else {
            "<a class=`"reader-route__primary`" href=`"$candidateQuickstartPage`">Start with the quickstart</a>"
        }

        $readerRouteHtml = @"
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="The selected five-part teaching route through $tablesPublicationName.">
<title>$readerPublicationName · $publicationName</title>
<link rel="stylesheet" href="assets/site.css">
$identityPreviewStyle
</head>
<body class="proof-site reader-ready reader-route-page">
<a class="site-skip" href="#main-content">Skip to content</a>
<header class="site-header"><div class="site-header__inner">
<a class="site-brand" href="index.html">$siteBrand</a>
<nav class="site-nav" aria-label="Primary">$(if ($editionNumber -ge 66) { '<a href="tables.html">Tables</a><a href="reader.html" aria-current="page">Reader</a><a href="compose.html">Work with a question</a><a href="index.html#search">Search</a><a href="index.html#contents">Contents</a>' } else { '<a href="tables.html">Tables</a><a href="reader.html" aria-current="page">Reader</a>' + $homePointerNav + '<a href="index.html#search">Search</a><a href="index.html#contents">Contents</a><a href="' + $candidateQuickstartPage + '">Quickstart</a>' })</nav>
</div></header>$identityPreviewBanner
<main id="main-content" class="site-main reader-route">
<nav class="site-breadcrumbs" aria-label="Breadcrumb"><a href="index.html">$publicationName</a> / Reader</nav>
<section class="reader-route__heading">
<p class="site-kicker">Teaching companion · selected route</p>
<h1>$readerPublicationName</h1>
<p>Learn one bounded method through 24 selected records in five parts, then return to the canonical $tablesPublicationName whenever the question needs more depth.</p>
<div class="reader-route__actions">$readerPrimaryActions<a href="$candidateGuidePage">Read the complete method</a><a href="$candidateTasksPage">Try worked questions</a><a href="tables.html">Browse Tables A-Z</a></div>
<p class="reader-route__boundary"><strong>$tablesPublicationName remain authoritative.</strong> $(if ($lexiconIdentity) { 'Lexicon schemas and file formats are canonical; Factorium and Formarium identifiers remain readable historical imports. ' } elseif ($formariumIdentityPreview) { 'Formarium is the public feedback identity; Factorium schema names, file formats, and canonical IDs remain compatibility internals. ' } elseif ($formariumIdentity) { 'Formarium schemas and file formats are canonical; legacy identifiers remain readable historical imports. ' } elseif ($tabulaIdentityPreview) { 'Tabula Facta is the candidate publication name; Factorium identities and source records are unchanged. ' } else { '' })This order is an editorial teaching sequence—not hierarchy, prerequisite truth, semantic relatedness, completeness, or a ranking of the other $readerAdditionalRecordCount records.</p>
</section>
<nav class="reader-route__parts" aria-label="Reader parts"><a href="#reader-part-1">I</a><a href="#reader-part-2">II</a><a href="#reader-part-3">III</a><a href="#reader-part-4">IV</a><a href="#reader-part-5">V</a></nav>
<div class="reader-route__spine">$readerPartSections</div>
<section class="reader-route__after" aria-labelledby="reader-route-after-heading">
<p class="site-kicker">After the selected route</p>
<h2 id="reader-route-after-heading">Branch only when the question requires it</h2>
<p>Search or browse the full Tables for specialized depth. Factor Guides apply selected Tables to bounded questions; they are not additional Reader chapters or a third authority.</p>
<div class="reader-route__actions"><a href="index.html#search">Search all Tables</a><a href="$(if ($editionNumber -ge 66) { 'compose.html' } else { 'index.html#problems' })">Open worked questions</a><a href="index.html#contents">Keep exploring</a></div>
</section>
</main>
<footer class="site-footer">$rootPublicationStatus$contentLicenseNotice</footer>
</body>
</html>
"@
        [System.IO.File]::WriteAllText($siteReader, $readerRouteHtml, [System.Text.UTF8Encoding]::new($false))
    }

    if ($editionNumber -ge 16) {
        $labSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionLabSpec)])"
        $compositionLabHtml = @"
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="A bounded local simulation of explicit typed composition closure.">
<title>Bounded Composition Lab · $publicationName</title>
<link rel="stylesheet" href="assets/site.css">
$identityPreviewStyle
</head>
<body class="proof-site lab-page">
<a class="site-skip" href="#main-content">Skip to content</a>
<header class="site-header"><div class="site-header__inner">
<a class="site-brand" href="index.html">$siteBrand</a>
<nav class="site-nav" aria-label="Primary">$(if ($editionNumber -ge 66) { '<a href="tables.html">Tables</a><a href="reader.html">Reader</a><a href="compose.html" aria-current="page">Work with a question</a><a href="index.html#search">Search</a><a href="index.html#contents">Contents</a>' } else { '<a href="index.html#problems">Problems</a><a href="compose.html" aria-current="page">Compose</a><a href="index.html#compose">Traces</a>' + $homeTablesIndexNav + $homePointerNav + '<a href="index.html#search">Search</a><a href="index.html#contents">Contents</a><a href="' + $quickstartPage + '">Quickstart</a>' })</nav>
</div></header>$identityPreviewBanner
<main id="main-content" class="site-main lab-main">
<nav class="site-breadcrumbs" aria-label="Breadcrumb"><a href="index.html">$publicationName</a> / Bounded Composition Lab</nav>
<section class="lab-hero">
<p class="site-kicker">Local interactive simulation</p>
<h1>Build a bounded working graph</h1>
<p>Choose exact concepts and reviewed relations. The lab will follow only your allowlist, stop at finite budgets, keep exclusions visible, and flatten a structural draft.</p>
<div class="lab-boundary-note"><strong>Your words do not choose the graph.</strong> The problem statement names your work; only explicit seed and relation selections control closure. All checks remain unresolved.</div>
</section>
<div class="lab-layout">
<form id="composition-lab-form" class="composition-lab" novalidate>
<section class="lab-form-section">
<span class="lab-step">1 · Frame</span>
<h2>Name the local problem and context</h2>
<label class="lab-field"><span>Problem statement</span><textarea name="problem" rows="3" minlength="10" maxlength="240" required>Review a system dependency and its required interaction contract.</textarea><small>Identity and reading context only; no semantic extraction.</small></label>
<div class="lab-fields-two">
<label class="lab-field"><span>Context profile ID</span><input name="contextId" value="synthetic-query-lab" pattern="[a-z0-9]+(?:-[a-z0-9]+)*" required></label>
<label class="lab-field"><span>Context selections</span><input name="contextSelections" value="boundary=declared-system,reference-frame=not-applicable" required><small>Comma-separated lower-kebab <code>key=value</code>; <code>reference-frame</code> is mandatory.</small></label>
</div>
</section>
<section class="lab-form-section">
<span class="lab-step">2 · Add</span>
<h2>Select one to three seed concepts</h2>
<p class="lab-help">Only exact endpoints from the six reviewed F1-F6 relations in this edition's Lab allowlist are available.</p>
<div id="composition-lab-seeds" class="lab-choice-grid"></div>
</section>
<section class="lab-form-section">
<span class="lab-step">3 · Multiply</span>
<h2>Allow specific typed relations</h2>
<p class="lab-help">Selection is explicit. Names, links, and lexical similarity never become edges.</p>
<div id="composition-lab-relations" class="lab-choice-grid lab-choice-grid--relations"></div>
</section>
<section class="lab-form-section">
<span class="lab-step">4 · Bound</span>
<h2>Declare direction and finite budgets</h2>
<div class="lab-budget-grid">
<label class="lab-field"><span>Direction</span><select name="direction"><option value="forward">Forward</option><option value="reverse">Reverse</option></select></label>
<label class="lab-field"><span>Depth</span><input name="depth" type="number" min="1" max="6" value="1" required></label>
<label class="lab-field"><span>Edges</span><input name="edges" type="number" min="1" max="6" value="1" required></label>
<label class="lab-field"><span>Nodes</span><input name="nodes" type="number" min="3" max="24" value="6" required></label>
</div>
</section>
<details class="lab-form-section lab-exclusions">
<summary><span><span class="lab-step">5 · Subtract</span><strong>Request optional exclusions</strong></span></summary>
<p class="lab-help">A reached required or evaluative node remains in the graph and creates a contradiction.</p>
<div id="composition-lab-exclusions" class="lab-choice-grid"></div>
</details>
<div class="lab-submit"><button type="submit">Run bounded closure</button><p>No data leaves this page. Reloading deletes the result.</p></div>
</form>
<aside class="lab-contract">
<p class="site-kicker">Before you run it</p>
<h2>What this lab can—and cannot—do</h2>
<ul><li>It can follow explicit F1-F6 relations in one direction.</li><li>It can expose budget frontiers, unreachable predecessors, and exclusion conflicts.</li><li>It can assign unresolved structural checks to admitted scope views.</li><li>It cannot discover concepts from prose, decide compatibility, evaluate domain evidence, or emit a canonical trace.</li></ul>
<a href="$labSpecPage">Read the full simulation contract</a>
</aside>
</div>
<section id="composition-lab-result" class="lab-result" tabindex="-1" aria-live="polite">
<p class="lab-result__empty">Configure the explicit request, then run bounded closure. The result will appear here.</p>
</section>
<noscript><p class="lab-error">This local simulation requires JavaScript. The book, worked traces, and Factor Guides remain available without it.</p></noscript>
</main>
<footer class="site-footer">Local synthetic work product · no persistence · not canonical content$contentLicenseNotice</footer>
<script src="assets/site-data.js"></script>
<script src="assets/composition-lab.js"></script>
</body>
</html>
"@
        if ($editionNumber -ge 17) {
            $readingSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionReadingSpec)])"
            foreach ($marker in @(
                '<p>Choose exact concepts and reviewed relations. The lab will follow only your allowlist, stop at finite budgets, keep exclusions visible, and flatten a structural draft.</p>',
                "<a href=`"$labSpecPage`">Read the full simulation contract</a>",
                '<script src="assets/composition-lab.js"></script>'
            )) {
                if (-not $compositionLabHtml.Contains($marker)) {
                    throw "Composition reading page integration marker drift: $marker"
                }
            }
            $compositionLabHtml = $compositionLabHtml.Replace(
                '<p>Choose exact concepts and reviewed relations. The lab will follow only your allowlist, stop at finite budgets, keep exclusions visible, and flatten a structural draft.</p>',
                '<p>Choose exact concepts and reviewed relations. The lab will follow only your allowlist, stop at finite budgets, keep exclusions visible, flatten a structural draft, and route the admitted closure into the book.</p>'
            ).Replace(
                "<a href=`"$labSpecPage`">Read the full simulation contract</a>",
                "<a href=`"$labSpecPage`">Read the full simulation contract</a><a href=`"$readingSpecPage`">Read the reading-route contract</a>"
            ).Replace(
                '<script src="assets/composition-lab.js"></script>',
                "<script src=`"assets/composition-lab.js`"></script>`n<script src=`"assets/composition-reading.js`"></script>"
            )
            if (-not $compositionLabHtml.Contains("href=`"$readingSpecPage`"") -or
                -not $compositionLabHtml.Contains('src="assets/composition-reading.js"')) {
                throw "Composition reading page integration failed"
            }
            if ($editionNumber -ge 18) {
                $focusSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionFocusSpec)])"
                $readingContractLink = "<a href=`"$readingSpecPage`">Read the reading-route contract</a>"
                if (-not $compositionLabHtml.Contains($readingContractLink)) {
                    throw "Composition factor-focus contract marker drift"
                }
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $readingContractLink,
                    "$readingContractLink<a href=`"$focusSpecPage`">Read the factor-focus contract</a>"
                )
            }
            if ($editionNumber -ge 19) {
                $paletteSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionPaletteSpec)])"
                $focusContractLink = "<a href=`"$focusSpecPage`">Read the factor-focus contract</a>"
                foreach ($marker in @(
                    $focusContractLink,
                    '<h2>Select one to three seed concepts</h2>',
                    '<script src="assets/composition-reading.js"></script>'
                )) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition palette page integration marker drift: $marker"
                    }
                }
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $focusContractLink,
                    "$focusContractLink<a href=`"$paletteSpecPage`">Read the concept-palette contract</a>"
                ).Replace(
                    '<h2>Select one to three seed concepts</h2>',
                    '<h2>Choose one to three concepts by topic</h2>'
                ).Replace(
                    '<script src="assets/composition-reading.js"></script>',
                    "<script src=`"assets/composition-reading.js`"></script>`n<script src=`"assets/composition-palette.js`"></script>"
                )
            }
            if ($editionNumber -ge 20) {
                $viewsSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionViewsSpec)])"
                $paletteContractLink = "<a href=`"$paletteSpecPage`">Read the concept-palette contract</a>"
                $compositionViewToolbar = @'
<section id="composition-view-toolbar" class="reader-toolbar composition-view-toolbar" aria-labelledby="composition-view-heading" hidden>
<div class="reader-toolbar__heading"><div>
<h2 id="composition-view-heading">Composition view</h2>
<p id="composition-view-status" class="reader-toolbar__status" role="status" aria-live="polite"></p>
</div></div>
<div class="reader-toolbar__profiles" role="group" aria-label="Composition profile">
<button type="button" data-composition-profile="compact" aria-pressed="false">Compact</button>
<button type="button" data-composition-profile="abbreviated" aria-pressed="false">Abbreviated</button>
<button type="button" data-composition-profile="book" aria-pressed="true">Book</button>
<button type="button" data-composition-profile="full" aria-pressed="false">Full</button>
</div>
</section>
'@
                foreach ($marker in @(
                    $paletteContractLink,
                    '<section class="lab-hero">',
                    '<div class="lab-submit"><button type="submit">Run bounded closure</button><p>No data leaves this page. Reloading deletes the result.</p></div>',
                    "<footer class=`"site-footer`">Local synthetic work product · no persistence · not canonical content$contentLicenseNotice</footer>",
                    '<script src="assets/composition-palette.js"></script>'
                )) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition reader-views page integration marker drift: $marker"
                    }
                }
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $paletteContractLink,
                    "$paletteContractLink<a href=`"$viewsSpecPage`">Read the composition-view contract</a>"
                ).Replace(
                    '<section class="lab-hero">',
                    "$compositionViewToolbar<section class=`"lab-hero`">"
                ).Replace(
                    '<div class="lab-submit"><button type="submit">Run bounded closure</button><p>No data leaves this page. Reloading deletes the result.</p></div>',
                    '<div class="lab-submit"><button type="submit">Run bounded closure</button><p>Query data stays in this page. Only the reader-view preference may persist; reloading deletes the result.</p></div>'
                ).Replace(
                    "<footer class=`"site-footer`">Local synthetic work product · no persistence · not canonical content$contentLicenseNotice</footer>",
                    "<footer class=`"site-footer`">Local synthetic work product · no query persistence · not canonical content$contentLicenseNotice</footer>"
                ).Replace(
                    '<script src="assets/composition-palette.js"></script>',
                    "<script src=`"assets/composition-palette.js`"></script>`n<script src=`"assets/composition-views.js`"></script>"
                )
            }
            if ($editionNumber -ge 21) {
                $mapSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionMapSpec)])"
                $viewsContractLink = "<a href=`"$viewsSpecPage`">Read the composition-view contract</a>"
                foreach ($marker in @(
                    $viewsContractLink,
                    '<script src="assets/composition-views.js"></script>'
                )) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition closure-map page integration marker drift: $marker"
                    }
                }
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $viewsContractLink,
                    "$viewsContractLink<a href=`"$mapSpecPage`">Read the closure-map contract</a>"
                ).Replace(
                    '<script src="assets/composition-views.js"></script>',
                    "<script src=`"assets/composition-views.js`"></script>`n<script src=`"assets/composition-map.js`"></script>"
                )
            }
            if ($editionNumber -ge 22) {
                $startersSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionStartersSpec)])"
                $mapContractLink = "<a href=`"$mapSpecPage`">Read the closure-map contract</a>"
                foreach ($marker in @(
                    $mapContractLink,
                    '</section>' + "`n" + '<div class="lab-layout">',
                    '<script src="assets/composition-map.js"></script>'
                )) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition starters page integration marker drift: $marker"
                    }
                }
                $starterSection = @"
</section>
<section id="composition-starters" class="composition-starters" aria-labelledby="composition-starters-heading">
<p class="site-kicker">Authored starting configurations</p>
<h2 id="composition-starters-heading">Begin from a known structural pattern</h2>
<p class="composition-starters__intro">Load exact controls from a reviewed worked trace, then inspect or change them. Problem words never choose the graph, and loading never runs the lab.</p>
<div class="composition-starters__grid">$compositionStarterCards</div>
<p id="composition-starters-status" class="composition-starters__status" role="status" aria-live="polite">No starter loaded. The default controls remain active.</p>
</section>
<div class="lab-layout">
"@
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $mapContractLink,
                    "$mapContractLink<a href=`"$startersSpecPage`">Read the authored-starters contract</a>"
                ).Replace(
                    '</section>' + "`n" + '<div class="lab-layout">',
                    $starterSection
                ).Replace(
                    '<script src="assets/composition-map.js"></script>',
                    "<script src=`"assets/composition-map.js`"></script>`n<script src=`"assets/composition-starters.js`"></script>"
                )
            }
            if ($editionNumber -ge 23) {
                $queryPlanSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionQueryPlanSpec)])"
                $startersContractLink = "<a href=`"$startersSpecPage`">Read the authored-starters contract</a>"
                foreach ($marker in @(
                    $startersContractLink,
                    '<aside class="lab-contract">',
                    '</aside>',
                    '<script src="assets/composition-starters.js"></script>'
                )) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition query-plan page integration marker drift: $marker"
                    }
                }
                $queryPlanShell = @'
<aside class="lab-contract">
<p class="site-kicker">Visible request</p>
<section id="composition-query-plan" class="query-plan" aria-labelledby="composition-query-plan-heading">
<h2 id="composition-query-plan-heading">Your explicit query plan</h2>
<p>Inspect the visible controls before running closure. The live plan enhancement is loading.</p>
</section>
<div class="lab-contract__static">
'@
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $startersContractLink,
                    "$startersContractLink<a href=`"$queryPlanSpecPage`">Read the query-plan contract</a>"
                ).Replace(
                    '<aside class="lab-contract">',
                    $queryPlanShell
                ).Replace(
                    '</aside>',
                    "</div>`n</aside>"
                ).Replace(
                    '<script src="assets/composition-starters.js"></script>',
                    "<script src=`"assets/composition-starters.js`"></script>`n<script src=`"assets/composition-query-plan.js`"></script>"
                )
            }
            if ($editionNumber -ge 24) {
                $workBudgetSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionWorkBudgetSpec)])"
                $queryPlanContractLink = "<a href=`"$queryPlanSpecPage`">Read the query-plan contract</a>"
                $nodeControl = '<label class="lab-field"><span>Nodes</span><input name="nodes" type="number" min="3" max="24" value="6" required></label>'
                foreach ($marker in @($queryPlanContractLink, $nodeControl)) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition work-budget page integration marker drift: $marker"
                    }
                }
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $queryPlanContractLink,
                    "$queryPlanContractLink<a href=`"$workBudgetSpecPage`">Read the work-budget contract</a>"
                ).Replace(
                    $nodeControl,
                    "$nodeControl`n<label class=`"lab-field`"><span>Work records</span><input name=`"work`" type=`"number`" min=`"3`" max=`"64`" value=`"9`" required></label>"
                )
            }
            if ($editionNumber -ge 25) {
                $reconciliationSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionReconciliationSpec)])"
                $workBudgetContractLink = "<a href=`"$workBudgetSpecPage`">Read the work-budget contract</a>"
                $queryPlanScriptTag = '<script src="assets/composition-query-plan.js"></script>'
                foreach ($marker in @($workBudgetContractLink, $queryPlanScriptTag)) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition reconciliation page integration marker drift: $marker"
                    }
                }
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $workBudgetContractLink,
                    "$workBudgetContractLink<a href=`"$reconciliationSpecPage`">Read the result-reconciliation contract</a>"
                ).Replace(
                    $queryPlanScriptTag,
                    "$queryPlanScriptTag`n<script src=`"assets/composition-reconciliation.js`"></script>"
                )
            }
            if ($editionNumber -ge 26) {
                $continuationsSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionContinuationsSpec)])"
                $reconciliationContractLink = "<a href=`"$reconciliationSpecPage`">Read the result-reconciliation contract</a>"
                $reconciliationScriptTag = '<script src="assets/composition-reconciliation.js"></script>'
                foreach ($marker in @($reconciliationContractLink, $reconciliationScriptTag)) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition continuations page integration marker drift: $marker"
                    }
                }
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $reconciliationContractLink,
                    "$reconciliationContractLink<a href=`"$continuationsSpecPage`">Read the explicit-continuations contract</a>"
                ).Replace(
                    $reconciliationScriptTag,
                    "$reconciliationScriptTag`n<script src=`"assets/composition-continuations.js`"></script>"
                )
            }
            if ($editionNumber -ge 27) {
                $rerunComparisonSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionRerunComparisonSpec)])"
                $continuationsContractLink = "<a href=`"$continuationsSpecPage`">Read the explicit-continuations contract</a>"
                $continuationsScriptTag = '<script src="assets/composition-continuations.js"></script>'
                foreach ($marker in @($continuationsContractLink, $continuationsScriptTag)) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition rerun-comparison page integration marker drift: $marker"
                    }
                }
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $continuationsContractLink,
                    "$continuationsContractLink<a href=`"$rerunComparisonSpecPage`">Read the rerun-comparison contract</a>"
                ).Replace(
                    $continuationsScriptTag,
                    "$continuationsScriptTag`n<script src=`"assets/composition-rerun-comparison.js`"></script>"
                )
            }
            if ($editionNumber -ge 28) {
                $guideSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionGuideSpec)])"
                $rerunComparisonContractLink = "<a href=`"$rerunComparisonSpecPage`">Read the rerun-comparison contract</a>"
                $rerunComparisonScriptTag = '<script src="assets/composition-rerun-comparison.js"></script>'
                foreach ($marker in @($rerunComparisonContractLink, $rerunComparisonScriptTag)) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition guide-skeleton page integration marker drift: $marker"
                    }
                }
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $rerunComparisonContractLink,
                    "$rerunComparisonContractLink<a href=`"$guideSpecPage`">Read the guide-skeleton contract</a>"
                ).Replace(
                    $rerunComparisonScriptTag,
                    "$rerunComparisonScriptTag`n<script src=`"assets/composition-guide.js`"></script>"
                )
            }
            if ($editionNumber -ge 29) {
                $evaluationSpecPage = "entries/$($pageBySource[[System.IO.Path]::GetFullPath($compositionEvaluationSpec)])"
                $guideContractLink = "<a href=`"$guideSpecPage`">Read the guide-skeleton contract</a>"
                $guideScriptTag = '<script src="assets/composition-guide.js"></script>'
                foreach ($marker in @($guideContractLink, $guideScriptTag)) {
                    if (-not $compositionLabHtml.Contains($marker)) {
                        throw "Composition evaluation-record page integration marker drift: $marker"
                    }
                }
                $compositionLabHtml = $compositionLabHtml.Replace(
                    $guideContractLink,
                    "$guideContractLink<a href=`"$evaluationSpecPage`">Read the evaluation-record contract</a>"
                ).Replace(
                    $guideScriptTag,
                    "$guideScriptTag`n<script src=`"assets/composition-evaluation.js`"></script>"
                )
            }
        }
        [System.IO.File]::WriteAllText($siteCompose, $compositionLabHtml, [System.Text.UTF8Encoding]::new($false))
    }

    for ($chapterIndex = 0; $chapterIndex -lt $siteChapters.Count; $chapterIndex++) {
        $chapter = $siteChapters[$chapterIndex]
        $encodedChapterTitle = [System.Net.WebUtility]::HtmlEncode($chapter.title)
        $chapterLabel = if ($chapter.key.StartsWith("part-")) {
            $chapter.key.Replace("part-", "Part ").ToUpperInvariant()
        }
        else {
            "Guided use"
        }
        $chapterGroupItems = [System.Text.StringBuilder]::new()
        foreach ($group in $chapter.groups) {
            $encodedGroupTitle = [System.Net.WebUtility]::HtmlEncode($group.title)
            $chapterRecordItems = [System.Text.StringBuilder]::new()
            foreach ($chapterPath in $group.paths) {
                $chapterRelativePath = [System.IO.Path]::GetRelativePath($workspace, $chapterPath).Replace("\", "/")
                $chapterRecord = $searchRecordByPath[$chapterRelativePath]
                $encodedRecordTitle = [System.Net.WebUtility]::HtmlEncode($chapterRecord.title)
                $encodedRecordMeta = [System.Net.WebUtility]::HtmlEncode(
                    (@($chapterRecord.kind, $chapterRecord.domain) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }) -join " · "
                )
                $recordPage = [System.IO.Path]::GetFileName($chapterRecord.href)
                [void]$chapterRecordItems.AppendLine(
                    "<li><a href=`"../entries/$recordPage`">$encodedRecordTitle</a><span>$encodedRecordMeta</span></li>"
                )
            }
            [void]$chapterGroupItems.AppendLine(
                "<section class=`"site-chapter-group`"><h2>$encodedGroupTitle</h2><ol class=`"site-entry-grid`">$chapterRecordItems</ol></section>"
            )
        }
        $previousChapter = "<span></span>"
        $nextChapter = "<span></span>"
        if ($chapterIndex -gt 0) {
            $previous = $siteChapters[$chapterIndex - 1]
            $previousTitle = [System.Net.WebUtility]::HtmlEncode($previous.title)
            $previousChapter = "<a rel=`"prev`" href=`"$($previous.key).html`"><span>Previous chapter</span>$previousTitle</a>"
        }
        if ($chapterIndex -lt $siteChapters.Count - 1) {
            $next = $siteChapters[$chapterIndex + 1]
            $nextTitle = [System.Net.WebUtility]::HtmlEncode($next.title)
            $nextChapter = "<a rel=`"next`" href=`"$($next.key).html`"><span>Next chapter</span>$nextTitle</a>"
        }
        $chapterHtml = @"
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$encodedChapterTitle · $publicationName</title>
<link rel="stylesheet" href="../assets/site.css">
$identityPreviewStyle
</head>
<body class="proof-site reader-ready">
<a class="site-skip" href="#main-content">Skip to content</a>
<header class="site-header"><div class="site-header__inner">
<a class="site-brand" href="../index.html">$siteBrand</a>
<nav class="site-nav" aria-label="Primary">$(if ($editionNumber -ge 66) { $nestedStableNav } else { "$nestedCandidateNav$nestedProblemNav$nestedComposeNav$nestedTablesIndexNav$nestedPointerNav$nestedStartNav<a href=`"../index.html#search`">Search</a><a href=`"../index.html#contents`">Contents</a><a href=`"../entries/$($pageBySource[$quickstart])`">Quickstart</a>" })</nav>
</div></header>
<main id="main-content" class="site-main">
<nav class="site-breadcrumbs" aria-label="Breadcrumb"><a href="../index.html">Structure, Quantity, and Choice</a> / $encodedChapterTitle</nav>
<section class="site-chapter-heading"><p class="site-kicker">$chapterLabel</p><h1>$encodedChapterTitle</h1><p>$($chapter.paths.Count) records in the curated reading sequence.</p></section>
<div class="site-chapter-groups">$chapterGroupItems</div>
<nav class="site-pagination" aria-label="Chapter sequence">$previousChapter$nextChapter</nav>
</main>
<footer class="site-footer">$nestedPublicationStatus$contentLicenseNotice</footer>
</body>
</html>
"@
        [System.IO.File]::WriteAllText(
            (Join-Path $siteChapterDirectory "$($chapter.key).html"),
            $chapterHtml,
            [System.Text.UTF8Encoding]::new($false)
        )
    }

    $tableNavigatorPages = 0
    $tableCanonicalEntryPages = 0
    $tableSpecializedViewPages = 0
    $tableCuratedRecordPages = 0
    $tableOwnerLinks = 0
    $tableContrastRoutes = 0
    $tableCrossReferenceRoutes = 0
    $tableAuthoredConnections = 0
    $tableConnectionPreviewLinks = 0
    $tableFamilyContentsPanels = 0
    $tableFamilyContentsLinks = 0
    $tableFamilyContentsOpen = 0
    $tableFamilyContentsFolded = 0
    $readerSequencePanels = 0
    $readerSequenceContentsLinks = 0
    $readerSequencePreviousLinks = 0
    $readerSequenceNextLinks = 0
    $readerSequenceFinishLinks = 0
    $dictionarySequencePanels = 0
    $dictionarySequencePreviousLinks = 0
    $dictionarySequenceNextLinks = 0
    $dictionarySequenceFinishLinks = 0
    foreach ($source in $sources) {
        $relativeSource = [System.IO.Path]::GetRelativePath($workspace, $source).Replace("\", "/")
        $segment = $renderedSegmentBySource[$source]
        $segment = [regex]::Replace(
            $segment,
            'href="#([^"]+)"',
            {
                param($match)

                $targetId = $match.Groups[1].Value
                if (-not $sourceByRenderedId.ContainsKey($targetId)) {
                    return $match.Value
                }
                $targetSource = $sourceByRenderedId[$targetId]
                if ($targetSource.Equals($source, [System.StringComparison]::OrdinalIgnoreCase)) {
                    return $match.Value
                }
                return 'href="' + $pageBySource[$targetSource] + '#' + $targetId + '"'
            }
        )

        $record = if ($searchRecordByPath.ContainsKey($relativeSource)) {
            $searchRecordByPath[$relativeSource]
        }
        else {
            $null
        }
        $headingMatch = [regex]::Match($segment, '<h1 id="[^"]+">(.+?)</h1>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
        if (-not $headingMatch.Success) {
            throw "Site page has no top-level heading: $relativeSource"
        }
        $headingText = [System.Net.WebUtility]::HtmlDecode(
            [regex]::Replace($headingMatch.Groups[1].Value, '<[^>]+>', '')
        ).Trim()
        $pageTitle = if ($null -ne $record) { $record.title } else { $headingText }
        $encodedPageTitle = [System.Net.WebUtility]::HtmlEncode($pageTitle)
        $encodedSource = [System.Net.WebUtility]::HtmlEncode($relativeSource)

        $readerControls = ""
        $pageScripts = ""
        $pagination = ""
        if ($null -ne $record) {
            $readerControls = $readerShell
            $pageScripts = @"
<script src="../assets/site-data.js"></script>
<script src="../assets/reader.js"></script>
<script src="../assets/context.js"></script>
$(if ($editionNumber -ge 52) { '<script src="../assets/pointers.js"></script>' } else { '' })
"@
            $sequenceIndex = $searchRecordIndexByPath[$relativeSource]
            $previousLink = "<span></span>"
            $nextLink = "<span></span>"
            if ($sequenceIndex -gt 0) {
                $previous = $searchRecords[$sequenceIndex - 1]
                $previousTitle = [System.Net.WebUtility]::HtmlEncode($previous.title)
                $previousPage = [System.IO.Path]::GetFileName($previous.href)
                $previousLink = "<a rel=`"prev`" href=`"$previousPage`"><span>Previous</span>$previousTitle</a>"
            }
            if ($sequenceIndex -lt $searchRecords.Count - 1) {
                $next = $searchRecords[$sequenceIndex + 1]
                $nextTitle = [System.Net.WebUtility]::HtmlEncode($next.title)
                $nextPage = [System.IO.Path]::GetFileName($next.href)
                $nextLink = "<a rel=`"next`" href=`"$nextPage`"><span>Next</span>$nextTitle</a>"
            }
            $pagination = if ($editionNumber -ge 37) {
                "<div class=`"all-record-sequence`"><p>All contents sequence</p><nav class=`"site-pagination`" aria-label=`"All-record sequence`">$previousLink$nextLink</nav></div>"
            }
            else {
                "<nav class=`"site-pagination`" aria-label=`"Entry sequence`">$previousLink$nextLink</nav>"
            }
        }

        $readerSequenceHtml = ""
        if ($editionNumber -ge 37 -and $candidateRecordIndexByPath.ContainsKey($relativeSource)) {
            $readerPositionIndex = $candidateRecordIndexByPath[$relativeSource]
            $readerStep = $readerPositionIndex + 1
            $readerPartNumber = $readerPartNumberByPath[$relativeSource]
            $encodedReaderPartTitle = [System.Net.WebUtility]::HtmlEncode($readerPartTitleByPath[$relativeSource])
            $readerPrevious = "<span></span>"
            $readerNext = "<span></span>"
            if ($readerPositionIndex -gt 0) {
                $readerPreviousPath = $candidateRecordPaths[$readerPositionIndex - 1]
                $readerPreviousRecord = $searchRecordByPath[$readerPreviousPath]
                $readerPreviousTitle = [System.Net.WebUtility]::HtmlEncode($readerPreviousRecord.title)
                $readerPreviousPage = [System.IO.Path]::GetFileName($readerPreviousRecord.href)
                $readerPrevious = "<a data-reader-direction=`"previous`" href=`"$readerPreviousPage`"><span>Previous Reader step</span>$readerPreviousTitle</a>"
                $readerSequencePreviousLinks += 1
            }
            if ($readerPositionIndex -lt $candidateRecordPaths.Count - 1) {
                $readerNextPath = $candidateRecordPaths[$readerPositionIndex + 1]
                $readerNextRecord = $searchRecordByPath[$readerNextPath]
                $readerNextTitle = [System.Net.WebUtility]::HtmlEncode($readerNextRecord.title)
                $readerNextPage = [System.IO.Path]::GetFileName($readerNextRecord.href)
                $readerNext = "<a data-reader-direction=`"next`" href=`"$readerNextPage`"><span>Next Reader step</span>$readerNextTitle</a>"
                $readerSequenceNextLinks += 1
            }
            elseif ($editionNumber -ge 39) {
                $readerNext = '<a data-reader-direction="finish" href="../reader.html#reader-route-after-heading"><span>End of selected route</span>Choose a bounded next path</a>'
                $readerSequenceFinishLinks += 1
            }
            $readerSequencePanels += 1
            $readerSequenceContentsLinks += 1
            $readerSequenceHtml = @"
<nav class="reader-sequence" aria-label="Reader sequence" data-reader-step="$readerStep" data-reader-part="$readerPartNumber">
<div class="reader-sequence__heading"><p>$readerPublicationName · Step $readerStep of 24</p><a href="../reader.html">Back to Reader contents</a></div>
<p class="reader-sequence__part">Part $readerPartNumber · $encodedReaderPartTitle</p>
<div class="reader-sequence__links">$readerPrevious$readerNext</div>
<p class="reader-sequence__boundary">Editorial teaching order only—not prerequisite, dependency, semantic adjacency, hierarchy, progress, or mastery.</p>
</nav>
"@
        }

        $dictionarySequenceHtml = ""
        if ($editionNumber -ge 66 -and $null -ne $record -and
            $dictionaryIndexByCanonicalPath.ContainsKey($relativeSource)) {
            $dictionaryPositionIndex = $dictionaryIndexByCanonicalPath[$relativeSource]
            $dictionaryStep = $dictionaryPositionIndex + 1
            $dictionaryPrevious = "<span></span>"
            $dictionaryNext = '<a data-dictionary-direction="finish" href="../tables.html"><span>End of A-Z sequence</span>Back to the Tables index</a>'
            if ($dictionaryPositionIndex -gt 0) {
                $dictionaryPreviousRecord = $dictionaryRecords[$dictionaryPositionIndex - 1]
                $dictionaryPreviousTitle = [System.Net.WebUtility]::HtmlEncode($dictionaryPreviousRecord.title)
                $dictionaryPreviousPage = if ($dictionaryPreviousRecord.href.StartsWith("entries/")) {
                    [System.IO.Path]::GetFileName($dictionaryPreviousRecord.href)
                }
                else { "../$($dictionaryPreviousRecord.href)" }
                $dictionaryPrevious = "<a data-dictionary-direction=`"previous`" href=`"$dictionaryPreviousPage`"><span>Previous A-Z entry</span>$dictionaryPreviousTitle</a>"
                $dictionarySequencePreviousLinks += 1
            }
            if ($dictionaryPositionIndex -lt $dictionaryRecords.Count - 1) {
                $dictionaryNextRecord = $dictionaryRecords[$dictionaryPositionIndex + 1]
                $dictionaryNextTitle = [System.Net.WebUtility]::HtmlEncode($dictionaryNextRecord.title)
                $dictionaryNextPage = if ($dictionaryNextRecord.href.StartsWith("entries/")) {
                    [System.IO.Path]::GetFileName($dictionaryNextRecord.href)
                }
                else { "../$($dictionaryNextRecord.href)" }
                $dictionaryNext = "<a data-dictionary-direction=`"next`" href=`"$dictionaryNextPage`"><span>Next A-Z entry</span>$dictionaryNextTitle</a>"
                $dictionarySequenceNextLinks += 1
            }
            else {
                $dictionarySequenceFinishLinks += 1
            }
            $dictionarySequencePanels += 1
            $dictionarySequenceHtml = @"
<nav class="dictionary-sequence" aria-label="Formarium alphabetical dictionary sequence" data-dictionary-step="$dictionaryStep" data-dictionary-kind="table">
<div class="dictionary-sequence__heading"><p>Formarium Dictionary A-Z · Item $dictionaryStep of $($dictionaryRecords.Count) · Canonical Table</p><a href="../tables.html">Back to Dictionary A-Z</a></div>
<div class="dictionary-sequence__links">$dictionaryPrevious$dictionaryNext</div>
<p class="dictionary-sequence__boundary">Pointers and canonical Tables are interleaved for reading only. Alphabetical adjacency does not assert synonymy, hierarchy, dependency, recommendation, or another semantic relation.</p>
</nav>
"@
            $pagination = ""
        }

        $factorFocusHtml = ""
        if ($editionNumber -ge 18) {
            $sourceFocusRecords = @($compositionFocusRecords | Where-Object {
                $_.source.Equals($source, [System.StringComparison]::OrdinalIgnoreCase)
            })
            if ($sourceFocusRecords.Count -gt 0) {
                $rootFactorizationMatches = [regex]::Matches(
                    $segment,
                    '<h2 id="([^"]+)">Root\s*factorization</h2>',
                    [System.Text.RegularExpressions.RegexOptions]::Singleline
                )
                if ($rootFactorizationMatches.Count -ne 1) {
                    throw "Composition factor focus requires one Root factorization heading: $relativeSource"
                }
                $rootFactorizationId = $rootFactorizationMatches[0].Groups[1].Value
                $focusCards = [System.Text.StringBuilder]::new()
                foreach ($focusRecord in $sourceFocusRecords | Sort-Object artifact) {
                    $encodedFocusId = [System.Net.WebUtility]::HtmlEncode($focusRecord.focusId)
                    $encodedFocusLabel = [System.Net.WebUtility]::HtmlEncode($focusRecord.label)
                    $encodedFocusArtifact = [System.Net.WebUtility]::HtmlEncode($focusRecord.artifact)
                    $encodedFocusEntry = [System.Net.WebUtility]::HtmlEncode($focusRecord.entryTitle)
                    $focusTitleId = "$encodedFocusId-title"
                    [void]$focusCards.AppendLine(@"
<aside id="$encodedFocusId" class="factor-focus" aria-labelledby="$focusTitleId">
<p class="factor-focus__kicker">Composition focus</p>
<p id="$focusTitleId" class="factor-focus__title">$encodedFocusLabel</p>
<p>This generated landing point identifies an exact factor owned by <strong>$encodedFocusEntry</strong>. The repository entry remains authoritative.</p>
<code>$encodedFocusArtifact</code>
<a href="#$rootFactorizationId">Read the owning Root factorization</a>
</aside>
"@)
                }
                $factorFocusHtml = "<section class=`"factor-focus-stack`" aria-label=`"Composition factor focus`">$focusCards</section>"
            }
        }

        $tableNavigatorHtml = ""
        if ($editionNumber -ge 32 -and $null -ne $record -and
            $relativeSource.StartsWith("tables/", [System.StringComparison]::OrdinalIgnoreCase)) {
            $tableNavigatorPages += 1
            $tableIdentity = "Curated Table record"
            $ownerAction = ""
            $familyContents = ""
            if ($canonicalClassByPath.ContainsKey($relativeSource)) {
                if ($canonicalClassByPath[$relativeSource] -eq "entry") {
                    $tableIdentity = "Canonical entry"
                    $tableCanonicalEntryPages += 1
                    if ($editionNumber -ge 34) {
                        $ownedViews = @($canonicalViewsByOwnerPath[$relativeSource])
                        if ($ownedViews.Count -gt 0) {
                            $ownedViewItems = [System.Text.StringBuilder]::new()
                            foreach ($ownedView in $ownedViews) {
                                if (-not $searchRecordByPath.ContainsKey($ownedView.path)) {
                                    throw "Canonical Table family view is not selected: $relativeSource -> $($ownedView.path)"
                                }
                                $ownedRecord = $searchRecordByPath[$ownedView.path]
                                $ownedSource = [System.IO.Path]::GetFullPath((Join-Path $workspace $ownedView.path))
                                if (-not $pageBySource.ContainsKey($ownedSource)) {
                                    throw "Canonical Table family view has no page: $relativeSource -> $($ownedView.path)"
                                }
                                $ownedTitle = [System.Net.WebUtility]::HtmlEncode($ownedRecord.title)
                                $ownedKind = [System.Net.WebUtility]::HtmlEncode($ownedView.kind)
                                $ownedPage = $pageBySource[$ownedSource]
                                [void]$ownedViewItems.Append(
                                    "<li data-view-path=`"$($ownedView.path)`"><a href=`"$ownedPage`"><span>$ownedKind view</span>$ownedTitle</a></li>"
                                )
                                $tableFamilyContentsLinks += 1
                            }
                            $openAttribute = if ($ownedViews.Count -le 3) {
                                $tableFamilyContentsOpen += 1
                                " open"
                            }
                            else {
                                $tableFamilyContentsFolded += 1
                                ""
                            }
                            $tableFamilyContentsPanels += 1
                            $familyContents = @"
<details class="table-navigator__family" data-view-count="$($ownedViews.Count)"$openAttribute>
<summary><span>Specialized views owned by this Table</span><strong>$($ownedViews.Count) $(if ($ownedViews.Count -eq 1) { 'view' } else { 'views' })</strong></summary>
<ul>$ownedViewItems</ul>
<p>Publication ownership only; these are not subtypes, broader/narrower terms, dependencies, or closure steps.</p>
</details>
"@
                        }
                    }
                }
                else {
                    $encodedViewFamily = [System.Net.WebUtility]::HtmlEncode($canonicalClassByPath[$relativeSource])
                    $tableIdentity = "Specialized $encodedViewFamily view"
                    $tableSpecializedViewPages += 1
                    $ownerRelative = $canonicalOwnerByPath[$relativeSource]
                    $ownerSource = [System.IO.Path]::GetFullPath((Join-Path $workspace $ownerRelative))
                    if (-not $pageBySource.ContainsKey($ownerSource) -or
                        -not $searchRecordByPath.ContainsKey($ownerRelative)) {
                        throw "Table navigator cannot resolve canonical owner: $relativeSource -> $ownerRelative"
                    }
                    $ownerTitle = [System.Net.WebUtility]::HtmlEncode($searchRecordByPath[$ownerRelative].title)
                    $ownerPage = $pageBySource[$ownerSource]
                    $ownerAction = "<a class=`"table-navigator__owner`" href=`"$ownerPage`"><span>Owning Table</span>$ownerTitle</a>"
                    $tableOwnerLinks += 1
                }
            }
            else {
                $tableCuratedRecordPages += 1
            }

            $localActions = [System.Text.StringBuilder]::new()
            [void]$localActions.Append(
                '<a href="../index.html#search">Search Tables</a>' +
                $(if ($editionNumber -ge 35) { '<a href="../tables.html">Browse Tables</a>' } else { '<a href="../index.html#contents">Browse Tables</a>' })
            )
            $contrastMatch = [regex]::Match(
                $segment,
                '<h2 id="([^"]+)">Contrast\s*table</h2>',
                [System.Text.RegularExpressions.RegexOptions]::Singleline
            )
            if ($contrastMatch.Success) {
                [void]$localActions.Append('<a href="#' + $contrastMatch.Groups[1].Value + '">Compare nearby terms</a>')
                $tableContrastRoutes += 1
            }

            $crossReferenceMatch = [regex]::Match(
                $segment,
                '(?s)<h2 id="([^"]+)">Cross-references</h2>(.*?)(?=<h2\s|$)'
            )
            $connectionList = ""
            if ($crossReferenceMatch.Success) {
                $crossReferenceId = $crossReferenceMatch.Groups[1].Value
                $connectionMatches = @([regex]::Matches(
                    $crossReferenceMatch.Groups[2].Value,
                    '<a href="(?!https?://|mailto:|#)([^"]+)">(.+?)</a>',
                    [System.Text.RegularExpressions.RegexOptions]::Singleline
                ))
                [void]$localActions.Append('<a href="#' + $crossReferenceId + '">All cross-references (' + $connectionMatches.Count + ')</a>')
                $tableCrossReferenceRoutes += 1
                $tableAuthoredConnections += $connectionMatches.Count
                $previewItems = [System.Text.StringBuilder]::new()
                $previewCount = [Math]::Min(6, $connectionMatches.Count)
                for ($connectionIndex = 0; $connectionIndex -lt $previewCount; $connectionIndex++) {
                    $connection = $connectionMatches[$connectionIndex]
                    [void]$previewItems.Append('<li><a href="' + $connection.Groups[1].Value + '">' + $connection.Groups[2].Value + '</a></li>')
                }
                $tableConnectionPreviewLinks += $previewCount
                $remainingConnections = $connectionMatches.Count - $previewCount
                $moreConnections = if ($remainingConnections -gt 0) {
                    "<a class=`"table-navigator__more`" href=`"#$crossReferenceId`">+$remainingConnections more in the authored section</a>"
                }
                else { "" }
                $connectionList = "<div class=`"table-navigator__connections`"><p>Authored connections · untyped</p><ul>$previewItems</ul>$moreConnections</div>"
            }

            $encodedTableIdentity = [System.Net.WebUtility]::HtmlEncode($tableIdentity)
            $familyContentsLine = if ([string]::IsNullOrEmpty($familyContents)) {
                ""
            }
            else { "`n$familyContents" }
            $tableNavigatorHtml = @"
<nav class="table-navigator" aria-label="Explore this Table" data-table-class="$encodedTableIdentity">
<div class="table-navigator__heading"><p>Explore this Table</p><span>$encodedTableIdentity</span></div>
$ownerAction
<div class="table-navigator__actions">$localActions</div>$familyContentsLine
$connectionList
<p class="table-navigator__boundary">Authored connections are navigation, not synonym, broader/narrower, equivalence, dependency, or closure claims.</p>
</nav>
"@
        }

        $pageHtml = @"
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$encodedPageTitle · $publicationName</title>
<link rel="stylesheet" href="../assets/site.css">
$identityPreviewStyle
</head>
<body class="proof-site">
<a class="site-skip" href="#main-content">Skip to content</a>
<header class="site-header"><div class="site-header__inner">
<a class="site-brand" href="../index.html">$siteBrand</a>
<nav class="site-nav" aria-label="Primary">$(if ($editionNumber -ge 66) { $nestedStableNav } else { "$nestedCandidateNav$nestedProblemNav$nestedComposeNav$nestedTablesIndexNav$nestedPointerNav$nestedStartNav<a href=`"../index.html#search`">Search</a><a href=`"../index.html#contents`">Contents</a><a href=`"$($pageBySource[$quickstart])`">Quickstart</a>" })</nav>
</div></header>
<div class="site-main">
<nav class="site-breadcrumbs" aria-label="Breadcrumb"><a href="../index.html">Structure, Quantity, and Choice</a>$(
    if ($null -ne $record) {
        $entryChapter = $chapterBySearchPath[$relativeSource]
        $entryChapterTitle = [System.Net.WebUtility]::HtmlEncode($entryChapter.title)
        " / <a href=`"../chapters/$($entryChapter.key).html`">$entryChapterTitle</a>"
    }
) / $encodedPageTitle</nav>
$readerControls
$readerSequenceHtml<main id="main-content" class="site-entry" data-source-path="$encodedSource">$tableNavigatorHtml$factorFocusHtml$segment</main>
$dictionarySequenceHtml$pagination
</div>
<footer class="site-footer">Canonical source: $encodedSource · $(if ($Edition -eq 'sim-66') { $nestedPublicationStatus } else { 'simulation projection' })$contentLicenseNotice</footer>
$pageScripts
</body>
</html>
"@
        $pagePath = Join-Path $siteEntryDirectory $pageBySource[$source]
        [System.IO.File]::WriteAllText($pagePath, $pageHtml, [System.Text.UTF8Encoding]::new($false))
    }

    if ($editionNumber -ge 52) {
        $pointerIndexItems = [System.Text.StringBuilder]::new()
        foreach ($pointerRecord in $pointerRecords | Sort-Object { $_.label.ToLowerInvariant() }) {
            $pointerOwners = @($pointerRecord.occurrences.path | Sort-Object -Unique).Count
            $encodedPointerLabel = [System.Net.WebUtility]::HtmlEncode($pointerRecord.label)
            $encodedPointerOrientation = [System.Net.WebUtility]::HtmlEncode($pointerRecord.orientation)
            [void]$pointerIndexItems.AppendLine(
                "<li><a href=`"pointers/$($pointerRecord.slug).html`">$encodedPointerLabel</a><span>$pointerOwners owning Tables · $($pointerRecord.occurrences.Count) distinct structural expressions</span><p>$encodedPointerOrientation.</p></li>"
            )

            $ownerSections = [System.Text.StringBuilder]::new()
            $pointerOwnerGroups = @($pointerRecord.occurrences | Group-Object -Property { $_.path } | Sort-Object Name)
            foreach ($ownerGroup in $pointerOwnerGroups) {
                $ownerOccurrences = @($ownerGroup.Group)
                $owner = $ownerOccurrences[0]
                $encodedOwnerTitle = [System.Net.WebUtility]::HtmlEncode($owner.title)
                $encodedOwnerPath = [System.Net.WebUtility]::HtmlEncode($owner.path)
                $expressionItems = [System.Text.StringBuilder]::new()
                foreach ($occurrence in $ownerOccurrences | Sort-Object expression) {
                    $encodedExpression = [System.Net.WebUtility]::HtmlEncode($occurrence.expression)
                    [void]$expressionItems.AppendLine("<li><code>$encodedExpression</code></li>")
                }
                [void]$ownerSections.AppendLine(@"
<section class="pointer-owner" data-source-path="$encodedOwnerPath">
<h2><a href="../entries/$($owner.page)#$($owner.anchor)">$encodedOwnerTitle</a></h2>
<p><code>$encodedOwnerPath</code></p>
<ul>$expressionItems</ul>
</section>
"@)
            }
            $dictionaryPositionIndex = $dictionaryIndexByPointerSlug[$pointerRecord.slug]
            $dictionaryStep = $dictionaryPositionIndex + 1
            $dictionaryPrevious = "<span></span>"
            $dictionaryNext = '<a data-dictionary-direction="finish" href="../tables.html"><span>End of A-Z sequence</span>Back to the Dictionary index</a>'
            if ($dictionaryPositionIndex -gt 0) {
                $dictionaryPreviousRecord = $dictionaryRecords[$dictionaryPositionIndex - 1]
                $dictionaryPreviousTitle = [System.Net.WebUtility]::HtmlEncode($dictionaryPreviousRecord.title)
                $dictionaryPreviousPage = if ($dictionaryPreviousRecord.href.StartsWith("pointers/")) {
                    [System.IO.Path]::GetFileName($dictionaryPreviousRecord.href)
                }
                else { "../$($dictionaryPreviousRecord.href)" }
                $dictionaryPrevious = "<a data-dictionary-direction=`"previous`" href=`"$dictionaryPreviousPage`"><span>Previous A-Z entry</span>$dictionaryPreviousTitle</a>"
                $dictionarySequencePreviousLinks += 1
            }
            if ($dictionaryPositionIndex -lt $dictionaryRecords.Count - 1) {
                $dictionaryNextRecord = $dictionaryRecords[$dictionaryPositionIndex + 1]
                $dictionaryNextTitle = [System.Net.WebUtility]::HtmlEncode($dictionaryNextRecord.title)
                $dictionaryNextPage = if ($dictionaryNextRecord.href.StartsWith("pointers/")) {
                    [System.IO.Path]::GetFileName($dictionaryNextRecord.href)
                }
                else { "../$($dictionaryNextRecord.href)" }
                $dictionaryNext = "<a data-dictionary-direction=`"next`" href=`"$dictionaryNextPage`"><span>Next A-Z entry</span>$dictionaryNextTitle</a>"
                $dictionarySequenceNextLinks += 1
            }
            else {
                $dictionarySequenceFinishLinks += 1
            }
            $dictionarySequencePanels += 1
            $dictionarySequenceHtml = @"
<nav class="dictionary-sequence" aria-label="Formarium alphabetical dictionary sequence" data-dictionary-step="$dictionaryStep" data-dictionary-kind="pointer">
<div class="dictionary-sequence__heading"><p>Formarium Dictionary A-Z · Item $dictionaryStep of $($dictionaryRecords.Count) · Pointer</p><a href="../tables.html">Back to Dictionary A-Z</a></div>
<div class="dictionary-sequence__links">$dictionaryPrevious$dictionaryNext</div>
<p class="dictionary-sequence__boundary">Pointers and canonical Tables are interleaved for reading only. Alphabetical adjacency does not assert synonymy, hierarchy, dependency, recommendation, or another semantic relation.</p>
</nav>
"@
            $pointerPage = @"
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="A generated $publicationName concordance for the structural label $encodedPointerLabel.">
<title>$encodedPointerLabel · Pointer Entry · $publicationName</title>
<link rel="stylesheet" href="../assets/site.css">
$identityPreviewStyle
</head>
<body class="proof-site pointer-page-shell">
<a class="site-skip" href="#main-content">Skip to content</a>
<header class="site-header"><div class="site-header__inner">
<a class="site-brand" href="../index.html">$siteBrand</a>
<nav class="site-nav" aria-label="Primary">$(if ($editionNumber -ge 66) { $nestedStableNav } else { '<a href="../tables.html">Tables</a><a href="../reader.html">Reader</a><a href="../terms.html" aria-current="page">Terms</a><a href="../index.html#search">Search</a><a href="../index.html#contents">Contents</a>' })</nav>
</div></header>$identityPreviewBanner
<main id="main-content" class="site-main pointer-page">
<nav class="site-breadcrumbs" aria-label="Breadcrumb"><a href="../index.html">$publicationName</a> / <a href="../terms.html">Pointer Entries</a> / $encodedPointerLabel</nav>
<p class="site-kicker">Generated concordance · indexed leaf</p>
<h1>$encodedPointerLabel</h1>
<p>$encodedPointerOrientation.</p>
<p class="pointer-page__counts">$pointerOwners owning Tables · $($pointerRecord.occurrences.Count) distinct structural expressions</p>
<p class="pointer-page__boundary"><strong>Pointer, not canonical entry.</strong> This page reports exact structural occurrences in selected Tables. Frequency is not importance, one spelling is not one sense, and co-occurrence does not create synonymy, hierarchy, dependency, or another semantic relation.</p>
<div class="pointer-page__owners">$ownerSections</div>
$dictionarySequenceHtml
</main>
<footer class="site-footer">Generated from the $Edition pointer registry and selected Table expressions · not canonical authority$(if ($Edition -eq 'sim-66') { " · $nestedPublicationStatus" })$contentLicenseNotice</footer>
</body>
</html>
"@
            [System.IO.File]::WriteAllText(
                (Join-Path $sitePointerDirectory "$($pointerRecord.slug).html"),
                $pointerPage,
                [System.Text.UTF8Encoding]::new($false)
            )
        }
        $pointerIndexHtml = @"
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Generated concordance pages for admitted structural labels in $tablesPublicationName.">
<title>Pointer Entries · $publicationName</title>
<link rel="stylesheet" href="assets/site.css">
$identityPreviewStyle
</head>
<body class="proof-site pointer-index-shell">
<a class="site-skip" href="#main-content">Skip to content</a>
<header class="site-header"><div class="site-header__inner">
<a class="site-brand" href="index.html">$siteBrand</a>
<nav class="site-nav" aria-label="Primary">$(if ($editionNumber -ge 66) { $rootStableNav } else { '<a href="tables.html">Tables</a><a href="reader.html">Reader</a><a href="terms.html" aria-current="page">Terms</a><a href="index.html#search">Search</a><a href="index.html#contents">Contents</a>' })</nav>
</div></header>$identityPreviewBanner
<main id="main-content" class="site-main pointer-index">
<nav class="site-breadcrumbs" aria-label="Breadcrumb"><a href="index.html">$publicationName</a> / Pointer Entries</nav>
<p class="site-kicker">Generated concordance · $($pointerRecords.Count) admitted labels</p>
<h1>Pointer Entries</h1>
<p>Follow a repeated structural label to every exact code expression and owning Table in this edition.</p>
<p><a data-dictionary-start href="$dictionaryStartHref">Read the merged $($dictionaryRecords.Count)-item dictionary A-Z</a></p>
<p class="pointer-index__boundary"><strong>Navigation layer, not a third book.</strong> Pointer Entries appear beside canonical Table families in the mixed A-Z reading route, but they are not canonical definitions, senses, relations, or evidence of importance.</p>
<ol class="pointer-grid">$pointerIndexItems</ol>
</main>
<footer class="site-footer">$(if ($editionNumber -ge 66) { "$rootPublicationStatus · generated navigation, not canonical authority" } else { 'Internal deterministic simulation · not reader evidence or canonical authority' })$contentLicenseNotice</footer>
</body>
</html>
"@
        [System.IO.File]::WriteAllText($sitePointerIndex, $pointerIndexHtml, [System.Text.UTF8Encoding]::new($false))
    }

    $actualChapterFiles = @(Get-ChildItem -LiteralPath $siteChapterDirectory -Filter "*.html")
    $actualEntryFiles = @(Get-ChildItem -LiteralPath $siteEntryDirectory -Filter "*.html")
    $actualPointerFiles = @(if ($editionNumber -ge 52) { Get-ChildItem -LiteralPath $sitePointerDirectory -Filter "*.html" })
    $expectedAssetNames = @("context.js", "reader.js", "search.js", "site-data.js", "site.css")
    if ($editionNumber -ge 16) {
        $expectedAssetNames += "composition-lab.js"
    }
    if ($editionNumber -ge 17) {
        $expectedAssetNames += "composition-reading.js"
    }
    if ($editionNumber -ge 19) {
        $expectedAssetNames += "composition-palette.js"
    }
    if ($editionNumber -ge 20) {
        $expectedAssetNames += "composition-views.js"
    }
    if ($editionNumber -ge 21) {
        $expectedAssetNames += "composition-map.js"
    }
    if ($editionNumber -ge 22) {
        $expectedAssetNames += "composition-starters.js"
    }
    if ($editionNumber -ge 23) {
        $expectedAssetNames += "composition-query-plan.js"
    }
    if ($editionNumber -ge 25) {
        $expectedAssetNames += "composition-reconciliation.js"
    }
    if ($editionNumber -ge 26) {
        $expectedAssetNames += "composition-continuations.js"
    }
    if ($editionNumber -ge 27) {
        $expectedAssetNames += "composition-rerun-comparison.js"
    }
    if ($editionNumber -ge 28) {
        $expectedAssetNames += "composition-guide.js"
    }
    if ($editionNumber -ge 29) {
        $expectedAssetNames += "composition-evaluation.js"
    }
    if ($editionNumber -ge 44) {
        $expectedAssetNames += "handoff.js"
    }
    if ($editionNumber -ge 45) {
        $expectedAssetNames += "dual-lookup.js"
    }
    if ($editionNumber -ge 52) {
        $expectedAssetNames += "pointers.js"
    }
    if ($editionNumber -ge 66) {
        $expectedAssetNames += "dictionary-stream.js"
    }
    $actualAssetFiles = @(Get-ChildItem -LiteralPath $siteAssetDirectory -File)
    $unexpectedAssetNames = @($actualAssetFiles.Name | Where-Object { $_ -notin $expectedAssetNames })
    $missingAssetNames = @($expectedAssetNames | Where-Object { $_ -notin $actualAssetFiles.Name })
    if ($actualChapterFiles.Count -ne $siteChapters.Count -or
        $actualEntryFiles.Count -ne $sources.Count -or
        ($editionNumber -ge 52 -and $actualPointerFiles.Count -ne $pointerRecords.Count) -or
        $unexpectedAssetNames.Count -ne 0 -or $missingAssetNames.Count -ne 0) {
        throw "Stale or incomplete site output: chapters=$($actualChapterFiles.Count)/$($siteChapters.Count) entries=$($actualEntryFiles.Count)/$($sources.Count) pointers=$($actualPointerFiles.Count)/$($pointerRecords.Count) unexpected-assets=$($unexpectedAssetNames -join ',') missing-assets=$($missingAssetNames -join ',')"
    }
    $siteHtmlFiles = @($siteIndex) +
        @(if ($editionNumber -ge 35) { $siteTablesIndex }) +
        @(if ($editionNumber -ge 36) { $siteReader }) +
        @(if ($editionNumber -ge 52) { $sitePointerIndex }) +
        @(if ($editionNumber -ge 66) { $siteDictionaryStream }) +
        @(if ($editionNumber -ge 66) { $siteDictionaryBook }) +
        @(if ($editionNumber -ge 16) { $siteCompose }) +
        @($actualChapterFiles | ForEach-Object { $_.FullName }) +
        @($actualEntryFiles | ForEach-Object { $_.FullName }) +
        @($actualPointerFiles | ForEach-Object { $_.FullName })
    if ($identityPreview) {
        foreach ($siteHtmlFile in $siteHtmlFiles) {
            $sitePageText = Get-Content -LiteralPath $siteHtmlFile -Raw
            if (-not $sitePageText.Contains("class=`"identity-preview`"")) {
                if (-not $sitePageText.Contains("</header>")) {
                    throw "Identity preview target page has no header close: $siteHtmlFile"
                }
                $sitePageText = $sitePageText.Replace("</header>", "</header>$identityPreviewBanner")
            }
            if (-not $sitePageText.Contains(".identity-preview{")) {
                if (-not $sitePageText.Contains("</head>")) {
                    throw "Identity preview target page has no head close: $siteHtmlFile"
                }
                $sitePageText = $sitePageText.Replace("</head>", "$identityPreviewStyle`n</head>")
            }
            [System.IO.File]::WriteAllText(
                $siteHtmlFile,
                $sitePageText,
                [System.Text.UTF8Encoding]::new($false)
            )
        }
    }
    $handoffNotePages = 0
    $handoffHtmlFiles = @($siteHtmlFiles)
    if ($editionNumber -ge 66) {
        $handoffHtmlFiles = @($handoffHtmlFiles | Where-Object { $_ -ne $siteDictionaryBook })
    }
    if ($editionNumber -ge 44) {
        $handoffNamespace = if ($lexiconIdentity) { "lexicon" } elseif ($editionNumber -ge 66) { "formarium" } else { "factorium" }
        $handoffSection = @"
<section class="site-handoff" data-$handoffNamespace-handoff aria-labelledby="$handoffNamespace-handoff-heading">
<p class="site-kicker">Ephemeral handoff note</p>
<h2 id="$handoffNamespace-handoff-heading">Take this route with you</h2>
<p>Re-enter only what is safe to keep in page memory. $publicationName does not store, send, or verify this note; reload clears it.</p>
<div class="site-handoff__grid">
<label><span>Question or situation</span><textarea data-handoff-question rows="3" placeholder="What were you trying to distinguish, explain, check, or decide?"></textarea></label>
<label><span>What remains unresolved</span><textarea data-handoff-unresolved rows="3" placeholder="Missing evidence, condition, concept, authority, or decision state"></textarea></label>
<label><span>Next authoritative source</span><input data-handoff-source type="text" placeholder="Document, dataset, handbook, expert, or local record"></label>
</div>
<p class="site-handoff__page"><strong>Current $publicationName page</strong><span data-handoff-page></span></p>
<div class="site-handoff__actions"><button type="button" data-handoff-copy>Copy handoff</button><button type="button" data-handoff-print>Print</button><button type="button" data-handoff-clear>Clear</button></div>
<p class="site-handoff__status" data-handoff-status role="status" aria-live="polite">Nothing is saved.</p>
</section>
"@
        foreach ($siteHtmlFile in $handoffHtmlFiles) {
            $sitePageText = Get-Content -LiteralPath $siteHtmlFile -Raw
            if (-not $sitePageText.Contains("</main>")) {
                throw "Handoff target page has no main close: $siteHtmlFile"
            }
            $assetPrefix = if ((Split-Path $siteHtmlFile -Parent) -eq $output) { "assets" } else { "../assets" }
            $sitePageText = $sitePageText.Replace("</main>", "</main>`n$handoffSection")
            $sitePageText = $sitePageText.Replace("</body>", "<script src=`"$assetPrefix/handoff.js`"></script>`n</body>")
            [System.IO.File]::WriteAllText($siteHtmlFile, $sitePageText, [System.Text.UTF8Encoding]::new($false))
            $handoffNotePages += 1
        }
    }
    if ($editionNumber -ge 66) {
        $canonicalIdentityFiles = @($siteHtmlFiles) +
            @($actualAssetFiles | ForEach-Object { $_.FullName }) +
            @($html, $searchIndexOutput)
        foreach ($canonicalIdentityFile in $canonicalIdentityFiles) {
            $canonicalIdentityText = Get-Content -LiteralPath $canonicalIdentityFile -Raw
            if ($lexiconIdentity) {
                $canonicalIdentityText = $canonicalIdentityText.Replace("FACTORIUM_", "LEXICON_")
                $canonicalIdentityText = $canonicalIdentityText.Replace("FORMARIUM_", "LEXICON_")
                $canonicalIdentityText = $canonicalIdentityText.Replace("data-factorium", "data-lexicon")
                $canonicalIdentityText = $canonicalIdentityText.Replace("data-formarium", "data-lexicon")
                $canonicalIdentityText = $canonicalIdentityText.Replace("factorium-handoff", "lexicon-handoff")
                $canonicalIdentityText = $canonicalIdentityText.Replace("formarium-handoff", "lexicon-handoff")
                $canonicalIdentityText = $canonicalIdentityText.Replace("Factorium", "Lexicon")
                $canonicalIdentityText = $canonicalIdentityText.Replace("Formarium", "Lexicon")
                $canonicalIdentityText = $canonicalIdentityText.Replace("Lexicon Tables", "Lexicon")
                $canonicalIdentityText = $canonicalIdentityText.Replace("The Lexicon Reader", "Lexicon Reader")
                $canonicalIdentityText = $canonicalIdentityText.Replace("The Lexicon", "Lexicon")
                $canonicalIdentityText = $canonicalIdentityText.Replace(
                    "Lexicon and Lexicon identifiers remain readable historical imports.",
                    "Factorium and Formarium identifiers remain readable historical imports."
                )
                $canonicalIdentityText = $canonicalIdentityText.Replace("/FORMARIUM", "/LEXICON")
            }
            else {
                $canonicalIdentityText = $canonicalIdentityText.Replace("FACTORIUM_", "FORMARIUM_")
                $canonicalIdentityText = $canonicalIdentityText.Replace("data-factorium", "data-formarium")
                $canonicalIdentityText = $canonicalIdentityText.Replace("factorium-handoff", "formarium-handoff")
                $canonicalIdentityText = $canonicalIdentityText.Replace("Factorium", "Formarium")
            }
            [System.IO.File]::WriteAllText(
                $canonicalIdentityFile,
                $canonicalIdentityText,
                [System.Text.UTF8Encoding]::new($false)
            )
        }
    }
    $idsBySiteFile = [System.Collections.Generic.Dictionary[string, object]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )
    foreach ($siteHtmlFile in $siteHtmlFiles) {
        $sitePageText = Get-Content -LiteralPath $siteHtmlFile -Raw
        $sitePageIds = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
        [regex]::Matches($sitePageText, ' id="([^"]+)"') | ForEach-Object {
            [void]$sitePageIds.Add($_.Groups[1].Value)
        }
        $idsBySiteFile[[System.IO.Path]::GetFullPath($siteHtmlFile)] = $sitePageIds
    }

    $siteLocalLinks = 0
    $missingSiteTargets = [System.Collections.Generic.List[string]]::new()
    foreach ($siteHtmlFile in $siteHtmlFiles) {
        $sitePageText = Get-Content -LiteralPath $siteHtmlFile -Raw
        foreach ($siteLink in [regex]::Matches($sitePageText, '(?:href|src)="([^"]+)"')) {
            $siteTarget = [System.Net.WebUtility]::HtmlDecode($siteLink.Groups[1].Value)
            if ($siteTarget -match '^(?:https?://|mailto:|data:)' ) {
                continue
            }
            $siteLocalLinks += 1
            $targetParts = $siteTarget -split '#', 2
            $targetPath = $targetParts[0]
            $targetFragment = if ($targetParts.Count -eq 2) { $targetParts[1] } else { "" }
            $resolvedTarget = if ([string]::IsNullOrWhiteSpace($targetPath)) {
                [System.IO.Path]::GetFullPath($siteHtmlFile)
            }
            else {
                [System.IO.Path]::GetFullPath((Join-Path (Split-Path $siteHtmlFile) $targetPath))
            }
            $isPlannedManifest = $editionNumber -ge 66 -and $resolvedTarget.Equals(
                [System.IO.Path]::GetFullPath($manifest),
                [System.StringComparison]::Ordinal
            )
            if (-not $resolvedTarget.StartsWith($output, [System.StringComparison]::OrdinalIgnoreCase) -or
                (-not $isPlannedManifest -and -not (Test-Path -LiteralPath $resolvedTarget -PathType Leaf))) {
                $missingSiteTargets.Add("$siteHtmlFile -> $siteTarget")
                continue
            }
            if (-not [string]::IsNullOrWhiteSpace($targetFragment) -and
                $idsBySiteFile.ContainsKey($resolvedTarget) -and
                -not $idsBySiteFile[$resolvedTarget].Contains($targetFragment)) {
                $missingSiteTargets.Add("$siteHtmlFile -> $siteTarget")
            }
        }
    }
    if ($missingSiteTargets.Count -ne 0) {
        throw "Book site has $($missingSiteTargets.Count) missing local targets: $($missingSiteTargets[0])"
    }

    $siteOutputFiles = @($siteIndex) +
        @(if ($editionNumber -ge 35) { $siteTablesIndex }) +
        @(if ($editionNumber -ge 36) { $siteReader }) +
        @(if ($editionNumber -ge 52) { $sitePointerIndex }) +
        @(if ($editionNumber -ge 16) { $siteCompose }) +
        @(Get-ChildItem -LiteralPath $siteChapterDirectory -File | ForEach-Object { $_.FullName }) +
        @(Get-ChildItem -LiteralPath $siteEntryDirectory -File | ForEach-Object { $_.FullName }) +
        @(if ($editionNumber -ge 52) { Get-ChildItem -LiteralPath $sitePointerDirectory -File | ForEach-Object { $_.FullName } }) +
        @(Get-ChildItem -LiteralPath $siteAssetDirectory -File | ForEach-Object { $_.FullName })
    $siteFileRecords = foreach ($siteOutputFile in $siteOutputFiles | Sort-Object) {
        [ordered]@{
            path = [System.IO.Path]::GetRelativePath($output, $siteOutputFile).Replace("\", "/")
            sha256 = (Get-FileHash -LiteralPath $siteOutputFile -Algorithm SHA256).Hash.ToLowerInvariant()
            bytes = (Get-Item -LiteralPath $siteOutputFile).Length
        }
    }
    $siteIdentityInput = ($siteFileRecords | ForEach-Object { "$($_.path)|$($_.sha256)|$($_.bytes)" }) -join "`n"
    $siteIdentityBytes = [System.Text.Encoding]::UTF8.GetBytes($siteIdentityInput)
    $siteIdentityHash = [System.Security.Cryptography.SHA256]::HashData($siteIdentityBytes)
    $siteIdentity = [System.Convert]::ToHexString($siteIdentityHash).ToLowerInvariant()
    $siteAssets = @($siteFileRecords | Where-Object { $_.path.StartsWith("assets/") })
    $siteChecks = [ordered]@{
        home_pages = 1
        chapter_pages = $siteChapters.Count
        chapter_subsections = @(foreach ($chapter in $siteChapters) { $chapter.groups }).Count
        source_pages = $sources.Count
        indexed_entry_pages = $searchRecords.Count
        supporting_source_pages = $sources.Count - $searchRecords.Count
        unique_page_names = $pageNames.Count
        local_links = $siteLocalLinks
        missing_local_targets = $missingSiteTargets.Count
        previous_next_sequence_records = $searchRecords.Count
        first_journey_targets = if ($editionNumber -ge 66) { 0 } else { $firstJourneySources.Count }
        problem_led_targets = if ($editionNumber -ge 66) { 0 } else { $problemLedTargets }
        composition_trace_targets = if ($editionNumber -ge 66) { 0 } else { $compositionTraceTargets }
        canonical_content_authority = "repository Markdown and reference metadata"
        execution = "multi-page static files; no server"
        identity = $siteIdentity
    }
    if ($editionNumber -ge 30) {
        $siteChecks.candidate_start_targets = $candidateStartTargets
    }
    if ($editionNumber -ge 31) {
        $siteChecks.product_books = $productBooks
        $siteChecks.tables_start_targets = $tablesStartTargets
        $siteChecks.reader_start_targets = $readerStartTargets
        $siteChecks.product_authority = "$tablesPublicationName canonical; Reader and Factor Guides are linked projections"
    }
    if ($editionNumber -ge 52) {
        $siteChecks.pointer_index_pages = 1
        $siteChecks.pointer_entry_pages = $pointerRecords.Count
        $siteChecks.pointer_distinct_occurrences = $pointerOccurrenceCount
        $siteChecks.pointer_owner_bindings = $pointerOwnerCount
        $siteChecks.pointer_authority_change = $false
        $siteChecks.pointer_relation_inference = $false
        $siteChecks.pointer_search_integration = $false
    }
    if ($editionNumber -ge 43) {
        if ($intentRouterTargets -ne 3) {
            throw "Intent router target mismatch: $intentRouterTargets"
        }
        $siteChecks.intent_router_targets = $intentRouterTargets
        $siteChecks.intent_router_jobs = @("know-term", "have-question", "learn-or-explore")
        $siteChecks.intent_router_authority_change = $false
        $siteChecks.intent_router_search_change = $false
    }
    if ($editionNumber -ge 44) {
        if ($handoffNotePages -ne $handoffHtmlFiles.Count) {
            throw "Handoff note coverage mismatch: $handoffNotePages/$($handoffHtmlFiles.Count)"
        }
        $siteChecks.handoff_note_pages = $handoffNotePages
        if ($editionNumber -ge 66) {
            $siteChecks.handoff_note_excluded_pages = @("book.html")
        }
        $siteChecks.handoff_note_fields = @("question", "current-page", "unresolved", "next-source")
        $siteChecks.handoff_note_actions = @("copy", "print", "clear")
        $siteChecks.handoff_note_storage = "none"
        $siteChecks.handoff_note_network = "none"
        $siteChecks.handoff_note_verification = "none"
        $siteChecks.handoff_note_authority_change = $false
    }
    if ($editionNumber -ge 45 -and $editionNumber -lt 66) {
        $dualLookupHtml = Get-Content -LiteralPath $siteIndex -Raw
        if (@([regex]::Matches($dualLookupHtml, 'id="compare-searches"')).Count -ne 1 -or
            @([regex]::Matches($dualLookupHtml, 'id="dual-lookup-query-(one|two)"')).Count -ne 2 -or
            @([regex]::Matches($dualLookupHtml, 'id="dual-lookup-results-(one|two)"')).Count -ne 2) {
            throw "Dual literal lookup shell mismatch"
        }
        $siteChecks.dual_lookup_pages = 1
        $siteChecks.dual_lookup_query_panels = 2
        $siteChecks.dual_lookup_family_limit_per_query = 10
        $siteChecks.dual_lookup_rankings = "independent-existing-order"
        $siteChecks.dual_lookup_comparison = "canonical-family-identity-only"
        $siteChecks.dual_lookup_merged_ranking = $false
        $siteChecks.dual_lookup_semantic_decomposition = $false
        $siteChecks.dual_lookup_storage = "none"
        $siteChecks.dual_lookup_network = "none"
        $siteChecks.dual_lookup_authority_change = $false
    }
    elseif ($editionNumber -ge 66) {
        $siteChecks.dual_lookup_pages = 0
        $siteChecks.dual_lookup_retired_from_home = $true
    }
    if ($editionNumber -ge 32) {
        $expectedTableNavigatorPages = @($searchRecords | Where-Object { $_.path.StartsWith("tables/") }).Count
        $expectedSpecializedViews = @($canonicalClassByPath.Keys | Where-Object { $canonicalClassByPath[$_] -ne "entry" }).Count
        if ($tableNavigatorPages -ne $expectedTableNavigatorPages -or
            $tableSpecializedViewPages -ne $expectedSpecializedViews -or
            $tableOwnerLinks -ne $expectedSpecializedViews) {
            throw "Table navigator coverage mismatch: pages=$tableNavigatorPages/$expectedTableNavigatorPages views=$tableSpecializedViewPages/$expectedSpecializedViews owners=$tableOwnerLinks/$expectedSpecializedViews"
        }
        $siteChecks.table_navigator_pages = $tableNavigatorPages
        $siteChecks.table_canonical_entry_pages = $tableCanonicalEntryPages
        $siteChecks.table_specialized_view_pages = $tableSpecializedViewPages
        $siteChecks.table_curated_record_pages = $tableCuratedRecordPages
        $siteChecks.table_owner_links = $tableOwnerLinks
        $siteChecks.table_contrast_routes = $tableContrastRoutes
        $siteChecks.table_cross_reference_routes = $tableCrossReferenceRoutes
        $siteChecks.table_authored_connections = $tableAuthoredConnections
        $siteChecks.table_connection_preview_links = $tableConnectionPreviewLinks
        $siteChecks.table_connection_semantics = "authored-untyped-navigation-only"
    }
    if ($editionNumber -ge 33) {
        $siteChecks.search_result_views = @("families", "records")
        $siteChecks.search_default_result_view = "families"
        $siteChecks.search_ownership_groups = $searchChecks.ownership_groups
        $siteChecks.search_specialized_view_owners = $searchChecks.specialized_view_owners
        $siteChecks.search_family_semantics = $searchChecks.family_semantics
    }
    if ($editionNumber -ge 34) {
        $expectedFamilyLinks = if ($editionNumber -ge 50) { 100 } elseif ($editionNumber -ge 49) { 97 } else { 95 }
        $expectedFamilyOpen = if ($editionNumber -ge 49) { 47 } else { 48 }
        $expectedFamilyFolded = if ($editionNumber -ge 49) { 5 } else { 4 }
        if ($tableFamilyContentsPanels -ne 52 -or
            $tableFamilyContentsLinks -ne $expectedFamilyLinks -or
            $tableFamilyContentsOpen -ne $expectedFamilyOpen -or
            $tableFamilyContentsFolded -ne $expectedFamilyFolded) {
            throw "Canonical Table family contents mismatch: panels=$tableFamilyContentsPanels links=$tableFamilyContentsLinks open=$tableFamilyContentsOpen folded=$tableFamilyContentsFolded"
        }
        $siteChecks.table_family_contents_panels = $tableFamilyContentsPanels
        $siteChecks.table_family_contents_links = $tableFamilyContentsLinks
        $siteChecks.table_family_contents_open = $tableFamilyContentsOpen
        $siteChecks.table_family_contents_folded = $tableFamilyContentsFolded
        $siteChecks.table_family_contents_semantics = "exact-publication-ownership-only"
    }
    if ($editionNumber -ge 35) {
        $expectedCanonicalCount = if ($editionNumber -ge 74) { 133 } elseif ($editionNumber -ge 73) { 124 } elseif ($editionNumber -ge 72) { 119 } elseif ($editionNumber -ge 71) { 113 } elseif ($editionNumber -ge 70) { 107 } elseif ($editionNumber -ge 69) { 101 } elseif ($editionNumber -ge 68) { 91 } elseif ($editionNumber -ge 49) { 54 } else { 53 }
        $expectedOwnedViewCount = if ($editionNumber -ge 50) { 100 } elseif ($editionNumber -ge 49) { 97 } else { 95 }
        if ($tablesIndexCanonicalCount -ne $expectedCanonicalCount -or
            $tablesIndexCuratedCount -ne 27 -or
            $tablesIndexLetterCount -ne $(if ($editionNumber -ge 72) { 20 } elseif ($editionNumber -ge 70) { 19 } elseif ($editionNumber -ge 69) { 18 } else { 17 }) -or
            $tablesIndexOwnedViewCount -ne $expectedOwnedViewCount) {
            throw "Tables alphabetical index mismatch: canonical=$tablesIndexCanonicalCount curated=$tablesIndexCuratedCount letters=$tablesIndexLetterCount views=$tablesIndexOwnedViewCount"
        }
        if ($editionNumber -ge 52 -and $tablesIndexPointerCount -ne $expectedPointerCount) {
            throw "Tables pointer index mismatch: pointers=$tablesIndexPointerCount"
        }
        $siteChecks.tables_index_pages = 1
        $siteChecks.tables_index_canonical_families = $tablesIndexCanonicalCount
        $siteChecks.tables_index_curated_records = $tablesIndexCuratedCount
        $siteChecks.tables_index_letters = $tablesIndexLetterCount
        $siteChecks.tables_index_owned_views = $tablesIndexOwnedViewCount
        $siteChecks.tables_index_guides = 0
        $siteChecks.tables_index_reader_records = 0
        $siteChecks.tables_index_order = "normalized-selected-title"
        $siteChecks.tables_index_semantics = "alphabetical-presentation-only"
        if ($editionNumber -ge 52) {
            $siteChecks.tables_index_pointer_entries = $tablesIndexPointerCount
        }
        if ($editionNumber -ge 66) {
            $expectedDictionaryCount = $tablesIndexCanonicalCount + $tablesIndexPointerCount
            if ($dictionaryRecords.Count -ne $expectedDictionaryCount -or
                $dictionarySequencePanels -ne $expectedDictionaryCount -or
                $dictionarySequencePreviousLinks -ne ($expectedDictionaryCount - 1) -or
                $dictionarySequenceNextLinks -ne ($expectedDictionaryCount - 1) -or
                $dictionarySequenceFinishLinks -ne 1) {
                throw "Merged dictionary sequence mismatch: records=$($dictionaryRecords.Count) panels=$dictionarySequencePanels previous=$dictionarySequencePreviousLinks next=$dictionarySequenceNextLinks finish=$dictionarySequenceFinishLinks"
            }
            $siteChecks.dictionary_sequence_pages = $dictionarySequencePanels
            $siteChecks.dictionary_sequence_canonical_entries = $tablesIndexCanonicalCount
            $siteChecks.dictionary_sequence_pointer_entries = $tablesIndexPointerCount
            $siteChecks.dictionary_sequence_previous_links = $dictionarySequencePreviousLinks
            $siteChecks.dictionary_sequence_next_links = $dictionarySequenceNextLinks
            $siteChecks.dictionary_sequence_finish_links = $dictionarySequenceFinishLinks
            $siteChecks.dictionary_index_letters = $dictionaryLetterCount
            $siteChecks.dictionary_order = "normalized-title-then-href"
            $siteChecks.dictionary_stream_pages = 1
            $siteChecks.dictionary_stream_records = $dictionaryRecords.Count
            $siteChecks.dictionary_stream_batch_size = 4
            $siteChecks.dictionary_book_pages = 1
            $siteChecks.dictionary_book_records = $dictionaryRecords.Count
            $siteChecks.dictionary_book_columns = 2
            $siteChecks.dictionary_book_screen_flow = "bounded-horizontal-pages"
            $siteChecks.dictionary_book_mobile_flow = "single-column-vertical"
            $siteChecks.dictionary_book_print_flow = "full-width-canonical-tables-then-two-column-pointer-index"
            $siteChecks.dictionary_book_print_canonical_tables = $tablesIndexCanonicalCount
            $siteChecks.dictionary_book_print_pointer_records = $tablesIndexPointerCount
            $siteChecks.dictionary_book_print_provenance_sections = $bookSupplementCounts.sources_provenance
            $siteChecks.dictionary_book_supplements = ($bookSupplementCounts.Values | Measure-Object -Sum).Sum
            $siteChecks.dictionary_book_specialized_sections = $bookSupplementCounts.specialized
            $siteChecks.dictionary_book_reference_delta_sections = $bookSupplementCounts.reference_delta
            $siteChecks.dictionary_book_cross_reference_sections = $bookSupplementCounts.cross_references
            $siteChecks.dictionary_book_sources_provenance_sections = $bookSupplementCounts.sources_provenance
        }
    }
    if ($editionNumber -ge 36) {
        if ($readerRouteRecordCount -ne 24 -or
            $readerRoutePartCount -ne 5 -or
            ($readerRoutePartSizes -join ",") -ne "6,6,5,4,3") {
            throw "Factorium Reader route mismatch: records=$readerRouteRecordCount parts=$readerRoutePartCount sizes=$($readerRoutePartSizes -join ',')"
        }
        $siteChecks.reader_route_pages = 1
        $siteChecks.reader_route_records = $readerRouteRecordCount
        $siteChecks.reader_route_parts = $readerRoutePartCount
        $siteChecks.reader_route_part_sizes = @($readerRoutePartSizes)
        $siteChecks.reader_route_guides = 0
        $siteChecks.reader_route_support_records = 0
        $siteChecks.reader_route_order = "exact-frozen-manifest"
        $siteChecks.reader_route_semantics = "editorial-teaching-sequence-only"
        $siteChecks.reader_route_additional_records = $readerAdditionalRecordCount
    }
    if ($editionNumber -ge 37) {
        if ($readerSequencePanels -ne 24 -or
            $readerSequenceContentsLinks -ne 24 -or
            $readerSequencePreviousLinks -ne 23 -or
            $readerSequenceNextLinks -ne 23) {
            throw "Factorium Reader sequence mismatch: panels=$readerSequencePanels contents=$readerSequenceContentsLinks previous=$readerSequencePreviousLinks next=$readerSequenceNextLinks"
        }
        $siteChecks.reader_sequence_panels = $readerSequencePanels
        $siteChecks.reader_sequence_contents_links = $readerSequenceContentsLinks
        $siteChecks.reader_sequence_previous_links = $readerSequencePreviousLinks
        $siteChecks.reader_sequence_next_links = $readerSequenceNextLinks
        $siteChecks.reader_sequence_nonmember_panels = 0
        $siteChecks.reader_sequence_state = "none"
        $siteChecks.reader_sequence_semantics = "editorial-teaching-order-only"
    }
    if ($editionNumber -ge 38) {
        $siteChecks.reader_primary_start_links = 1
        $siteChecks.reader_optional_quickstart_links = 1
        $siteChecks.reader_primary_start_position = 1
        $siteChecks.reader_primary_start_path = $candidateRecordPaths[0]
        $siteChecks.reader_primary_start_state = "none"
    }
    if ($editionNumber -ge 39) {
        if ($readerSequenceFinishLinks -ne 1) {
            throw "Factorium Reader terminal handoff mismatch: $readerSequenceFinishLinks"
        }
        $siteChecks.reader_sequence_finish_links = $readerSequenceFinishLinks
        $siteChecks.reader_sequence_finish_position = 24
        $siteChecks.reader_sequence_finish_target = "reader.html#reader-route-after-heading"
        $siteChecks.reader_sequence_finish_state = "none"
    }
    if ($editionNumber -ge 16) {
        $siteChecks.composition_lab_pages = 1
    }
    if ($editionNumber -ge 18) {
        $siteChecks.composition_factor_focus_records = $compositionFocusRecords.Count
    }
    if ($editionNumber -ge 19) {
        $siteChecks.composition_palette_groups = $compositionPaletteChecks.concept_groups
    }
    if ($editionNumber -ge 20) {
        $siteChecks.composition_view_profiles = $compositionViewsChecks.profiles.Count
    }
    if ($editionNumber -ge 21) {
        $siteChecks.composition_closure_map_pages = 1
    }
    if ($editionNumber -ge 22) {
        $siteChecks.composition_starter_cards = $compositionStarterChecks.starters
    }
    if ($editionNumber -ge 23) {
        $siteChecks.composition_query_plan_pages = 1
    }
    if ($editionNumber -ge 24) {
        $siteChecks.composition_work_budget_controls = 1
    }
    if ($editionNumber -ge 25) {
        $siteChecks.composition_reconciliation_pages = 1
    }
    if ($editionNumber -ge 26) {
        $siteChecks.composition_continuation_pages = 1
        $siteChecks.composition_continuation_actions = 3
    }
    if ($editionNumber -ge 27) {
        $siteChecks.composition_rerun_comparison_pages = 1
        $siteChecks.composition_rerun_comparison_retained = 1
    }
    if ($editionNumber -ge 28) {
        $siteChecks.composition_guide_skeleton_pages = 1
        $siteChecks.composition_guide_missing_work_records = 8
    }
    if ($editionNumber -ge 29) {
        $siteChecks.composition_evaluation_record_pages = 1
        $siteChecks.composition_evaluation_outcomes = 3
    }
}

$sourceRecords = foreach ($source in $sources) {
    [ordered]@{
        path = [System.IO.Path]::GetRelativePath($workspace, $source).Replace("\", "/")
        sha256 = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash.ToLowerInvariant()
    }
}

$gitStatus = @(git -C $workspace status --porcelain)
$manifestRecord = [ordered]@{
    artifact = $artifactName
    edition = $Edition
    status = if ($editionNumber -ge 66) { "internally validated projection; not reader-outcome evidence" } else { "internal simulation rendering; not reader evidence or preview-01" }
    source_commit = $sourceCommit
    workspace_dirty_at_render = $gitStatus.Count -gt 0
    pandoc = (& $pandoc.Source --version | Select-Object -First 1)
    source_count = $sources.Count
    excluded_moderator_files = @(
        "USABILITY-PROTOCOL.md",
        "READER-PACKET.md",
        "EVALUATOR-RUBRIC.md",
        "OBSERVATIONS.md",
        "FACTOR-FORGE-SIM-RUBRIC.md"
    )
    sources = $sourceRecords
    selection_checks = $selectionChecks
    search_checks = $searchChecks
    search_assets = $searchAssets
    reader_checks = $readerChecks
    context_checks = $contextChecks
    context_assets = $contextAssets
    site_checks = $siteChecks
    site_assets = $siteAssets
    composition_checks = $compositionChecks
    rendering_checks = [ordered]@{
        internal_fragment_links = $fragmentLinks.Count
        missing_fragment_targets = $missingFragments.Count
        filesystem_dependent_links = $localFileLinks.Count
        repository_source_links = $repositorySourceLinks.Count
    }
    output = [ordered]@{
        path = "$artifactName.html"
        sha256 = (Get-FileHash -LiteralPath $html -Algorithm SHA256).Hash.ToLowerInvariant()
        bytes = (Get-Item -LiteralPath $html).Length
    }
}
if ($lexiconIdentity) {
    $manifestRecord.active_contracts = [ordered]@{
        composition_lab_payload = "lexicon-composition-lab-payload-v0"
        composition_reading_payload = "lexicon-composition-reading-payload-v0"
        composition_starters = "lexicon-composition-starters-v0"
        reader_profile_preference = "lexicon-reader-profile"
        composition_guide_skeleton = "lexicon-composition-guide-skeleton-v0"
        composition_evaluation_record = "lexicon-composition-evaluation-record-v0"
    }
}
if ($editionNumber -ge 16) {
    $manifestRecord.composition_lab_checks = $compositionLabChecks
}
if ($editionNumber -ge 17) {
    $manifestRecord.composition_reading_checks = $compositionReadingChecks
}
if ($editionNumber -ge 18) {
    $manifestRecord.composition_factor_focus_checks = $compositionFocusChecks
}
if ($editionNumber -ge 19) {
    $manifestRecord.composition_palette_checks = $compositionPaletteChecks
}
if ($editionNumber -ge 20) {
    $manifestRecord.composition_view_checks = $compositionViewsChecks
}
if ($editionNumber -ge 21) {
    $manifestRecord.composition_closure_map_checks = $compositionMapChecks
}
if ($editionNumber -ge 22) {
    $manifestRecord.composition_starter_checks = $compositionStarterChecks
}
if ($editionNumber -ge 23) {
    $manifestRecord.composition_query_plan_checks = $compositionQueryPlanChecks
}
if ($editionNumber -ge 25) {
    $manifestRecord.composition_reconciliation_checks = $compositionReconciliationChecks
}
if ($editionNumber -ge 26) {
    $manifestRecord.composition_continuation_checks = $compositionContinuationsChecks
}
if ($editionNumber -ge 27) {
    $manifestRecord.composition_rerun_comparison_checks = $compositionRerunComparisonChecks
}
if ($editionNumber -ge 28) {
    $manifestRecord.composition_guide_skeleton_checks = $compositionGuideChecks
}
if ($editionNumber -ge 29) {
    $manifestRecord.composition_evaluation_record_checks = $compositionEvaluationChecks
}
if ($editionNumber -ge 4) {
    $manifestRecord.output.search_index_path = "search-index.json"
    $manifestRecord.output.search_index_sha256 = (Get-FileHash -LiteralPath $searchIndexOutput -Algorithm SHA256).Hash.ToLowerInvariant()
}
if ($editionNumber -ge 7) {
    $manifestRecord.output.site_index_path = "index.html"
    $manifestRecord.output.site_index_sha256 = (Get-FileHash -LiteralPath $siteIndex -Algorithm SHA256).Hash.ToLowerInvariant()
    $manifestRecord.output.site_identity = $siteChecks.identity
    $compositionLabPageCount = if ($editionNumber -ge 16) { $siteChecks.composition_lab_pages } else { 0 }
    $manifestRecord.output.site_file_count = 1 + $compositionLabPageCount + $siteChecks.chapter_pages + $siteChecks.source_pages + $siteAssets.Count
}

$manifestRecord | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $manifest -Encoding utf8

Write-Output "artifact=$html"
Write-Output "manifest=$manifest"
Write-Output "sources=$($sources.Count)"
if ($Edition -ne "sim-01") {
    Write-Output "delta_entries=$($selectionChecks.delta_entries)"
    Write-Output "delta_views=$($selectionChecks.delta_views)"
    Write-Output "combined_records=$($selectionChecks.combined_projection_records)"
}
if ($editionNumber -ge 3) {
    Write-Output "tasks=$($selectionChecks.task_count)"
    Write-Output "task_coverage_records=$($selectionChecks.task_coverage_records)"
}
if ($editionNumber -ge 4) {
    Write-Output "search_records=$($searchChecks.indexed_records)"
    Write-Output "search_missing_targets=$($searchChecks.missing_rendered_targets)"
}
if ($editionNumber -ge 5) {
    Write-Output "reader_profiles=$($readerChecks.profiles.Count)"
    Write-Output "reader_default=$($readerChecks.default_profile)"
}
if ($editionNumber -ge 6) {
    Write-Output "context_profiles=$($contextChecks.profiles)"
    Write-Output "context_bindings=$($contextChecks.bindings)"
}
if ($editionNumber -ge 7) {
    Write-Output "site=$siteIndex"
    $compositionLabPageCount = if ($editionNumber -ge 16) { $siteChecks.composition_lab_pages } else { 0 }
    $tablesIndexPageCount = if ($editionNumber -ge 35) { $siteChecks.tables_index_pages } else { 0 }
    $readerRoutePageCount = if ($editionNumber -ge 36) { $siteChecks.reader_route_pages } else { 0 }
    $dictionaryExtraPageCount = if ($editionNumber -ge 66) {
        $siteChecks.dictionary_stream_pages + $siteChecks.dictionary_book_pages
    } else { 0 }
    Write-Output "site_pages=$($siteChecks.source_pages + $siteChecks.chapter_pages + $compositionLabPageCount + $tablesIndexPageCount + $readerRoutePageCount + $dictionaryExtraPageCount + 1)"
    Write-Output "site_chapters=$($siteChecks.chapter_pages)"
    Write-Output "site_chapter_subsections=$($siteChecks.chapter_subsections)"
    Write-Output "site_entry_pages=$($siteChecks.indexed_entry_pages)"
    Write-Output "site_first_journey_targets=$($siteChecks.first_journey_targets)"
    Write-Output "site_problem_led_targets=$($siteChecks.problem_led_targets)"
    if ($editionNumber -ge 15) {
        Write-Output "site_composition_trace_targets=$($siteChecks.composition_trace_targets)"
    }
    if ($editionNumber -ge 16) {
        Write-Output "site_composition_lab_pages=$($siteChecks.composition_lab_pages)"
        Write-Output "site_composition_lab_relations=$($compositionLabChecks.relation_records)"
    }
    if ($editionNumber -ge 17) {
        Write-Output "site_composition_reading_bindings=$($compositionReadingChecks.artifact_bindings)"
    }
    if ($editionNumber -ge 18) {
        Write-Output "site_composition_factor_focus_records=$($compositionFocusChecks.factor_focus_records)"
    }
    if ($editionNumber -ge 19) {
        Write-Output "site_composition_palette_groups=$($compositionPaletteChecks.concept_groups)"
    }
    if ($editionNumber -ge 20) {
        Write-Output "site_composition_view_profiles=$($compositionViewsChecks.profiles.Count)"
    }
    if ($editionNumber -ge 21) {
        Write-Output "site_composition_closure_map_pages=$($siteChecks.composition_closure_map_pages)"
    }
    if ($editionNumber -ge 22) {
        Write-Output "site_composition_starter_cards=$($siteChecks.composition_starter_cards)"
    }
    if ($editionNumber -ge 23) {
        Write-Output "site_composition_query_plan_pages=$($siteChecks.composition_query_plan_pages)"
    }
    Write-Output "site_missing_targets=$($siteChecks.missing_local_targets)"
    Write-Output "site_identity=$($siteChecks.identity)"
}
Write-Output "internal_links=$($fragmentLinks.Count)"
Write-Output "missing_internal_targets=$($missingFragments.Count)"
Write-Output "filesystem_links=$($localFileLinks.Count)"
Write-Output "repository_source_links=$($repositorySourceLinks.Count)"
Write-Output "bytes=$((Get-Item -LiteralPath $html).Length)"
Write-Output "sha256=$((Get-FileHash -LiteralPath $html -Algorithm SHA256).Hash.ToLowerInvariant())"
