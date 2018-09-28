FROM golang:alpine AS build

WORKDIR /go/src

COPY ./ /go/src
RUN CGO_ENABLED=0 GOARM=6 go build -ldflags '-w -s' -o helloworld

FROM scratch

COPY --from=build /go/src/helloworld /usr/local/bin/helloworld

ENTRYPOINT ["helloworld"]