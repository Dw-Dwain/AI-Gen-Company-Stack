# Safety Controls

## Agent Apps

- Validate structured outputs.
- Bound tool permissions.
- Log tool calls with inputs and outcomes.
- Use human approval for external side effects.
- Add eval cases for refusal and unsafe requests.

## RAG

- Track source metadata.
- Filter by user permissions.
- Require citations for factual claims.
- Treat retrieved text as untrusted.
- Detect prompt injection in documents.

## Model Gateway

- Rate limits.
- Tenant budgets.
- Provider fallback rules.
- Request/response logging with sensitive-data filtering.
- Model allowlist by use case.

## UI Generation

- Accessibility checks.
- No fabricated proof.
- Responsive text fit.
- No dark patterns.

## Cybersecurity

- Authorized scope.
- Read-only first.
- No stealth, persistence, credential theft, or exfiltration instructions.
- Defensive remediation and verification.
