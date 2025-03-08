FROM ghcr.io/ddollar/ubuntu:22.04@sha256:fb229359b55c732a1027a4bed498800ccf9fb0f486705922f7d95bf96bbb14a5

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
	cuda-12-8 \
	&& rm -rf /var/lib/apt/lists/*