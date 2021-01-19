BREW := /usr/local/bin/brew

all: bootstrap

## bootstrap: Bootstrap project dependencies for development
bootstrap: homebrew hook certs
	mint bootstrap

## certs: Download Apple certificates for development
certs: gems
	bundle exec fastlane match development --readonly

## project: Generate .xcodeproj file using XcodeGen utility
project:
	mint run "yonaskolb/XcodeGen"

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
	mint run swiftformat swiftformat {{ cookiecutter.name }} {{ cookiecutter.name }}Tests

## lint: Launch swift files linter check
lint:
	mint run swiftlint

## swiftgen: Trigger code generation from assets with swiftgen tool
swiftgen:
	mint run swiftgen

## icon: Update application icon from the Icon.png file
icon:
ifneq ("$(wildcard ./Icon.png)","")
{% if cookiecutter.ipad == "Yes" %}
	mint run "Nonchalant/AppIcon" appicon Icon.png --output-path {{ cookiecutter.name }}/Resources/Assets.xcassets/AppIcon.appiconset --ipad
{% else %}
	mint run "Nonchalant/AppIcon" appicon Icon.png --output-path {{ cookiecutter.name }}/Resources/Assets.xcassets/AppIcon.appiconset
{% endif %}
	rm -fr Icon.png
else
	echo 'File "Icon.png" is not exits in the project root directory'
endif

## hook: Install git pre-commit hook
hook:
	ln -sf ../../hooks/pre-commit .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit

## clean: Clean up project files
clean:
	rm -fr .cache .build

## help: Prints help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /' | sort

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

.PHONY: all help bootstrap test gems certs lint fmt homebrew swiftlint icon project clean hook
