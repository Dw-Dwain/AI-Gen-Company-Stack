---
name: company-skill-author
description: Create company-owned Agent Skills for Claude Code and Codex using reusable workflow patterns inspired by open Agent Skills examples. Use when turning repeated writing, research, SEO, sales, operations, coding, review, brand voice, or content workflows into portable SKILL.md-based skills.
---

# Company Skill Author

Turn repeatable company workflows into portable Agent Skills. Create original skill content that encodes the company's process, templates, policies, and quality bar.

## Workflow

1. Identify the repeated workflow and the user prompts that should trigger it.
2. Choose a concise hyphen-case skill name.
3. Write frontmatter with `name` and a complete trigger-focused `description`.
4. Keep `SKILL.md` short: workflow, decision rules, and references.
5. Move long policies, examples, schemas, or templates into `references/`.
6. Add scripts only for deterministic repeated work.
7. Add Codex-facing `agents/openai.yaml` when useful.
8. Validate YAML, file paths, and whether the skill can be understood without hidden context.

## Company Skill Ideas

- `brand-voice-writer`
- `seo-brief-builder`
- `content-refresh-operator`
- `competitor-researcher`
- `sales-proposal-drafter`
- `support-macro-author`
- `meeting-to-actions`
- `rag-answer-auditor`
- `agent-eval-writer`

## References

- Read `references/skill-patterns.md` for portable skill structures.
