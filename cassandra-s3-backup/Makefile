default: build

NAME=cassandra-s3-backup
REGISTRY=quay.io/vnadgir_ef/
REF=$(shell git rev-parse --short HEAD)

build:
	docker build -t $(NAME) .

push:
	docker build -t $(REGISTRY)$(NAME):$(REF) .
	docker push $(REGISTRY)$(NAME):$(REF)

version:
	echo $(REF)
