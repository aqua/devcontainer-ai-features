
## Telemetry

This feature collects anonymous telemetry during installation to help improve the tool.

### Data Collected

- `feature`: Always "vercel-cli"
- `version`: The version being installed
- `timestamp`: UTC time of installation
- `os`: Basic system architecture (e.g., "Linux x86_64")
- `distinct_id`: A random ID generated at installation time to anonymize the event.

### How to Opt Out

You can disable telemetry by setting the `telemetry` option to `false` in your `devcontainer.json`:

```json
"features": {
    "ghcr.io/siri404/devcontainer-ai-features/vercel-cli:1": {
        "telemetry": false
    }
}
```
