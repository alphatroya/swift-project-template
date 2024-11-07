SWIFTFORMAT = Pods/SwiftFormat/CommandLineTool/swiftformat

.PHONY: all
all: test

.PHONY: project
## project: Generate .xcodeproj file using XcodeGen utility
project:
	mint run "yonaskolb/XcodeGen@2.38.0"

.PHONY: fmt
## fmt: Launch swift files code formatter
fmt:
	$(SWIFTFORMAT) {{ cookiecutter.name }} {{ cookiecutter.name }}Tests

.PHONY: lint
## lint: Launch swift files linter check
lint:
	$(SWIFTFORMAT) {{ cookiecutter.name }} {{ cookiecutter.name }}Tests --lint

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
