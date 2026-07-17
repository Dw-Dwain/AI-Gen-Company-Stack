# Compliance Matrix

This plugin is intended to be redistributed as Dwain-owned guidance. It should not vendor upstream source content unless the license and attribution requirements are reviewed.

| Source | License signal checked | Safe use in this plugin |
|---|---:|---|
| Pydantic AI | MIT | Reference as dependency/integration target |
| LangGraph/LangChain | MIT | Reference as dependency/integration target |
| LlamaIndex | MIT | Reference as dependency/integration target |
| smolagents | Apache-2.0 | Reference as dependency/integration target |
| AnythingLLM | MIT | Reference as dependency/integration target |
| Flowise Community | Apache-2.0 with enterprise caveats | Reference community edition only; avoid enterprise code |
| LiteLLM | MIT outside enterprise restrictions | Reference OSS gateway patterns |
| vLLM | Apache-2.0 | Reference serving patterns |
| Agent Skills examples | Mixed | Reuse pattern only; verify per skill before copying |
| minimal (minimal-code skill) | Owned original | No vendored content, no third-party affiliation |
| brevity (terse-output skill) | Owned original | No vendored content, no third-party affiliation |
| signature-design-ui (UI-quality skill) | Owned original | No vendored content, no third-party affiliation |
| Anthropic-Cybersecurity-Skills | Apache-2.0 | Original defensive router; optionally install upstream separately |
| system_prompts_leaks | CC0 signal | Pattern analysis only; do not redistribute leaked prompt contents |

## Distribution Rules

- Keep `LICENSE` and `NOTICE`.
- If vendoring Apache-2.0 content later, include upstream LICENSE and NOTICE where required.
- If vendoring MIT content later, retain copyright and permission notice.
- Avoid redistributing leaked commercial system prompts; summarize defensive patterns instead.
- Treat cybersecurity workflows as authorized defensive guidance only.
