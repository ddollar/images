FROM golang:1.24.1@sha256:c5adecdb7b3f8c5ca3c88648a861882849cc8b02fed68ece31e25de88ad13418 AS build

ARG OLLAMA_VERSION=0.5.13

ENV GOFLAGS="'-ldflags=-w -s'"
ENV CGO_ENABLED=1

RUN go install github.com/ollama/ollama@v${OLLAMA_VERSION}

FROM ghcr.io/ddollar/nvidia:570.124.06@sha256:7fb3ceb1142bb84cac7d0166cb9b77bd8fa52347ae35ec24b6b30ffb3e46d0c2

COPY --from=build /go/bin/ollama /usr/local/bin/ollama

ENV LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_VISIBLE_DEVICES=all
ENV OLLAMA_HOST=0.0.0.0:11434

WORKDIR /
VOLUME /root/.ollama
EXPOSE 11434

CMD ["ollama", "serve"]
