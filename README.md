# Flrx Validator

Validator on Steroids

[![Build Status](https://api.cirrus-ci.com/github/flrx/validator.svg)](https://cirrus-ci.com/github/flrx/validator)
[![codecov](https://codecov.io/gh/flrx/validator/branch/master/graph/badge.svg)](https://codecov.io/gh/flrx/validator)

## Installation

Add the following to your `pubspec.yaml` file

```yaml
dependencies:
  flrx_validator: ^0.0.1
```

## Usage

```dart
import 'package:flrx_validator/validator.dart';
import 'package:flrx_validator/rules/email_rule.dart':
import 'package:flrx_validator/rules/required_rule.dart':

....
....

TextFormField(
    validator: Validator<String>()
        .add(RequiredRule())
        .add(EmailRule())
        .build()
);

....
....

```

## Contributing

Please see CONTRIBUTING.md.

## License

Please see [LICENSE](LICENSE).
