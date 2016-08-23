default: build

NAME=efset-nginx
REGISTRY=quay.io/vnadgir_ef/

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):v4.5.0
	docker push $(REGISTRY)$(NAME)
