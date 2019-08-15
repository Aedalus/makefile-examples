.ONESHELL:
.DEFAULT_GOAL := help

# --- init is called from a parent makefile ---
init: ## Initializes the project

# --- test is called from a parent makefile ---
.PHONY: lint
lint: ## Run any linting

# --- test is called from a parent makefile ---
.PHONY: test
test: ## Run unit tests

# --- build is called from a parent makefile ---
build: $(wildcard src/**) ## Build the project

# --- clean is called from a parent makefile ---
clean: ## Cleans the project

# --- publish is called from a parent makefile ---
publish: ## Publishes the project
	echo "Deploying!"

.PHONY : help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'