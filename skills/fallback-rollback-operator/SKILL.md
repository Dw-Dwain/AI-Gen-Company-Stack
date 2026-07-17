---
name: fallback-rollback-operator
description: Design and execute fallback and rollback plans for plugins, skills, prompts, model gateways, RAG indexes, deployments, UI changes, and automation workflows. Use when the user asks for fallbacks, rollback, recovery, safe deploys, versioning, backups, canaries, kill switches, degraded modes, or undo plans.
---

# Fallback Rollback Operator

Never ship a risky AI system change without a way back.

## Workflow

1. Identify what can fail: dependency, model provider, local model, vector index, prompt, tool call, UI, deployment, data migration.
2. Define fallback path: lower capability, alternate provider, cached result, read-only mode, previous prompt, previous skill version, manual workflow.
3. Define rollback trigger: failed tests, elevated error rate, cost spike, safety violation, user report, quality regression.
4. Define rollback action: restore backup, revert version, disable skill, switch provider, restore index, stop automation.
5. Define verification: healthcheck, smoke test, eval pass, user-visible confirmation.

## Output Format

```text
Change:
Failure modes:
Fallback:
Rollback trigger:
Rollback steps:
Verification:
Owner:
```

## References

- Read `references/rollback-patterns.md` for subsystem-specific rollback patterns.
