SHELL=/bin/bash -o pipefail
GO                := $(shell command -v go)
GOFILES_ALL       := $(shell find . -type f -name '*.go')
PYTHON            := $(shell command -v python || command -v python3)
TOOLS             := \
	github.com/golangci/golangci-lint/cmd/golangci-lint@latest \
	github.com/kyoh86/richgo@latest \

.PHONY: test

deps:
	$(GO) clean -modcache
	$(GO) mod download
	$(GO) mod tidy

update:
	$(GO) get -u
	$(GO) mod tidy

fmt:
	gofmt -l -w $(GOFILES_ALL)

build:
	$(GO) build

test:
	richgo test -failfast -short -v -race -coverprofile=coverage.out -covermode=atomic -p=1 $(PKG_LIST)

clean-testcache:
	$(GO) clean -testcache $(PKG_LIST)

install-tools:
	@for tool in $(TOOLS); do \
		$(GO) install $$tool; \
	done; \

pre-commit-install:
	curl https://pre-commit.com/install-local.py | $(PYTHON) - && \
		rm -rf .git/hooks && pre-commit install && pre-commit install --hook-type commit-msg
