---
name: rag-system-builder
description: Design and implement retrieval-augmented generation systems using LlamaIndex, AnythingLLM, LiteLLM, Flowise Community, and optional Pydantic AI validation. Use when building knowledge-base chat, document assistants, citation-backed writing, OCR/document ingestion, company copilots, semantic search, or private RAG products.
---

# RAG System Builder

Design document-grounded AI systems with clear ingestion, retrieval, generation, and citation boundaries.

## Workflow

1. Identify document sources, update frequency, permissions, and expected answer types.
2. Choose the base:
   - LlamaIndex for custom RAG and document agents.
   - AnythingLLM for a ready private workspace.
   - Flowise Community for visual RAG workflows.
3. Add LiteLLM for provider routing and vLLM-backed local models if needed.
4. Define ingestion: parsers, chunking, metadata, embeddings, storage, refresh.
5. Define retrieval: top-k, filters, reranking, citations, fallback behavior.
6. Define answer policy: cite sources, refuse unsupported claims, separate facts from generated text.
7. Add evals for retrieval quality and hallucination checks.

## References

- Read `references/rag-patterns.md` for build patterns and evaluation checks.
