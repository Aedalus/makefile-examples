include ./globals.mk

# ------------------------------------------------------------------------------
# SETUP MODULES
# ------------------------------------------------------------------------------
# Use this if you don't care about sub-module order
MODULES=$(dir $(wildcard */makefile))

# Use this if it matters which order sub-modules build/deploy in
# MODULES = sample-ui sample-docker

# ------------------------------------------------------------------------------
# DECLARE RULES
# ------------------------------------------------------------------------------
.PHONY: clean
clean: ## Call the 'clean' target on all sub-modules
	$(foreach mod,$(MODULES),($(MAKE) -C $(mod) $@) || exit $$?;)

.PHONY: lint
lint: ## Call the 'lint' target on all sub-modules
	$(foreach mod,$(MODULES),($(MAKE) -C $(mod) $@) || exit $$?;)

.PHONY: build
build: ## Call the 'build' target on all sub-modules
	$(foreach mod,$(MODULES),($(MAKE) -C $(mod) $@) || exit $$?;)

.PHONY: test
test: ## Call the 'test' target on all sub-modules
	$(foreach mod,$(MODULES),($(MAKE) -C $(mod) $@) || exit $$?;)

.PHONY: plan
plan: ## Call the 'plan' target on all sub-modules
	$(foreach mod,$(MODULES),($(MAKE) -C $(mod) $@) || exit $$?;)

.PHONY: publish
publish: ## Call the 'publish' target on all sub-modules
	$(foreach mod,$(MODULES),($(MAKE) -C $(mod) $@) || exit $$?;)

.PHONY: destroy
destroy: ## Call the 'destroy' target on all sub-modules
	$(foreach mod,$(MODULES),($(MAKE) -C $(mod) $@) || exit $$?;)

.PHONY: dev-all
dev-all: lint build test