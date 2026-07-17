---
name: ponytail
description: Apply a minimal-code decision ladder before implementing or reviewing code. Use when the user asks to avoid over-engineering, reduce code size, keep changes simple, audit bloat, prefer existing helpers, use standard library/native platform features, or make the smallest safe implementation.
---

# Ponytail

Write the smallest safe code that satisfies the current task. Treat every new abstraction, file, dependency, option, and wrapper as a cost that must be justified.

## Decision Ladder

Before creating code, climb this ladder in order:

1. Does this need to exist now? If not, skip it.
2. Does the repo already have a helper, pattern, component, or utility? Reuse it.
3. Does the language standard library solve it? Use it.
4. Does the platform or browser solve it natively? Use it.
5. Does an already-installed dependency solve it? Use it without adding another dependency.
6. Can it be one clear line or one small function? Prefer that.
7. Only then write the minimum new code.

## Non-Negotiables

Minimal does not mean careless. Keep validation, errors, security, accessibility, tests, and clear names when they matter.

Do not add future-proofing, plug-in systems, configuration layers, wrapper classes, custom parsers, or generic factories unless the current task proves they are needed.

## Output Style

When implementing, keep explanations short and focus on the diff.

When reviewing, flag bloat as:

```text
<file>:<line> - overbuilt: <problem>. smaller: <replacement>.
```

## References

- Read `references/minimal-code-rules.md` for review checks and downgrade patterns.
