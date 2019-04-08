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
echo '{{ cookiecutter.name }}/Resources/Configuration.plist' >> .gitignore

if ! [ -x "$(command -v pwgen)" ]; then
    brew install pwgen
fi
password=$(pwgen -s 25 1)
gpg -c --pinentry-mode loopback --passphrase $password ./{{ cookiecutter.name }}/Resources/Configuration.plist
rm -fr ./{{ cookiecutter.name }}/Resources/Configuration.plist

{% if cookiecutter.ipad == "Yes" %}
mint run "Nonchalant/AppIcon" appicon Icon.png --output-path {{ cookiecutter.name }}/Resources/Assets.xcassets/AppIcon.appiconset --ipad
{% else %}
mint run "Nonchalant/AppIcon" appicon Icon.png --output-path {{ cookiecutter.name }}/Resources/Assets.xcassets/AppIcon.appiconset
{% endif %}
rm -fr Icon.png project.yml

mint run "carthage/carthage" carthage update --no-use-binaries --platform iOS --no-build

git init
git add .

if which pre-commit >/dev/null; then
    pre-commit install
    pre-commit run || echo "Some files was changed by git hook"
fi

git add .
git commit -m "Initial commit"
git checkout -b develop

gpg --pinentry-mode loopback --passphrase $password ./{{ cookiecutter.name }}/Resources/Configuration.plist.gpg
echo "Configuration password was copied to the clipboard"
echo $password | pbcopy
