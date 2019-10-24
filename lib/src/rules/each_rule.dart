import 'package:flrx_validator/src/rules/rule.dart';

/// A [Rule] subclass which runs validation on the list of [Rule]
/// and does not stop if any of them fail.
class EachRule<T> extends Rule<T> {
  /// The list of [Rule] to be validated for.
  final List<Rule<T>> _ruleList;

  /// A function which concatenates all the Validation Messages.
  final String Function(List<String>) concatenator;

  /// The default constructor
  EachRule(
    this._ruleList, {
    String validationMessage,
    this.concatenator = joinWithNewLine,
  }) : super(validationMessage);

  static String joinWithNewLine(List<String> validationMessages) =>
      validationMessages.join("\n");

  @override
  String onValidate(String entityName, T value) {
    List<String> eachRulesValidationMessage = _ruleList
        .map((Rule<T> rule) {
          rule.transformMessage ??= transformMessage;
          return rule.validate(entityName, value);
        })
        .where((String validationMessage) => validationMessage != null)
        .toList();

    if (eachRulesValidationMessage.isEmpty) {
      return null;
    }

    return concatenator(eachRulesValidationMessage);
  }
}
