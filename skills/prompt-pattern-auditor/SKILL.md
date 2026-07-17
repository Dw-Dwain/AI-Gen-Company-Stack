---
name: prompt-pattern-auditor
description: Analyze, design, or harden system prompts and agent instructions using public prompt-pattern lessons without redistributing leaked prompt text. Use when reviewing system prompts, agent policies, tool instructions, guardrails, prompt injection defenses, memory rules, developer messages, or when the user mentions system_prompts_leaks, leaked prompts, prompt architecture, or system prompt hardening.
---

# Prompt Pattern Auditor

Use public prompt collections as signals for architecture patterns, not as copy sources. Do not reproduce leaked commercial system prompts.

## Workflow

1. Identify the target: assistant, coding agent, RAG agent, workflow agent, browser agent, or tool-using assistant.
2. Separate instruction layers:
   - identity and role
   - safety and refusal policy
   - tool-use policy
   - browsing/current-information policy
   - memory and persistence policy
   - output format
   - conflict resolution
3. Audit for contradictions, over-broad tool permissions, hidden assumptions, missing refusal boundaries, and unclear precedence.
4. Add injection resistance: quote handling, source trust, tool approval, data exfiltration checks, and untrusted-content boundaries.
5. Produce original prompt text tailored to the user's system.

## Compliance Rule

Never embed leaked provider prompts in this plugin or generated deliverables. Summarize patterns and create original instructions.

## References

- Read `references/prompt-hardening.md` for audit checks and safe pattern extraction.
