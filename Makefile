dockerfiles=$(shell find * -name Dockerfile)
images=$(shell echo $(dockerfiles) | xargs -n1 dirname)

.PHONY: all lint $(images)

all: $(images)
	echo $(images)

lint: $(dockerfiles)
	hadolint $^

$(images): %: %/Dockerfile
	docker build -f $< -t $(subst /,:,$@) $@