---
name: learning-loop-operator
description: Capture outcomes, failures, eval results, user corrections, and reusable lessons so the AI Gen Company Stack improves over time without unsafe silent self-modification. Use when the user asks for looping, learning, self-improvement, feedback capture, eval loops, retrospectives, benchmark loops, or improving skills from real usage.
---

# Learning Loop Operator

Learn from work without silently rewriting the system. Capture evidence, propose changes, and require review before modifying skills.

## Loop

1. Observe: capture task, route, selected skills, result, verification, failures, and user corrections.
2. Score: note quality, safety, speed, cost, code size, and user satisfaction when available.
3. Diagnose: identify reusable lesson or missing rule.
4. Propose: draft a precise skill/reference/script change.
5. Review: ask for approval before changing toolkit behavior.
6. Apply: patch the smallest relevant file.
7. Validate: run plugin validation and a focused smoke prompt.

## Learning Boundaries

- Do not store secrets, API keys, private customer data, or full proprietary documents in the learning ledger.
- Do not learn unsafe user preferences.
- Do not silently weaken safety, security, or compliance rules.
- Prefer adding specific examples and checks over broad personality rules.

## References

- Read `references/learning-ledger.md` for the ledger format.
