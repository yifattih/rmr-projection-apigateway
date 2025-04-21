#!/bin/bash
###############################################################################
###############################################################################
# Retrieves the authentication token
###############################################################################
###############################################################################
# List of services that require identity tokens
declare -A SERVICES_ENDPOINT
SERVICES_ENDPOINT["API"]=${API_SERVICE_ENDPOINT}
SERVICES_ENDPOINT["UI"]=${UI_SERVICE_ENDPOINT}

# Function to retrieve identity token for a given service
get_identity_token() {
    local audience="$1"

    if curl -s "http://metadata.google.internal" > /dev/null 2>&1; then
        curl -H "Metadata-Flavor: Google" \
            "http://metadata/computeMetadata/v1/instance/service-accounts/default/identity?audience=$audience"
    else
        gcloud auth print-identity-token
    fi
}

# Function to update tokens for all services
update_tokens() {
    for key in "${!SERVICES_ENDPOINT[@]}"; do
        audience=$(eval echo "${SERVICES_ENDPOINT[${key}]}")
        if [ -n "${audience}" ]; then
            token=$(get_identity_token "${audience}")
            export "${key}_TOKEN=${token}"
        else
            echo "Warning: SERVICES_ENDPOINT associative array is not set!"
        fi
    done
}

# Main execution
update_tokens
