import 'package:test_api/test_api.dart';
import 'package:flrx_validator/src/string_utils.dart';

import '../mocks/mock_validator_rule.dart';

void main() {
  test('rule_uses_custom_validation_message', () {
    String validationMessage = "Custom Validation";
    MockRule rule = MockRule(validationMessage: validationMessage);
    rule.transformMessage = StringUtils.replaceWithValues;

    expect(rule.validate('entity', 'value'), validationMessage);
  });

  test('rule_uses_custom_transformer', () {
    MockRule rule = MockRule();
    rule.transformMessage =
        (String message, Map<String, String> params) => message.toUpperCase();
    expect(rule.validate('entity', 'value'), "VALUE");
  });
}
