#!/bin/bash
set -e
source dev-container-features-test-lib

check "mcp-inspector exists" command -v mcp-inspector

reportResults
