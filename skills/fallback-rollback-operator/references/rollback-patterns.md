# Rollback Patterns

## Skills And Plugins

- Keep versioned plugin manifests.
- Back up overwritten skill folders.
- Keep a latest-backup pointer.
- Validate before install.
- Reinstall previous plugin version or restore copied skills.

## Prompts

- Store prompt version, owner, and change reason.
- Keep last known good prompt.
- Roll back on eval regression or safety violation.

## RAG

- Version ingestion configs and index builds.
- Keep previous index until new index passes evals.
- Roll back by switching active index pointer.

## Model Gateway

- Route by alias, not hard-coded model.
- Keep provider fallback order.
- Use circuit breakers for failing providers.
- Roll back routing config independently of app deploys.

## UI

- Keep feature flag for redesigns.
- Add visual smoke tests for primary viewports.
- Roll back by disabling flag or reverting route.
