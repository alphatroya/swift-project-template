# Changelog

## [1.2.37] - 2023-04-14
## Changed
- Обновил SwiftFormat до версии 0.51.6
## Removed
- Удалил SwiftLint, линтер в проекте заменён на SwiftFormat

## [1.2.36] - 2023-04-11
## Removed
- Удалил URLRequest+Debug.swift файл, вынес его содержимое в отдельную [библиотеку](https://github.com/alphatroya/curlifier)

## [1.2.35] - 2023-04-04
### Removed
- Удалил NetworkLogger helper класс

## [1.2.34] - 2023-03-31
### Changed
- Удалил BartyCrouch config файл

## [1.2.33] - 2023-03-21
### Removed
- Удален установщик homebrew из Makefile

## [1.2.32] - 2023-01-16
### Removed
- Удален bitrise.yml файл

## [1.2.31] - 2023-01-15
### Changed
- Удалил BartyCrouch helper файл

## [1.2.30] - 2022-10-10
### Changed
- Удалил зависимость с BartyCrouch из Makefile

## [1.2.29] - 2022-10-02
### Changed
- Обновил SwiftFormat утилиту до 0.50.0
- Обновил версию swift в `.swiftformat` до 5.7

## [1.2.28] - 2022-09-20
### Changed
- Теперь используется одно изображение для иконки (Xcode 14+)
- Удалил зависимость appicon и `make icon` target.

## [1.2.27] - 2022-09-16
### Changed
- Обновил swiftgen до версии 6.6.2

## [1.2.26] - 2022-09-13
### Changed
- Обновил swiftformat 0.49.18
- Включил preferDouble правило для swiftformat

## [1.2.25] - 2022-09-12
### Changed
- Обновил SwiftLint 0.49.1
- Почищены правила для swiftlint'а. Линтер больше не создает предупреждения, которые будут исправлены форматтером.
- Включил todo правило

## [1.2.24] - 2022-05-30
### Changed
- Обновил SwiftFormat до 0.49.9
- Обновил версию swift для SwiftFormat до 5.5
- Обновил SwiftLint 0.47.1
- Обновил XCodeGen 2.29.0
- Обновил SwiftGen 6.5.1
- SwiftFormat теперь удаляет заголовки у файлов

## [1.2.23] - 2021-09-11
### Changed
- Обновил SwiftLint до 0.44.0 версии
- Обновил SwiftFormat до 0.48.11 версии

## [1.2.22] - 2021-08-23
### Changed
- Удалён BartyCrouch из проектных билд скриптов

## [1.2.21] - 2021-07-08
### Changed
- Удалён ProjectConfiguration.swift хэлпер, вместо него лучше использовать #if DEBUG проверки.

## [1.2.20] - 2021-03-29
### Changed
- Уменьшил количество информации, которая сохраняется в .xcode-version файле

## [1.2.19] - 2021-03-25
### Fixed
- Добавил генерацию пустого api-key.json файла при вызове fastlane, так как без него вызов `fastlane match` падал.

## [1.2.18] - 2021-03-15
### Changed
- Обновил имена SwiftGen темплейтов до swift5 версии
- Установил переменную окружения FASTLANE_SKIP_UPDATE_CHECK в true. Теперь текст с обновлениями fastlane не будет показываться во время сборки

## [1.2.17] - 2021-03-10
### Changed
- Во время генерации проекта теперь создается `.xcode-version` файл с проектной версией XCode

## [1.2.16] - 2021-02-24
### Changed
- Путь к `api-key.json` файл вынесен в `APP_STORE_CONNECT_API_KEY_PATH` ENV переменную. Теперь нет необходимости указывать путь к ключам доступа при любом использовании `fastlane`.

## [1.2.15] - 2021-01-19
### Changed
- Обновил BartyCrouch до версии 4.4.1
- Удалил `.git` зависимость из `make clean` действия
- Включены следующие правила в .swiftlint.yml: `xct_specific_matcher` `vertical_whitespace_closing_braces` `vertical_whitespace_opening_braces` `unowned_variable_capture` `unavailable_function` `redundant_type_annotation` `ibinspectable_in_extension` `multiline_function_chains` `multiline_parameters` `lower_acl_than_parent` `last_where` `discouraged_optional_collection` `anyobject_protocol`
- Выключено `indentation_width` правило в .swiftlint

## [1.2.14] - 2021-01-15
### Changed
- Обновил SwiftLint до 0.42.0 версии

## [1.2.13] - 2021-01-14
### Changed
- Удалены параметры `apple_id` и `team_name` из Appfile, так как в них нет необходимости при использовании JWT токенов.
- Добавлен параметр `feedback_email` для техподдержки.

## [1.2.12] - 2020-11-16
### Changed
- Обновил SwiftLint до 0.41.0 версии

## [1.2.11] - 2020-10-23
### Changed
- Добавил опцию для удаления `bitrise.yml` конфига во время генерации

## [1.2.10] - 2020-10-22
### Changed
- Добавил параметр api-key для fastlane register_devices команды.

## [1.2.9] - 2020-10-20
### Changed
- Обновил SwiftFormat до версии 0.47.0 и включил опциональное правило markTypes для него

## [1.2.8] - 2020-10-13
### Changed
- Обновил SwiftGen до версии 6.4.0

## [1.2.7] - 2020-10-13
### Changed
- Исключил Generated папку из списка форматирования pre-commit хуков
- Хуки теперь хранятся в папке hooks проекта

## [1.2.6] - 2020-10-12
### Added
- Добавил кэширование клонированных зависимостей SPM для Bitrise CI

## [1.2.5] - 2020-10-08
### Changed
- Изменил конфигурации bitrise и fastlane на использование [AppStore API](https://docs.fastlane.tools/app-store-connect-api/)

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
