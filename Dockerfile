FROM golang:1.23-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o server-ps4 ./server

FROM alpine:latest
RUN apk add --no-cache ca-certificates
WORKDIR /app
COPY --from=builder /app/server-ps4 .
CMD ["./server-ps4"]
