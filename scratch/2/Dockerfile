FROM alpine:latest AS builder

# Download the custom CA cert (insecure) and add it to the cert bundle
RUN apk add --no-cache ca-certificates curl && \
    curl --insecure -o /usr/local/share/ca-certificates/dollar-io.crt https://ca.dollar.io && \
    update-ca-certificates

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/