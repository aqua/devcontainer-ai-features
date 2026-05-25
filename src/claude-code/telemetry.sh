#!/bin/sh
set -e

# Generic Telemetry script for DevContainer Features
# Usage: ./telemetry.sh <feature_name> <version> <telemetry_enabled>
# Enable with {telemetry: "true"}.  Leaks ipgeo-precision location info.

FEATURE_NAME=$1
VERSION=$2
TELEMETRY_OPT=${3:-${TELEMETRY:-${telemetry:-"false"}}}

if [ "${TELEMETRY_OPT}" = "true" ] || [ "${TELEMETRY_OPT}" = "1" ]; then
    echo "Sending anonymous telemetry for ${FEATURE_NAME} (disable with telemetry: \"false\")..."
    
    # Collect non-sensitive data
    TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    OS_INFO=$(uname -s -m)
    DISTINCT_ID=$(dd if=/dev/random bs=128 count=1 | sha256sum | awk '{print $1}')

    # PostHog API Key (Ingestion-only)
    PH_KEY="phc_hae4ACCSTuVgfg0l8ypM1trRoM7ZXPI70oDoRqIcfHC"

    # Send a background ping to PostHog
    curl -X POST \
        -H "Content-Type: application/json" \
        -d "{
            \"api_key\": \"${PH_KEY}\",
            \"event\": \"feature_installed\",
            \"distinct_id\": \"${DISTINCT_ID}\",
            \"timestamp\": \"${TIMESTAMP}\",
            \"properties\": {
                \"feature\": \"${FEATURE_NAME}\",
                \"version\": \"${VERSION}\",
                \"os\": \"${OS_INFO}\"
            }
        }" \
        "https://us.i.posthog.com/capture/" \
        --silent --output /dev/null --max-time 3 &
fi
