import 'package:flrx_validator/rule.dart';

/// A [Rule] subclass validating if the length of input is less than [maxLength].
class MaxLengthRule extends Rule<String> {
  final int maxLength;

  MaxLengthRule(this.maxLength, {String validationMessage})
      : super(validationMessage);

  @override
  String onValidate(String entityName, String value) {
    if (value.length <= maxLength) {
      return null;
    }
    return validationMessage ??
        ":entity should be less than :maxLength characters";
  }

  @override
  Map<String, String> getRuleSpecificParams() {
    return <String, String>{"maxLength": maxLength.toString()};
  }
}
