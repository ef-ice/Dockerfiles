default: build

NAME=alpine-logstash-efset
REGISTRY=quay.io/vnadgir_ef/
VERSION=2.4.0

build:
	docker build -t $(NAME) .

push:
	docker build -t $(REGISTRY)$(NAME):$(VERSION) .
	docker push $(REGISTRY)$(NAME):$(VERSION)

clean:
	docker build --no-cache -t $(NAME) .
