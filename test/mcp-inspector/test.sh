#!/bin/bash
set -e
source dev-container-features-test-lib

check "mcp-inspector version" mcp-inspector --version

reportResults
