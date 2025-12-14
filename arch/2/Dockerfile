FROM archlinux:base-20251019.0.436919@sha256:c136b06a4f786b84c1cc0d2494fabdf9be8811d15051cd4404deb5c3dc0b2e57

RUN pacman -Syu --noconfirm \
  base-devel \
  git \
  go \
  nodejs \
  && pacman -Scc --noconfirm && rm -rf /var/lib/pacman/sync/* /var/cache/pacman/pkg/* /tmp/*

#ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
#ENV SSL_CERT_DIR=/etc/ssl/certs


COPY ca.crt /etc/ca-certificates/trust-source/anchors/ca.dollar.io.crt
RUN update-ca-trust

RUN useradd -m builder

ENV GOPRIVATE=ddollar.dev,git.dollar.io
RUN go install git.dollar.io/david/dev@latest
