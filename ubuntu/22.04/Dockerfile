FROM ubuntu:22.04@sha256:dfd64a3b4296d8c9b62aa3309984f8620b98d87e47492599ee20739e8eb54fbf

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get -y --no-install-recommends install \
  ca-certificates \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
