import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('String Required Rule Test', () {
    var entityName = 'required';
    var validString = '12';
    var invalidString = '';

    var rule = RequiredRule();
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_require_rule_test', () {
      var validationError = rule.validate(entityName, validString);
      expect(validationError, null);
    });

    test('invalid_require_rule_test', () {
      var validationError = rule.validate(entityName, invalidString);
      expect(validationError, '$entityName is required.');
    });
  });
  group('List Required Rule Test', () {
    var entityName = 'required';
    var validList = ['12'];
    var invalidList = [];

    var rule = RequiredRule<List>();
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_require_rule_test', () {
      var validationError = rule.validate(entityName, validList);
      expect(validationError, null);
    });

    test('invalid_require_rule_test', () {
      var validationError = rule.validate(entityName, invalidList);
      expect(validationError, '$entityName is required.');
    });
  });

  group('Map Required Rule Test', () {
    var entityName = 'required';
    var validMap = {'12': '24'};
    var invalidMap = {};

    var rule = RequiredRule<Map>();
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_require_rule_test', () {
      var validationError = rule.validate(entityName, validMap);
      expect(validationError, null);
    });

    test('invalid_require_rule_test', () {
      var validationError = rule.validate(entityName, invalidMap);
      expect(validationError, '$entityName is required.');
    });
  });

  group('Object Required Rule Test', () {
    var entityName = 'required';
    var validObject = Object();
    Object invalidObject;

    var rule = RequiredRule<Object>();
    rule.transformMessage = StringUtils.replaceWithValues;

    test('valid_require_rule_test', () {
      var validationError = rule.validate(entityName, validObject);
      expect(validationError, null);
    });

    test('invalid_require_rule_test', () {
      var validationError = rule.validate(entityName, invalidObject);
      expect(validationError, '$entityName is required.');
    });
  });
}
