SWIFTGEN = Pods/SwiftGen/bin/swiftgen
SWIFTFORMAT = Pods/SwiftFormat/CommandLineTool/swiftformat

.PHONY: all
all: test

.PHONY: pods
## pods: Download project packages
pods: gems
	bundle exec pod install

.PHONY: project
## project: Generate .xcodeproj file using XcodeGen utility
project: gems
	mint run "yonaskolb/XcodeGen@2.38.0"

.PHONY: gems
## gems: Install ruby dependencies
gems:
	bundle install

.PHONY: fmt
## fmt: Launch swift files code formatter
fmt:
	$(SWIFTFORMAT) {{ cookiecutter.name }} {{ cookiecutter.name }}Tests

.PHONY: lint
## lint: Launch swift files linter check
lint:
	$(SWIFTFORMAT) {{ cookiecutter.name }} {{ cookiecutter.name }}Tests --lint

.PHONY: xcfilelist
## xcfilelist: Regenerate xcfilelist files
xcfilelist:
	$(SWIFTGEN) config generate-xcfilelists \
		--inputs swiftgen-input-files.xcfilelist \
		--outputs swiftgen-output-files.xcfilelist

.PHONY: swiftgen
## swiftgen: Trigger code generation from assets with swiftgen tool
swiftgen:
	$(SWIFTGEN)

GIT_HOOKS_SCRIPTS := $(wildcard hooks/*)

.PHONY: hooks
## hooks: Install git pre-commit hook
hooks:
	$(foreach file,$(GIT_HOOKS_SCRIPTS),ln -sf ../../$(file) .git/$(file); chmod +x .git/$(file);)

.PHONY: clean
## clean: Clean up project files
clean:
	rm -fr .cache .build Pods

.PHONY: help
## help: Prints help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /' | sort
