.PHONY: image test sh

image: 
	docker image build -t codeclimate/simplecov-json-formatter .

test:
	./bin/run-image rake

sh:
	./bin/run-image sh

