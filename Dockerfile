FROM golang:alpine AS build

WORKDIR /go/src

COPY ./ /go/src
RUN apk update && apk add git \
    && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOARM=6 go build -ldflags '-w -s' -o helloworld


FROM scratch

COPY --from=build /go/src/helloworld /usr/local/bin/helloworld

ENTRYPOINT ["helloworld"]