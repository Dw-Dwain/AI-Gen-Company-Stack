param(
  [Parameter(Mandatory=$true)][string]$Task,
  [Parameter(Mandatory=$true)][string]$Outcome,
  [string]$Route = "unknown",
  [string]$Verification = "not recorded",
  [string]$Lesson = "not recorded",
  [string]$ProposedChange = "none"
)

$ErrorActionPreference = "Stop"
$stateDir = Join-Path $env:USERPROFILE ".ai-gen-company-stack"
New-Item -ItemType Directory -Force -Path $stateDir | Out-Null
$ledger = Join-Path $stateDir "learning-ledger.md"
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

@"
## $date

Task: $Task
Route: $Route
Outcome: $Outcome
Verification: $Verification
Lesson: $Lesson
Proposed change: $ProposedChange
Approval: pending
Applied: no

"@ | Add-Content -Path $ledger -Encoding UTF8

Write-Host "[ai-gen-company-stack] learned entry appended: $ledger"
