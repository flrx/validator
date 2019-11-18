import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

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
