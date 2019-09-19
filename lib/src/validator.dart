import 'package:flrx_validator/src/rules/rule.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:flrx_validator/src/utils/validator_utils.dart';

/// A class primarily designed to retrieve validation messages based on [Rule]s.
///
/// The [Validator] class takes a List of [Rule]. The value supplied to the
/// [Validator] is supplied to the [Rule]s in the order they were registered.
/// The error message of the first [Rule] that fails is returned back.
/// If all the [Rule]s pass, then null is returned.
class Validator<T> {
  Validator(
      {this.entityName = "Entity",
      this.transformMessage = StringUtils.replaceWithValues});

  static Validator<T> Function<T>(
          {String entityName,
          String Function(String, Map<String, String>) transformMessage})
      builder = validatorBuilder;

  /// The name of the field that is being evaluated.
  ///
  /// The [Validator.entityName] property is used by some [Rule]s to format their
  /// Error Message.
  String entityName;

  /// A function used for transforming the message that comes back from the rules.
  ///
  /// This function can generally be used when we need to localize the message
  /// which comes back from the rules.
  String Function(String, Map<String, String>) transformMessage;

  /// List of all registered rules.
  List<Rule<T>> rulesList = <Rule<T>>[];

  /// Registers a single [Rule] with the [Validator].
  Validator<T> add(Rule<T> rule) {
    rulesList.add(rule);
    return this;
  }

  /// Registers a List of [Rule] with the [Validator].
  Validator<T> addAll(List<Rule<T>> rule) {
    rulesList.addAll(rule);
    return this;
  }

  /// Returns a Function that can be called to validate. Added as a convenience for Flutter
  String Function(T value) build() => validate;

  /// Validates and returns an error message(if any).
  String validate(T value) {
    String validationMessage;
    rulesList.any((Rule<T> rule) {
      rule.transformMessage ??= transformMessage;
      validationMessage = rule.validate(entityName, value);
      return validationMessage != null;
    });
    return validationMessage;
  }
}
