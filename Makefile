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

generate-project-site: clean-project-site
	node_modules/.bin/plop project-site

test-project-site:
	node_modules/.bin/plop project-site -- \
	  --project_id "projectsite" \
		--project_name "ProjectSite" \
		--project_desc "A sample project website" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "project-site" \
		--github_token_prefix "STUDIO"
	cd stage/project-site/ && make ci

########################################
# project-site-partials targets
########################################

clean-project-site-partials:
	rm -rf stage/project-site-partials/

generate-project-site-partials: clean-project-site-partials
	node_modules/.bin/plop project-site-partials

test-project-site-partials:
	node_modules/.bin/plop project-site-partials -- \
	  --project_id "projectsite" \
		--project_name "ProjectSite" \
		--project_desc "A sample project website" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "project-site" \
		--github_token_prefix "STUDIO"

########################################
# doco-site targets
########################################

clean-doco-site:
	rm -rf stage/doco-site/

generate-doco-site: clean-doco-site
	node_modules/.bin/plop doco-site

test-doco-site:
	node_modules/.bin/plop doco-site -- \
	  --project_id "docosite" \
		--project_name "DocoSite" \
		--project_desc "A sample documentation website" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "doco-site" \
		--github_token_prefix "STUDIO"
	cd stage/doco-site/ && make ci

########################################
# doco-site-partials targets
########################################

clean-doco-site-partials:
	rm -rf stage/doco-site-partials/

generate-doco-site-partials: clean-doco-site-partials
	node_modules/.bin/plop doco-site-partials

test-doco-site-partials:
	node_modules/.bin/plop doco-site-partials -- \
	  --project_id "docosite" \
		--project_name "DocoSite" \
		--project_desc "A sample documentation website" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "doco-site" \
		--github_token_prefix "STUDIO"

update-doco-to-latest:
	cd templates/doco-site && make update-to-latest
	cd templates/project-site && make update-to-latest

.PHONY: ci clean clean-project-site clean-project-site-partials clean-doco-site clean-doco-site-partials stage deps generate-project-site test-project-site generate-project-site-partials test-project-site-partials generate-doco-site test-doco-site generate-doco-site-partials test-doco-site-partials update-doco-to-latest
