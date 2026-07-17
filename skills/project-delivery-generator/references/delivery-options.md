# Delivery Options

## Pick Some, Not All

Use only what the project needs now.

| Request | Generate |
|---|---|
| "Generate LangGraph project" | `app/graph.py`, `app/main.py`, dependencies |
| "Create Docker" | `Dockerfile`, `.dockerignore`, optional `docker-compose.yml` |
| "Configure LiteLLM" | `config/litellm.yaml`, `.env.example` |
| "Generate CI" or "Create GitHub Actions" | `.github/workflows/ci.yml` |
| "Configure Sentry" | `app/observability.py`, `SENTRY_DSN` env |
| "Build RAG pipeline" | `app/rag.py`, retrieval interfaces |
| "Create evaluation tests" | `tests/test_eval_smoke.py` |
| "Add observability" | logging/tracing hooks and request IDs |

## Safety Notes

- Never commit API keys or DSNs.
- Keep generated CI read-only until deployment is explicitly requested.
- Prefer smoke/eval tests that can run without paid model calls.
- Put provider model names in env/config, not source constants.
