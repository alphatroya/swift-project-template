#!/bin/sh

# Generate xcodeproj file
make project

# Generate SwiftGen files
make swiftgen

# Download .gitignore file
curl -L 'https://www.gitignore.io/api/swift,macos,fastlane' > .gitignore
echo '.idea' >> .gitignore
echo 'Templates' >> .gitignore
echo 'fastlane/api-key.json' >> .gitignore
echo '.cache' >> .gitignore

make icon

make fmt
make gems

{% if cookiecutter.enable_bitrise == "No" %}
    rm -fr bitrise.yml
{% endif %}

xcodebuild -version | sed 's/Xcode //' | head -n 1 > .xcode-version

git init
git add .
git commit -m "Initial commit"

make hook
