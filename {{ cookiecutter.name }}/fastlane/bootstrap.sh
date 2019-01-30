#!/bin/bash

brew install mint carthage libxml2 pre-commit gpg pwgen
mint bootstrap
mint run carthage/carthage carthage bootstrap --cache-builds --platform ios --no-use-binaries
pre-commit install
bundle install
bundle exec fastlane match development --readonly
