#!/bin/sh

# Generate xcodeproj file
make project

# Generate SwiftGen files
make swiftgen

# Download .gitignore file
curl 'https://www.gitignore.io/api/swift,macos,fastlane,carthage' > .gitignore
echo 'Carthage/Checkouts' >> .gitignore
echo '.idea' >> .gitignore
echo 'Templates' >> .gitignore

make icon

mint run "carthage/carthage" carthage update --no-use-binaries --platform iOS --no-build

make fmt
make gems

git init
git add .
git commit -m "Initial commit"
git checkout -b develop

make hook
