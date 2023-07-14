FROM golang:alpine AS build
WORKDIR /home/golang
COPY main.go .
RUN go build main.go

FROM scratch as prod
WORKDIR /home/golang
COPY --from=build /home/golang/main .
ENTRYPOINT [ "./main" ]
