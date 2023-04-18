#!/bin/sh

# Generate xcodeproj file
make project

# Generate SwiftGen files
make swiftgen

# Download .gitignore file
curl -L 'https://www.gitignore.io/api/swift,macos,fastlane' > .gitignore
echo 'fastlane/api-key.json' >> .gitignore
echo '.cache' >> .gitignore
{% if cookiecutter.ignore_xcproject == "Yes" %}
    echo '{{ cookiecutter.name }}.xcodeproj' >> .gitignore
{% endif %}

make fmt
make gems

# Stamp current version of xcode in .xcode-version file
xcodebuild -version | sed 's/Xcode //' | head -n 1 > .xcode-version

git init
git add .
git commit -m "Initial commit"

make hook
