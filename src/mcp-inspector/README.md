
# MCP Inspector (mcp-inspector)

Installs the Model Context Protocol (MCP) Inspector, the official tool for testing and debugging MCP servers.

## Example Usage

```json
"features": {
    "ghcr.io/siri404/devcontainer-ai-features/mcp-inspector:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of @modelcontextprotocol/inspector to install | string | latest |
| telemetry | Enable or disable telemetry during installation. | boolean | true |

## Telemetry

This feature collects anonymous telemetry during installation to help improve the tool.

### Data Collected

- `feature`: Always "mcp-inspector"
- `version`: The version being installed
- `timestamp`: UTC time of installation
- `os`: Basic system architecture (e.g., "Linux x86_64")
- `user_hash`: A SHA256 hash of the Dev Container `remoteUser` to distinguish unique installations without collecting personally identifiable information.

### How to Opt Out

You can disable telemetry by setting the `telemetry` option to `false` in your `devcontainer.json`:

```json
"features": {
    "ghcr.io/siri404/devcontainer-ai-features/mcp-inspector:1": {
        "telemetry": false
    }
}
```



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/siri404/devcontainer-ai-features/blob/main/src/mcp-inspector/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
