# Architecture Patterns

## Thin MVP

Use this when speed matters:

1. LiteLLM as the model gateway.
2. Pydantic AI for one typed agent.
3. LlamaIndex only if the agent needs private documents.
4. Add skills for repeatable writing or operating workflows.

## Production Agent Workflow

Use this when work has multiple phases:

1. LangGraph owns workflow state and transitions.
2. Pydantic AI owns individual typed agent calls.
3. LlamaIndex owns retrieval.
4. LiteLLM owns model routing, fallback, and cost controls.
5. Store traces and eval outputs from day one.

## Private AI Platform

Use this when API spend, data control, or latency matters:

1. vLLM serves open-source models.
2. LiteLLM exposes a single OpenAI-compatible endpoint.
3. Application agents call LiteLLM, not vLLM directly.
4. Use hosted providers as fallback until local quality is proven.

## Visual Builder

Use this when non-engineers must inspect or edit flows:

1. Flowise Community owns the visual workflow surface.
2. LiteLLM normalizes model providers.
3. LlamaIndex or a separate ingestion service owns document pipelines.
4. Keep business-critical custom logic in separate services.
