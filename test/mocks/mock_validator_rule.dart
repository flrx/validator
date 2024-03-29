import 'package:flrx_validator/flrx_validator.dart';

class MockRule extends Rule<String> {
  MockRule({String? validationMessage}) : super(validationMessage);

  @override
  String? onValidate(String entityName, String? value) => value;

  @override
  Map<String, String> getRuleSpecificParams() =>
      {'mockParam': 'mockParamValue'};
}

class MockAlwaysFailRule<T> extends Rule<T> {
  MockAlwaysFailRule() : super(null);

  @override
  String onValidate(String entityName, dynamic value) {
    return '$value is not a valid value for $entityName';
  }
}
