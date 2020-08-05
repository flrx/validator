import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  var entityName = 'maxLength';
  var maxLength = 5;
  var validString = '12345';
  var invalidString = '12345678';

  var rule = MaxLengthRule(maxLength);
  rule.transformMessage = StringUtils.replaceWithValues;

  test('valid_max_length_test', () {
    var validationError = rule.validate(entityName, validString);
    expect(validationError, null);
  });

  test('invalid_max_length_test', () {
    var validationError = rule.validate(entityName, invalidString);
    expect(validationError,
        '$entityName should be less than $maxLength characters');
  });
}
