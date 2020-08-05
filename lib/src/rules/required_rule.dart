import 'package:flrx_validator/src/rules/rule.dart';

/// A [Rule] subclass validating if the input is notEmpty.
class RequiredRule<T> extends Rule<T> {
  RequiredRule({String validationMessage}) : super(validationMessage);

  @override
  String onValidate(String entityName, T value) {
    if (value == null) {
      return ':entity is required.';
    }

    if (value is Iterable && value.isEmpty) {
      return ':entity is required.';
    }

    if (value is Map && value.isEmpty) {
      return ':entity is required.';
    }

    if (value is String && value.isEmpty) {
      return ':entity is required.';
    }

    return null;
  }
}
