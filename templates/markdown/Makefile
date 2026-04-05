################################################################
# Doco: Makefile for building Markdown website
# https://github.com/cliffano/doco
################################################################

# Doco's version number
DOCO_VERSION = 0.9.0-pre.0

$(info ################################################################)
$(info Building Markdown website using Doco:)

################################################################
# Base targets

# CI target to be executed by CI/CD tool
all: ci
ci: deps lint

# Ensure stage directory exists
stage:
	mkdir -p stage/

# Remove all temporary (staged, generated) files
clean:
	rm -rf stage/

# Retrieve the dependencies
deps:
	echo "PLACHOLDER"

deps-extra-apt:
	apt-get install -y markdownlint

lint:
	mdl -s .mdl-style.rb $(shell find . -path ./stage -prune -o -name "*.md" -print)

test:
	echo "PLACEHOLDER"

# Update Makefile to the latest version tag
update-to-latest: TARGET_DOCO_VERSION = $(shell curl -s https://api.github.com/repos/cliffano/doco/tags | jq -r '.[0].name')
update-to-latest: update-to-version

# Update Makefile to the main branch
update-to-main:
	curl https://raw.githubusercontent.com/cliffano/doco/main/src/Makefile-doco -o Makefile

# Update Makefile to the version defined in TARGET_DOCO_VERSION parameter
update-to-version:
	curl https://raw.githubusercontent.com/cliffano/doco/$(TARGET_DOCO_VERSION)/src/Makefile-doco -o Makefile

# Update dotfiles using the generator-website
update-dotfiles: GENERATOR_COMPONENT = $(shell yq .generator.component doco.yml)
update-dotfiles: GENERATOR_INPUTS_PROJECT_ID = $(shell yq .generator.inputs.project_id doco.yml)
update-dotfiles: GENERATOR_INPUTS_PROJECT_NAME = $(shell yq .generator.inputs.project_name doco.yml)
update-dotfiles: GENERATOR_INPUTS_PROJECT_DESC = $(shell yq .generator.inputs.project_desc doco.yml)
update-dotfiles: GENERATOR_INPUTS_AUTHOR_NAME = $(shell yq .generator.inputs.author_name doco.yml)
update-dotfiles: GENERATOR_INPUTS_AUTHOR_EMAIL = $(shell yq .generator.inputs.author_email doco.yml)
update-dotfiles: GENERATOR_INPUTS_GITHUB_ID = $(shell yq .generator.inputs.github_id doco.yml)
update-dotfiles: GENERATOR_INPUTS_GITHUB_REPO = $(shell yq .generator.inputs.github_repo doco.yml)
update-dotfiles: stage
	cd stage/ && \
	  rm -rf generator-website/ && \
	  git clone https://github.com/cliffano/generator-website && \
	  cd generator-website && \
	  make deps && \
	  node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		  --project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		  --project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		  --author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		  --author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		  --github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		  --github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)"
	cd stage/generator-website/stage/$(GENERATOR_COMPONENT) && \
	  cp -R .github/* ../../../../.github/ && \
	  cp .gitignore ../../../../.gitignore && \
	  cp .mdl-style.rb ../../../../.mdl-style.rb

################################################################
# Release targets

release-major:
	rtk release --release-increment-type major

release-minor:
	rtk release --release-increment-type minor

release-patch:
	rtk release --release-increment-type patch

.PHONY: all ci clean deps deps-extra-apt lint test update-to-latest update-to-main update-to-version update-dotfiles release release-major release-minor release-patch