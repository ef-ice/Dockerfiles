default: build

NAME=traefik-proxy
REGISTRY=quay.io/vnadgir_ef/
TAG=$(shell git rev-parse --short HEAD)

build:
	docker build -t $(NAME) .

push:
	docker build -t $(REGISTRY)$(NAME):$(TAG) .
	docker push $(REGISTRY)$(NAME):$(TAG)
