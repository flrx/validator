import 'package:flrx_validator/rule.dart';
import 'package:flrx_validator/rules/in_rule.dart';

/// A [Rule] subclass validating if the input is one of the element in the [acceptedList].
@Deprecated('Use InRule instead')
class OneOfRule<T> extends InRule<T> {

  OneOfRule(List<T> acceptedList, {String validationMessage})
      : super(acceptedList, validationMessage: validationMessage);

  @override
  String onValidate(String entityName, T value) {
    return super.onValidate(entityName, value);
  }
}
