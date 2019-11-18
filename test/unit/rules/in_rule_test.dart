import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:flrx_validator/validator.dart';
import 'package:test/test.dart';

void main() {
  String entityName = "In";
  String validString = "test1";
  String invalidString = "fail";

  InRule<String> rule = InRule<String>(<String>['test1', 'test2']);
  rule.transformMessage = StringUtils.replaceWithValues;

  test("valid_one_of_test", () {
    String validationError = rule.validate(entityName, validString);
    expect(validationError, null);
  });

  test("invalid_one_of_test", () {
    String validationError = rule.validate(entityName, invalidString);
    expect(validationError, "$entityName is not in list of accepted values");
  });
}
