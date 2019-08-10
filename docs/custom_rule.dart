import 'package:flrx_validator/rule.dart';

class CustomRule<T> extends Rule<T> {
  CustomRule({this.customParam, validationMessage}) : super(validationMessage);

  final String customParam;

  @override
  String onValidate(String entityName, T value) {
    return null;
  }

  @override
  Map<String, String> getRuleSpecificParams() {
    return {'customParam': customParam};
  }
}
