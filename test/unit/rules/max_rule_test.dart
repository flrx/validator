import 'package:flrx_validator/src/rules/max_rule.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Max Rule Test', () {
    var entityName = 'number';
    var validString = '20';
    var invalidString = '50';
    var maxValue = 40;

    var rule = MaxRule(maxValue);
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_number_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_number_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(validationError, '$entityName should be lesser than $maxValue');
    });
  });
}
