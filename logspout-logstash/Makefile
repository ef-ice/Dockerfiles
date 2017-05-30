default: build

NAME=logspout-logstash
REGISTRY_EU=quay.io/vnadgir_ef/
REGISTRY_CN=registry-mirror.efset.cn/efset/
VERSION=latest

build:
	docker pull bekt/$(NAME)

push:
	docker tag bekt/$(NAME) $(REGISTRY_EU)$(NAME):$(VERSION) 
	docker push $(REGISTRY_EU)$(NAME):$(VERSION)

push_china:
	docker tag bekt/$(NAME) $(REGISTRY_CN)$(NAME):$(VERSION) 
	docker push $(REGISTRY_CN)$(NAME):$(VERSION)
