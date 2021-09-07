FROM golang:1.17-buster AS build

COPY go.mod go.sum main.go /src/

WORKDIR /src

RUN go mod tidy
RUN go build -o /grpc-healthcheck-server

FROM gcr.io/distroless/base-debian10

COPY --from=build /grpc-healthcheck-server /

ENTRYPOINT ["/grpc-healthcheck-server"]
