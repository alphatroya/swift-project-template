BREW := /usr/local/bin/brew
PRE_COMMIT_HOOK := .git/hooks/pre-commit

bootstrap: $(PRE_COMMIT_HOOK) certs brew_bundle deps
	mint bootstrap

deps:
	mint run carthage/carthage carthage bootstrap --cache-builds --platform ios --no-use-binaries

certs: gems
	bundle exec fastlane match development --readonly

test: gems
	bundle exec fastlane test

gems:
	bundle install

brew_bundle: $(BREW)
	brew bundle check || brew bundle

fmt: brew_bundle
	mint run swiftformat swiftformat {{ cookiecutter.name }}

lint: brew_bundle
	mint run swiftlint

carting:
	mint run carting carting update

swiftgen:
	mint run swiftgen

$(PRE_COMMIT_HOOK): brew_bundle
	pre-commit install

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

.PHONY: bootstrap test gems certs carting lint fmt brew_bundle deps swiftlint
