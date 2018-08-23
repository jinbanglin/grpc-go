all: vet test testrace

deps:
	go get -d -v github.com/jinbanglin/grpc-go/...

updatedeps:
	go get -d -v -u -f github.com/jinbanglin/grpc-go/...

testdeps:
	go get -d -v -t github.com/jinbanglin/grpc-go/...

testgaedeps:
	goapp get -d -v -t -tags 'appengine appenginevm' github.com/jinbanglin/grpc-go/...

updatetestdeps:
	go get -d -v -t -u -f github.com/jinbanglin/grpc-go/...

build: deps
	go build github.com/jinbanglin/grpc-go/...

proto:
	@ if ! which protoc > /dev/null; then \
		echo "error: protoc not installed" >&2; \
		exit 1; \
	fi
	go generate github.com/jinbanglin/grpc-go/...

vet:
	./vet.sh

test: testdeps
	go test -cpu 1,4 -timeout 5m github.com/jinbanglin/grpc-go/...

testrace: testdeps
	go test -race -cpu 1,4 -timeout 7m github.com/jinbanglin/grpc-go/...

testappengine: testgaedeps
	goapp test -cpu 1,4 -timeout 5m github.com/jinbanglin/grpc-go/...

clean:
	go clean -i github.com/jinbanglin/grpc-go/...

.PHONY: \
	all \
	deps \
	updatedeps \
	testdeps \
	testgaedeps \
	updatetestdeps \
	build \
	proto \
	vet \
	test \
	testrace \
	clean
