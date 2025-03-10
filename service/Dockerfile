# FROM nginx:otel
FROM nginx:stable-alpine3.20-otel

# Remove default configuration to avoid conflicts
RUN rm -rf /etc/nginx/conf.d/*

COPY security.conf /etc/nginx/conf.d/security.conf
COPY common_headers.conf /etc/nginx/conf.d/common_headers.conf
COPY servers.conf.template /etc/nginx/templates/servers.conf.template
COPY nginx.conf nginx.conf

ARG OTLP_ENDPOINT
ARG SERVICE_NAME
RUN envsubst '${OTLP_ENDPOINT} ${SERVICE_NAME}' < nginx.conf > /etc/nginx/nginx.conf

EXPOSE 80
