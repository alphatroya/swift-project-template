# {{ cookiecutter.name }}

<!--- A place for CI status badge --->

## Bootstrapping development environment
```sh
make bootstrap
```

## Xcode version
The project must use the specific version of Xcode that is specified in the `.xcode-version` file. This is important to ensure that everyone on the team is using the same version of Xcode, which avoids compatibility issues and makes it easier to collaborate.

To ensure everyone has the correct version of Xcode, it's highly recommended to use [xcodes](https://github.com/RobotsAndPencils/xcodes) tool, which can automatically install and select the right Xcode version using the `xcodes install` and `xcodes select` commands.

Before launching the project, it's important to confirm that each team member has installed the correct version of Xcode using the 'xcodes' tool. This will help ensure a smooth launch and prevent any problems down the line.

## Template info

The project was generated using the [cookiecutter tool](https://github.com/audreyr/cookiecutter)
and [this](https://github.com/alphatroya/swift-project-template) swift template.

Template version: 1.3.0

## AppStore credentials

Interaction with AppStore needs credentials. This project uses the official [AppStore API](https://docs.fastlane.tools/app-store-connect-api). For proper project deployment process, the project owner needs to create the `fastlane/app-key.json` file with access keys and encrypt by gpg tool with a strong password.
```sh
gpg -c fastlane/api-key.json
```
The resulted encrypted file should be committed to the repository.

## Copyright

{{ cookiecutter.organization }} ©
