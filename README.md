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
            "version": "latest",
             // Optional: Set API key here or use containerEnv/secrets
            "apiKey": ""
        }
    },
    "containerEnv": {
        "GEMINI_API_KEY": "${localEnv:GEMINI_API_KEY}" // Recommended: Use local environment variable
    }
}
```

#### CLI Usage

Once the container is built, you can use the `gemini-cli` command:

```bash
$ gemini-cli "What is the capital of France?"

Paris is the capital of France.
```

#### Options

| Option Id | Description | Type | Default |
|-----------|-------------|------|---------|
| `version` | Version of gemini-cli to install | string | `latest` |
| `apiKey`  | Google API key for Gemini | string | - |

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
