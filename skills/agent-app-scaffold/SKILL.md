---
name: agent-app-scaffold
description: Scaffold or plan a production AI agent application using Pydantic AI, LangGraph/LangChain, smolagents, LiteLLM, and optional LlamaIndex retrieval. Use when building typed agents, multi-agent workflows, content operators, writing agents, research agents, workflow automation, or MVP agent applications.
---

# Agent App Scaffold

Create original starter architecture and code plans for agent applications. Select the smallest framework set that satisfies the requested behavior.

## Workflow

1. Determine whether the app is a single agent, stateful workflow, multi-agent system, or quick prototype.
2. Pick the framework:
   - Pydantic AI for typed production agents.
   - LangGraph for workflow state and branching.
   - smolagents for small code-executing prototypes.
3. Add LiteLLM when more than one model provider or cost control is expected.
4. Add LlamaIndex only when private documents or citations are required.
5. Define interfaces before implementation: request schema, response schema, tools, memory, persistence, evals.
6. Generate code in the user's existing stack when a repo exists.

## Guardrails

- Keep agent calls deterministic where possible with schemas, validators, and eval fixtures.
- Keep provider-specific API calls behind one adapter or LiteLLM.
- Treat tools as explicit capabilities with names, input schemas, side effects, and failure modes.
- Include human approval for actions that publish, delete, spend money, or contact users.

## References

- Read `references/scaffold-patterns.md` for framework-specific skeletons and folder layouts.
