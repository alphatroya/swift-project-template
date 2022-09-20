# {{ cookiecutter.name }}

<!--- A place for CI status badge --->

## Bootstrapping development environment
```sh
make bootstrap
```

## Bitrise CI configuration

Configure Bitrise for using stored in repository `bitrise.yml` file.

Also, some secret environment parameters need to be set:

- `$MATCH_PASSWORD`: password to the [match](https://docs.fastlane.tools/actions/match/) repo
- `$APPSTORE_API_KEY_ENCRYPT_PWD`: password for the encrypted `api-key.json` file

## Xcode
The project uses the version of Xcode specified in the `.xcode-version` file

## Template info

The project was generated using the [cookiecutter tool](https://github.com/audreyr/cookiecutter)
and [this](https://github.com/alphatroya/swift-project-template) swift template.

Template version: 1.2.28

## AppStore credentials

Interaction with AppStore needs credentials. This project uses the official [AppStore API](https://docs.fastlane.tools/app-store-connect-api). For proper project deployment process, the project owner needs to create the `fastlane/app-key.json` file with access keys and encrypt by gpg tool with a strong password. 
```sh
gpg -c fastlane/api-key.json
```
The resulted encrypted file should be committed to the repository.

## Copyright

{{ cookiecutter.organization }} ©
