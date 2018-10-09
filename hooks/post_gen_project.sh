#!/bin/sh

# Generate xcodeproj file
mint run "yonaskolb/XcodeGen"

# Download .gitignore file
curl 'https://www.gitignore.io/api/swift,macos,fastlane,carthage' > .gitignore
echo 'Carthage/Checkouts' >> .gitignore
echo '.idea' >> .gitignore

# Trigger initial commit
git init
git add .
git commit -m "Initial commit"
git checkout -b develop
