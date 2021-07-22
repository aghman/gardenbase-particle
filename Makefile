GO=/usr/local/go/bin/go

.DEFAULT_GOAL=build

.PHONY: setup build
setup:
	go mod vendor
	go mod tidy
	go mod vendor


.PHONY: build build_arm build_arm64 build_darwin_arm64

build: build_arm build_arm64 build_darwin_arm64

build_arm:
	GOOS=linux GOARCH=arm go build -o build/gbparticle_linux_arm cmd/main.go 
build_arm64:
	GOOS=linux GOARCH=arm64 go build -o build/gbparticle_linux_arm64 cmd/main.go
build_darwin_arm64:
	GOOS=darwin GOARCH=arm64 go build -o build/gbparticle_darwin_arm64 cmd/main.go