.PHONY: all lint 

all:

lint: $(shell find . -name Dockerfile)
	hadolint $^