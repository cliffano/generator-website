ci: clean stage deps test-project-site test-doco-site

clean:
	rm -rf stage/

clean-project-site:
	rm -rf stage/project-site/

clean-doco-site:
	rm -rf stage/doco-site/

stage:
	mkdir -p stage/

deps:
	npm install .

generate-project-site: clean-project-site
	node_modules/.bin/plop project-site

generate-doco-site: clean-doco-site
	node_modules/.bin/plop doco-site

test-project-site:
	node_modules/.bin/plop project-site -- \
	    --project_id "project-site" \
		--project_name "ProjectSite" \
		--project_desc "A sample ProjectSite project" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--github_id "pakkunbot" \
		--github_repo "project-site"
	cd stage/project-site/ && \
	  make deps-extra-apt ci

test-doco-site:
	node_modules/.bin/plop doco-site -- \
	    --project_id "doco-site" \
		--project_name "DocoSite" \
		--project_desc "A sample DocoSite project" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--github_id "pakkunbot" \
		--github_repo "doco-site"
	cd stage/doco-site/ && \
	  make deps-extra-apt ci

.PHONY: ci clean clean-project-site clean-doco-site stage deps generate-project-site generate-doco-site test-project-site test-doco-site