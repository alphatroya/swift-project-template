#!/bin/sh

# Generate xcodeproj file
mint run "yonaskolb/XcodeGen"

# Generate SwiftGen files
mint run "swiftgen/swiftgen"

# Download .gitignore file
curl 'https://www.gitignore.io/api/swift,macos,fastlane,carthage' > .gitignore
echo 'Carthage/Checkouts' >> .gitignore
echo '.idea' >> .gitignore

mint run "Nonchalant/AppIcon" appicon Icon.png --output-path {{ cookiecutter.name }}/Resources/Assets.xcassets/AppIcon.appiconset
rm -fr Icon.png

# Trigger initial commit
git init
git add .
git commit -m "Initial commit"
git checkout -b develop
