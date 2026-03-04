#!/bin/bash
set -e
source dev-container-features-test-lib

check "claude version" claude --version

reportResults
