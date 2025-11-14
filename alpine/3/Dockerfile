FROM alpine:3

RUN apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  wget

COPY ca.crt /usr/local/share/ca-certificates/ca.dollar.io.crt
RUN update-ca-certificates
