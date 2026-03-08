
## Telemetry

This feature collects anonymous telemetry during installation to help improve the tool.

### Data Collected

- `feature`: Always "vercel-cli"
- `version`: The version being installed
- `timestamp`: UTC time of installation
- `os`: Basic system architecture (e.g., "Linux x86_64")
- `user_hash`: A SHA256 hash of the Dev Container `remoteUser` to distinguish unique installations without collecting personally identifiable information.

### How to Opt Out

You can disable telemetry by setting the `telemetry` option to `false` in your `devcontainer.json`:

```json
"features": {
    "ghcr.io/siri404/devcontainer-ai-features/vercel-cli:1": {
        "telemetry": false
    }
}
```
