FROM golang as builder

ARG VV

ENV GOOS=linux GOARCH=amd64 CGO_ENABLED=0

RUN go install -v github.com/envoyproxy/protoc-gen-validate@"$VV"

FROM scratch

ARG VV

LABEL "build.buf.plugins.runtime_library_versions.0.name"="github.com/go-sdk/protoc-gen-validate"
LABEL "build.buf.plugins.runtime_library_versions.0.version"="$VV"

COPY --from=builder /go/bin/protoc-gen-validate /protoc-gen-validate

ENTRYPOINT ["/protoc-gen-validate"]
