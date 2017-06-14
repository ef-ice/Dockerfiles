default: build

NAME=efset-nodejs4.5-webapp-basebuild
REGISTRY=quay.io/vnadgir_ef/
VERSION=1.0.0

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(VERSION)
	docker push $(REGISTRY)$(NAME):$(VERSION)
