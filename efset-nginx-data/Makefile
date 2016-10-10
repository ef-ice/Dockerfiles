default: build

NAME=efset-nginx-data
REGISTRY=quay.io/vnadgir_ef/
VERSION=0.0.1

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(VERSION)
	docker push $(REGISTRY)$(NAME):$(VERSION)
