import 'package:flrx_validator/src/validator.dart';
import 'package:meta/meta.dart';

/// An abstract class designed to use with [Validator].
///
/// All the rules must extend this class as it specifies the blueprint
/// on how the [Validator] is expecting the [Rule] classes to be.
abstract class Rule<T> {
  /// The default constructor, taking custom [validationMessage].
  Rule(this.validationMessage);

  /// A custom validation message to be used with the rule.
  ///
  /// This can be passed to the default constructor if the user wants to
  /// show a custom validation message over the default ones for the rule.
  final String? validationMessage;

  /// A function used for transforming the message that comes back from the rules.
  ///
  /// This function can generally be used when we need to localize the message
  /// which comes back from the rules.
  ///
  /// If passed to [Rule], it overrides the default [Validator.transformMessage]
  /// function.
  MessageTransformer? transformMessage;

  /// Returns validation message if validation fails.
  ///
  /// If [Validator.transformMessage] or [transformMessage] is passed, it returns
  /// transformed validated message back to the user.
  ///
  /// Override it on the child class when necessary.
  @visibleForOverriding
  @visibleForTesting
  String? validate(String entityName, T? value) {
    var validationMessageFromRule = onValidate(entityName, value);
    if (validationMessageFromRule == null) {
      return null;
    }
    return transformMessage!(validationMessage ?? validationMessageFromRule,
        _getResultantMap(entityName, value));
  }

  /// Returns the validation message by the child class extending [Rule].
  ///
  /// Override it in the child class to define the validation logic for it.
  @protected
  String? onValidate(String entityName, T? value);

  /// Returns a Map of values that are needed to be replaced in
  /// [validationMessage].
  ///
  /// This function is takes the default entity and value along with
  /// the key, value pairs provided by the [getRuleSpecificParams()] function.
  Map<String, String> _getResultantMap(String entityName, T? value) {
    return <String, String>{
      'entity': entityName,
      'value': value.toString(),
      ...getRuleSpecificParams()
    };
  }

  /// Returns a Map of values that are specific to the child [Rule].
  Map<String, String> getRuleSpecificParams() => <String, String>{};
}
