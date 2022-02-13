import 'package:flrx_validator/src/rules/rule.dart';

/// A [Rule] subclass validating if the length of input is less than [maxLength].
class MaxLengthRule<T extends dynamic> extends Rule<T> {
  final int maxLength;

  MaxLengthRule(this.maxLength, {String? validationMessage})
      : assert(T == List || T == Map || T == String || T == dynamic),
        super(validationMessage);

  @override
  String? onValidate(String entityName, T? value) {
    if (value == null) {
      return null;
    }

    if (value.length <= maxLength) {
      return null;
    }

    return validationMessage ?? ':entity length should be less than :maxLength';
  }

  @override
  Map<String, String> getRuleSpecificParams() {
    return {'maxLength': maxLength.toString()};
  }
}
