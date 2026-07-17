param(
  [string]$BackupPath
)

$ErrorActionPreference = "Stop"
$codexSkills = Join-Path $env:USERPROFILE ".codex\skills"
$backupRoot = Join-Path $env:USERPROFILE ".ai-gen-company-stack\backups"

if (-not $BackupPath) {
  $latestFile = Join-Path $backupRoot "latest-codex-backup.txt"
  if (-not (Test-Path -LiteralPath $latestFile)) {
    throw "No latest backup pointer found at $latestFile"
  }
  $BackupPath = (Get-Content -LiteralPath $latestFile -Raw).Trim()
}

if (-not (Test-Path -LiteralPath $BackupPath)) {
  throw "Backup path not found: $BackupPath"
}

$resolvedSkills = [System.IO.Path]::GetFullPath($codexSkills)
$resolvedBackup = [System.IO.Path]::GetFullPath($BackupPath)
if (-not $resolvedBackup.StartsWith([System.IO.Path]::GetFullPath($backupRoot), [System.StringComparison]::OrdinalIgnoreCase)) {
  throw "Refusing backup outside expected backup root: $resolvedBackup"
}

Write-Host "[ai-gen-company-stack] restoring Codex skills from $resolvedBackup"
Get-ChildItem -LiteralPath $resolvedBackup -Directory | ForEach-Object {
  $target = Join-Path $codexSkills $_.Name
  $resolvedTarget = [System.IO.Path]::GetFullPath($target)
  if (-not $resolvedTarget.StartsWith($resolvedSkills, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing target outside Codex skills root: $resolvedTarget"
  }
  if (Test-Path -LiteralPath $target) {
    Remove-Item -LiteralPath $target -Recurse -Force
  }
  Copy-Item -LiteralPath $_.FullName -Destination $target -Recurse
  Write-Host "[ai-gen-company-stack] restored $($_.Name)"
}
Write-Host "[ai-gen-company-stack] rollback complete"
