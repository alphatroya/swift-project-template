#!/bin/sh

# Generate xcodeproj file
make project

# Generate SwiftGen files
make swiftgen

# Download .gitignore file
curl -L 'https://www.gitignore.io/api/swift,macos,fastlane' > .gitignore
echo '.idea' >> .gitignore
echo 'Templates' >> .gitignore

make icon

make fmt
make gems

git init
git add .
git commit -m "Initial commit"

make hook
