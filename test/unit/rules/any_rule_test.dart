import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../../mocks/mock_validator_rule.dart';

void main() {
  var entityName = 'any';
  String? validForMockRule;
  var invalidForMockRule = 'invalid';

  var rule = AnyRule<String>(<Rule<String>>[
    MockRule(),
    MockAlwaysFailRule<String>(),
  ]);

  rule.transformMessage = StringUtils.replaceWithValues;

  test('valid_any_rule_test', () {
    var validationError = rule.validate(entityName, validForMockRule);
    expect(validationError, validForMockRule);
  });

  test('invalid_any_rule_test', () {
    var validationError = rule.validate(entityName, invalidForMockRule);
    expect(validationError, invalidForMockRule);
  });
}
