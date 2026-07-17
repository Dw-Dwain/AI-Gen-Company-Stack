param(
  [Parameter(Mandatory=$true, ParameterSetName='Log')][string]$Task,
  [Parameter(Mandatory=$true, ParameterSetName='Log')][string]$Outcome,
  [Parameter(ParameterSetName='Log')][string]$Route = "unknown",
  [Parameter(ParameterSetName='Log')][string]$Verification = "not recorded",
  [Parameter(ParameterSetName='Log')][string]$Lesson = "not recorded",
  [Parameter(ParameterSetName='Log')][string]$ProposedChange = "none",
  [Parameter(ParameterSetName='SelfTest')][switch]$SelfTest
)

$ErrorActionPreference = "Stop"

# minimal: best-effort secret scrub before anything reaches the ledger. Not a full
# DLP engine; extend $tokenPatterns if a new key format shows up. Enforces the
# "No secrets in learning-loop logs" rule in SECURITY.md.
function Protect-Secrets([string]$Value) {
  if ([string]::IsNullOrEmpty($Value)) { return $Value }
  $tokenPatterns = @(
    'sk-ant-[A-Za-z0-9\-_]{16,}',                                   # Anthropic keys
    'sk-[A-Za-z0-9]{16,}',                                          # OpenAI-style keys
    'AKIA[0-9A-Z]{16}',                                             # AWS access key id
    'gh[pousr]_[A-Za-z0-9]{20,}',                                   # GitHub tokens
    'xox[baprs]-[A-Za-z0-9-]{10,}',                                 # Slack tokens
    'eyJ[A-Za-z0-9_\-]{8,}\.[A-Za-z0-9_\-]{8,}\.[A-Za-z0-9_\-]{8,}' # JWTs
  )
  foreach ($p in $tokenPatterns) {
    $Value = [regex]::Replace($Value, $p, '[REDACTED]')
  }
  # key: value / key=value where the key names a secret. Keep the key, drop the value.
  $Value = [regex]::Replace(
    $Value,
    '(?i)((?:api[_-]?key|secret|token|password|passwd|pwd|bearer|authorization)\s*[:=]\s*)("?)([^\s"]+)',
    '${1}[REDACTED]'
  )
  return $Value
}

if ($SelfTest) {
  $sample = 'leaked sk-ABCDEFGHIJKLMNOPQRSTUVWXYZ012345 and password=hunter2 plus token: abc123def456'
  $red = Protect-Secrets $sample
  if ($red -match 'sk-ABCDEF' -or $red -match 'hunter2' -or $red -match 'abc123def456') {
    Write-Error "SelfTest FAILED: secret survived redaction -> $red"
    exit 1
  }
  Write-Host "[ai-gen-company-stack] learn.ps1 redaction self-test passed"
  exit 0
}

$Task = Protect-Secrets $Task
$Outcome = Protect-Secrets $Outcome
$Route = Protect-Secrets $Route
$Verification = Protect-Secrets $Verification
$Lesson = Protect-Secrets $Lesson
$ProposedChange = Protect-Secrets $ProposedChange

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

Write-Host "[ai-gen-company-stack] learned entry appended (secrets redacted): $ledger"
