.PHONY: image test format sh

image: 
	docker image build -t simplecov-json-formatter .

test:
	./bin/run-image rake

format:
	./bin/run-image rubocop -a

sh:
	./bin/run-image sh

