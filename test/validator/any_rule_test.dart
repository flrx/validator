import 'package:flrx_validator/rule.dart';
import 'package:test/test.dart';
import 'package:flrx_validator/rules/any_rule.dart';
import 'package:flrx_validator/src/string_utils.dart';

import '../mocks/mock_validator_rule.dart';

void main() {
  String entityName = "any";
  String validForMockRule;
  String invalidForMockRule = "invalid";

  AnyRule<String> rule = AnyRule<String>(<Rule<String>>[
    MockRule(),
    MockAlwaysFailRule<String>(),
  ]);

  rule.transformMessage = StringUtils.replaceWithValues;

  test("valid_any_rule_test", () {
    String validationError = rule.validate(entityName, validForMockRule);
    expect(validationError, validForMockRule);
  });

  test("invalid_any_rule_test", () {
    String validationError = rule.validate(entityName, invalidForMockRule);
    expect(validationError, invalidForMockRule);
  });
}
