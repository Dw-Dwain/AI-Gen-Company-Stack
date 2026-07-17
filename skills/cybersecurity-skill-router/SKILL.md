---
name: cybersecurity-skill-router
description: Route authorized defensive cybersecurity work into structured investigation, detection, hardening, incident response, AI security, cloud security, supply-chain security, and compliance workflows. Use when the user asks for security review, threat modeling, vulnerability triage, incident analysis, MITRE ATT&CK mapping, NIST CSF mapping, AI red-team defense, prompt injection defense, malware/forensics analysis, or secure agent design.
---

# Cybersecurity Skill Router

Provide defensive, authorized security guidance. Scope first, then choose a workflow and evidence model.

## Safety And Authorization

Proceed only for owned systems, authorized assessments, defensive analysis, or educational hardening. Refuse or redirect requests that enable credential theft, stealth, persistence, malware deployment, unauthorized exploitation, or evasion.

## Routing Workflow

1. Confirm scope: asset, owner, authorization, environment, and constraints.
2. Classify domain:
   - application security
   - cloud security
   - identity and access
   - detection engineering
   - incident response
   - digital forensics
   - supply-chain security
   - AI/LLM security
   - governance/compliance
3. Map to frameworks when useful: MITRE ATT&CK, MITRE ATLAS, D3FEND, NIST CSF, NIST AI RMF.
4. Produce a defensive plan: collect evidence, analyze, verify, remediate, monitor.
5. Keep commands read-only by default. Ask before destructive, disruptive, or exploitative steps.

## Output Formats

Investigation:

```text
Scope:
Hypothesis:
Evidence to collect:
Analysis steps:
Likely findings:
Remediation:
Framework mapping:
```

Finding:

```text
Severity:
Evidence:
Impact:
Fix:
Verification:
Framework mapping:
```

## References

- Read `references/security-routing.md` for workflow routing and allowed/blocked boundaries.
