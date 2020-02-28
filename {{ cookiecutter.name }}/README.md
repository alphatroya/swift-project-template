# {{ cookiecutter.name }}

/// A place for CI status badge

## Bootstrapping development environment
```sh
make bootstrap
```

## Bitrise CI configuration

Paste [bitrise.yml](https://github.com/alphatroya/swift-project-template/wiki/Bitrise%20config) content in the bitrise project settings page.

Also some additional environment parameters should be set:

- `$MATCH_PASSWORD`: password to the [match](https://docs.fastlane.tools/actions/match/) repo
- `$FASTLANE_PASSWORD`: AppleID password

## Template info

The project was generated using the [cookiecutter tool](https://github.com/audreyr/cookiecutter)
and [this](https://github.com/alphatroya/swift-project-template) swift template.

Template version: 1.0.30

## Copyright

{{ cookiecutter.organization }} ©
