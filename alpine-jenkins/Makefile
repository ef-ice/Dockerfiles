default: build

NAME=alpine-jenkins
REGISTRY=quay.io/vnadgir_ef/
VERSION=$(shell grep "ENV JENKINS_VERSION" Dockerfile | cut -d= -f2)

build:
	docker build --force-rm -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(VERSION)
	docker push $(REGISTRY)$(NAME):$(VERSION)
