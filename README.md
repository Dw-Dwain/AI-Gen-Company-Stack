# AI Gen Company Stack

Full-stack AI agent toolkit for Claude Code and Codex: agent architecture, RAG, UI design, security, prompt hardening, model gateways, rollback, and learning loops.

AI Gen Company Stack is an independent plugin and skill suite. It gives coding agents a practical operating layer for building AI products without gluing together scattered prompts by hand.

## What It Does

- Routes AI product tasks through one entrypoint: `ai-gen-suite`
- Designs agent apps using Pydantic AI, LangGraph/LangChain, LlamaIndex, smolagents, LiteLLM, and vLLM patterns
- Builds RAG and knowledge-copilot plans
- Adds Hallmark-style UI quality gates without copying Hallmark source
- Adds Ponytail-style minimal-code pressure without copying Ponytail source
- Adds Caveman-style terse output without copying Caveman source
- Adds defensive cybersecurity routing inspired by open cybersecurity skill libraries
- Adds prompt hardening without redistributing leaked system prompts
- Adds safety, fallback, rollback, and learning-loop workflows

## Install

### Claude Code

Install directly from GitHub:

```text
/plugin marketplace add Dw-Dwain/AI-Gen-Company-Stack
/plugin install ai-gen-company-stack@dwain-ai-gen
```

Or from inside a local clone:

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1 -ClaudeOnly
```

Manual local marketplace:

```text
/plugin marketplace add <path-to-this-repo>
/plugin install ai-gen-company-stack@dwain-ai-gen
```

Restart Claude Code after install or update.

### Codex

From inside this repo:

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1 -CodexOnly
```

This copies skills into:

```text
%USERPROFILE%\.codex\skills
```

The installer backs up overwritten Codex skills under:

```text
%USERPROFILE%\.ai-gen-company-stack\backups
```

### Full Local Install

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
powershell -ExecutionPolicy Bypass -File .\activate.ps1
```

## Included Skills

| Skill | Purpose |
|---|---|
| `ai-gen-suite` | Main router for the full toolkit |
| `ai-stack-architect` | Pick the right AI product stack |
| `agent-app-scaffold` | Plan/scaffold typed agents and workflows |
| `project-delivery-generator` | Generate LangGraph/Docker/LiteLLM/CI/Sentry/RAG/eval project scaffolds |
| `rag-system-builder` | Design RAG, document QA, and knowledge copilots |
| `seo-writing-operator` | Plan, draft, refresh, and QA SEO articles |
| `llm-infra-gateway` | Plan LiteLLM/vLLM model infrastructure |
| `company-skill-author` | Create company workflow skills |
| `ponytail` | Keep code minimal without dropping safety |
| `caveman` | Compress output while preserving technical accuracy |
| `hallmark-design-ui` | Build/audit distinctive UI, not generic AI UI |
| `cybersecurity-skill-router` | Route authorized defensive security workflows |
| `prompt-pattern-auditor` | Harden prompts without copying leaked prompts |
| `safety-governor` | Add guardrails, permissions, and safety controls |
| `fallback-rollback-operator` | Add fallback and rollback plans |
| `learning-loop-operator` | Capture lessons and improve safely |

## Useful Commands

```powershell
# Validate toolkit
powershell -ExecutionPolicy Bypass -File .\scripts\healthcheck.ps1

# Roll back Codex skills to latest backup
powershell -ExecutionPolicy Bypass -File .\scripts\rollback.ps1

# Record a learning-loop entry
powershell -ExecutionPolicy Bypass -File .\scripts\learn.ps1 -Task "..." -Outcome "..." -Lesson "..."

# Generate an AI project scaffold
powershell -ExecutionPolicy Bypass -File .\scripts\new-ai-project.ps1 -Name demo-agent -OutputPath .\examples\demo-agent -LangGraph -Docker -LiteLLM -GitHubActions -Sentry -Rag -Evals -Observability
```

## Positioning

Use this when you want:

- one AI agent operating kit instead of many loose prompts
- AI product architecture help
- safer agent workflows
- faster RAG/product prototyping
- better frontend output
- defensive security checks
- rollback and learning loops

## Compliance

This repository is original plugin and skill guidance. It references permissive open-source tools as integration targets and pattern inspiration, but does not vendor their source code.

See:

- [LICENSE](LICENSE)
- [NOTICE](NOTICE)
- [Compliance Matrix](references/compliance-matrix.md)

Important boundaries:

- This is not an official OpenAI, Anthropic, Claude, Codex, Hallmark, Ponytail, Caveman, or cybersecurity-skills project.
- It is compatible with Claude Code and Codex.
- It does not redistribute leaked commercial system prompts.
- It does not vendor third-party project source files.
- If you later add third-party code, retain the required upstream license and attribution files.

## License

MIT. See [LICENSE](LICENSE).
