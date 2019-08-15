.ONESHELL:
.DEFAULT_GOAL := help

node_modules: package.json
	npm ci

# --- init is called from a parent makefile ---
init: node_modules ## Initializes the project

# --- test is called from a parent makefile ---
.PHONY: lint
lint: ## Run any linting

# --- test is called from a parent makefile ---
.PHONY: test
test: node_modules ## Run unit tests

# --- build is called from a parent makefile ---
build: $(wildcard src/**) node_modules ## Build the project
	npm run build

# --- clean is called from a parent makefile ---
clean: ## Cleans the project
	echo "Cleaning!"
	rm -rf node_modules

# --- publish is called from a parent makefile ---
publish: ## Publishes the project
	echo "Deploying!"

.PHONY : help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'