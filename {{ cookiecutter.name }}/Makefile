BREW := /usr/local/bin/brew
PRE_COMMIT_HOOK := .git/hooks/pre-commit

all: bootstrap

## bootstrap: Bootstrap project dependencies for development
bootstrap: $(PRE_COMMIT_HOOK) certs deps homebrew
	mint bootstrap

## deps: Bootstrap swift dependencies
deps:
	mint run carthage/carthage carthage bootstrap --cache-builds --platform ios --no-use-binaries

## certs: Download Apple certificates for development
certs: gems
	bundle exec fastlane match development --readonly

## test: Launch unit tests
test: gems
	bundle exec fastlane test

## gems: Install ruby dependencies
gems:
	bundle install

## homebrew: Bootstrap Homebrew dependencies
homebrew: $(BREW)
	brew bundle check || brew bundle

## fmt: Launch swift files code formatter
fmt:
	mint run swiftformat swiftformat {{ cookiecutter.name }}

## lint: Launch swift files linter check
lint:
	swift run -c release swiftlint

## carting: Update "Carthage" project Build Phase to include all Carthage dependencies
carting:
	mint run carting carting update

## swiftgen: Trigger code generation from assets with swiftgen tool
swiftgen:
	mint run swiftgen

$(PRE_COMMIT_HOOK): homebrew
	pre-commit install

## help: Prints help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

.PHONY: all help bootstrap test gems certs carting lint fmt homebrew deps swiftlint
