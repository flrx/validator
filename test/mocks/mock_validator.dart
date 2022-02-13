import 'package:flrx_validator/flrx_validator.dart';

class MockValidator<T> extends Validator<T> {
  MockValidator() : super(rules: []);

  @override
  Validator<T> addAll(List<Rule<T>> rule) {
    rulesList.addAll(rule);
    return this;
  }
}
