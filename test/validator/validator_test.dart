import 'package:flrx_validator/rule.dart';
import 'package:test/test.dart';
import 'package:flrx_validator/rules/any_rule.dart';
import 'package:flrx_validator/rules/one_of_rule.dart';
import 'package:flrx_validator/validator.dart';

import '../mocks/mock_validator_rule.dart';

void main() {
  MockRule mockRule;
  Validator<String> validator;

  setUp(() {
    validator = Validator<String>();
    mockRule = MockRule();
  });

  group('validator_rules_tests', () {
    test('test_validation_has_all_added_rules', () {
      validator.add(mockRule);
      expect(validator.rulesList.length, 1);
      validator.addAll(<Rule<String>>[
        AnyRule<String>(<Rule<String>>[]),
        OneOfRule<String>(<String>[]),
      ]);
      expect(validator.rulesList.length, 3);
    });

    test('test_validation_rule_passes', () {
      Function validationFunction = validator.add(mockRule).build();
      String validationMessage = validationFunction(null);
      expect(validationMessage, null);
    });

    test('test_validation_rule_fails', () {
      Function validationFunction = validator.add(mockRule).build();
      String validationMessage = validationFunction("Fail");
      expect(validationMessage, "Fail");
    });
  });

  group('validator_transform_message_tests', () {
    String Function(String, Map<String, String>) upperCaseTransformer =
        (String message, Map<String, String> _) => message.toUpperCase();

    test('test_validator_with_message_transformer', () {
      Validator<String> customValidator =
          Validator<String>(transformMessage: upperCaseTransformer);
      Function validationFunction = customValidator.add(mockRule).build();
      String validationMessage = validationFunction("value");
      expect(validationMessage, "VALUE");
    });

    test('test_rule_uses_custom_transformer', () {
      Validator<String> customValidator =
          Validator<String>(transformMessage: upperCaseTransformer);
      mockRule.transformMessage =
          (String message, Map<String, String> params) => message.toLowerCase();
      Function validationFunction = customValidator.add(mockRule).build();
      String validationMessage = validationFunction("Value");
      expect(validationMessage, "value");
    });

    test('test_transform_message_gets_all_params', () {
      String entityName = 'MockEntity';
      String valueToValidate = 'Value';
      String mockParamValue = 'mockParamValue';
      Validator<String> customValidator = Validator<String>(
          entityName: entityName,
          transformMessage: (String message, Map<String, String> params) {
            expect(params['entity'], entityName);
            expect(params['value'], valueToValidate);
            expect(params['mockParam'], mockParamValue);
            return message.toUpperCase();
          });
      Function validationFunction = customValidator.add(mockRule).build();
      validationFunction(valueToValidate);
    });
  });
}
