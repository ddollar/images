FROM golang:1.22.0@sha256:7b297d9abee021bab9046e492506b3c2da8a3722cbf301653186545ecc1e00bb

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

# docker
RUN curl -s https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz | \
  tar -C /usr/bin --strip-components 1 -xz

# node
RUN apt-get update && apt-get -y --no-install-recommends install ca-certificates curl gnupg \
  && mkdir -p /etc/apt/keyrings \
  && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
  && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends nodejs \
  && corepack enable \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# watchexec
RUN curl -Ls https://github.com/watchexec/watchexec/releases/download/cli-v1.18.11/watchexec-1.18.11-x86_64-unknown-linux-gnu.tar.xz | \
  tar -C /usr/bin --strip-components 1 -xJ
