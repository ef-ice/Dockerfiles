default: build

NAME=prometheus-cadvisor
REGISTRY=quay.io/vnadgir_ef/
VERSION=latest

build:
	docker build -t $(NAME) .

push:
	docker build -t $(REGISTRY)$(NAME):$(VERSION) .
	docker push $(REGISTRY)$(NAME):$(VERSION)
