default: build

NAME=elastic-kibana
REGISTRY=quay.io/vnadgir_ef/
VERSION=4.6.1

build:
	docker build -t $(NAME) .

push:
	docker build -t $(REGISTRY)$(NAME):$(VERSION) .
	docker push $(REGISTRY)$(NAME):$(VERSION)

clean:
	docker build --no-cache -t $(NAME) .
