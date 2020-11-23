import 'package:flrx_validator/src/rules/number_rule.dart';

/// A [Rule] subclass which validates if the value
/// passed is at most a specific number.
class MaxRule<T> extends NumberRule<T> {

  /// Value passed should be at most [maxValue]
  final num maxValue;

  /// The default constructor
  MaxRule(
    this.maxValue, {
    String validationMessage,
  }) : super(validationMessage: validationMessage);

  @override
  String onValidate(String entityName, T value) {
    var message = super.onValidate(entityName, value);
    if (message != null) {
      return message;
    }

    var numValue = double.parse(value.toString());
    if (numValue > maxValue) {
      return '$entityName should be lesser than $maxValue';
    }

    return null;
  }
}
