# Skill Patterns

## Minimal Skill

```text
skill-name/
  SKILL.md
```

Use for short workflows where all instructions fit under 150 lines.

## Skill With References

```text
skill-name/
  SKILL.md
  references/
    brand-voice.md
    examples.md
    checklist.md
```

Use when the workflow depends on company policy, examples, brand voice, or quality checks.

## Skill With Scripts

```text
skill-name/
  SKILL.md
  scripts/
    validate_output.py
```

Use only when deterministic execution is valuable. Examples: validate frontmatter, transform CSV, package artifacts, check schema conformance.

## Trigger Description Template

```yaml
---
name: short-hyphen-name
description: Do the concrete workflow. Use when the user asks for [specific tasks], mentions [trigger phrases], or needs [domain output] for [audience/system].
---
```

The description is the routing surface. Put all "when to use" information there.

## Quality Checklist

- The skill name is short and specific.
- The description includes use cases and trigger phrases.
- The body explains what to do, not why skills exist.
- References are linked directly from `SKILL.md`.
- No copied upstream project documentation is included.
- Company-sensitive examples are stored intentionally, not accidentally.
