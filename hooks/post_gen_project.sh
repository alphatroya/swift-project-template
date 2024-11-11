#!/bin/sh

# Install all dependencies
mise install

# Generate xcodeproj file
mise run project

# Download .gitignore file
curl -L 'https://www.gitignore.io/api/swift,macos,fastlane' > .gitignore
{% if cookiecutter.ignore_xcproject == "Yes" %}
    echo '{{ cookiecutter.name }}.xcodeproj' >> .gitignore
{% endif %}

mise run fmt

# Stamp current version of xcode in .xcode-version file
xcodebuild -version | sed 's/Xcode //' | head -n 1 > .xcode-version

git init
git add .
git commit -m "Initial commit"

mise generate git-pre-commit --write
