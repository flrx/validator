import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:flrx_validator/src/utils/validator_utils.dart';
import 'package:flrx_validator/validator.dart';
import 'package:test/test.dart';

import '../../mocks/mock_validator.dart';
import '../../mocks/mock_validator_rule.dart';

Validator<T> mockValidatorBuilder<T>(
    {String entityName = "Entity",
    String Function(String, Map<String, String>) transformMessage =
        StringUtils.replaceWithValues}) {
  return MockValidator<T>();
}

void main() {
  String Function(String message, Map<String, String> keyValuePair)
      transformMessage = (String message, Map<String, String> keyValuePair) {
    return message;
  };

  test('default validator builder returns a valid Validator', () {
    Validator<String> validator = validatorBuilder<String>(
        entityName: "Test", transformMessage: transformMessage);
    validator.add(MockRule());
    expect('Test', validator.entityName);
    expect(transformMessage, validator.transformMessage);
    expect(validator.validate('Test :test'), 'Test :test');
  });

  test('Validator utility runs the builder method', () {
    Validator.builder = mockValidatorBuilder;
    Function(String value) validator =
        validate<String>(<Rule<String>>[MockRule()]);
    expect(validator('test'), 'test');
  });
}
