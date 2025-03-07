FROM ghcr.io/ddollar/nvidia:570.124.06@sha256:6d714e12fc9425bd40d5c8ff8c45053882bd585c690ec5e72763006cec99ad32

ARG WYOMING_VERSION=1.5.0
ARG PIPER_VERSION=1.2.0

ENV PIP_BREAK_SYSTEM_PACKAGES=1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
	apt-get update \
	&& apt-get install -y --no-install-recommends \
	curl \
	netcat-traditional \
	python3 \
	python3-pip \
	&& pip3 install --no-cache-dir -U \
	setuptools==75.8.2 \
	wheel==0.45.1 \
	&& pip3 install --no-cache-dir \
	"wyoming-piper @ https://github.com/rhasspy/wyoming-piper/archive/refs/tags/v${WYOMING_VERSION}.tar.gz" \
	&& curl -L -s \
	"https://github.com/rhasspy/piper/releases/download/v${PIPER_VERSION}/piper_amd64.tar.gz" \
	| tar -zxvf - -C /usr/share \
	&& rm -rf /var/lib/apt/lists/*

CMD ["wyoming-piper", "--piper", "/usr/share/piper/piper", "--uri", "tcp://0.0.0.0:10300", "--voice", "en_US-amy-medium", "--data-dir", "/data", "--data-dir", "/usr/share/piper"]