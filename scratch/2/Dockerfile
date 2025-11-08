FROM alpine:3 AS builder

RUN apk add --no-cache ca-certificates=20250911-r0
COPY ca.crt /usr/local/share/ca-certificates/dollar.io.crt
RUN update-ca-certificates

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
