# Contributing

Contributions are welcome if they keep the project original, safe, and redistributable.

## Rules

- Do not copy upstream skill files, scripts, docs, or assets into this repo unless the license has been reviewed and attribution is added.
- Do not add leaked proprietary system prompts.
- Keep cybersecurity content defensive and authorized.
- Keep skills concise and route detailed guidance into `references/`.
- Run the healthcheck before opening a pull request:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\healthcheck.ps1
```

## Skill Format

Each skill must have:

```text
skills/<skill-name>/SKILL.md
```

Use YAML frontmatter:

```yaml
---
name: skill-name
description: Trigger-focused description.
---
```

Optional:

```text
skills/<skill-name>/references/
skills/<skill-name>/agents/openai.yaml
```
