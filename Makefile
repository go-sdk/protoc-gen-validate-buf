VERSION := v0.6.6
PATCH   := 1

.PHONY: init
init:
	git submodule update --init
	@mkdir -p validate
	cp -rf protoc-gen-validate/validate/validate.proto validate

diff-pb:
	diff validate/validate.pb.go protoc-gen-validate/validate/validate.pb.go

buf-build:
	buf build -v

buf-gen:
	buf generate -v

buf-push:
	buf push --tag $(VERSION)

docker-build:
	docker build --platform linux/amd64 --force-rm --compress -f Dockerfile -t plugins.buf.build/go-sdk/protoc-gen-validate:$(VERSION)-$(PATCH) --build-arg VV=$(VERSION) .

docker-push:
	docker push plugins.buf.build/go-sdk/protoc-gen-validate:$(VERSION)-$(PATCH)
