import 'package:flrx_validator/rules/regex_rule.dart';

/// A [Rule] subclass validating if the given input is a valid email.
class EmailRule extends RegexRule {
  static String get emailRegex =>
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

  static String get _emailValidationMessage =>
      ":value is not a valid email address";

  EmailRule({String validationMessage})
      : super(emailRegex,
            validationMessage: validationMessage ?? _emailValidationMessage);
}
