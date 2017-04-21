default: build

NAME=logspout-logstash
REGISTRY=quay.io/vnadgir_ef/
CN_REGISTRY=registry-mirror.efset.cn/efset/
VERSION=e00429e

build:
	docker build -t $(NAME) .

clean:
	docker build --no-cache -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(VERSION)
	docker push $(REGISTRY)$(NAME):$(VERSION)

push_china:
	echo "Using version .... $(VERSION)"
	docker tag $(NAME) $(CN_REGISTRY)$(NAME):$(VERSION)
	docker push $(CN_REGISTRY)$(NAME):$(VERSION)

version:
	echo "$(VERSION)"
