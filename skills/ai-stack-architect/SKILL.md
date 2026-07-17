---
name: ai-stack-architect
description: Select and design a company-owned AI generation stack using Pydantic AI, LangGraph/LangChain, LlamaIndex, smolagents, AnythingLLM, Flowise Community, LiteLLM, vLLM, and Agent Skills patterns. Use when planning AI products, writing systems, agent platforms, RAG assistants, model gateways, self-hosted LLM infrastructure, or deciding which open-source AI tools to build upon.
---

# AI Stack Architect

Design practical AI product architecture from the nine-tool stack. Prefer original architecture and integration guidance over copying upstream code.

## Workflow

1. Identify the product class: writing studio, content operator, knowledge copilot, visual workflow builder, LLM gateway, self-hosted model platform, internal agent platform, or reusable skills library.
2. Select the minimum tool set needed.
3. State why each selected tool belongs in the system and what it should not own.
4. Draw module boundaries: UI, workflow orchestration, retrieval, model gateway, inference, storage, evals, observability, and skill packaging.
5. Flag license and commercial-use notes before implementation.
6. Produce an implementation sequence with a thin MVP first.

## Tool Selection Rules

- Use Pydantic AI when typed inputs, validated outputs, or structured tool calls are central.
- Use LangGraph/LangChain when the workflow needs state, branches, retries, human approval, multi-step orchestration, or long-running agents.
- Use LlamaIndex when documents, retrieval, citations, parsing, OCR, or knowledge-base Q&A are central.
- Use smolagents when the user wants small code-executing agents or fast prototypes.
- Use AnythingLLM when the user wants a ready local/private workspace experience.
- Use Flowise Community when non-engineers need to inspect or assemble workflows visually.
- Use LiteLLM when multiple model providers, fallbacks, usage accounting, OpenAI-compatible routing, or tenant keys are needed.
- Use vLLM when self-hosted open-source LLM serving, throughput, batching, or private inference is needed.
- Use Agent Skills patterns when the company needs repeatable workflows, brand voice, operating procedures, or tool-specific agent behavior.

## References

- Read `references/tools-map.md` for the tool map, license notes, and product archetypes.
- Read `references/architecture-patterns.md` for recommended combinations.
