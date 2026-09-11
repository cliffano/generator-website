ci: clean stage deps test-project-site test-project-site-partials test-doco-site test-doco-site-partials

clean:
	rm -rf stage/

########################################
# project-site targets
########################################

clean-project-site:
	rm -rf stage/project-site/

stage:
	mkdir -p stage/

deps:
	npm install .

########################################
# Utility targets
########################################

# GENERATOR_CONFIG defaults to pagemaker.yml for project-site targets, and doco.yml for doco-site targets, unless overridden
PAGEMAKER_CONFIG := $(if $(GENERATOR_CONFIG),$(GENERATOR_CONFIG),pagemaker.yml)
DOCO_CONFIG := $(if $(GENERATOR_CONFIG),$(GENERATOR_CONFIG),doco.yml)

define set_generator_vars
$(1): GENERATOR_COMPONENT = $$(shell yq .generator.component $(2))
$(1): GENERATOR_INPUTS_PROJECT_ID = $$(shell yq .generator.inputs.project_id $(2))
$(1): GENERATOR_INPUTS_PROJECT_NAME = $$(shell yq .generator.inputs.project_name $(2))
$(1): GENERATOR_INPUTS_PROJECT_DESC = $$(shell yq .generator.inputs.project_desc $(2))
$(1): GENERATOR_INPUTS_AUTHOR_NAME = $$(shell yq .generator.inputs.author_name $(2))
$(1): GENERATOR_INPUTS_AUTHOR_EMAIL = $$(shell yq .generator.inputs.author_email $(2))
$(1): GENERATOR_INPUTS_AUTHOR_URL = $$(shell yq .generator.inputs.author_url $(2))
$(1): GENERATOR_INPUTS_GITHUB_ID = $$(shell yq .generator.inputs.github_id $(2))
$(1): GENERATOR_INPUTS_GITHUB_REPO = $$(shell yq .generator.inputs.github_repo $(2))
$(1): GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX = $$(shell yq .generator.inputs.github_token_prefix $(2))
endef

generate-project-site: clean-project-site
	node_modules/.bin/plop project-site

$(eval $(call set_generator_vars,generate-project-site-with-config,$(PAGEMAKER_CONFIG)))
generate-project-site-with-config: clean-project-site
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-project-site: clean-project-site
	make generate-project-site-with-config GENERATOR_CONFIG=examples/pagemaker-project-site.yml
	cd stage/project-site/ && make deps ci

########################################
# project-site-partials targets
########################################

clean-project-site-partials:
	rm -rf stage/project-site-partials/

generate-project-site-partials: clean-project-site-partials
	node_modules/.bin/plop project-site-partials

$(eval $(call set_generator_vars,generate-project-site-partials-with-config,$(PAGEMAKER_CONFIG)))
generate-project-site-partials-with-config: clean-project-site-partials
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-project-site-partials: clean-project-site-partials
	make generate-project-site-partials-with-config GENERATOR_CONFIG=examples/pagemaker-project-site-partials.yml

########################################
# doco-site targets
########################################

clean-doco-site:
	rm -rf stage/doco-site/

generate-doco-site: clean-doco-site
	node_modules/.bin/plop doco-site

$(eval $(call set_generator_vars,generate-doco-site-with-config,$(DOCO_CONFIG)))
generate-doco-site-with-config: clean-doco-site
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-doco-site: clean-doco-site
	make generate-doco-site-with-config GENERATOR_CONFIG=examples/doco-doco-site.yml
	cd stage/doco-site/ && make deps ci

########################################
# doco-site-partials targets
########################################

clean-doco-site-partials:
	rm -rf stage/doco-site-partials/

generate-doco-site-partials: clean-doco-site-partials
	node_modules/.bin/plop doco-site-partials

$(eval $(call set_generator_vars,generate-doco-site-partials-with-config,$(DOCO_CONFIG)))
generate-doco-site-partials-with-config: clean-doco-site-partials
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-doco-site-partials: clean-doco-site-partials
	make generate-doco-site-partials-with-config GENERATOR_CONFIG=examples/doco-doco-site-partials.yml

update-doco-to-latest:
	cd templates/doco-site && make update-to-latest

update-pagemaker-to-latest:
	cd templates/project-site && make update-to-latest

.PHONY: ci clean clean-project-site clean-project-site-partials clean-doco-site clean-doco-site-partials stage deps generate-project-site generate-project-site-with-config test-project-site generate-project-site-partials generate-project-site-partials-with-config test-project-site-partials generate-doco-site generate-doco-site-with-config test-doco-site generate-doco-site-partials generate-doco-site-partials-with-config test-doco-site-partials update-doco-to-latest update-pagemaker-to-latest
