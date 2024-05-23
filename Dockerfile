############################
# STEP 1 build executable binary
############################
FROM golang:1.20.0 AS builder
RUN mkdir /work
WORKDIR /work
COPY ./ ./
RUN CGO_ENABLED=0 go build -o /work/tautulli-exporter
############################
# STEP 2 build a small image
############################
FROM scratch
WORKDIR /go/bin
COPY --from=builder /work/tautulli-exporter /go/bin/tautulli-exporter
EXPOSE 9487/tcp
ENTRYPOINT ["./tautulli-exporter"]
