#!/bin/sh
set -e

VERSION=${VERSION:-"latest"}

echo "Activating feature 'mcp-inspector'"
echo "Installing @modelcontextprotocol/inspector version: ${VERSION}"

# Ensure required packages are installed
export DEBIAN_FRONTEND=noninteractive

# Check if node/npm is already installed, if not install it
if ! command -v node > /dev/null 2>&1; then
    echo "Node.js not found, installing..."
    apt-get update -y
    apt-get install -y --no-install-recommends curl ca-certificates
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
    apt-get install -y --no-install-recommends nodejs
else
    echo "Node.js already installed: $(node --version)"
fi

# Install MCP Inspector via npm
INSTALL_VERSION=""
if [ "${VERSION}" != "latest" ]; then
    INSTALL_VERSION="@${VERSION}"
fi

echo "Installing @modelcontextprotocol/inspector package..."
npm install -g @modelcontextprotocol/inspector${INSTALL_VERSION}

echo "MCP Inspector installation complete!"

# Telemetry Implementation
TELEMETRY_SCRIPT="$(dirname "$0")/telemetry.sh"
if [ -f "${TELEMETRY_SCRIPT}" ]; then
    /bin/sh "${TELEMETRY_SCRIPT}" "mcp-inspector" "${VERSION}" "${TELEMETRY}"
fi
