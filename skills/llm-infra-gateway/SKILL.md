---
name: llm-infra-gateway
description: Design LLM infrastructure using LiteLLM and vLLM, with optional Flowise, AnythingLLM, LangGraph, Pydantic AI, and LlamaIndex clients. Use when setting up model routing, OpenAI-compatible gateways, fallback policies, cost controls, tenant keys, self-hosted inference, private models, or high-throughput generation backends.
---

# LLM Infra Gateway

Create the model access layer for company AI applications. Keep apps pointed at one stable gateway rather than many provider-specific APIs.

## Workflow

1. Decide hosted-only, hybrid, or self-hosted.
2. Use LiteLLM as the model gateway when routing, budget, fallback, logging, or provider flexibility matters.
3. Use vLLM behind LiteLLM when serving open-source models privately or cheaply.
4. Define model classes by capability, not brand: `fast`, `cheap`, `reasoning`, `long-context`, `local-private`, `embedding`.
5. Define tenant/project budgets, rate limits, fallback order, and audit logs.
6. Provide deployment outputs that match the user's environment: Docker Compose, Kubernetes, or local dev.

## References

- Read `references/gateway-patterns.md` for gateway and serving patterns.
