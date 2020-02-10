IMAGE_NAME ?= dandelionphp/php
BASE_IMAGE_TAG ?= 7.4-cli-alpine
DEV_IMAGE_TAG ?= 7.4-cli-alpine-dev

.PHONY: buildAll buildBase buildDev pushAll pushBase pushDev

login:
	echo $(DOCKER_HUB_PASSWORD) | docker login -u $(DOCKER_HUB_USERNAME) --password-stdin

buildAll: buildBase buildDev

buildBase:
	docker build -t $(IMAGE_NAME):$(BASE_IMAGE_TAG) ./php/7.4/cli/alpine

buildDev:
	docker build -t $(IMAGE_NAME):$(DEV_IMAGE_TAG) -f ./php/7.4/cli/alpine/dev.Dockerfile ./php/7.4/cli/alpine

pushAll: pushBase pushDev

pushBase: login
	docker push $(IMAGE_NAME):$(BASE_IMAGE_TAG)

pushDev: login
	docker push $(IMAGE_NAME):$(DEV_IMAGE_TAG)