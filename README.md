# protoc-gen-validate-buf

## Usage

example for version `v0.6.6`:

- `buf.yaml`

```yaml
version: v1
deps:
  - buf.build/go-sdk/protoc-gen-validate:v0.6.6
lint:
  use:
    - DEFAULT
breaking:
  use:
    - FILE
```

- `buf.gen.yaml`

```yaml
version: v1
plugins:
  - remote: buf.build/library/plugins/go:v1.27.1-1
    out: pb
    opt:
      - paths=source_relative
  - remote: buf.build/library/plugins/go-grpc:v1.1.0-2
    out: pb
    opt:
      - paths=source_relative
  - remote: buf.build/go-sdk/plugins/protoc-gen-validate:v0.6.6-1
    out: pb
    opt:
      - paths=source_relative
      - lang=go
```

## Link

- [https://github.com/envoyproxy/protoc-gen-validate](https://github.com/envoyproxy/protoc-gen-validate)

- [https://buf.build/go-sdk/protoc-gen-validate](https://buf.build/go-sdk/protoc-gen-validate)

- [https://buf.build/go-sdk/plugins/protoc-gen-validate](https://buf.build/go-sdk/plugins/protoc-gen-validate)
