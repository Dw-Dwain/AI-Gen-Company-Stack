# Gateway Patterns

## Hosted Provider Gateway

Use LiteLLM as an OpenAI-compatible proxy. Applications call one base URL and one API format while LiteLLM handles provider-specific model names and credentials.

Good for:

- OpenAI plus Anthropic plus Gemini routing.
- Per-team API keys.
- Cost tracking.
- Fallback when a provider fails.

## Hybrid Gateway

Use LiteLLM in front of hosted providers and vLLM.

Routing example:

- `cheap-fast`: local vLLM model.
- `reasoning`: hosted frontier model.
- `private-draft`: local vLLM model only.
- `long-context`: hosted long-context model.

## Self-Hosted Serving

Use vLLM when volume or privacy justifies model hosting. Start with one known model and benchmark:

- Latency at expected concurrency.
- Tokens per second.
- GPU memory.
- Quality on company evals.
- Cost per 1M tokens compared with hosted models.

Do not make every application know vLLM details. Keep vLLM behind LiteLLM or a thin internal API.
