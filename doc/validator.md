# Validator

[[toc]]

## Introduction

Validator is primarily designed to be used by Flutter's `FormField`'s validator.

The `Validator` takes a List of `Rule`. The value supplied to the
`Validator` is supplied to the `Rule`s in the order they were registered.
The error message of the first `Rule` that fails is returned back. If all the `Rule`s pass, then null is returned to the `FormField`.

## Adding Rules

The `Validator` takes `Rule`s againt which the value is validated. You can add `Rule`s to the validator in the following ways

### Via `add()`

```dart
TextFormField(
    validator: Validator<String>()
        .add(RequiredRule())
        .build()
)
```

As `Validator`'s add method returns `Validator` instance, therefore we can chain it to do something like this.

```dart
TextFormField(
    validator: Validator<String>()
        .add(RequiredRule())
        .add(EmailRule())
        .build()
)
```

### Via `addAll()`

If you have multiple `Rule`s to add and you do not want to chain the `add` method, then `addAll` method can be used as shown below:

```dart
TextFormField(
    validator: Validator<String>()
        .addAll([RequiredRule(), EmailRule()])
        .build()
)
```

::: tip Remember
The **`Validator`** runs the **`Rule`**'s in the order they are registered.
:::

## Specifying name of the entity

`Validator` also accepts the name of the entity/field on which it is run, this way it is able to customize its validation message and put the `entityName` provided in its constructor.

```dart
TextFormField(
    validator: Validator<String>(entityName: 'Password')
        .add(MinLengthRule(6))
        .build()
```

will produce a validation message like:

```
Password should be more than 6 characters
```

## Transforming the message

`Validator` also accepts a function which can be used to transform the message that is returned after the validation of the input.

`transformMessage` function can be used for cases like localization amongst others.

By default, `transformMessage` replaces the `keys` in the `message` by the corresponding `values` which are defined in the `params` map.

Consider a situation where we want to change the case of the message to upperCase, it can be done as follows:

```dart
TextFormField(
    validator: Validator<String>(
        transformMessage: (String message, Map<String, String> params) =>
            message.toUpperCase();
    ).add(RequiredRule())
    .build()
)
```

::: tip Remember
The **`Rule`** also accepts the **`transformMessage`** which takes precedence over the **`Validator`**'s **`transformMessage`**.
:::
