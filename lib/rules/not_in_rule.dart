import 'package:flrx_validator/rule.dart';

/// A [Rule] subclass validating if the input is one of the element in the [rejectionList].
class NotInRule<T> extends Rule<T> {
  final List<T> rejectionList;

  NotInRule(this.rejectionList, {String validationMessage})
      : super(validationMessage);

  @override
  String onValidate(String entityName, T value) {
    String validationMessage = ":entity is in list of rejected values";
    return rejectionList.contains(value) ? validationMessage : null;
  }
}
