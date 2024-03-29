FROM golang:1.21 as builder
RUN mkdir /build
WORKDIR /build
COPY . /build
ENV CGO_ENABLED=0
RUN go mod vendor
RUN go build -o app

FROM scratch

COPY --from=builder /build/app /app
CMD ["/app"]