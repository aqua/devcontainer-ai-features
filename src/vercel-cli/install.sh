#!/bin/sh
set -e

VERSION=${VERSION:-"latest"}

echo "Activating feature 'vercel-cli'"
echo "Installing Vercel CLI version: ${VERSION}"

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

# Install Vercel CLI via npm
INSTALL_VERSION=""
if [ "${VERSION}" != "latest" ]; then
    INSTALL_VERSION="@${VERSION}"
fi

echo "Installing vercel package..."
npm install -g vercel${INSTALL_VERSION}

echo "Vercel CLI installation complete!"

# Telemetry Implementation
TELEMETRY_SCRIPT="$(dirname "$0")/telemetry.sh"
if [ -f "${TELEMETRY_SCRIPT}" ]; then
    /bin/sh "${TELEMETRY_SCRIPT}" "vercel-cli" "${VERSION}" "${TELEMETRY}"
fi
