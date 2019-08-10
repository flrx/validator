import 'package:flrx_validator/rule.dart';

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
    return {"minLength": minLength.toString()};
  }
}
