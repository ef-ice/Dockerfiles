default: build

NAME=efset-seo-disallow
REGISTRY=quay.io/vnadgir_ef/

build:
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):1.0.0
	docker push $(REGISTRY)$(NAME)
