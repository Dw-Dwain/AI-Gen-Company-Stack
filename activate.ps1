param(
  [ValidateSet("lite", "full", "ultra")]
  [string]$Brevity = "full"
)

$ErrorActionPreference = "Stop"
$stateDir = Join-Path $env:USERPROFILE ".ai-gen-company-stack"
New-Item -ItemType Directory -Force -Path $stateDir | Out-Null

@{
  suite = "on"
  ponytail = "on"
  hallmark_design_ui = "on"
  cybersecurity_defensive_only = "on"
  prompt_leak_redistribution = "off"
  caveman_brevity = $Brevity
} | ConvertTo-Json | Set-Content -Path (Join-Path $stateDir "state.json") -Encoding UTF8

Write-Host "[ai-gen-company-stack] activated. State: $stateDir\state.json"
