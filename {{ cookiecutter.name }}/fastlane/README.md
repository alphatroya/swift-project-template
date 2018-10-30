fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios create
```
fastlane ios create
```
Create a new application on the developer portal
### ios bootstrap
```
fastlane ios bootstrap
```
Initial bootstrap project for development
### ios register
```
fastlane ios register
```
Register devices on apple portal
### ios test
```
fastlane ios test
```
Perform test checks
### ios internal
```
fastlane ios internal
```
Deploy a build for beta testing
### ios external
```
fastlane ios external
```
Deploy a build for the external beta testing
### ios release
```
fastlane ios release
```
Deploy a release build

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
