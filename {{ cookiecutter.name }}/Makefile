API_KEY := fastlane/api-key.json

all: bootstrap

$(API_KEY):
	touch $@

## bootstrap: Bootstrap project dependencies for development
bootstrap: homebrew hook certs
	mint bootstrap

## certs: Download Apple certificates for development
certs: gems $(API_KEY)
	bundle exec fastlane match development --readonly

## project: Generate .xcodeproj file using XcodeGen utility
project:
	mint run "yonaskolb/XcodeGen"

## test: Launch unit tests
test: gems $(API_KEY)
	bundle exec fastlane test

## gems: Install ruby dependencies
gems:
	bundle install

## homebrew: Bootstrap Homebrew dependencies
homebrew:
	brew bundle check || brew bundle

## fmt: Launch swift files code formatter
fmt:
	mint run swiftformat swiftformat {{ cookiecutter.name }} {{ cookiecutter.name }}Tests

## lint: Launch swift files linter check
lint:
	mint run swiftformat {{ cookiecutter.name }} {{ cookiecutter.name }}Tests --lint

## swiftgen: Trigger code generation from assets with swiftgen tool
swiftgen:
	mint run swiftgen

GIT_HOOKS_SCRIPTS := $(wildcard hooks/*)

## hook: Install git pre-commit hook
hook:
	$(foreach file,$(GIT_HOOKS_SCRIPTS),ln -sf ../../$(file) .git/$(file); chmod +x .git/$(file);)

## clean: Clean up project files
clean:
	rm -fr .cache .build

## help: Prints help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /' | sort

.PHONY: all help bootstrap test gems certs lint fmt homebrew project clean hook
