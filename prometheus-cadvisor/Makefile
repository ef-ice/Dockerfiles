default: build

NAME=prometheus-cadvisor
REGISTRY=quay.io/vnadgir_ef/
CN_REGISTRY=registry-mirror.efset.cn/efset/
VERSION=latest

build:
	docker build -t $(NAME) .

push:
	docker build -t $(REGISTRY)$(NAME):$(VERSION) .
	docker push $(REGISTRY)$(NAME):$(VERSION)

push_china:
	docker tag $(NAME) $(CN_REGISTRY)$(NAME):$(VERSION)
	docker push $(CN_REGISTRY)$(NAME):$(VERSION)
