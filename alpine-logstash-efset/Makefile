default: build

NAME=alpine-logstash-efset
REGISTRY_EU=quay.io/vnadgir_ef/
REGISTRY_CN=registry-mirror.internal.efset.cn/efset/
VERSION=2.4.1

build:
	docker build -t $(NAME) .

push:
	docker build -t $(REGISTRY_EU)$(NAME):$(VERSION) .
	docker push $(REGISTRY_EU)$(NAME):$(VERSION)

push_china:
	docker build -t $(REGISTRY_CN)$(NAME):$(VERSION) .
	docker push $(REGISTRY_CN)$(NAME):$(VERSION)

clean:
	docker build --no-cache -t $(NAME) .
