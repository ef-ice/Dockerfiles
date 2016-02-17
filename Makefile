default: build

build: javabase elasticsearch solr
	echo "Done."

javabase:
	cd ./alpine-javabase && make && cd -

elasticsearch:
	cd ./alpine-elasticsearch && make && cd -

solr:
	cd ./alpine-solr && make && cd -
