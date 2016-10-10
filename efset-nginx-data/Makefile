default: build

NAME=efset-nginx-data
REGISTRY=quay.io/vnadgir_ef/
VERSION=$(shell git rev-parse HEAD)

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(VERSION)
	docker push $(REGISTRY)$(NAME):$(VERSION)
