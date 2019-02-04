#!/bin/bash

brew install mint carthage libxml2 pre-commit gpg
gpg --pinentry-mode loopback --passphrase $1 ./{{ cookiecutter.name }}/Resources/Configuration.plist.gpg
mint bootstrap
mint run carthage/carthage carthage bootstrap --cache-builds --platform ios --no-use-binaries
pre-commit install
bundle install
bundle exec fastlane match development --readonly
