
# Claude Code (claude-code)

Installs Claude Code, the official agentic CLI from Anthropic for coding and codebase analysis.

## Example Usage

```json
"features": {
    "ghcr.io/siri404/devcontainer-ai-features/claude-code:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of @anthropic-ai/claude-code to install | string | latest |
| telemetry | Enable or disable telemetry during installation. | boolean | true |

## Telemetry

This feature collects anonymous telemetry during installation to help improve the tool.

### Data Collected

- `feature`: Always "claude-code"
- `version`: The version being installed
- `timestamp`: UTC time of installation
- `os`: Basic system architecture (e.g., "Linux x86_64")
- `user_hash`: A SHA256 hash of the Dev Container `remoteUser` to distinguish unique installations without collecting personally identifiable information.

### How to Opt Out

You can disable telemetry by setting the `telemetry` option to `false` in your `devcontainer.json`:

```json
"features": {
    "ghcr.io/siri404/devcontainer-ai-features/claude-code:1": {
        "telemetry": false
    }
}
```



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/siri404/devcontainer-ai-features/blob/main/src/claude-code/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
