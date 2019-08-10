import 'package:flrx_validator/rule.dart';

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
