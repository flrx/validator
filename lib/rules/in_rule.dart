import 'package:flrx_validator/rule.dart';

/// A [Rule] subclass validating if the input is one of the element in the [acceptedList].
class InRule<T> extends Rule<T> {
  final List<T> acceptedList;

  InRule(this.acceptedList, {String validationMessage})
      : super(validationMessage);

  @override
  String onValidate(String entityName, T value) {
    String validationMessage = ":entity is not in list of accepted values";
    return acceptedList.contains(value) ? null : validationMessage;
  }
}
