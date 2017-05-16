default: build

NAME=efset-nginx-data
REGISTRY=quay.io/vnadgir_ef/
CN_REGISTRY=registry-mirror.internal.efset.cn/efset/
VERSION=$(shell git rev-parse --short HEAD)

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(VERSION)
	docker push $(REGISTRY)$(NAME):$(VERSION)

push_china:
	docker tag $(NAME) $(CN_REGISTRY)$(NAME):$(VERSION)
	docker push $(CN_REGISTRY)$(NAME):$(VERSION)
