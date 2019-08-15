
include ../globals.mk

node_modules: package.json
	npm ci

# --- init is called from a parent makefile ---
init: node_modules ## Initializes the project

# --- test is called from a parent makefile ---
.PHONY: lint
lint: node_modules ## Run any linting
	npx prettier --check src/**

# --- test is called from a parent makefile ---
.PHONY: test
test: node_modules ## Run unit tests
	echo $(ARTIFACT_ID)

# --- build is called from a parent makefile ---
build: $(wildcard src/**) node_modules ## Build the project
	npm run build

# --- clean is called from a parent makefile ---
clean: ## Cleans the project
	echo "Cleaning!"
	rm -rf node_modules build

# --- plan is called from a parent makefile ---
.PHONY: plan
plan: ## Plans any changes before publishing
	cd terraform
	rm -rf .terraform
	terraform init
	terraform plan -var-file=../../environments/$(env)/config.json

	echo $(GREEN)Files from ./build will also be uploaded to the S3 bucket created.$(NO_COLOR)

# --- publish is called from a parent makefile ---
.PHONY: publish
publish: ## Publishes the project
	cd terraform
	rm -rf .terraform
	terraform init
	terraform apply -var-file=../../environments/$(env)/config.json -auto-approve
	terraform output -json

# --- destroy is called from a parent makefile ---
.PHONY: destroy
destroy: ## Destroys the environment
	cd terraform
	rm -rf .terraform
	terraform init
	terraform destroy -var-file=../../environments/$(env)/config.json -auto-approve