#!/bin/bash
###############################################################################
###############################################################################
# Updates the authentication tokens
###############################################################################
###############################################################################
source /scripts/fetch-token.sh
# Function to update Nginx configuration with the latest token
update_nginx_config() {
    if [ -z "${API_TOKEN}" ]; then
        echo "Error: API TOKEN variable is not set."
        exit 1
    elif [ -z "${UI_TOKEN}" ]; then
        echo "Error: UI TOKEN variable is not set."
        exit 1
    fi

    echo "Applying new token to Nginx configuration..."
    envsubst "${API_TOKEN}" < /etc/nginx/conf.d/api-auth.conf.template > /etc/nginx/conf.d/api-auth.conf
    envsubst "${UI_TOKEN}" < /etc/nginx/conf.d/ui-auth.conf.template > /etc/nginx/conf.d/ui-auth.conf

    # Reload Nginx to apply changes
    nginx -s reload
    echo "Nginx reloaded successfully with the updated authentication token."
}

# Main execution
update_nginx_config
