# Dev Container AI Features

This repository contains a collection of Dev Container Features focused on AI tools and integrations.

## Features

### `gemini-cli`

The `gemini-cli` feature installs a command-line interface for interacting with Google's Gemini AI models.

**Repository:** `ghcr.io/siri404/devcontainer-ai-features/gemini-cli`

#### Usage

Add the following to your `devcontainer.json`:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/siri404/devcontainer-ai-features/gemini-cli:1": {
            "version": "latest"
        }
    },
    "containerEnv": {
        "GEMINI_API_KEY": "${localEnv:GEMINI_API_KEY}" // Recommended: Use local environment variable
    }
}
```

#### Options

| Option Id | Description | Type | Default |
|-----------|-------------|------|---------|
| `version` | Version of gemini-cli to install | string | `latest` |
| `apiKey`  | Google API key for Gemini | string | - |

---

### `vercel-cli`

The `vercel-cli` feature installs the Vercel CLI, which includes tools for managing Vercel projects and AI SDK scaffolds.

**Repository:** `ghcr.io/siri404/devcontainer-ai-features/vercel-cli`

#### Usage

Add the following to your `devcontainer.json`:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/siri404/devcontainer-ai-features/vercel-cli:1": {
            "version": "latest"
        }
    }
}
```

#### Options

| Option Id | Description | Type | Default |
|-----------|-------------|------|---------|
| `version` | Version of vercel CLI to install | string | `latest` |

---

### `claude-code`

The `claude-code` feature installs Claude Code, the official agentic CLI from Anthropic for coding and codebase analysis.

**Repository:** `ghcr.io/siri404/devcontainer-ai-features/claude-code`

#### Usage

Add the following to your `devcontainer.json`:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/siri404/devcontainer-ai-features/claude-code:1": {
            "version": "latest"
        }
    }
}
```

#### Options

| Option Id | Description | Type | Default |
|-----------|-------------|------|---------|
| `version` | Version of Claude Code to install | string | `latest` |

---

### `mcp-inspector`

The `mcp-inspector` feature installs the Model Context Protocol (MCP) Inspector, the official tool for testing and debugging MCP servers.

**Repository:** `ghcr.io/siri404/devcontainer-ai-features/mcp-inspector`

#### Usage

Add the following to your `devcontainer.json`:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/siri404/devcontainer-ai-features/mcp-inspector:1": {
            "version": "latest"
        }
    }
}
```

> **Note:** Port `6274` is automatically forwarded to your host to allow access to the Inspector's web interface.

#### Options

| Option Id | Description | Type | Default |
|-----------|-------------|------|---------|
| `version` | Version of MCP Inspector to install | string | `latest` |

---

## Repository Structure

This repository follows the [dev container Feature distribution specification](https://containers.dev/implementors/features-distribution/).

```
├── src
│   ├── gemini-cli
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
```

## Distribution

This repository uses a GitHub Action workflow to publish features to GitHub Container Registry (GHCR).

The features are available at: `ghcr.io/siri404/devcontainer-ai-features/<feature-name>`
