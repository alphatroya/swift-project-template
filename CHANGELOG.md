# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.20] - 2020-08-18
### Changed
- Отключены SwiftLint правила prohibited_nan_comparison,
return_value_from_void_function, tuple_pattern и void_function_in_ternary, так как 
они были исключены из релиза
- Включены новые SwiftLint правила: prefer_zero_over_explicit_init

## [1.1.19] - 2020-08-18
### Changed
- После генерации проекта теперь автоматически не создается ветка 'develop'
