param(
  [switch]$ClaudeOnly,
  [switch]$CodexOnly,
  [switch]$SkipClaude,
  [switch]$SkipCodex,
  [switch]$NoBackup
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$PluginName = "ai-gen-company-stack"
$MarketplaceName = "dwain-ai-gen"

function Write-Step($Message) {
  Write-Host "[ai-gen-company-stack] $Message"
}

function Assert-UnderPath($Path, $Parent) {
  $resolvedParent = [System.IO.Path]::GetFullPath($Parent)
  $resolvedPath = [System.IO.Path]::GetFullPath($Path)
  if (-not $resolvedPath.StartsWith($resolvedParent, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to modify path outside expected parent: $resolvedPath"
  }
}

if (-not $CodexOnly -and -not $SkipClaude) {
  $claude = Get-Command claude -ErrorAction SilentlyContinue
  if ($claude) {
    Write-Step "validating Claude plugin"
    & claude plugin validate $Root

    Write-Step "adding Claude marketplace from $Root"
    & claude plugin marketplace add $Root

    Write-Step "installing Claude plugin $PluginName@$MarketplaceName"
    & claude plugin install "$PluginName@$MarketplaceName"

    Write-Step "enabling Claude plugin $PluginName"
    & claude plugin enable $PluginName
  } else {
    Write-Step "claude command not found; skipping Claude install"
  }
}

if (-not $ClaudeOnly -and -not $SkipCodex) {
  $codexSkills = Join-Path $env:USERPROFILE ".codex\skills"
  $backupRoot = Join-Path $env:USERPROFILE ".ai-gen-company-stack\backups"
  $stamp = Get-Date -Format "yyyyMMdd-HHmmss"
  $backupDir = Join-Path $backupRoot "codex-skills-$stamp"
  New-Item -ItemType Directory -Force -Path $codexSkills | Out-Null
  if (-not $NoBackup) {
    New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
  }

  Write-Step "installing Codex skills to $codexSkills"
  Get-ChildItem -Path (Join-Path $Root "skills") -Directory | ForEach-Object {
    $target = Join-Path $codexSkills $_.Name
    Assert-UnderPath -Path $target -Parent $codexSkills
    if (Test-Path -LiteralPath $target) {
      if (-not $NoBackup) {
        $backupTarget = Join-Path $backupDir $_.Name
        Copy-Item -LiteralPath $target -Destination $backupTarget -Recurse
        Write-Step "backed up Codex skill $($_.Name)"
      }
      Remove-Item -LiteralPath $target -Recurse -Force
    }
    Copy-Item -LiteralPath $_.FullName -Destination $target -Recurse
    Write-Step "installed Codex skill $($_.Name)"
  }
  if (-not $NoBackup) {
    Set-Content -Path (Join-Path $backupRoot "latest-codex-backup.txt") -Value $backupDir -Encoding UTF8
    Write-Step "Codex backup: $backupDir"
  }
}

Write-Step "done"
