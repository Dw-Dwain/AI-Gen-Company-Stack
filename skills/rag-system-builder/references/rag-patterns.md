# RAG Patterns

## Custom RAG Product

Use LlamaIndex when the product needs custom ingestion, metadata filters, citations, or source-aware writing.

Core components:

- Loader per source type.
- Normalized document model with source, owner, timestamp, and access metadata.
- Chunking strategy per document class.
- Embedding and vector store abstraction.
- Query engine with citations.
- Evaluation set with expected source IDs.

## Ready Workspace

Use AnythingLLM when the first product is a private AI workspace over company documents. Customize around governance, onboarding, source connectors, and branded workflows rather than rebuilding the entire app immediately.

## Visual RAG

Use Flowise Community when workflow transparency matters for operators. Keep private ingestion and permission logic outside visual flows if it is business-critical.

## Answer Policy

For company use, require:

- Source citations for factual claims.
- Explicit uncertainty when retrieval is weak.
- No invented URLs, citations, policies, prices, or dates.
- Separation between quoted source facts and generated recommendations.
