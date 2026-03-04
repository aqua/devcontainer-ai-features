# Dev Container AI Features

A collection of [Dev Container Features](https://containers.dev/features) for AI development tools.

## Available Features

| Feature | Description | Install Path |
|---------|-------------|--------------|
| `gemini-cli` | Google's Gemini AI command-line interface. | `ghcr.io/siri404/devcontainer-ai-features/gemini-cli:1` |
| `claude-code` | Anthropic's agentic CLI for coding and analysis. | `ghcr.io/siri404/devcontainer-ai-features/claude-code:1` |
| `vercel-cli` | Vercel CLI for managing projects and AI SDKs. | `ghcr.io/siri404/devcontainer-ai-features/vercel-cli:1` |
| `mcp-inspector` | Official tool for debugging MCP servers. | `ghcr.io/siri404/devcontainer-ai-features/mcp-inspector:1` |

## Usage

Add a feature to your `devcontainer.json`:

```json
"features": {
    "ghcr.io/siri404/devcontainer-ai-features/gemini-cli:1": {
        "version": "latest"
    }
}
```

Most features support a `version` option (default: `latest`).

## Development

This repository follows the [Feature distribution specification](https://containers.dev/implementors/features-distribution/). Features are automatically published to GHCR.
