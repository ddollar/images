FROM golang:1.24.1 AS build

ARG OLLAMA_VERSION=0.5.13

RUN go install github.com/ollama/ollama@v${OLLAMA_VERSION}

FROM ghcr.io/ddollar/nvidia:570.124.06@sha256:7fb3ceb1142bb84cac7d0166cb9b77bd8fa52347ae35ec24b6b30ffb3e46d0c2

COPY --from=build /go/bin/ollama /usr/local/bin/ollama

CMD ["ollama", "serve"]
