# FROM nginx:otel
FROM nginx:stable-alpine3.20-otel@sha256:02a1e29f7b93e643c5d5ca202ab50616222aacc4a84a9522ea85bb5e50bb079a

RUN apk add --no-cache \
    bash \
    curl \
    openssh-client \
    python3 \
    py3-pip \
    cronie \
    jq  # Needed for JSON parsing in GCP responses

# Copy startup scripts
COPY src/scripts/update-nginx-config.sh /docker-entrypoint.d/50-update-nginx-config.sh
COPY src/scripts/start-cron.sh /docker-entrypoint.d/1000-start-cron.sh

# Copy script to fetch google auth tokens
COPY src/scripts/fetch-token.sh /scripts/fetch-token.sh

# Remove default configuration to avoid conflicts
RUN rm -rf /etc/nginx/conf.d/*

# Make directory for cron
RUN mkdir -p /root/.cache/crontab

# Copy NGINX configuration files and templates to their respective directories
COPY src/config_modules/security.conf /etc/nginx/conf.d/security.conf
COPY src/config_modules/cors.conf /etc/nginx/conf.d/cors.conf
COPY src/config_modules/client_info_forwarding.conf /etc/nginx/conf.d/client_info_forwarding.conf
COPY src/config_modules/api-auth.conf.template /etc/nginx/conf.d/api-auth.conf.template
COPY src/config_modules/ui-auth.conf.template /etc/nginx/conf.d/ui-auth.conf.template
COPY src/config_modules/servers.conf.template /etc/nginx/templates/servers.conf.template
COPY src/config_modules/nginx.conf nginx.conf


# Define build arguments for OpenTelemetry endpoint and service name
ARG OTLP_ENDPOINT
ARG OTEL_SERVICE_NAME

# Use envsubst to substitute the environment variables in the nginx.conf template
# and generate the final nginx configuration file
RUN envsubst '${OTLP_ENDPOINT} ${OTEL_SERVICE_NAME}' < nginx.conf > /etc/nginx/nginx.conf

# Expose port 80 for HTTP traffic
EXPOSE 80
