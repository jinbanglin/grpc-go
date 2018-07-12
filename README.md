# gRPC-Go

gRPC-go is a stripped down version of the official [grpc-go](https://github.com/grpc/grpc-go) library.

## Why?

We continually encountered breaking changes, the library didn't feel like it was made to be used by developers. 
The transport was moved to an internal package which broke support for go-micro so we've forked to alleviate these problems.

## Usage

See official [readme](https://github.com/grpc/grpc-go) for usage.

## Compatibility

- gRPC-go continues to be compatible with official grpc applications
- gRPC-go is not a replacement for [go-grpc](https://github.com/micro/go-grpc)

## License

- gRPC-go remains under the same license as the official library
