FROM golang:1.18-alpine AS builder

WORKDIR /go/src

ENV GO111MODULE=on CGO_ENABLED=0

COPY . .
RUN go build -o fcrocks

FROM scratch
WORKDIR /app
COPY --from=builder /go/src/fcrocks .

CMD [ "./fcrocks" ]
