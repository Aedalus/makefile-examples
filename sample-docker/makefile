include ../makefiles/globals.mk

# --- init is called from a parent makefile ---
init: ## Initializes the project

# --- test is called from a parent makefile ---
.PHONY: lint
lint: ## Run any linting

# --- test is called from a parent makefile ---
.PHONY: test
test: ## Run unit tests

# --- build is called from a parent makefile ---
build: $(wildcard src/**) dockerfile ## Build the project
	mkdir -p ./build
	docker build -t "my-image" .
	docker save my-image > ./build/my-image.tar

# --- clean is called from a parent makefile ---
clean: ## Cleans the project
	rm -rf build

# --- plan is called from a parent makefile ---
.PHONY: plan
plan: ## Plans any changes before publishing
	@echo $(ARTIFACT_ID)

# --- publish is called from a parent makefile ---
.PHONY: publish
publish: ## Publishes the project
	echo $(GREEN)Publishing docker image (mock)$(NO_COLOR)

# --- destroy is called from a parent makefile ---
.PHONY: destroy
destroy: ## Destroys the environment
	echo "Nothing to do"