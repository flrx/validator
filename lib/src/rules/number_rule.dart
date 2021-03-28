import 'package:flrx_validator/flrx_validator.dart';

/// A [Rule] subclass which validates if the value passed is a number.
class NumberRule<T> extends Rule<T> {
  /// The default constructor
  NumberRule({String validationMessage}) : super(validationMessage);

  @override
  String onValidate(String entityName, T value) {
    num numValue;
    if (!(value is num)) {
      numValue = double.tryParse(value.toString());
    }
    if (numValue == null) {
      return '$entityName is not a number';
    }
    return null;
  }
}
