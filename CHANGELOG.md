## [v0.4.0]

### Added
- `EachRule`
- Made `Validator` a callable class

### Deprecated
- `Validator.build()`

### Changed
- Moved all files to src folder. Use `import 'package:flrx_validator/validator.dart';` *BREAKING CHANGE*

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

[v0.4.0]: https://github.com/flrx/validator/compare/v0.4.0...v0.3.0
[v0.3.0]: https://github.com/flrx/validator/compare/v0.3.0...v0.2.0
[v0.2.0]: https://github.com/flrx/validator/compare/v0.2.0...v0.1.0
[v0.1.0]: https://github.com/flrx/validator/tag/v0.1.0
