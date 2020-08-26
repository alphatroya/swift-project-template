# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.23] - 2020-08-26
### Added
- Сервис bitrise.io включил возможность хранения `bitrise.yml` файла в репозитории. Файл 
перенесен в темплейт из внутренней wiki.

## [1.1.22] - 2020-08-25
### Fixed
- Установил параметр `clone_branch_directly` в false для `create` lane, так как он может 
упасть при первом вызове в новую ветку с ошибкой "You passed '' as branch in combination 
with the `clone_branch_directly` flag. Please remove `clone_branch_directly` flag on the 
first run for _match_ to create the branch."

## [1.1.21] - 2020-08-24
### Fixed
- Добавил проверку на установленный mint в build phase, так как сборка падала на системах
где он не был установлен

## [1.1.20] - 2020-08-18
### Changed
- Обновил SwiftLint утилиту до версии 0.40.0
- Отключены SwiftLint правила prohibited_nan_comparison,
return_value_from_void_function, tuple_pattern и void_function_in_ternary, так как 
они были исключены из релиза
- Включены новые SwiftLint правила: prefer_zero_over_explicit_init

## [1.1.19] - 2020-08-18
### Changed
- После генерации проекта теперь автоматически не создается ветка 'develop'
