#!/bin/bash
###############################################################################
###############################################################################
# Start cron and schedule job if not set 
###############################################################################
###############################################################################
start_cron() {
    if ! pgrep crond > /dev/null; then
        echo "Starting cron service..."
        # crond -x ext,sch,proc,pars,load,misc,test,bit /var/log/cron.log
        crond
    else
        echo "Cron is already running."
    fi
}

# Function to schedule token refresh every 55 minutes
schedule_token_refresh() {
    local cron_job="*/55 * * * * /docker-entrypoint.d/50-update-nginx-config.sh >> /var/log/auth-refresh.log 2>&1"

    if ! crontab -l 2>/dev/null | grep -q "fetch-token.sh"; then
        echo "Adding cron job for token refresh..."
        (crontab -l 2>/dev/null; echo "${cron_job}") | crontab -
    else
        echo "Cron job already exists."
    fi
}

# Main execution
start_cron
schedule_token_refresh
