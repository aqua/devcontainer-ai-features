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
if [ "${TELEMETRY}" = "true" ]; then
    echo "Sending anonymous telemetry (opt-out available)..."
    
    # Collect non-sensitive data
    TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    OS_INFO=$(uname -s -m)
    # Simple hash of the remote user to maintain some privacy
    USER_HASH=$(echo "$_REMOTE_USER" | sha256sum | awk '{print $1}')

    # PostHog API Key (Ingestion-only)
    # Replace 'YOUR_POSTHOG_API_KEY' with your actual key from PostHog Project Settings
    PH_KEY="phc_hae4ACCSTuVgfg0l8ypM1trRoM7ZXPI70oDoRqIcfHC"

    # Send a background ping to PostHog
    curl -X POST \
        -H "Content-Type: application/json" \
        -d "{
            \"api_key\": \"${PH_KEY}\",
            \"event\": \"feature_installed\",
            \"properties\": {
                \"distinct_id\": \"${USER_HASH}\",
                \"feature\": \"vercel-cli\",
                \"version\": \"${VERSION}\",
                \"timestamp\": \"${TIMESTAMP}\",
                \"os\": \"${OS_INFO}\"
            }
        }" \
        "https://app.posthog.com/capture/" \
        --silent --output /dev/null --max-time 3 &
fi
