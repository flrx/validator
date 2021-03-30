import 'package:flrx_validator/src/rules/rule.dart';

/// A [Rule] subclass validating the input matches a [regex].
class RegexRule extends Rule<String> {
  RegexRule(this.regex, {String? validationMessage}) : super(validationMessage);

  final String regex;

  @override
  String? onValidate(String entityName, String? value) {
    var regExp = RegExp(regex);
    if (!regExp.hasMatch(value!)) {
      return ':value is not a valid pattern';
    }
    return null;
  }
}
