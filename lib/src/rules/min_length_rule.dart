import 'package:flrx_validator/src/rules/rule.dart';

/// A [Rule] subclass validating if the input length is more than [minLength].
class MinLengthRule<T extends dynamic> extends Rule<T> {
  final int minLength;

  MinLengthRule(this.minLength, {String? validationMessage})
      : assert(T == List || T == Map || T == String || T == dynamic),
        super(validationMessage);

  @override
  String? onValidate(String entityName, T? value) {
    if (value!.length < minLength) {
      return ':entity length should be more than :minLength';
    }
    return null;
  }

  @override
  Map<String, String> getRuleSpecificParams() {
    return {'minLength': minLength.toString()};
  }
}
