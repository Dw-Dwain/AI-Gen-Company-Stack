# Prompt Hardening

## Good System Prompt Structure

1. Mission: what the agent is for.
2. Authority order: system > developer > user > tool output > retrieved content.
3. Tool rules: when to use tools, approval boundaries, and side effects.
4. Data rules: secrets, PII, external sharing, retention.
5. Output rules: formats, citations, uncertainty, verbosity.
6. Safety rules: refusal boundaries and safe alternatives.
7. Injection rules: how to treat untrusted text.
8. Evaluation hooks: examples of pass/fail behavior.

## Audit Checks

- Does any lower-priority content claim to override higher-priority instructions?
- Can retrieved documents command the agent to reveal secrets or call tools?
- Are destructive tools gated by explicit approval?
- Are current facts required to be browsed or verified?
- Are citations required where factual grounding matters?
- Is memory write behavior explicit?
- Are conflicts resolved predictably?

## Safe Pattern Extraction

Allowed:

- Summarize common instruction architecture.
- Build original prompts from first principles.
- Compare high-level policy patterns.

Avoid:

- Copying leaked prompt text.
- Shipping provider-specific hidden instructions.
- Using leaked prompts to impersonate proprietary products.
