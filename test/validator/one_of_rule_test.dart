import 'package:test/test.dart';
import 'package:flrx_validator/rules/one_of_rule.dart';
import 'package:flrx_validator/src/string_utils.dart';

void main() {
  String entityName = "oneOf";
  String validString = "test1";
  String invalidString = "fail";

  OneOfRule<String> rule = OneOfRule<String>(<String>['test1', 'test2']);
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
