.PHONY: all
all:    lint build

lint:
	gofmt -w -s *.go

build:
	CGO_ENABLED=0 go build -o ./tautulli-exporter tautulli-exporter.go

docker:
	docker buildx build --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --push -t visago/tautulli-exporter .
