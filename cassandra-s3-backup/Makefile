default: build

NAME=cassandra-s3-backup
REGISTRY=quay.io/vnadgir_ef/
CN_REGISTRY=registry-mirror.efset.cn/efset/
REF=$(shell git rev-parse --short HEAD)

build:
	docker build -t $(NAME) .

push:
	docker build -t $(REGISTRY)$(NAME):$(REF) .
	docker push $(REGISTRY)$(NAME):$(REF)

push_china:
	docker build -t $(CN_REGISTRY)$(NAME):$(REF) .
	docker push $(CN_REGISTRY)$(NAME):$(REF)

version:
	echo $(REF)
