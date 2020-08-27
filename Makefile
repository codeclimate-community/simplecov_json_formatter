.PHONY: image test sh

image: 
	docker image build -t simplecov-json-formatter .

test:
	./bin/run-image rake

sh:
	./bin/run-image sh

