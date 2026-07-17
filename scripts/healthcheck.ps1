$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

Write-Host "[ai-gen-company-stack] checking JSON"
Get-Content (Join-Path $Root ".codex-plugin\plugin.json") -Raw | ConvertFrom-Json | Out-Null
Get-Content (Join-Path $Root ".claude-plugin\plugin.json") -Raw | ConvertFrom-Json | Out-Null
Get-Content (Join-Path $Root ".claude-plugin\marketplace.json") -Raw | ConvertFrom-Json | Out-Null

Write-Host "[ai-gen-company-stack] checking skills"
$errors = @()
Get-ChildItem (Join-Path $Root "skills") -Directory | ForEach-Object {
  $skillFile = Join-Path $_.FullName "SKILL.md"
  if (-not (Test-Path -LiteralPath $skillFile)) {
    $errors += "missing SKILL.md: $($_.Name)"
    return
  }
  $text = Get-Content -LiteralPath $skillFile -Raw
  if ($text -notmatch "(?s)^---\s*\r?\nname:\s*[-a-z0-9]+\s*\r?\ndescription:\s*.+?\r?\n---") {
    $errors += "bad frontmatter: $($_.Name)"
  }
}
if ($errors.Count -gt 0) {
  $errors | ForEach-Object { Write-Error $_ }
  exit 1
}

$claude = Get-Command claude -ErrorAction SilentlyContinue
if ($claude) {
  Write-Host "[ai-gen-company-stack] validating Claude plugin"
  & claude plugin validate $Root
}

Write-Host "[ai-gen-company-stack] healthcheck passed"
