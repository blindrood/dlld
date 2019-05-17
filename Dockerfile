FROM golang:1.10-alpine as builder

RUN apk --no-cache update && apk add git upx

RUN mkdir -p /go/src/github.com/blindrood/dlld
WORKDIR /go/src/github.com/blindrood/dlld
COPY . /go/src/github.com/blindrood/dlld

RUN go get -d -v ./...

# bugfix
WORKDIR /go/src/github.com/docker/go-connections
RUN git checkout tags/v0.4.0
WORKDIR /go/src/github.com/blindrood/dlld

RUN go build --ldflags '-extldflags "-static"' -o /usr/bin/dlld
RUN upx /usr/bin/dlld

FROM alpine
RUN mkdir -p /run/docker/plugins
COPY --from=builder /usr/bin/dlld /dlld
CMD ["dlld"]
