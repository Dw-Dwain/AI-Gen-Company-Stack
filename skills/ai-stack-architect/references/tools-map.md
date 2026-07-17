# Tool Map

Use this as a routing table. Verify upstream licenses before shipping a derived product.

| Tool | Upstream license signal | Primary role |
|---|---:|---|
| Pydantic AI | MIT | Typed production agents, structured output, validation, model abstraction |
| LangGraph/LangChain | MIT | Stateful agent workflows, tool orchestration, memory, human-in-the-loop flows |
| LlamaIndex | MIT | RAG, document ingestion, citation-backed answers, data agents |
| smolagents | Apache-2.0 | Lightweight code agents and tool-using prototypes |
| AnythingLLM | MIT | Local-first AI workspace and private RAG product base |
| Flowise Community | Apache-2.0 with enterprise-code caveats | Visual workflow and chatbot builder |
| LiteLLM | MIT outside enterprise restrictions | Unified model gateway, routing, fallback, budgets |
| vLLM | Apache-2.0 | High-throughput open-source LLM serving |
| Agent Skills patterns | Mixed; many Apache-2.0 examples | Portable task instructions, reusable company workflows |

## Ownership Model

Treat this plugin as company-owned guidance. Do not vendor upstream project code into generated deliverables unless the user explicitly asks and the license is reviewed. Prefer generating original scaffold code that imports packages as dependencies.

## Product Archetypes

| Product | Recommended base |
|---|---|
| AI writing studio | Pydantic AI, LlamaIndex, LiteLLM, Agent Skills |
| Agentic content operator | LangGraph, Pydantic AI, LiteLLM, Agent Skills |
| Company knowledge copilot | LlamaIndex, AnythingLLM, LiteLLM |
| No-code workflow builder | Flowise Community, LiteLLM, LlamaIndex |
| Private model platform | vLLM, LiteLLM, observability |
| Agent prototype lab | smolagents, LiteLLM |
| Company workflow library | Agent Skills, Pydantic AI for structured tasks |
