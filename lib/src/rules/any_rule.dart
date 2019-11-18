import 'package:flrx_validator/src/rules/rule.dart';

/// A [Rule] subclass which validates if any of the list of [Rule]
/// passed to it are passing.
class AnyRule<T> extends Rule<T> {
  /// The list of [Rule] to be validated for.
  final List<Rule<T>> _ruleList;

  /// The default constructor
  AnyRule(this._ruleList, {String validationMessage})
      : super(validationMessage);

  @override
  String onValidate(String entityName, T value) {
    String ruleValidationMessage;
    _ruleList.reversed.any((Rule<T> rule) {
      rule.transformMessage ??= transformMessage;
      ruleValidationMessage = rule.validate(entityName, value);
      return ruleValidationMessage == null;
    });
    return ruleValidationMessage;
  }
}
