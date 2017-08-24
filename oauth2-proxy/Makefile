default: build

NAME=efset-bitly-oauth2-proxy
REGISTRY_EU=quay.io/vnadgir_ef/
REGISTRY_CN=registry-mirror.efset.cn/efset/
VERSION=$(shell git rev-parse --short HEAD)

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY_EU)$(NAME):$(VERSION)
	docker push $(REGISTRY_EU)$(NAME):$(VERSION)

push_china:
	docker tag $(NAME) $(REGISTRY_CN)$(NAME):$(VERSION)
	docker push $(REGISTRY_CN)$(NAME):$(VERSION)

run:
	docker run -it $(NAME)
