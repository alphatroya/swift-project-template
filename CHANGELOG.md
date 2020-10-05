# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.4] - 2020-10-05
### Changed
- Обновил AppIcon утилиту до 1.0.5 версии, так как предыдущая не собиралась на Swift 5.3

## [1.2.3] - 2020-09-29
### Fixed
- Обновил BartyCrouch утилиту до версии 4.3.0, так как на предыдущей версии были проблемы с Swift 5.3

## [1.2.2] - 2020-09-23
### Changed
- UIViewController lifecycle методы были добавлены в правило organizeDeclarations SwiftFormat

## [1.2.1] - 2020-09-21
### Fixed
- Перенес homebrew target на первое место в bootstrap make таргете чтобы он вызывался 
первым при разворачивании проекта.

## [1.2.0] - 2020-09-21
### Removed
- Удален Carthage, менеджер зависимостей заменен на Swift Package Manager.

## [1.1.28] - 2020-09-18
### Changed
- Swiftformat утилита обновлена до 0.46.2
- Версия swift в проекте повышена до 5.3

## [1.1.27] - 2020-09-18
### Changed
- Удален Carting, теперь его функционал может выполнять XCodeGen.

## [1.1.26] - 2020-09-14
### Changed
- Изменен путь на папку Generated в swiftformat исключениях.

## [1.1.25] - 2020-08-31
### Changed
- Переименовал папку UIKit -> Views (теперь там могут быть общие вьюхи не только от UIKit).
- Переместил родительский класс NavigationController в папку Parent

## [1.1.24] - 2020-08-31
### Changed
- Swiftformat утилита обновлена до 0.46.1
- Включена опция isEmpty для swiftformat для преобразования `.count == 0 => .isEmpty`
- Включена опция `organizeDeclarations` для swiftformat для форматирования структуры файлов
- Выключено правило `type_contents_order` для swiftlint с которым swiftformat конфликтовал

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
