import 'package:flrx_validator/src/rules/number_rule.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Number Rule Test', () {
    var entityName = 'number';
    var validString = '12345';
    var invalidString = '12abcd';

    var rule = NumberRule();
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_number_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_number_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(
          validationError, '$entityName is not a number');
    });
  });
}
