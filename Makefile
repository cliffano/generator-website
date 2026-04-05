ci: clean stage deps test-gh-pages

clean:
	rm -rf stage/

clean-gh-pages:
	rm -rf stage/gh-pages/

clean-markdown:
	rm -rf stage/markdown/

stage:
	mkdir -p stage/

deps:
	npm install .

generate-gh-pages: clean-gh-pages
	node_modules/.bin/plop gh-pages

generate-markdown: clean-markdown
	node_modules/.bin/plop markdown

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

test-markdown:
	node_modules/.bin/plop markdown -- \
	    --project_id "markdown" \
		--project_name "Markdown" \
		--project_desc "A sample Markdown project" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--github_id "pakkunbot" \
		--github_repo "markdown"
	cd stage/markdown/ && \
	  make ci

.PHONY: ci clean clean-gh-pages clean-markdown stage deps generate-gh-pages generate-markdown test-gh-pages test-markdown