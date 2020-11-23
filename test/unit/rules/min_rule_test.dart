import 'package:flrx_validator/src/rules/min_rule.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Min Rule Test', () {
    var entityName = 'number';
    var validString = '50';
    var invalidString = '20';
    var minValue = 40;

    var rule = MinRule(minValue);
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_number_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_number_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(validationError, '$entityName should be greater than $minValue');
    });
  });
}
