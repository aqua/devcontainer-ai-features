#!/bin/bash

# This is the single test script for the 'gemini-cli' feature.
#
# It will be executed against a variety of devcontainer.json configurations
# specified in the 'scenarios.json' file.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# This test can be run with the following command:
#
#    devcontainer features test    \
#               --features gemini-cli   \
#               /path/to/this/repo

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "node is installed" node --version
check "npm is installed" npm --version
check "gemini command exists" which gemini
check "@google/gemini-cli package is installed" npm list -g @google/gemini-cli
check "gemini shows usage info" gemini --help 2>&1 | grep -i "gemini\|usage\|command"
check "gemini version flag works" gemini --version 2>&1

# Report result
reportResults
