FROM ghcr.io/ddollar/nvidia:570.124.06@sha256:56e19b4a101ed893fae5419bf8146cbbb04cd2bce9f14596b444405c6a1093e1

ARG WYOMING_VERSION=1.5.2.dd0
ARG PIPER_COMMIT=9b1c6397698b1da11ad6cca2b318026b628328ec

ENV PIP_BREAK_SYSTEM_PACKAGES=1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /usr/src

RUN \
	apt-get update \
	&& apt-get install -y --no-install-recommends \
	cmake \
	curl \
	git \
	netcat-traditional \
	python3 \
	python3-pip \
	&& pip3 install --no-cache-dir -U \
	setuptools==75.8.2 \
	wheel==0.45.1 \
	&& pip3 install --no-cache-dir \
	onnxruntime-gpu==1.21.0 \
	&& curl -Ls https://github.com/rhasspy/piper/archive/${PIPER_COMMIT}.tar.gz | tar xz \
	&& make -C piper-${PIPER_COMMIT} \
	&& mv piper-${PIPER_COMMIT}/install /usr/share/piper \
	&& pip3 install --no-cache-dir \
	"wyoming-piper @ https://github.com/ddollar/wyoming-piper/archive/refs/tags/v${WYOMING_VERSION}.tar.gz" \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /
VOLUME /data
EXPOSE 10200

CMD ["wyoming-piper", "--piper", "/usr/share/piper/piper", "--uri", "tcp://0.0.0.0:10200", "--voice", "en_US-glados-medium", "--data-dir", "/data", "--data-dir", "/usr/share/piper"]