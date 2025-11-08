FROM alpine:3 AS builder

# Download the custom CA cert (insecure) and add it to the cert bundle
RUN apk add --no-cache \
      ca-certificates=20250911-r0 \
      curl=8.14.1-r2 \
      && \
    curl --insecure -o /usr/local/share/ca-certificates/dollar-io.crt https://ca.dollar.io && \
    update-ca-certificates

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
