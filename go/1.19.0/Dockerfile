FROM golang:1.19.0@sha256:d3f734e1f46ec36da8c1bce67cd48536138085289e24cfc8765f483c401b7d96

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# development dependencies
RUN apt-get update && apt-get -y --no-install-recommends install \
  bzip2 \
  curl \
  git \
  software-properties-common \
  telnet \
  xz-utils \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# datastore dependencies
RUN apt-get update && apt-get -y --no-install-recommends install \
  default-mysql-client \
  postgresql-client \
  redis-tools \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# packaging dependencies
RUN apt-get update && apt-get -y --no-install-recommends install \
  upx-ucl \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# docker
RUN curl -s https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz | \
  tar -C /usr/bin --strip-components 1 -xz

# node
# hadolint ignore=DL3008
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
  apt-get update && apt-get -y --no-install-recommends install \
  nodejs \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# watchexec
RUN curl -Ls https://github.com/watchexec/watchexec/releases/download/cli-v1.18.11/watchexec-1.18.11-x86_64-unknown-linux-gnu.tar.xz | \
  tar -C /usr/bin --strip-components 1 -xJ
