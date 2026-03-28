ci: clean stage deps test-gh-pages

clean:
	rm -rf stage/

clean-gh-pages:
	rm -rf stage/gh-pages/

stage:
	mkdir -p stage/

deps:
	npm install .

generate-gh-pages: clean-gh-pages
	node_modules/.bin/plop gh-pages

test-gh-pages:
	node_modules/.bin/plop gh-pages -- \
	    --project_id "gh-pages" \
		--project_name "GH Pages" \
		--project_desc "A sample GH Pages project" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--github_id "pakkunbot" \
		--github_repo "gh-pages"
	cd stage/gh-pages/ && \
	  make ci

.PHONY: ci clean clean-gh-pages stage deps generate-gh-pages test-gh-pages