---
name: project-delivery-generator
description: Generate or plan production-ready AI project scaffolding with LangGraph, Docker, LiteLLM, CI, GitHub Actions, Sentry, RAG pipeline, evaluation tests, and observability. Use when the user asks to generate a LangGraph project, create Docker files, configure LiteLLM, generate CI, create GitHub Actions, configure Sentry, build a RAG pipeline, create evaluation tests, add observability, or make an AI app deployment-ready.
---

# Project Delivery Generator

Turn an AI product idea into a runnable project skeleton. Pick only the requested pieces and the minimum sensible defaults.

## Workflow

1. Identify requested capabilities: LangGraph, Docker, LiteLLM, CI, GitHub Actions, Sentry, RAG, evals, observability.
2. If generating files, prefer the bundled script:
   - `scripts/new-ai-project.ps1`
3. If editing an existing repo, inspect the repo first and add only missing pieces.
4. Apply `safety-governor` for secrets, external services, CI permissions, and telemetry.
5. Apply `fallback-rollback-operator` for deploy or config changes.

## Script

From the plugin root:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\new-ai-project.ps1 -Name demo-agent -OutputPath .\examples\demo-agent -LangGraph -Docker -LiteLLM -GitHubActions -Sentry -Rag -Evals -Observability
```

Use `-Force` only when overwriting a non-empty target intentionally; the script creates a backup first.

## Defaults

- Python project.
- LiteLLM as the model access layer.
- Optional LangGraph workflow skeleton.
- Optional RAG module.
- Optional Sentry init.
- Optional OpenTelemetry-style trace hook placeholder.
- Pytest smoke/eval tests.
- GitHub Actions CI.

## References

- Read `references/delivery-options.md` for option selection and generated files.
