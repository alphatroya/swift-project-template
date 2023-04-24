API_KEY := fastlane/api-key.json

.PHONY: all
all: test

$(API_KEY):
	touch $@

.PHONY: bootstrap
## bootstrap: Bootstrap project dependencies for development
bootstrap: homebrew hook certs
	mint bootstrap

.PHONY: certs
## certs: Download Apple certificates for development
certs: gems $(API_KEY)
	bundle exec fastlane match development --readonly

.PHONY: project
## project: Generate .xcodeproj file using XcodeGen utility
project:
	mint run "yonaskolb/XcodeGen"

.PHONY: test
## test: Launch unit tests
test: gems $(API_KEY)
	bundle exec fastlane test

.PHONY: gems
## gems: Install ruby dependencies
gems:
	bundle install

.PHONY: homebrew
## homebrew: Bootstrap Homebrew dependencies
homebrew:
	brew bundle check || brew bundle

.PHONY: fmt
## fmt: Launch swift files code formatter
fmt:
	mint run swiftformat swiftformat {{ cookiecutter.name }} {{ cookiecutter.name }}Tests

.PHONY: lint
## lint: Launch swift files linter check
lint:
	mint run swiftformat {{ cookiecutter.name }} {{ cookiecutter.name }}Tests --lint

.PHONY: xcfilelist
## xcfilelist: Regenerate xcfilelist files
xcfilelist:
	mint run swiftgen config generate-xcfilelists \
		--inputs swiftgen-input-files.xcfilelist \
		--outputs swiftgen-output-files.xcfilelist

.PHONY: swiftgen
## swiftgen: Trigger code generation from assets with swiftgen tool
swiftgen:
	mint run swiftgen

GIT_HOOKS_SCRIPTS := $(wildcard hooks/*)

.PHONY: hooks
## hooks: Install git pre-commit hook
hooks:
	$(foreach file,$(GIT_HOOKS_SCRIPTS),ln -sf ../../$(file) .git/$(file); chmod +x .git/$(file);)

.PHONY: clean
## clean: Clean up project files
clean:
	rm -fr .cache .build

.PHONY: help
## help: Prints help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /' | sort
