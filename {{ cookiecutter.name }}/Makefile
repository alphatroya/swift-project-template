BREW := /usr/local/bin/brew
MINT := /usr/local/bin/mint
CARTHAGE := /usr/local/bin/carthage
PRE_COMMIT := /usr/local/bin/pre-commit
PRE_COMMIT_HOOK := .git/hooks/pre-commit

bootstrap: $(MINT) $(CARTHAGE) $(PRE_COMMIT_HOOK) install_certs
	mint bootstrap
	mint run carthage/carthage carthage bootstrap --cache-builds --platform ios --no-use-binaries

install_certs: bootstrap_gems
	bundle exec fastlane match development --readonly

test: bootstrap_gems
	bundle exec fastlane test

bootstrap_gems:
	bundle install

fmt: $(MINT)
	mint run swiftformat swiftformat {{ cookiecutter.name }}

lint: $(MINT)
	mint run swiftlint

$(PRE_COMMIT_HOOK): $(PRE_COMMIT)
	pre-commit install

$(PRE_COMMIT): $(BREW)
	brew install pre-commit

$(MINT): $(BREW)
	brew install mint libxml2

$(CARTHAGE): $(BREW)
	brew install carthage

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

.PHONY: bootstrap test bootstrap_gems install_certs lint fmt

