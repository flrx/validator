import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  var entityName = 'In';
  var validString = 'test1';
  var invalidString = 'fail';

  var rule = InRule<String>(<String>['test1', 'test2']);
  rule.transformMessage = StringUtils.replaceWithValues;

  test('valid_one_of_test', () {
    var validationError = rule.validate(entityName, validString);
    expect(validationError, null);
  });

  test('invalid_one_of_test', () {
    var validationError = rule.validate(entityName, invalidString);
    expect(validationError, '$entityName is not in list of accepted values');
  });
}
