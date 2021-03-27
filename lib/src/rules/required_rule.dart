import 'package:flrx_validator/src/rules/rule.dart';

/// A [Rule] subclass validating if the input is notEmpty.
/// If the Value is null, this rule fails.
/// If the value if of type String and if the String is empty, this rule fails.
/// If the value if of type Iterable or Map and if the value is empty, this rule fails.
class RequiredRule<T> extends Rule<T> {
  RequiredRule({String validationMessage}) : super(validationMessage);

  @override
  String onValidate(String entityName, T value) {
    if (value == null ||
        isEmptyIterable(value) ||
        isEmptyMap(value) ||
        isEmptyString(value)) {
      return ':entity is required.';
    }
    return null;
  }

  bool isEmptyString(value) => value is String && value.isEmpty;

  bool isEmptyMap(value) => value is Map && value.isEmpty;

  bool isEmptyIterable(value) => value is Iterable && value.isEmpty;
}
