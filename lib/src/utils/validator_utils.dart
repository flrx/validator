import 'package:flrx_validator/src/rules/rule.dart';
import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:flrx_validator/src/validator.dart';

Validator<T> validatorBuilder<T>(
    {String entityName = "Entity",
    String Function(String, Map<String, String>) transformMessage =
        StringUtils.replaceWithValues}) {
  return Validator<T>(
      entityName: entityName, transformMessage: transformMessage);
}

String Function(T value) validate<T>(
  List<Rule<T>> rules, {
  String entityName = "Entity",
  String Function(String, Map<String, String>) transformMessage =
      StringUtils.replaceWithValues,
}) {
  return (Validator.builder<T>(
          entityName: entityName, transformMessage: transformMessage)
        ..addAll(rules))
      .build();
}
