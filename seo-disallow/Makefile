default: build

NAME=efset-seo-disallow
REGISTRY=quay.io/vnadgir_ef/
VERSION=$(shell git rev-parse --short HEAD)

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(VERSION)
	docker push $(REGISTRY)$(NAME):$(VERSION)
