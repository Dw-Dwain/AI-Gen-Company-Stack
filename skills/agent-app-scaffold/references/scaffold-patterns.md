# Scaffold Patterns

## Pydantic AI Single Agent

Use for extraction, writing, classification, support, or content tasks with strict output shape.

Suggested modules:

```text
app/
  agents/
    content_agent.py
  models/
    requests.py
    outputs.py
  tools/
  evals/
  main.py
```

Design requirements:

- Define Pydantic models for input and output.
- Put model/provider settings in environment config.
- Add small fixture-based evals for common prompts.

## LangGraph Workflow

Use for multi-step flows, retries, review gates, and workflow memory.

Suggested nodes:

- `intake`
- `research`
- `draft`
- `critique`
- `revise`
- `human_review`
- `publish_or_export`

Each node should have typed state transitions and bounded responsibilities.

## smolagents Prototype

Use for experiments where code execution is the core capability. Keep these separate from production until sandboxing and approval are explicit.

Minimum controls:

- Isolate file and network access.
- Log generated code before execution.
- Require approval for destructive commands.

## LiteLLM Provider Layer

Use LiteLLM as the only model endpoint when supporting multiple providers. Applications should request capabilities such as `cheap-fast`, `reasoning`, `long-context`, or `local-private` rather than hard-coding model names throughout the codebase.
