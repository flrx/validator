## [v0.6.0-nullsafety]
### Changed
Migrated to Null Safety

## [v0.5.0]
### Added
Added `NumberRule` which checks if the value is a valid number or not
Added `MinRule` which checks if the value is greater a specific number or not
Added `MaxRule` which checks if the value is less than a specific number or not

### Changed
`MinLengthRule`, `MaxLengthRule` now supports List and Map
`RequiredRule` now supports List, Map and other Data types. In case of other Data type, nullability of the value is tested
Update Project Style
Migrate Example to AndroidX
Update Docs Dependencies

### Removed
- `Validator.build()` deprecated in [v0.4.0+2]

## [v0.4.0+2]

### Added
- `EachRule`
- Made `Validator` a callable class
- Allow adding rules via `Validator` constructor

### Deprecated
- `Validator.build()`

### Changed
- Moved all files to src folder. Use `import 'package:flrx_validator/flrx_validator.dart';` *BREAKING CHANGE*
- Minor Code cleanup

### Fixed
- Fixed `transformMessage` not applying properly in `AnyRule`

### Removed
- OneOfRule (deprecated in v0.3.0)

## [v0.3.0]

### Added
- `InRule`, `NotInRule`

### Deprecated
- `OneOfRule` in favour of `InRule`

### Changed
- Minor Code Cleanup.

## [v0.2.0]

### Added
- Support for all Dart projects.

## [v0.1.0]

Initial Release

[v0.6.0-nullsafety]: https://github.com/flrx/validator/compare/v0.6.0-nullsafety...v0.5.0
[v0.5.0]: https://github.com/flrx/validator/compare/v0.5.0...v0.4.0+2
[v0.4.0+2]: https://github.com/flrx/validator/compare/v0.4.0+2...v0.3.0
[v0.3.0]: https://github.com/flrx/validator/compare/v0.3.0...v0.2.0
[v0.2.0]: https://github.com/flrx/validator/compare/v0.2.0...v0.1.0
[v0.1.0]: https://github.com/flrx/validator/tag/v0.1.0
