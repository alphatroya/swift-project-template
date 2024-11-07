#!/bin/sh

# Generate xcodeproj file
make project

# Download .gitignore file
curl -L 'https://www.gitignore.io/api/swift,macos,fastlane' > .gitignore
echo '.cache' >> .gitignore
{% if cookiecutter.ignore_xcproject == "Yes" %}
    echo '{{ cookiecutter.name }}.xcodeproj' >> .gitignore
    echo '{{ cookiecutter.name }}.xcworkspace' >> .gitignore
{% endif %}

echo 'Pods' >> .gitignore

make fmt
make gems

# Stamp current version of xcode in .xcode-version file
xcodebuild -version | sed 's/Xcode //' | head -n 1 > .xcode-version

git init
git add .
git commit -m "Initial commit"

mise generate pre-commit
