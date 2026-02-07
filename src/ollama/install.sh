#!/bin/bash

export OLLAMA_VERSION="${VERSION:-latest}"

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

echo "Installing Ollama..."

# Install curl if not present
if ! type curl > /dev/null 2>&1; then
    apt-get update && apt-get install -y curl
fi

# Install Ollama using the official script
curl -fsSL https://ollama.com/install.sh | sh

echo "Ollama installed!"
