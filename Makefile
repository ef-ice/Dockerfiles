default: build

build: build-filebeat build-javabase build-elasticsearch build-solr

push: push-filebeat push-javabase push-elasticsearch push-solr

build-filebeat:
	cd ./elastic-filebeat && make && cd -

push-filebeat:
	cd ./elastic-filebeat && make push && cd -

build-javabase:
	cd ./alpine-javabase && make && cd -

push-javabase:
	cd ./alpine-javabase && make push && cd -

build-elasticsearch:
	cd ./alpine-elasticsearch && make && cd -

push-elasticsearch:
	cd ./alpine-elasticsearch && make push && cd -

build-solr:
	cd ./alpine-solr && make && cd -

push-solr:
	cd ./alpine-solr && make push && cd -

