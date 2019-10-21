# Rule

[[toc]]

## Introduction

`Rule` encapsulates validation logic and its associated validation message. They are reusable and easily testable.

## Built-in Rules

Flrx Validator comes with lot of built-in rules:

### RequiredRule

This `Rule` validates if the input provided to it is not empty.

```dart
Validator<String>()
    .add(RequiredRule())
    .build()
```

**Output**

```
Entity is required
```

### MaxLengthRule

This `Rule` validates if the input's length is less than the max limit.

```dart
Validator<String>()
    .add(MaxLengthRule(20))
    .build()
```

**Output**

```
Entity should be less than 20 characters
```

### MinLengthRule

This `Rule` validates if the input's length is more than the min limit.

```dart
Validator<String>()
    .add(MinLengthRule(6))
    .build()
```

**Output**

```
Entity should be more than 6 characters
```

### RegexRule

This `Rule` validates if the input matches a `RegEx` pattern.

```dart
Validator<String>()
    .add(RegexRule(r"([(+]*[0-9]+[()+. -]*)"))
    .build()
```

**Output**

```
Value is not a valid pattern
```

### EmailRule

This `Rule` is an extension of `RegexRule` which checks the input against the email regex pattern.

```dart
Validator<String>()
    .add(EmailRule())
    .build()
```

**Output**

```
Value is not a valid email address
```

### OneOfRule (Deprecated, See [InRule](#inrule)) 

This `Rule` checks whether the input provided is present in the the values provided to the `OneOfRule`.

```dart
Validator<String>()
    .add(OneOfRule(['value1', 'value2', 'value3']))
    .build()
```

**Output**

```
Entity is not in the list of accepted values.
```

### InRule

This `Rule` checks if the value provided is in the list of accepted values.

```dart
Validator<String>()
    .add(InRule(['value1', 'value2', 'value3']))
    .build()
```

**Output**

```
Entity is not in the list of accepted values.
```

### NotInRule

This `Rule` checks if the value provided is not in the list of rejected values.

```dart
Validator<String>()
    .add(NotInRule(['value1', 'value2', 'value3']))
    .build()
```

**Output**

```
Entity is in list of rejected values.
```

### AnyRule

This `Rule` checks whether the input provided passes any of the `Rule`s provided to `AnyRule`.

```dart
Validator<String>()
    .add(AnyRule([MinLengthRule(6), EmailRule()]))
    .build()
```

**Output**

```
Value is not a valid email address.
```

### AllRule

This `Rule` checks whether the input provided passes all of the `Rule`s provided to `AllRule`.
This rule also returns the validation message for all `Rule`s passed to it.

```dart
Validator<String>()
    .add(AllRule([
      MinLengthRule(6),
      RegexRule(
        r'(?=.*[a-z])',
        validationMessage: ":entity should contain one lowercase character",
      ),
    ]))
    .build()
```

**Output**

```
Password should be more than 6 characters
Password should contain one lowercase character
```

`AllRule` also accepts a `concatenator` which concatenates all the validation messages.

## Custom Validation Rule

The built-in rules are not an exhaustive list of rules that can be possible. Hence the user can always extend the `Rule` class and create custom validation `Rule`s according to the requirements.

The custom validation rule can be written this way:

<<< @/code/custom_rule.dart

## Custom Validation Message

All rules can take a custom validation message in case you want to show something else instead of the built in message.

You can pass a custom message as follows

```dart
Validator<String>()
    .add(RequiredRule(validationMessage:"Email is needed for creating an account"))
    .build()
```

**Output**

```
Email is needed for creating an account
```

## Transforming the message

All rules can take `transformMessage` function as well just like the `Validator`.

You can refer [**`Validator.transformMessage()`**](./validator.html#transforming-the-message) for more Info.