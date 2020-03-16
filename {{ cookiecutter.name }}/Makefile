BREW := /usr/local/bin/brew
PRE_COMMIT_HOOK := .git/hooks/pre-commit

all: bootstrap

## bootstrap: Bootstrap project dependencies for development
bootstrap: $(PRE_COMMIT_HOOK) certs deps homebrew
	mint bootstrap

## deps: Bootstrap swift dependencies
deps:
	mint run carthage/carthage carthage bootstrap --cache-builds --platform ios

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

## carting: Update "Carthage" project Build Phase to include all Carthage dependencies
carting:
	mint run carting carting update

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

$(PRE_COMMIT_HOOK): homebrew
	pre-commit install

## clean: Clean up project files
clean:
	git clean -Xfd

## help: Prints help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /' | sort

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

.PHONY: all help bootstrap test gems certs carting lint fmt homebrew deps swiftlint icon project clean
