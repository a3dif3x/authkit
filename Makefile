# Makefile — shortcuts for everyday development tasks. Run `make` to list them.
.DEFAULT_GOAL := help

BINARY := authkit
PKG    := ./cmd/authkit

.PHONY: help run build tidy fmt clean

help: ## Show available targets
	@awk 'BEGIN {FS = ":.*## "} /^[a-zA-Z_-]+:.*## / {printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

run: ## Run the API locally
	go run $(PKG)

build: ## Build a static binary into bin/
	CGO_ENABLED=0 go build -trimpath -o bin/$(BINARY) $(PKG)

tidy: ## Add missing and remove unused modules
	go mod tidy

fmt: ## Format all Go code
	gofmt -s -w .

clean: ## Remove build and coverage output
	rm -rf bin coverage.out coverage.html
