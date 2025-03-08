FROM ghcr.io/ddollar/nvidia:570.124.06@sha256:82c17995f7b7aefba2808703d73caa790bd10f57cba339e1a3a360938ad52580

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
	&& apt-get purge -y --auto-remove \
	build-essential \
	python3-dev \
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
