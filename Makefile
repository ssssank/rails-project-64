setup:
	bin/setup

start:
	bin/rails server

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

test:
	bin/rails test

.PHONY: test
