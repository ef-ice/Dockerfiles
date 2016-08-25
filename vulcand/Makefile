default: build

NAME=vulcand
REGISTRY=quay.io/vnadgir_ef/
TAG=v0.8.0-beta.3

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(TAG)
	docker push $(REGISTRY)$(NAME):$(TAG)
