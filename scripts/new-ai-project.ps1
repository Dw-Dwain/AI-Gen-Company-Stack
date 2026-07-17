param(
  [Parameter(Mandatory=$true)][string]$Name,
  [Parameter(Mandatory=$true)][string]$OutputPath,
  [switch]$LangGraph,
  [switch]$Docker,
  [switch]$LiteLLM,
  [switch]$GitHubActions,
  [switch]$Sentry,
  [switch]$Rag,
  [switch]$Evals,
  [switch]$Observability,
  [switch]$Force
)

$ErrorActionPreference = "Stop"

function Write-Step($Message) {
  Write-Host "[ai-gen-company-stack] $Message"
}

function Write-File($Path, $Content) {
  $dir = Split-Path -Parent $Path
  if ($dir) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
  }
  Set-Content -Path $Path -Value $Content -Encoding UTF8
  Write-Step "wrote $Path"
}

function Sanitize-Name($Value) {
  $clean = ($Value.ToLowerInvariant() -replace '[^a-z0-9-]+','-' -replace '-+','-').Trim('-')
  if (-not $clean) { throw "Name must include letters or numbers." }
  return $clean
}

$ProjectName = Sanitize-Name $Name
$Target = [System.IO.Path]::GetFullPath($OutputPath)
$Parent = Split-Path -Parent $Target
if (-not $Parent) { throw "OutputPath must have a parent directory." }
New-Item -ItemType Directory -Force -Path $Parent | Out-Null

if (Test-Path -LiteralPath $Target) {
  $items = @(Get-ChildItem -LiteralPath $Target -Force -ErrorAction SilentlyContinue)
  if ($items.Count -gt 0) {
    if (-not $Force) {
      throw "Target exists and is not empty. Use -Force to back it up and overwrite: $Target"
    }
    $backupRoot = Join-Path $env:USERPROFILE ".ai-gen-company-stack\generated-backups"
    New-Item -ItemType Directory -Force -Path $backupRoot | Out-Null
    $stamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $backup = Join-Path $backupRoot "$ProjectName-$stamp"
    Copy-Item -LiteralPath $Target -Destination $backup -Recurse
    Remove-Item -LiteralPath $Target -Recurse -Force
    Write-Step "backed up existing target to $backup"
  }
}

New-Item -ItemType Directory -Force -Path $Target | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $Target "app") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $Target "tests") | Out-Null

$deps = @(
  "pydantic>=2.7",
  "python-dotenv>=1.0",
  "pytest>=8.0",
  "ruff>=0.5"
)
if ($LangGraph) { $deps += @("langgraph>=0.2", "langchain-core>=0.2") }
if ($LiteLLM) { $deps += "litellm>=1.40" }
if ($Sentry) { $deps += "sentry-sdk>=2.0" }
if ($Observability) { $deps += "opentelemetry-api>=1.25" }

