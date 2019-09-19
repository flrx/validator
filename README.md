# Flrx Validator

![Pub](https://img.shields.io/pub/v/flrx_validator)
[![Build Status](https://api.cirrus-ci.com/github/flrx/validator.svg)](https://cirrus-ci.com/github/flrx/validator)
[![codecov](https://codecov.io/gh/flrx/validator/branch/master/graph/badge.svg)](https://codecov.io/gh/flrx/validator)
[![GitHub](https://img.shields.io/github/license/flrx/validator)](https://github.com/flrx/validator/blob/master/LICENSE)

A fluent API based validator designed around flutter with simple utility method, that promotes code reuse.
It is highly extensible, modular and testable.

![Validator Utility](doc/flrx_validator_simple.png "Validator Utility")

## Installation

Add the following to your `pubspec.yaml` file

```yaml
dependencies:
  flrx_validator: ^0.3.0
```

## Usage

### Documentation

For more info on Flrx Validator and Rules you can see the [**documentation**](https://flrx.github.io/validator). 

### Built In Rules

|       Rule      |   Arguments  | Description |
|-----------------|--------------|-------------|
|    `AnyRule`    |   ruleList   | Takes A list of rules, Passes when any of the rule passes, Useful for Validation of Username/Email Fields or similar fields|
|   `EmailRule`   |      -       | Passes when String is an E-Mail |
|     `InRule`    | acceptedList | Passes when the value is included in the given list of values. |
| `MaxLengthRule` |   maxLength  | Passes when the String length is less than the given length |
| `MinLengthRule` |   minLength  | Passes when the String length is more than the given length |
|   `NotInRule`   | rejectedList | Passes when the value is not included in the given list of values. |
|   `RegexRule`   |    regex     | Passes when the value matches the given Regex. |
|  `RequiredRule` |       -      | Passes when the value is not null or empty. |

Can't see a rule you need? Raise an issue or create a Pull Request.

### Example

```dart
import 'package:flrx_validator/validator.dart';
import 'package:flrx_validator/rules/email_rule.dart';
import 'package:flrx_validator/rules/required_rule.dart';

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

### Using `validate` method
```dart
TextFormField(
  validator: validate([RequiredRule(), MinLengthRule(6)]),
)
```

## Contributing

Please see [**CONTRIBUTING**](https://github.com/flrx/validator/blob/develop/CONTRIBUTING.md).

## License

Please see [**LICENSE**](https://github.com/flrx/validator/blob/develop/LICENSE).
