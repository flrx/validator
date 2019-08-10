import 'package:flrx_validator/rule.dart';

class CustomRule<T> extends Rule<T> {
  CustomRule({validationMessage}) : super(validationMessage);

  @override
  String onValidate(String entityName, T value) {
    // TODO: implement onValidate
    return null;
  }

  @override
  Map<String, String> getRuleSpecificParams() {
    // TODO: implement getRuleSpecificParams
    return super.getRuleSpecificParams();
  }
}
