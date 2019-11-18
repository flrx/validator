import 'package:flrx_validator/flrx_validator.dart';
import 'package:test/test.dart';

import '../../mocks/mock_validator_rule.dart';

void main() {
  MockRule mockRule;
  Validator<String> validator;

  setUp(() {
    validator = Validator<String>();
    mockRule = MockRule();
  });

  group('Validator\'s legacy functions run as expected', () {
    test('Validator\'s build method runs the validator', () {
      Function validationFunction = validator.add(mockRule).build();
      String validationMessage = validationFunction(null);
      expect(validationMessage, null);
    });
    test('Validator\'s validate method runs the validator', () {
      String validationMessage = validator.add(mockRule).validate(null);
      expect(validationMessage, null);
    });
  });

  group('Validator with Rules specified in constructor tests', () {
    Validator<String> customValidator =
        Validator<String>(rules: <Rule<String>>[RequiredRule(), mockRule]);
    test('Validator has the ruleslist initialized with the rules in contructor',
        () {
      expect(customValidator.rulesList.length, 2);
    });

    test('Can add rules in validator after being initialized with other rules',
        () {
      customValidator.add(MaxLengthRule(20));
      expect(customValidator.rulesList.length, 3);
    });
  });

  group('validator_rules_tests', () {
    test('test_validation_has_all_added_rules', () {
      validator.add(mockRule);
      expect(validator.rulesList.length, 1);
      validator.addAll(<Rule<String>>[
        AnyRule<String>(<Rule<String>>[]),
        InRule<String>(<String>[]),
      ]);
      expect(validator.rulesList.length, 3);
    });

    test('test_validation_rule_passes', () {
      Function validationFunction = validator.add(mockRule);
      String validationMessage = validationFunction(null);
      expect(validationMessage, null);
    });

    test('test_validation_rule_fails', () {
      Function validationFunction = validator.add(mockRule);
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
      Function validationFunction = customValidator.add(mockRule);
      String validationMessage = validationFunction("value");
      expect(validationMessage, "VALUE");
    });

    test('test_rule_uses_custom_transformer', () {
      Validator<String> customValidator =
          Validator<String>(transformMessage: upperCaseTransformer);
      mockRule.transformMessage =
          (String message, Map<String, String> params) => message.toLowerCase();
      Function validationFunction = customValidator.add(mockRule);
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
      Function validationFunction = customValidator.add(mockRule);
      validationFunction(valueToValidate);
    });
  });
}
