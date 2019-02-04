# {{ cookiecutter.name }}

/// Place for CI status badge

## Bootstrapping development environment

Project store sensitive information in separate `Configuration.plist` file. This file
was encrypted using `gpg` tool. Use secret password from the project administrator
as bootstrap script parameter.

```sh
$./fastlane/bootstrap.sh <your password>
```

## Template info

Initial project generation has made by [cookiecutter tool](https://github.com/audreyr/cookiecutter)
and [this](https://github.com/alphatroya/swift-project-template) swift template.

## Copyright

{{ cookiecutter.organization }}
