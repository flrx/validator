# Validator

[[toc]]

## Introduction

Flrx Validator allows you to take a specific value and validate against a set of rules. 
It is primarily designed to be used by Flutter's `FormField`'s validator, however you can use it with any Dart 2 Project.

The `Validator` takes a List of `Rule`. The value supplied to the
`Validator` is supplied to the `Rule`s in the order they were registered.
The error message of the first `Rule` that fails is returned back. If all the `Rule`s pass, then null is returned to the `FormField`.

## Running the Validator

There are two ways to run the validator.

### Via `build()`

The `Validator`'s `build()` method is useful if you want to add validation to a `FormField` Widget.

```dart
TextFormField(validator: Validator<String>().build())
```


### Via `validate()`

The `Validator`'s `validate()` method is useful if you want to validate a value outside a `FormField`.
For example, Flutter does not have any Cupertino FormField Widgets. For such cases you can perform validation like this:

```dart

  @override
  Widget build(BuildContext context) {
  
    ...  
        CupertinoTextField(controller: _textEditingController),
        Text(emailValidationMessage),
    ...
  
  }
      
  void onFormSubmitPressed() {
    String value = _textEditingController.text;
    setState(() {
      emailValidationMessage = Validator<String>().validate(value) ?? '';
      });
  }
  
  ...

}
```

You can see the full example [here](https://github.com/flrx/validator/blob/master/example/lib/cupertino_form.dart).

::: warning
Although for simple forms this may seem like a good idea, this could quickly go out of hand.
You might want to use a Custom [FormField](https://api.flutter.dev/flutter/widgets/FormField-class.html) Widget instead.
:::

## Adding Rules

The `Validator` takes `Rule`s against which the value is validated. You can add `Rule`s to the validator in the following ways

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
)
```

will produce a validation message like:

```
Password should be more than 6 characters
```

## Transforming the message

`Validator` also accepts a function which can be used to transform the message that is returned after the validation of the input.

`transformMessage` function can be used for cases like localization among others.

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

## The `validate` utility

Flrx Validator now comes with a simple utility function for Flutter.
```dart
TextFormField(
  validator: validate([RequiredRule(), MinLengthRule(6)]),
)
```

### Customizing the `validate` utility
In case you are extending the Validator class, you might want the validate utility to return an instance of your validator object instead.
The validate method depends on a builder method from Validator which you can set as follows.

```dart
Validator<T> myCustomValidatorBuilder<T>({
  String entityName,
  String Function(String, Map<String, String>) transformMessage,
}) {
  return MyCustomValidator<T>(entityName, transformMessage);
}

Validator.builder = myCustomValidatorBuilder;
```  