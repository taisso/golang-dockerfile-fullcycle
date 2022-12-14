FROM golang:1.19 as build
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 go build -o /go/bin/app

FROM scratch
COPY --from=build /go/bin/app /
CMD ["/app"]