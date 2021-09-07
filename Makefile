VERSION = 1.0.0

.PHONY: bin
build:
	go build

.PHONY: clean
clean:
	rm grpc-healthcheck-server

.PHONY: image
image:
	docker build . \
		-t winebarrel/grpc-healthcheck-server:latest \
		-t winebarrel/grpc-healthcheck-server:$(VERSION)

.PHONY: push
push:
	docker push winebarrel/grpc-healthcheck-server:latest
	docker push winebarrel/grpc-healthcheck-server:$(VERSION)
