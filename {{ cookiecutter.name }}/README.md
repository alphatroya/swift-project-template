# {{ cookiecutter.name }}

/// A place for CI status badge

## Bootstrapping development environment
```sh
$./fastlane/bootstrap.sh
```

## Bitrise CI configuration

Paste [bitrise.yml](./fastlane/bitrise.yml) content in the bitrise project settings page.

Additionally several secret ENV variable should be set:

- `$MATCH_PASSWORD`: password to the [match](https://docs.fastlane.tools/actions/match/) repo
- `$FASTLANE_PASSWORD`: AppleID password

## Template info

Project generation was made by the [cookiecutter tool](https://github.com/audreyr/cookiecutter)
and [this](https://github.com/alphatroya/swift-project-template) swift template.

## Copyright

{{ cookiecutter.organization }} ©
