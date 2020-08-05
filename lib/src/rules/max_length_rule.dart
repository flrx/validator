import 'package:flrx_validator/src/rules/rule.dart';

/// A [Rule] subclass validating if the length of input is less than [maxLength].
class MaxLengthRule<T extends dynamic> extends Rule<T> {
  final int maxLength;

  MaxLengthRule(this.maxLength, {String validationMessage})
      : assert(T is List || T is Map || T is String),
        super(validationMessage);


  @override
  String onValidate(String entityName, T value) {
    if (value.length <= maxLength) {
      return null;
    }
    return validationMessage ??
        ':entity should be less than :maxLength characters';
  }

  @override
  Map<String, String> getRuleSpecificParams() {
    return {'maxLength': maxLength.toString()};
  }
}
