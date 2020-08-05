import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  var entityName = 'required';
  var validString = '12';
  var invalidString = '';

  var rule = RequiredRule();
  rule.transformMessage = StringUtils.replaceWithValues;

  test('valid_require_rule_test', () {
    var validationError = rule.validate(entityName, validString);
    expect(validationError, null);
  });

  test('invalid_require_rule_test', () {
    var validationError = rule.validate(entityName, invalidString);
    expect(validationError, '$entityName is required.');
  });
}
