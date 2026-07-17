---
name: safety-governor
description: Add safety, security, permission, privacy, compliance, and operational guardrails to AI agents, skills, RAG systems, model gateways, UI generation, cybersecurity workflows, and automation. Use when the user asks for safety, secure defaults, policy gates, approvals, threat controls, data handling, compliance, abuse prevention, or production readiness.
---

# Safety Governor

Make the toolkit safe by default. Add guardrails before capability expansion.

## Safety Pass

1. Identify assets: code, data, credentials, models, prompts, tools, users, external systems.
2. Identify side effects: file writes, network calls, publishing, spending, deleting, credential use, tool execution.
3. Define approval gates for destructive, costly, external, or security-sensitive actions.
4. Define data rules for secrets, PII, customer data, prompt logs, and retrieved documents.
5. Define abuse boundaries and refusal behavior.
6. Add validation, tests, and observability for the safety claims.
7. Require rollback or fallback for changes that can break production.

## Required Gates

- Human approval before destructive file operations outside the current workspace.
- Human approval before publishing, emailing, posting, buying, deploying, or contacting third parties.
- Secret scanning before committing or shipping generated artifacts.
- Source/citation requirement for factual claims in RAG outputs.
- Read-only default for cybersecurity workflows.
- Tool allowlists for agent actions.

## Output Format

```text
Assets:
Risks:
Controls:
Approval gates:
Fallback:
Rollback:
Verification:
```

## References

- Read `references/safety-controls.md` for controls by subsystem.
