FROM golang:1.16-buster as build

WORKDIR /go/src

RUN git clone -b v1.25 --depth 1 https://github.com/jandelgado/rabtap.git && cd rabtap && make

FROM gcr.io/distroless/base-debian10
COPY --from=build /go/src/rabtap/bin/rabtap-linux-amd64 /rabtap
ENTRYPOINT ["/rabtap"]
