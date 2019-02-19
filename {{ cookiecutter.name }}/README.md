# {{ cookiecutter.name }}

/// Place for CI status badge

## Bootstrapping development environment

Project store sensitive information in separate `Configuration.plist` file. This file
was encrypted using `gpg` tool. Use secret password from the project administrator
as bootstrap script parameter.

```sh
$./fastlane/bootstrap.sh <your password>
```

## Bitrise CI server configuration

Paste [bitrise.yml](./fastlane/bitrise.yml) content in the bitrise project settings page.

Additionally several secret ENV variable should be set:

- `$ENCRYPTION_PASSWORD`: gpg tool passphrase for the encrypted configuration file (was copied to the
  clipboard after project generation)
- `$MATCH_PASSWORD`: password to the [match](https://docs.fastlane.tools/actions/match/) repo
- `$FASTLANE_PASSWORD`: apple ID password

## Template info

Initial project generation has made by [cookiecutter tool](https://github.com/audreyr/cookiecutter)
and [this](https://github.com/alphatroya/swift-project-template) swift template.

## Copyright

{{ cookiecutter.organization }}
