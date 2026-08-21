param(
    [string]$Edition = "sim-67",
    [string]$PdfPath = "",
    [string]$ExpectedSourceCommit = "",
    [switch]$RequireCleanSource
)

$ErrorActionPreference = "Stop"
$workspace = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
if ([string]::IsNullOrWhiteSpace($PdfPath)) {
    $PdfPath = Join-Path $workspace "target\proof-set-$Edition\Lexicon-book-proof-$Edition.pdf"
}
elseif (-not [System.IO.Path]::IsPathRooted($PdfPath)) {
    $PdfPath = Join-Path $workspace $PdfPath
}
$PdfPath = [System.IO.Path]::GetFullPath($PdfPath)

if (-not (Test-Path -LiteralPath $PdfPath -PathType Leaf)) {
    throw "Missing Lexicon book proof: $PdfPath"
}

$sourceCommit = (git -C $workspace rev-parse HEAD).Trim()
if ([string]::IsNullOrWhiteSpace($ExpectedSourceCommit)) {
    $sidecarPath = "$PdfPath.manifest.json"
    if (Test-Path -LiteralPath $sidecarPath -PathType Leaf) {
        $sidecar = Get-Content -LiteralPath $sidecarPath -Raw | ConvertFrom-Json
        $ExpectedSourceCommit = [string]$sidecar.source_commit
    }
    if ([string]::IsNullOrWhiteSpace($ExpectedSourceCommit)) {
        $ExpectedSourceCommit = $sourceCommit
    }
}
git -C $workspace cat-file -e "$ExpectedSourceCommit`^{commit}" 2>$null
if ($LASTEXITCODE -ne 0) {
    throw "Expected source commit is not available in this repository: $ExpectedSourceCommit"
}
$gitStatus = @(git -C $workspace status --porcelain --untracked-files=all)
if ($RequireCleanSource -and $gitStatus.Count -ne 0) {
    throw "Lexicon PDF acceptance requires a clean source tree; found $($gitStatus.Count) changed paths"
}

$pdfToHtml = (Get-Command pdftohtml -ErrorAction Stop).Source
$pdfToolDirectory = Split-Path $pdfToHtml
$pdfInfo = Join-Path $pdfToolDirectory "pdfinfo.exe"
$pdfToText = Join-Path $pdfToolDirectory "pdftotext.exe"
$pdfFonts = Join-Path $pdfToolDirectory "pdffonts.exe"
foreach ($tool in @($pdfInfo, $pdfToText, $pdfFonts)) {
    if (-not (Test-Path -LiteralPath $tool -PathType Leaf)) {
        throw "Missing PDF acceptance tool: $tool"
    }
}

