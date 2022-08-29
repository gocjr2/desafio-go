FROM golang:1.19.0-alpine3.16 as builder
RUN mkdir -p /app
WORKDIR /app
RUN go mod init app
COPY ./hello.go .
RUN go build ./hello.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello .
CMD ["/app/hello"]
