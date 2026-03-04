#!/bin/bash
set -e
source dev-container-features-test-lib

# Use the consolidated test script
/bin/bash "$(dirname "$0")/test.sh"

reportResults
