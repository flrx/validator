import 'package:flrx_validator/rule.dart';

/// A [Rule] subclass validating if the input length is more than [minLength].
class MinLengthRule extends Rule<String> {
  final int minLength;

  MinLengthRule(this.minLength, {String validationMessage})
      : super(validationMessage);

  @override
  String onValidate(String entityName, String value) {
    if (value.length < minLength) {
      return ":entity should be more than :minLength characters";
    }
    return null;
  }

  @override
  Map<String, String> getRuleSpecificParams() {
    return <String, String>{"minLength": minLength.toString()};
  }
}
