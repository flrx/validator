import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('String Min Length Rule Test', () {
    var entityName = 'minLength';
    var minLength = 5;
    var validString = '12345';
    var invalidString = '12';

    var rule = MinLengthRule<String>(minLength);
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_min_length_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_min_length_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(
          validationError, '$entityName length should be more than $minLength');
    });
  });
  group('List Min Length Rule Test', () {
    var entityName = 'minLength';
    var minLength = 5;
    var validString = [1, 2, 3, 4, 5];
    var invalidString = [1, 2];

    var rule = MinLengthRule<List>(minLength);
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_min_length_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_min_length_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(
          validationError, '$entityName length should be more than $minLength');
    });
  });

  group('Map Min Length Rule Test', () {
    var entityName = 'minLength';
    var minLength = 3;
    var validString = {1: 2, 3: 4, 5: 56};
    var invalidString = {1: 2};

    var rule = MinLengthRule<Map>(minLength);
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_min_length_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_min_length_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(
          validationError, '$entityName length should be more than $minLength');
    });
  });

  group('Dynamic Min Length Rule Test', () {
    var entityName = 'minLength';
    var minLength = 5;
    var validString = '12345';
    var invalidString = '12';

    var rule = MinLengthRule(minLength);
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_min_length_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_min_length_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(
          validationError, '$entityName length should be more than $minLength');
    });
  });

  test('Object Min Length Rule Test', () {
    expect(() => MinLengthRule<Rule>(3), throwsA(isA<AssertionError>()));
  });
}
