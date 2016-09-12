default: build

NAME=alpine-elasticsearch
REGISTRY=quay.io/vnadgir_ef/
VERSION=1.7.3

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(VERSION)
	docker push $(REGISTRY)$(NAME):$(VERSION)
