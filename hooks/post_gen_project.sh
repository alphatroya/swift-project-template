#!/bin/sh

# Generate xcodeproj file
mint run "yonaskolb/XcodeGen"

# Generate SwiftGen files
mint run "swiftgen/swiftgen"

# Download .gitignore file
curl 'https://www.gitignore.io/api/swift,macos,fastlane,carthage' > .gitignore
echo 'Carthage/Checkouts' >> .gitignore
echo '.idea' >> .gitignore
echo 'Templates' >> .gitignore

{% if cookiecutter.ipad == "Yes" %}
mint run "Nonchalant/AppIcon" appicon Icon.png --output-path {{ cookiecutter.name }}/Resources/Assets.xcassets/AppIcon.appiconset --ipad
{% else %}
mint run "Nonchalant/AppIcon" appicon Icon.png --output-path {{ cookiecutter.name }}/Resources/Assets.xcassets/AppIcon.appiconset
{% endif %}
rm -fr Icon.png project.yml

# Trigger initial commit
git init
git add .
git commit -m "Initial commit"
git checkout -b develop

if which pre-commit >/dev/null; then
    pre-commit install
fi

mint run "carthage/carthage" carthage bootstrap --no-use-binaries --platform iOS --cache-builds
