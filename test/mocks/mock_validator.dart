import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/validator.dart';

class MockValidator<T> extends Validator<T> {
  @override
  Validator<T> addAll(List<Rule<T>> rule) {
    rulesList.addAll(rule);
    return this;
  }
}
