import 'package:test_api/test_api.dart';
import 'package:flrx_validator/rules/max_length_rule.dart';
import 'package:flrx_validator/src/string_utils.dart';

void main() {
  String entityName = "maxLength";
  int maxLength = 5;
  String validString = "12345";
  String invalidString = "12345678";

  MaxLengthRule rule = MaxLengthRule(maxLength);
  rule.transformMessage = StringUtils.replaceWithValues;

  test("valid_max_length_test", () {
    String validationError = rule.validate(entityName, validString);
    expect(validationError, null);
  });

  test("invalid_max_length_test", () {
    String validationError = rule.validate(entityName, invalidString);
    expect(validationError,
        "$entityName should be less than $maxLength characters");
  });
}
