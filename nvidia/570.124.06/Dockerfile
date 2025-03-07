FROM ubuntu:22.04@sha256:ed1544e454989078f5dec1bfdabd8c5cc9c48e0705d07b678ab6ae3fb61952d2

ARG NVIDIA_VERSION=570.124.06-0ubuntu1

RUN \
	apt-get update \
	&& apt-get install -y --no-install-recommends \
	ca-certificates \
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
	build-essential \
	curl \
	&& rm -rf /var/lib/apt/lists/*