import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

// Test Cases are from Microsoft,
// https://blogs.msdn.microsoft.com/testing123/2009/02/06/email-address-test-cases/
void main() {
  var entityName = 'email';
  var validEmailIds = <String>[
    'abcd@example.com',
    'firstname.lastname@domain.com',
    'email@subdomain.domain.com',
    'firstname+lastname@domain.com',
    'email@123.123.123.123',
    '1234567890@domain.com',
    'email@domain-one.com',
    '_______@domain.com',
    'email@domain.name',
    'email@domain.co.jp',
    'firstname-lastname@domain.com',
    //  TODO These 2 cases should pass
    // 'email@[123.123.123.123]',
    // '"email"@domain.com',
  ];
  var invalidEmailIds = <String>[
    'plainaddress',
    'abcd@example,com',
    r'#@%^%#$@#$@#.com',
    '@domain.com',
    'Joe Smith <email@domain.com>',
    'email.domain.com',
    'email@domain@domain.com',
    'あいうえお@domain.com',
    'email@domain.com (Joe Smith)',
    'email@-domain.com',
    'email@domain..com',
    //  TODO The following test cases should pass
    //  '.email@domain.com',
    //  'email.@domain.com',
    //  'email..email@domain.com',
    //  'email@domain',
  ];

  var rule = EmailRule();
  rule.transformMessage = StringUtils.replaceWithValues;

  test('valid_email_test', () {
    validEmailIds.forEach((String emailId) {
      var validationError = rule.validate(entityName, emailId);
      expect(validationError, null);
    });
  });

  test('invalid_email_test', () {
    invalidEmailIds.forEach((String emailId) {
      var validationError = rule.validate(entityName, emailId);
      expect(validationError, '$emailId is not a valid email address');
    });
  });

  test('empty_email_test', () {
    var validationError = rule.validate(entityName, '');
    expect(validationError, ' is not a valid email address');
  });
}
