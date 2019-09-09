BREW := /usr/local/bin/brew
PRE_COMMIT_HOOK := .git/hooks/pre-commit

bootstrap: $(PRE_COMMIT_HOOK) install_certs brew_bundle bootstrap_dependencies
	mint bootstrap

bootstrap_dependencies:
	mint run carthage/carthage carthage bootstrap --cache-builds --platform ios --no-use-binaries

install_certs: bootstrap_gems
	bundle exec fastlane match development --readonly

test: bootstrap_gems
	bundle exec fastlane test

bootstrap_gems:
	bundle install

brew_bundle: $(BREW)
	brew bundle check || brew bundle

fmt: brew_bundle
	mint run swiftformat swiftformat {{ cookiecutter.name }}

lint: brew_bundle
	mint run swiftlint

$(PRE_COMMIT_HOOK): brew_bundle
	pre-commit install

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

.PHONY: bootstrap test bootstrap_gems install_certs lint fmt brew_bundle bootstrap_dependencies
