FROM golang:1.18@sha256:478fcf47d5d8269f9b530784cca11b0386776b1d16417a5e694673e985f44253

ENV DEVELOPMENT=true

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# development dependencies
RUN apt-get update && apt-get -y --no-install-recommends install \
  bzip2=1.0.8-4 \
  curl=7.74.0-1.3+deb11u1 \
  git=1:2.30.2-1 \
  software-properties-common=0.96.20.2-2.1 \
  telnet=0.17-42 \
  xz-utils=5.2.5-2 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# datastore dependencies
RUN apt-get update && apt-get -y --no-install-recommends install \
  default-mysql-client=1.0.7 \
  postgresql-client=13+225 \
  redis-tools=5:6.0.16-1+deb11u2 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# packaging dependencies
RUN apt-get update && apt-get -y --no-install-recommends install \
  upx-ucl=3.96-2 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# docker
RUN curl -s https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz | \
  tar -C /usr/bin --strip-components 1 -xz

# node
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
  apt-get update && apt-get -y --no-install-recommends install \
  nodejs=16.14.2-deb-1nodesource1 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# watchexec
RUN curl -Ls https://github.com/watchexec/watchexec/releases/download/cli-v1.18.11/watchexec-1.18.11-x86_64-unknown-linux-gnu.tar.xz | \
  tar -C /usr/bin --strip-components 1 -xJ
