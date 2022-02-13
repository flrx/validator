import 'package:flrx_validator/src/rules/number_rule.dart';

/// A [Rule] subclass which validates if the value
/// passed is at least a specific number.
class MinRule<T> extends NumberRule<T> {
  /// Value passed should be at least [minValue]
  final num minValue;

  MinRule(
    this.minValue, {
    String? validationMessage,
  }) : super(validationMessage: validationMessage);

  @override
  String? onValidate(String entityName, T? value) {
    var message = super.onValidate(entityName, value);
    if (message != null) {
      return message;
    }

    var numValue = double.parse(value.toString());
    if (numValue < minValue) {
      return '$entityName should be greater than $minValue';
    }

    return null;
  }
}
