import 'package:meta/meta.dart';

abstract class Rule<T> {
  Rule(this.validationMessage);

  final String validationMessage;

  String Function(String, Map<String, String>) transformMessage;

  @visibleForOverriding
  String validate(String entityName, T value) {
    String validationMessageFromRule = onValidate(entityName, value);
    if (validationMessageFromRule == null) {
      return null;
    }
    return transformMessage(validationMessage ?? validationMessageFromRule,
        _getResultantMap(entityName, value));
  }

  @protected
  String onValidate(String entityName, T value);

  Map<String, String> _getResultantMap(String entityName, T value) {
    return {
      'entity': entityName,
      'value': value.toString(),
      ...getRuleSpecificParams()
    };
  }

  Map<String, String> getRuleSpecificParams() => {};
}
