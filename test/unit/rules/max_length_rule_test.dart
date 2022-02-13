import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('String Max Length Rule Test', () {
    var entityName = 'maxLength';
    var maxLength = 5;
    var validString = '12345';
    var invalidString = '123456';
    String? nullString;

    var rule = MaxLengthRule<String>(maxLength);
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_max_length_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_max_length_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(
          validationError, '$entityName length should be less than $maxLength');
    });

    test('null_string_length_test', () {
      var validationError = rule.validate(entityName, nullString);
      expect(validationError, null);
    });
  });

  group('List Max Length Rule Test', () {
    var entityName = 'maxLength';
    var maxLength = 2;
    var validString = [1, 2];
    var invalidString = [1, 2, 3, 4, 5];

    var rule = MaxLengthRule<List>(maxLength);
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_max_length_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_max_length_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(
          validationError, '$entityName length should be less than $maxLength');
    });
  });

  group('Map Max Length Rule Test', () {
    var entityName = 'maxLength';
    var maxLength = 1;
    var validString = {1: 2};
    var invalidString = {1: 2, 3: 4, 5: 56};

    var rule = MaxLengthRule<Map>(maxLength);
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_max_length_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_max_length_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(
          validationError, '$entityName length should be less than $maxLength');
    });
  });

  group('Dynamic Max Length Rule Test', () {
    var entityName = 'maxLength';
    var maxLength = 2;
    var invalidString = '12345';
    var validString = '12';

    var rule = MaxLengthRule(maxLength);
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_max_length_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_max_length_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(
          validationError, '$entityName length should be less than $maxLength');
    });
  });

  test('Object Max Length Rule Test', () {
    expect(() => MaxLengthRule<Object>(3), throwsA(const TypeMatcher<Error>()));
  });
}
