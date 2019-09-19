import 'package:flrx_validator/src/rules/rule.dart';

/// A [Rule] subclass validating if the input is notEmpty.
class RequiredRule extends Rule<String> {
  RequiredRule({String validationMessage}) : super(validationMessage);

  @override
  String onValidate(String entityName, String value) {
    if (value.isEmpty) {
      return ':entity is required.';
    }
    return null;
  }
}
