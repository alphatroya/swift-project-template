# iOS application template

![Build project and run tests](https://github.com/alphatroya/swift-project-template/workflows/Build%20project%20and%20run%20tests/badge.svg)

This project template was used by me to jump-start new iOS app projects. It comes with a minimalistic design, a well-defined file structure, and several pre-configured tools to make the development experience more productive and efficient.

## Features

Here are some of the key features of this project template:

- **A Minimalistic Design**: The design of this project template is simple and clean, includes only required tools.
- **File Structure**: The project template provides file structure, making it easy to organize your code and assets.
- **Source Code Linter and Formatter**: The project template comes pre-configured SwiftFormat formatter and linter that help ensure your code follows best practices and is easy to read and understand.
- **Git Hooks**: Git hooks are installed during bootstrap.
- **Xcode Project File Generation**: The project template includes a script that generates an Xcode project file, which avoid merge conflicts during teamwork.
- **No External Framework Dependencies**: The project template does not rely on any external frameworks or libraries, making it easy to maintain and update.
- **Version Lock**: A Mintfile provides tools version lock, ensuring that you always have the correct version of each tool.
- **.xcode-version support**: A .xcode-version file created during project bootstrap and specifies the version of Xcode required to build the project.
- **.gitignore generation**: This ensures that unnecessary files are not tracked by Git.

## Getting Started

### Prerequisites

Make sure that `cookiecutter` and `mint` tools are installed. Preferred way to make it is using homebrew.

```sh
brew install cookiecutter mint
```

### Bootstrap a new project

```sh
cookiecutter gh:alphatroya/swift-project-template`
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
