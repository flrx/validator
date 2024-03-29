import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('EachRule', () {
    Rule<String> rule = EachRule<String>(
      <Rule<String>>[
        MinLengthRule(6),
        RegexRule(
          r'(?=.*[a-z])',
          validationMessage: ':entity should contain one lowercase character',
        ),
      ],
    );
    rule.transformMessage = StringUtils.replaceWithValues;

    test('Runs all rules', () {
      var message = rule.validate('Password', '123');
      expect(message,
          'Password length should be more than 6\nPassword should contain one lowercase character');
    });

    test('Validated message exists only for rule that fails', () {
      var message = rule.validate('Password', 'abcd');
      expect(message, 'Password length should be more than 6');
    });

    test('Validated message is null when all rules pass', () {
      var message = rule.validate('Password', '1234abcd');
      expect(message, null);
    });
  });
}
