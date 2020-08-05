import 'package:flrx_validator/src/rules/rule.dart';

/// A [Rule] subclass validating if the input length is more than [minLength].
class MinLengthRule<T extends dynamic> extends Rule<T> {
  final int minLength;

  MinLengthRule(this.minLength, {String validationMessage})
      : assert(T is List || T is Map || T is String),
        super(validationMessage);

  @override
  String onValidate(String entityName, T value) {
    if (value.length < minLength) {
      return ':entity should be more than :minLength characters';
    }
    return null;
  }

  @override
  Map<String, String> getRuleSpecificParams() {
    return {'minLength': minLength.toString()};
  }
}
