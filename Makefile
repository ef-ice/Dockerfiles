default: build

build: build-javabase build-elasticsearch build-solr
	echo "Done."

push: push-javabase push-elasticsearch push-solr

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

