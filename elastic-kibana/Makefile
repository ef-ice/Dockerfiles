default: build

NAME=elastic-kibana
REGISTRY=quay.io/vnadgir_ef/

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME)
	docker push $(REGISTRY)$(NAME)
