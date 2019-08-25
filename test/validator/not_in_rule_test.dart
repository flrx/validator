import 'package:flrx_validator/rules/not_in_rule.dart';
import 'package:flrx_validator/src/string_utils.dart';
import 'package:test/test.dart';

void main() {
  String entityName = "notIn";
  String validString = "fail";
  String invalidString = "test1";

  NotInRule<String> rule = NotInRule<String>(<String>['test1', 'test2']);
  rule.transformMessage = StringUtils.replaceWithValues;

  test("invalid_not_in_rule_test", () {
    String validationError = rule.validate(entityName, validString);
    expect(validationError, null);
  });

  test("valid_not_in_rule_test", () {
    String validationError = rule.validate(entityName, invalidString);
    expect(validationError, "$entityName is in list of rejected values");
  });
}
