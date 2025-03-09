FROM ghcr.io/ddollar/nvidia:570.124.06@sha256:56e19b4a101ed893fae5419bf8146cbbb04cd2bce9f14596b444405c6a1093e1

ARG WYOMING_VERSION=2.4.0

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
	"wyoming-faster-whisper @ https://github.com/rhasspy/wyoming-faster-whisper/archive/refs/tags/v${WYOMING_VERSION}.tar.gz" \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /
VOLUME /data
EXPOSE 10300

CMD ["wyoming-faster-whisper", "--model", "base", "--uri", "tcp://0.0.0.0:10300", "--language", "en", "--device", "cuda", "--data-dir", "/data"]

HEALTHCHECK --start-period=10m \
	CMD echo '{ "type": "describe" }' \
	| nc -w 1 localhost 10300 \
	| grep -q "faster-whisper" \
	|| exit 1
