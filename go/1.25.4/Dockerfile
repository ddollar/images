FROM golang:1.25.4@sha256:6ca9eb0b32a4bd4e8c98a4a2edf2d7c96f3ea6db6eb4fc254eef6c067cf73bb4

COPY ca.crt /usr/local/share/ca-certificates/dollar.io.crt
RUN update-ca-certificates

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
