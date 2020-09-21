BREW := /usr/local/bin/brew

all: bootstrap

## bootstrap: Bootstrap project dependencies for development
bootstrap: hook certs homebrew
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
	curl "https://gist.githubusercontent.com/alphatroya/884aef2590d3c873d4f0d447d6a95a3c/raw/8a2682772cf9a7625b680771cf9ad9106c6cf00e/pre-commit" > .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit
	echo "\nmint run xcodegen" >> .git/hooks/pre-commit
	echo "git add {{ cookiecutter.name }}.xcodeproj" >> .git/hooks/pre-commit

## clean: Clean up project files
clean:
	git clean -Xfd

## help: Prints help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /' | sort

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

.PHONY: all help bootstrap test gems certs lint fmt homebrew swiftlint icon project clean hook
