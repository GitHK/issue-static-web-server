default:= help

IMAGE_NAME:=custom-static-webserver:latest

.PHONY: help
help: ## help on rule's targets
	@awk 'BEGIN {FS = ":.*?## "} /^[[:alpha:][:space:]_-]+:.*?## / {printf "%-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)


.PHONY: build
build: ## builds image
	@docker build . -t ${IMAGE_NAME}


.PHONY: run
run: ## runs the service
	@docker run -it --rm -e RUST_BACKTRACE=full -e SERVER_HOST=0.0.0.0 -e SERVER_PORT=80 -e SERVER_LOG_LEVEL=debug ${IMAGE_NAME}


.PHONY: shell
shell: ## run shell into container
	@docker run -it --rm -e RUST_BACKTRACE=full -e SERVER_HOST=0.0.0.0 -e SERVER_PORT=80 -e SERVER_LOG_LEVEL=debug ${IMAGE_NAME} sh