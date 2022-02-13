import 'package:flrx_validator/flrx_validator.dart';
import 'package:test/test.dart';

import '../../mocks/mock_validator_rule.dart';

void main() {
  var mockRule = MockRule();
  var validator = Validator<String>(rules: []);

  setUp(() {
    validator = Validator<String>(rules: []);
    mockRule = MockRule();
  });

  group('Validator\'s legacy functions run as expected', () {
    test('Validator\'s validate method runs the validator', () {
      var validationMessage = validator.add(mockRule).validate(null);
      expect(validationMessage, null);
    });
  });

  group('Validator with Rules specified in constructor tests', () {
    var customValidator =
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
      var validationFunction = validator.add(mockRule);
      var validationMessage = validationFunction(null);
      expect(validationMessage, null);
    });

    test('test_validation_rule_fails', () {
      Function validationFunction = validator.add(mockRule);
      String validationMessage = validationFunction('Fail');
      expect(validationMessage, 'Fail');
    });
  });

  group('validator_transform_message_tests', () {
    var upperCaseTransformer =
        (String message, Map<String, String> _) => message.toUpperCase();

    test('test_validator_with_message_transformer', () {
      var customValidator =
          Validator<String>(rules: [], transformMessage: upperCaseTransformer);
      Function validationFunction = customValidator.add(mockRule);
      String validationMessage = validationFunction('value');
      expect(validationMessage, 'VALUE');
    });

    test('test_rule_uses_custom_transformer', () {
      var customValidator =
          Validator<String>(rules: [], transformMessage: upperCaseTransformer);
      mockRule.transformMessage =
          (String message, Map<String, String> params) => message.toLowerCase();
      Function validationFunction = customValidator.add(mockRule);
      String validationMessage = validationFunction('Value');
      expect(validationMessage, 'value');
    });

    test('test_transform_message_gets_all_params', () {
      var entityName = 'MockEntity';
      var valueToValidate = 'Value';
      var mockParamValue = 'mockParamValue';
      var customValidator = Validator<String>(
          rules: [],
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
