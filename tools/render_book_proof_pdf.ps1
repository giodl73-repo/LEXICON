param(
    [string]$Edition = "sim-67",
    [string]$OutputPath = "",
    [switch]$SkipRender,
    [switch]$RequireCleanSource
)

$ErrorActionPreference = "Stop"
$workspace = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$sourceCommit = (git -C $workspace rev-parse HEAD).Trim()
$sourceStatus = @(git -C $workspace status --porcelain --untracked-files=all)
if ($RequireCleanSource -and $sourceStatus.Count -ne 0) {
    throw "Lexicon PDF rendering requires a clean source tree; found $($sourceStatus.Count) changed paths"
}
$proofDirectory = Join-Path $workspace "target\proof-set-$Edition"
$bookHtml = Join-Path $proofDirectory "book.html"

if (-not $SkipRender) {
    & (Join-Path $PSScriptRoot "render_proof_set.ps1") -Edition $Edition
    if ($LASTEXITCODE -ne 0) {
        throw "Proof-set rendering failed with exit code $LASTEXITCODE"
    }
}

if (-not (Test-Path -LiteralPath $bookHtml -PathType Leaf)) {
    throw "Missing generated book view: $bookHtml"
}

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $proofDirectory "Lexicon-book-proof-$Edition.pdf"
}
elseif (-not [System.IO.Path]::IsPathRooted($OutputPath)) {
    $OutputPath = Join-Path $workspace $OutputPath
}
$OutputPath = [System.IO.Path]::GetFullPath($OutputPath)
$outputDirectory = Split-Path -Parent $OutputPath
New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null

$browserCandidates = @(
    "C:\Program Files\Google\Chrome\Application\chrome.exe",
    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe",
    "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
    "C:\Program Files\Microsoft\Edge\Application\msedge.exe",
    "/usr/bin/google-chrome",
    "/usr/bin/chromium",
    "/usr/bin/chromium-browser",
    "/usr/bin/microsoft-edge"
)
$browser = $browserCandidates |
    Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } |
    Select-Object -First 1
if (-not $browser) {
    throw "No supported Chrome, Chromium, or Edge executable was found."
}

$profile = Join-Path (
    [System.IO.Path]::GetTempPath()
) ("lexicon-book-pdf-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $profile | Out-Null
$stdout = Join-Path $profile "stdout.txt"
$stderr = Join-Path $profile "stderr.txt"
$temporaryPdf = Join-Path $outputDirectory (
    "." + [System.IO.Path]::GetFileName($OutputPath) + "." +
    [guid]::NewGuid().ToString("N") + ".tmp"
)
$sidecarPath = "$OutputPath.manifest.json"
$temporarySidecar = "$temporaryPdf.manifest.json"

try {
    $bookUri = ([uri](Resolve-Path -LiteralPath $bookHtml).Path).AbsoluteUri
    $arguments = @(
        "--headless=new",
        "--disable-gpu",
        "--no-pdf-header-footer",
        "--user-data-dir=$profile",
        "--generate-pdf-document-outline",
        "--print-to-pdf=$temporaryPdf",
        $bookUri
    )
    $process = Start-Process `
        -FilePath $browser `
        -ArgumentList $arguments `
        -Wait `
        -PassThru `
        -WindowStyle Hidden `
        -RedirectStandardOutput $stdout `
        -RedirectStandardError $stderr
    if ($process.ExitCode -ne 0) {
        $details = Get-Content -LiteralPath $stderr -Raw -ErrorAction SilentlyContinue
        throw "Browser PDF rendering failed with exit code $($process.ExitCode): $details"
    }

    Start-Sleep -Seconds 2
    if (-not (Test-Path -LiteralPath $temporaryPdf -PathType Leaf)) {
        throw "Browser completed without creating the PDF: $temporaryPdf"
    }

    $validation = & (Join-Path $PSScriptRoot "check_book_proof_pdf.ps1") `
        -Edition $Edition `
        -PdfPath $temporaryPdf `
        -ExpectedSourceCommit $sourceCommit `
        -RequireCleanSource:$RequireCleanSource
    if ($LASTEXITCODE -ne 0 -or $null -eq $validation) {
        throw "Lexicon PDF acceptance did not return a result"
    }
    $browserVersion = (Get-Item -LiteralPath $browser).VersionInfo.ProductVersion
    $sidecar = [ordered]@{
        artifact = "Lexicon-book-proof-$Edition.pdf"
        edition = $Edition
        status = "internally validated projection; not reader-outcome evidence"
        source_commit = $sourceCommit
        workspace_dirty_at_render = $sourceStatus.Count -ne 0
        browser = $browserVersion.Trim()
        pdf = $validation
    }
    [System.IO.File]::WriteAllText(
        $temporarySidecar,
        ($sidecar | ConvertTo-Json -Depth 5),
        [System.Text.UTF8Encoding]::new($false)
    )
    Move-Item -LiteralPath $temporaryPdf -Destination $OutputPath -Force
    Move-Item -LiteralPath $temporarySidecar -Destination $sidecarPath -Force

    $file = Get-Item -LiteralPath $OutputPath
    $hash = (Get-FileHash -LiteralPath $OutputPath -Algorithm SHA256).Hash
    Write-Output "pdf=$($file.FullName)"
    Write-Output "bytes=$($file.Length)"
    Write-Output "sha256=$hash"
    Write-Output "pages=$($validation.pages)"
    Write-Output "collisions=$($validation.collision_pages.Count)"
    Write-Output "manifest=$sidecarPath"
}
finally {
    if (Test-Path -LiteralPath $temporaryPdf) {
        Remove-Item -LiteralPath $temporaryPdf -Force
    }
    if (Test-Path -LiteralPath $temporarySidecar) {
        Remove-Item -LiteralPath $temporarySidecar -Force
    }
    if (Test-Path -LiteralPath $profile) {
        Remove-Item -LiteralPath $profile -Recurse -Force
    }
}
