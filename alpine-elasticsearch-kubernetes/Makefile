default: build

NAME=alpine-elasticsearch-kubernetes
REGISTRY=quay.io/vnadgir_ef/
VERSION=$(shell grep -E "APP_VERSION=[0-9\.]+" Dockerfile | grep -Eo "[0-9\.]+")

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(VERSION)
	docker push $(REGISTRY)$(NAME):$(VERSION)
