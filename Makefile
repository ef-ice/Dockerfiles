default: build

build: build-elasticsearch build-javabase build-logstash build-nginx build-filebeat

push: push-elasticsearch push-javabase push-logstash push-nginx push-filebeat

# elasticsearch
build-elasticsearch:
	cd ./alpine-elasticsearch && make && cd -

push-elasticsearch:
	cd ./alpine-elasticsearch && make push && cd -

# javabase
build-javabase:
	cd ./alpine-javabase && make && cd -

push-javabase:
	cd ./alpine-javabase && make push && cd -

# logstash
build-logstash:
	cd ./alpine-logstash-efset && make && cd -

push-logstash:
	cd ./alpine-logstash-efset && make push && cd -

# nginx
build-nginx:
	cd ./alpine-nginx && make && cd -

push-nginx:
	cd ./alpine-nginx && make push && cd -

# filebeat
build-filebeat:
	cd ./elastic-filebeat && make && cd -

push-filebeat:
	cd ./elastic-filebeat && make push && cd -
