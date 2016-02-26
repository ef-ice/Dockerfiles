default: build

NAME=file-server
REGISTRY=quay.io/vnadgir_ef/

build:
	rm -rf server
	mkdir -p root_dir
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build server.go
	docker build -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME)
	docker push $(REGISTRY)$(NAME)
