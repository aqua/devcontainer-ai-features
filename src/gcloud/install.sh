#!/bin/sh
set -e

VERSION=${VERSION:-"latest"}

echo "Activating feature 'gcloud'"
echo "Installing Google Cloud CLI version: ${VERSION}"

# The 'install.sh' entrypoint script is always executed as the root user.
export DEBIAN_FRONTEND=noninteractive

# Ensure required packages are installed
echo "Installing dependencies..."
apt-get update -y
apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    gnupg \
    curl

# Add Google Cloud SDK GPG key
echo "Adding Google Cloud SDK GPG key..."
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# Add Google Cloud SDK APT repository
echo "Adding Google Cloud SDK APT repository..."
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Install Google Cloud CLI
echo "Installing google-cloud-cli..."
apt-get update -y

INSTALL_VERSION=""
if [ "${VERSION}" != "latest" ]; then
    INSTALL_VERSION="=${VERSION}-0"
fi

apt-get install -y --no-install-recommends google-cloud-cli${INSTALL_VERSION}

echo "Google Cloud CLI installation complete!"
echo "Use 'gcloud --version' to verify the installation"

# Telemetry Implementation
TELEMETRY_SCRIPT="$(dirname "$0")/telemetry.sh"
if [ -f "${TELEMETRY_SCRIPT}" ]; then
    /bin/sh "${TELEMETRY_SCRIPT}" "gcloud" "${VERSION}" "${TELEMETRY}"
fi
