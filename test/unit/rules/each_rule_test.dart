import 'package:flrx_validator/flrx_validator.dart';
import 'package:flrx_validator/src/rules/each_rule.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group("EachRule", () {
    Rule<String> rule = EachRule<String>(
      <Rule<String>>[
        MinLengthRule(6),
        RegexRule(
          r'(?=.*[a-z])',
          validationMessage: ":entity should contain one lowercase character",
        ),
      ],
    );
    rule.transformMessage = StringUtils.replaceWithValues;

    test('Runs all rules', () {
      String message = rule.validate("Password", "123");
      expect(message,
          "Password should be more than 6 characters\nPassword should contain one lowercase character");
    });

    test('Validated message exists only for rule that fails', () {
      String message = rule.validate("Password", "abcd");
      expect(message, "Password should be more than 6 characters");
    });

    test('Validated message is null when all rules pass', () {
      String message = rule.validate("Password", "1234abcd");
      expect(message, null);
    });
  });
}
