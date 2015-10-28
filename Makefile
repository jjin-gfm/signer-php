all:
	@cat Makefile | grep : | grep -v PHONY | grep -v @ | sed 's/:/ /' | awk '{print $$1}' | sort

#-------------------------------------------------------------------------------

.PHONY: install
install:
	composer install

.PHONY: test
test: install
	php bin/phpunit

#-------------------------------------------------------------------------------

.PHONY: docs
docs: install
	php bin/sami.php update docs/sami-config.php

.PHONY: pushdocs
pushdocs: docs
	rm -Rf /tmp/gh-pages
	git clone git@github.com:wepay/signer-php.git --branch gh-pages --single-branch /tmp/gh-pages
	cp -Rf ./docs/api-build/ /tmp/gh-pages/
	cd /tmp/gh-pages/ && git add . && git commit -a -m "Automated commit on $$(date)" && git push origin gh-pages

#-------------------------------------------------------------------------------

.PHONY: tag
tag:
	@ if [ $$(git status -s -uall | wc -l) != 0 ]; then echo 'ERROR: Git workspace must be clean.'; exit 1; fi;

	@echo "This release will be tagged as: $$(cat ./VERSION)"
	@echo "This version should match your release. If it doesn't, re-run 'make version'."
	@echo "---------------------------------------------------------------------"
	@read -p "Press any key to continue, or press Control+C to cancel. " x;

	keybase dir sign
	# git add .
	# git commit -a -m "Cryptographically signed the $$(cat ./VERSION) release."
	# git tag $$(cat ./VERSION)

#-------------------------------------------------------------------------------

.PHONY: version
version:
	@echo "Current version: $$(cat ./VERSION)"
	@read -p "Enter new version number: " nv; \
	printf "$$nv" > ./VERSION

#-------------------------------------------------------------------------------

.PHONY: clean
clean:
	rm *.gem
	rm *.gemspec
