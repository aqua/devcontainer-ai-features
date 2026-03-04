#!/bin/bash
set -e
source dev-container-features-test-lib
# Run the main consolidated test script
/bin/bash "$(dirname "$0")/test.sh"
reportResults
