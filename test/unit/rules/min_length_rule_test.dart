import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  var entityName = 'minLength';
  var minLength = 5;
  var validString = '12345';
  var invalidString = '12';

  var rule = MinLengthRule(minLength);
  rule.transformMessage = StringUtils.replaceWithValues;

  test('valid_min_length_test', () {
    var validationError = rule.validate(entityName, validString);
    expect(validationError, null);
  });

  test('invalid_min_length_test', () {
    var validationError = rule.validate(entityName, invalidString);
    expect(validationError,
        '$entityName should be more than $minLength characters');
  });
}
