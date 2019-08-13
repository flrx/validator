import 'package:test/test.dart';
import 'package:flrx_validator/rules/required_rule.dart';
import 'package:flrx_validator/src/string_utils.dart';

void main() {
  String entityName = "required";
  String validString = "12";
  String invalidString = "";

  RequiredRule rule = RequiredRule();
  rule.transformMessage = StringUtils.replaceWithValues;

  test("valid_require_rule_test", () {
    String validationError = rule.validate(entityName, validString);
    expect(validationError, null);
  });

  test("invalid_require_rule_test", () {
    String validationError = rule.validate(entityName, invalidString);
    expect(validationError, '$entityName is required.');
  });
}
