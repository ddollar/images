FROM ubuntu:20.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get -y --no-install-recommends install \
  ca-certificates=20210119~20.04.2 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
