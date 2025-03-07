FROM ubuntu:22.04

WORKDIR /usr/src

ARG WHISPER_VERSION=2.4.0

RUN \
	apt-get update \
	&& apt-get install -y --no-install-recommends \
	build-essential \
	netcat \
	python3 \
	python3-dev \
	python3-pip \
	&& pip3 install --no-cache-dir -U \
	setuptools==75.8.2 \
	wheel==0.45.1 \
	&& pip3 install --no-cache-dir \
	"wyoming-faster-whisper @ https://github.com/rhasspy/wyoming-faster-whisper/archive/refs/tags/v${WHISPER_VERSION}.tar.gz" \
	&& apt-get purge -y --auto-remove \
	build-essential \
	python3-dev \
	&& rm -rf /var/lib/apt/lists/*

ARG NVIDIA_VERSION=570.124.06-0ubuntu1

RUN \
	apt-get update \
	&& apt-get install -y --no-install-recommends \
	curl \
	&& curl -s -L https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb \
	-o /tmp/cuda-keyring.deb \
	&& dpkg -i /tmp/cuda-keyring.deb \
	&& apt-get update \
	&& env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	cuda-drivers=${NVIDIA_VERSION} \
	cuda-toolkit-12-8 \
	libcudnn9-cuda-12 \
	&& apt-get purge -y --auto-remove \
	curl \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /

CMD ["wyoming-faster-whisper", "--model", "base", "--uri", "tcp://0.0.0.0:10300", "--language", "en", "--device", "cuda", "--data-dir", "/data"]

HEALTHCHECK --start-period=10m \
	CMD echo '{ "type": "describe" }' \
	| nc -w 1 localhost 10300 \
	| grep -q "faster-whisper" \
	|| exit 1
