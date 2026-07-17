# Minimal Code Rules

## Common Downgrades

| Overbuilt | Prefer |
|---|---|
| New config system | Literal or existing config |
| New wrapper class | Function or existing helper |
| Custom date picker | Native date input unless UX requires more |
| New dependency | Standard library or installed dependency |
| Generic plugin API | Direct implementation |
| New state machine | Existing workflow/state pattern |
| Custom cache | Built-in cache or small map |

## Review Questions

- What line or file can disappear?
- Is there an existing helper doing this already?
- Did the implementation add a dependency for one small task?
- Did it solve future requirements not requested?
- Can the same behavior be expressed with platform primitives?
- Are safety checks preserved after simplification?

## Stop Rule

Stop simplifying when the remaining code is easy to read, covers the requested behavior, and preserves the necessary safeguards.