$temporaryDirectory = Join-Path (
    [System.IO.Path]::GetTempPath()
) ("lexicon-pdf-check-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $temporaryDirectory | Out-Null

try {
    $infoText = (& $pdfInfo $PdfPath 2>$null) -join "`n"
    if ($LASTEXITCODE -ne 0) {
        throw "pdfinfo failed for $PdfPath"
    }
    $pageMatch = [regex]::Match($infoText, '(?m)^Pages:\s+(\d+)\s*$')
    if (-not $pageMatch.Success) {
        throw "PDF page count is unavailable"
    }
    $pageCount = [int]$pageMatch.Groups[1].Value
    if ($pageCount -lt 100) {
        throw "Unexpectedly short Lexicon proof: $pageCount pages"
    }
    foreach ($requiredInfo in @(
        '(?m)^Title:\s+Lexicon\s*$',
        '(?m)^Tagged:\s+yes\s*$',
        '(?m)^Encrypted:\s+no\s*$'
    )) {
        if ($infoText -notmatch $requiredInfo) {
            throw "PDF metadata requirement failed: $requiredInfo"
        }
    }

    $textPath = Join-Path $temporaryDirectory "book.txt"
    & $pdfToText -layout $PdfPath $textPath 2>$null
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $textPath)) {
        throw "PDF text extraction failed"
    }
    $bookText = Get-Content -LiteralPath $textPath -Raw
    foreach ($requiredText in @(
        "Lexicon",
        "Internal proof",
        "Canonical Tables",
        "Pointer index",
        "Colophon",
        $ExpectedSourceCommit
    )) {
        if ($bookText.IndexOf(
                $requiredText,
                [System.StringComparison]::OrdinalIgnoreCase
            ) -lt 0) {
            throw "PDF is missing required text: $requiredText"
        }
    }

    $fontText = (& $pdfFonts $PdfPath 2>$null) -join "`n"
    if ($LASTEXITCODE -ne 0) {
        throw "pdffonts failed for $PdfPath"
    }
    $fontRows = [regex]::Matches(
        $fontText,
        '(?m)^\S.*?\s+(yes|no)\s+(yes|no)\s+(yes|no)\s+\d+\s+\d+\s*$'
    )
    if ($fontRows.Count -eq 0) {
        throw "PDF font inventory is unavailable"
    }
    foreach ($fontRow in $fontRows) {
        if ($fontRow.Groups[1].Value -ne "yes" -or $fontRow.Groups[3].Value -ne "yes") {
            throw "PDF contains a non-embedded font or a font without Unicode mapping: $($fontRow.Value)"
        }
    }

    $xmlPrefix = Join-Path $temporaryDirectory "book"
    & $pdfToHtml -xml -hidden -nodrm -noframes $PdfPath $xmlPrefix 2>$null | Out-Null
    $xmlPath = "$xmlPrefix.xml"
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $xmlPath)) {
        throw "PDF layout extraction failed"
    }
    [xml]$layout = Get-Content -LiteralPath $xmlPath -Raw
    $collisionPages = [System.Collections.Generic.List[int]]::new()
    $outOfBoundsPages = [System.Collections.Generic.List[int]]::new()
    foreach ($page in $layout.pdf2xml.page) {
        $pageWidth = [int]$page.width
        $items = @(
            $page.text |
                ForEach-Object {
                    [pscustomobject]@{
                        Top = [int]$_.top
                        Left = [int]$_.left
                        Width = [int]$_.width
                        Height = [int]$_.height
                        Text = $_.InnerText.Trim()
                    }
                } |
                Where-Object { -not [string]::IsNullOrWhiteSpace($_.Text) } |
                Sort-Object Top, Left
        )
        $pageHasCollision = $false
        $pageHasOutOfBoundsText = $false
        for ($index = 0; $index -lt $items.Count; $index++) {
            $left = $items[$index]
            if ($left.Left -lt 20 -or ($left.Left + $left.Width) -gt ($pageWidth - 20)) {
                $pageHasOutOfBoundsText = $true
            }
            for ($otherIndex = $index + 1; $otherIndex -lt $items.Count; $otherIndex++) {
                $right = $items[$otherIndex]
                if ($right.Top -ge ($left.Top + $left.Height)) {
                    break
                }
                $horizontalOverlap = [Math]::Min(
                    $left.Left + $left.Width,
                    $right.Left + $right.Width
                ) - [Math]::Max($left.Left, $right.Left)
                $verticalOverlap = [Math]::Min(
                    $left.Top + $left.Height,
                    $right.Top + $right.Height
                ) - [Math]::Max($left.Top, $right.Top)
                if ($horizontalOverlap -gt 3 -and
                    $verticalOverlap -gt 3 -and
                    $left.Text -ne $right.Text) {
                    $pageHasCollision = $true
                    break
                }
            }
            if ($pageHasCollision) {
                break
            }
        }
        if ($pageHasCollision) {
            $collisionPages.Add([int]$page.number)
        }
        if ($pageHasOutOfBoundsText) {
            $outOfBoundsPages.Add([int]$page.number)
        }
    }
    if ($collisionPages.Count -ne 0) {
        throw "PDF text collisions detected on pages: $($collisionPages -join ', ')"
    }
    if ($outOfBoundsPages.Count -ne 0) {
        throw "PDF text outside page bounds detected on pages: $($outOfBoundsPages -join ', ')"
    }

    [pscustomobject]@{
        edition = $Edition
        source_commit = $ExpectedSourceCommit
        workspace_dirty = $gitStatus.Count -ne 0
        pages = $pageCount
        bytes = (Get-Item -LiteralPath $PdfPath).Length
        sha256 = (Get-FileHash -LiteralPath $PdfPath -Algorithm SHA256).Hash.ToLowerInvariant()
        fonts = $fontRows.Count
        text_characters = $bookText.Length
        collision_pages = @($collisionPages)
        out_of_bounds_pages = @($outOfBoundsPages)
        status = "pass"
    }
}
finally {
    if (Test-Path -LiteralPath $temporaryDirectory) {
        Remove-Item -LiteralPath $temporaryDirectory -Recurse -Force
    }
}
