# Introduction

## What is Flrx validator?

It is a fluent API based FormField validator for flutter, that promotes code reuse. It is highly extensible, modular and testable.

It is as simple as doing the following:

```dart
TextFormField(
    validator: Validator<String>(
      rules: [RequiredRule(), EmailRule()],
    )
);
```

## Why use this?

There are many existing libraries solving this problem, but we did not find any solution which was made specifically for Flutter, was Dart 2 compatible, and at the same time was extensible.

We wanted a solution which was so flexible that if we wanted to localize or transform the messages given by the validator, we could do so and still be able to keep it clean.

## Getting started

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flrx_validator: ^0.4.0
```
