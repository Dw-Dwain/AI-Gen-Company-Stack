---
name: ai-gen-suite
description: Main entrypoint and router for Dwain's full AI generation company toolkit. Use when the user asks for the AI Gen Company Stack, full suite, toolkit mode, product planning, AI writing systems, agents, LangGraph, Docker, CI, GitHub Actions, Sentry, observability, evals, RAG, SEO writing, UI design, security, prompt hardening, model infrastructure, safety, fallbacks, rollback, learning loops, minimal code, terse output, or when multiple included skills may apply.
---

# AI Gen Suite

Route the task to the right skill set, then execute. This is the suite entrypoint.

## Routing

| User need | Use |
|---|---|
| Pick stack or architecture | `ai-stack-architect` |
| Build typed agent or workflow app | `agent-app-scaffold` |
| Generate project scaffolding, Docker, CI, Sentry, evals | `project-delivery-generator` |
| Build document Q&A or knowledge copilot | `rag-system-builder` |
| Write or refresh SEO content | `seo-writing-operator` |
| Plan LiteLLM/vLLM infrastructure | `llm-infra-gateway` |
| Create company workflow skill | `company-skill-author` |
| Keep implementation minimal | `ponytail` |
| Compress output | `caveman` |
| Build or audit UI | `hallmark-design-ui` |
| Defensive security review or AI threat model | `cybersecurity-skill-router` |
| Harden prompts or agent instructions | `prompt-pattern-auditor` |
| Add safety, permissions, or guardrails | `safety-governor` |
| Add fallback or rollback plans | `fallback-rollback-operator` |
| Capture lessons and improve the toolkit | `learning-loop-operator` |

## Default Behavior

For coding tasks, apply `ponytail` silently: reuse existing code, standard library, native platform features, and installed dependencies before adding anything new.

For frontend tasks, apply `hallmark-design-ui`: avoid generic AI-looking UI and produce domain-specific layout.

For agent/RAG/infrastructure tasks, start with architecture boundaries before code.

For requests that mention LangGraph project generation, Docker, LiteLLM config, CI, GitHub Actions, Sentry, evaluation tests, observability, or a RAG pipeline, use `project-delivery-generator`.

For SEO writing tasks, use `seo-writing-operator`: lead with the answer, structure sections around search intent, preserve verified facts, and avoid generic AI phrasing.

For security-sensitive tasks, apply `cybersecurity-skill-router` and keep work defensive and authorized.

For prompt/system instruction tasks, apply `prompt-pattern-auditor` and do not copy leaked prompt text.

For changes that can break tools, data, deployments, prompts, or security posture, apply `safety-governor` and `fallback-rollback-operator`.

After substantial work, apply `learning-loop-operator` to capture what worked, what failed, and what should change next. Do not self-modify silently.

For responses where the user asks for brevity, apply `caveman`.

## Output

Give the user the routed plan first when the task is broad. For implementation requests, proceed directly after the route decision unless clarification is required.