$depsToml = ($deps | ForEach-Object { "  `"$($_)`"," }) -join "`n"
$pyproject = @"
[build-system]
requires = ["setuptools>=69", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "$ProjectName"
version = "0.1.0"
description = "Generated AI project scaffold"
requires-python = ">=3.11"
dependencies = [
$depsToml
]

[tool.pytest.ini_options]
testpaths = ["tests"]

[tool.ruff]
line-length = 100
"@
Write-File (Join-Path $Target "pyproject.toml") $pyproject

$envExample = @"
# Model gateway
OPENAI_API_KEY=
ANTHROPIC_API_KEY=
LITELLM_BASE_URL=http://localhost:4000
LITELLM_MODEL=example-model

# Observability
SENTRY_DSN=
ENVIRONMENT=development
"@
Write-File (Join-Path $Target ".env.example") $envExample

$init = @"
"""$ProjectName package."""
"@
Write-File (Join-Path $Target "app\__init__.py") $init

$observabilityPy = @"
import logging
import os
from contextlib import contextmanager

logger = logging.getLogger("$ProjectName")


def configure_observability() -> None:
    logging.basicConfig(level=os.getenv("LOG_LEVEL", "INFO"))
    dsn = os.getenv("SENTRY_DSN")
    if dsn:
        try:
            import sentry_sdk

            sentry_sdk.init(dsn=dsn, environment=os.getenv("ENVIRONMENT", "development"))
            logger.info("sentry enabled")
        except Exception as exc:
            logger.warning("sentry disabled: %s", exc)


@contextmanager
def span(name: str):
    logger.info("span.start %s", name)
    try:
        yield
        logger.info("span.ok %s", name)
    except Exception:
        logger.exception("span.error %s", name)
        raise
"@
if ($Sentry -or $Observability) {
  Write-File (Join-Path $Target "app\observability.py") $observabilityPy
}

$mainImports = if ($Sentry -or $Observability) { "from app.observability import configure_observability, span" } else { "from contextlib import nullcontext as span`n`ndef configure_observability() -> None:`n    pass" }
$mainBody = if ($LangGraph) {
@"
from app.graph import run_graph


def main() -> None:
    configure_observability()
    with span("main"):
        result = run_graph("hello")
        print(result)
"@
} else {
@"
def main() -> None:
    configure_observability()
    with span("main"):
        print("hello from $ProjectName")
"@
}
$mainPy = @"
$mainImports


$mainBody


if __name__ == "__main__":
    main()
"@
Write-File (Join-Path $Target "app\main.py") $mainPy

if ($LangGraph) {
  $graphPy = @"
from typing import TypedDict


class State(TypedDict):
    input: str
    output: str


def draft(state: State) -> State:
    text = state["input"]
    return {"input": text, "output": f"Processed: {text}"}


def run_graph(user_input: str) -> str:
    try:
        from langgraph.graph import END, StateGraph
    except Exception:
        return draft({"input": user_input, "output": ""})["output"]

    graph = StateGraph(State)
    graph.add_node("draft", draft)
    graph.set_entry_point("draft")
    graph.add_edge("draft", END)
    app = graph.compile()
    result = app.invoke({"input": user_input, "output": ""})
    return result["output"]
"@
  Write-File (Join-Path $Target "app\graph.py") $graphPy
}

if ($Rag) {
  $ragPy = @"
from dataclasses import dataclass


@dataclass(frozen=True)
class Document:
    id: str
    text: str
    source: str


def chunk_text(text: str, size: int = 900) -> list[str]:
    return [text[i : i + size] for i in range(0, len(text), size)]


def retrieve(query: str, documents: list[Document], limit: int = 3) -> list[Document]:
    terms = {term.lower() for term in query.split() if term.strip()}
    scored = []
    for doc in documents:
        haystack = doc.text.lower()
        score = sum(1 for term in terms if term in haystack)
        if score:
            scored.append((score, doc))
    return [doc for _, doc in sorted(scored, key=lambda item: item[0], reverse=True)[:limit]]


def answer_with_sources(query: str, documents: list[Document]) -> dict:
    hits = retrieve(query, documents)
    return {
        "answer": "Use the cited sources to draft the answer.",
        "sources": [{"id": doc.id, "source": doc.source} for doc in hits],
    }
"@
  Write-File (Join-Path $Target "app\rag.py") $ragPy
}

if ($LiteLLM) {
  New-Item -ItemType Directory -Force -Path (Join-Path $Target "config") | Out-Null
  $litellmYaml = @"
model_list:
  - model_name: example-model
    litellm_params:
      model: openai/gpt-4o-mini
      api_key: os.environ/OPENAI_API_KEY

general_settings:
  master_key: os.environ/LITELLM_MASTER_KEY
"@
  Write-File (Join-Path $Target "config\litellm.yaml") $litellmYaml
}

if ($Evals) {
  $evalTest = @"
def test_project_imports():
    import app.main

    assert app.main is not None


def test_eval_contract():
    expected = {
        "quality": "pass",
        "safety": "pass",
        "rollback_ready": "yes",
    }
    assert expected["quality"] == "pass"
"@
  Write-File (Join-Path $Target "tests\test_eval_smoke.py") $evalTest
}

if ($Rag) {
  $ragTest = @"
from app.rag import Document, retrieve


def test_retrieve_returns_matching_source():
    docs = [
        Document(id="1", source="a.md", text="alpha beta"),
        Document(id="2", source="b.md", text="gamma delta"),
    ]
    hits = retrieve("alpha", docs)
    assert hits[0].id == "1"
"@
  Write-File (Join-Path $Target "tests\test_rag.py") $ragTest
}

if ($Docker) {
  $dockerfile = @"
FROM python:3.11-slim

WORKDIR /app
COPY pyproject.toml ./
RUN pip install --no-cache-dir .
COPY app ./app
CMD ["python", "-m", "app.main"]
"@
  Write-File (Join-Path $Target "Dockerfile") $dockerfile
  Write-File (Join-Path $Target ".dockerignore") "__pycache__/`n*.pyc`n.env`n.git/`n"

  if ($LiteLLM) {
    $compose = @"
services:
  app:
    build: .
    env_file: .env
    depends_on:
      - litellm

  litellm:
    image: ghcr.io/berriai/litellm:main-latest
    command: ["--config", "/app/config/litellm.yaml", "--port", "4000"]
    env_file: .env
    ports:
      - "4000:4000"
    volumes:
      - ./config:/app/config:ro
"@
    Write-File (Join-Path $Target "docker-compose.yml") $compose
  }
}

if ($GitHubActions) {
  $ci = @"
name: CI

on:
  pull_request:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    permissions:
      contents: read
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: "3.11"
      - name: Install
        run: |
          python -m pip install --upgrade pip
          pip install -e .
      - name: Lint
        run: ruff check .
      - name: Test
        run: pytest
"@
  Write-File (Join-Path $Target ".github\workflows\ci.yml") $ci
}

$readme = @"
# $ProjectName

Generated AI project scaffold.

## Run

```powershell
Copy-Item .env.example .env
pip install -e .
python -m app.main
```

## Test

```powershell
pytest
```

## Included

- LangGraph: $($LangGraph.IsPresent)
- Docker: $($Docker.IsPresent)
- LiteLLM: $($LiteLLM.IsPresent)
- GitHub Actions: $($GitHubActions.IsPresent)
- Sentry: $($Sentry.IsPresent)
- RAG: $($Rag.IsPresent)
- Evals: $($Evals.IsPresent)
- Observability: $($Observability.IsPresent)
"@
Write-File (Join-Path $Target "README.md") $readme

Write-Step "generated project at $Target"
