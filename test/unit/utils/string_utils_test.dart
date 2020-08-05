import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('routes replaceWithValues function test', () {
    test('no_param_route_test', () {
      var route = '/provider';
      var paramRoute =
          StringUtils.replaceWithValues(route, <String, String>{});
      var expectedRoute = '/provider';
      expect(paramRoute, expectedRoute);
    });

    test('one_param_route_test', () {
      var route = '/provider/:providerId';
      var paramRoute = StringUtils.replaceWithValues(
          route, <String, String>{'providerId': '1'});
      var expectedRoute = '/provider/1';
      expect(paramRoute, expectedRoute);
    });

    test('multiple_param_route_test', () {
      var route = '/provider/:providerId/booking/:bookingId';
      var paramRoute = StringUtils.replaceWithValues(
          route, <String, String>{'providerId': '1', 'bookingId': '2'});
      var expectedRoute = '/provider/1/booking/2';
      expect(paramRoute, expectedRoute);
    });

    test('multiple_continuous_params_route_test', () {
      var route = '/provider/:providerId/:bookingId';
      var paramRoute = StringUtils.replaceWithValues(
          route, <String, String>{'providerId': '1', 'bookingId': '2'});
      var expectedRoute = '/provider/1/2';
      expect(paramRoute, expectedRoute);
    });

    test('single_null_param_route_test', () {
      var paramName = 'providerId';
      expect(() {
        var route = '/provider/:$paramName';
        return StringUtils.replaceWithValues(
            route, <String, String>{paramName: null});
      }, throwsA(predicate((Error e) {
        return e is ArgumentError &&
            e.toString() ==
                'Invalid argument(s) ($paramName): Must not be null';
      })));
    });

    test('single_paramname_no_param_route_test', () {
      var paramName = 'providerId';
      expect(() {
        var route = '/provider/:$paramName';
        return StringUtils.replaceWithValues(route, <String, String>{});
      }, throwsA(predicate((Error e) {
        return e is ArgumentError &&
            e.toString() ==
                'Invalid argument(s) ($paramName): Must not be null';
      })));
    });

    test('one_param_with_underscore_route_test', () {
      var route = '/provider/:provider_id';
      var paramRoute = StringUtils.replaceWithValues(
          route, <String, String>{'provider_id': '1'});
      var expectedRoute = '/provider/1';
      expect(paramRoute, expectedRoute);
    });
  });

  group('routes replaceWithValues function test', () {
    test('no_value_in_sentence', () {
      var sentence = 'this is a sentence';
      var replacedSentence =
          StringUtils.replaceWithValues(sentence, <String, String>{});
      var expectedSentence = 'this is a sentence';
      expect(replacedSentence, expectedSentence);
    });

    test('one_value_in_sentence', () {
      var sentence = 'this is a sentence with a :value';
      var replacedSentence = StringUtils.replaceWithValues(
          sentence, <String, String>{'value': 'donut'});
      var expectedSentence = 'this is a sentence with a donut';
      expect(replacedSentence, expectedSentence);
    });

    test('one_value_in_beginning_of_sentence', () {
      var sentence = ':name, Hello';
      var replacedSentence = StringUtils.replaceWithValues(
          sentence, <String, String>{'name': 'John'});
      var expectedSentence = 'John, Hello';
      expect(replacedSentence, expectedSentence);
    });

    test('one_value_at_end_of_sentence', () {
      var sentence = 'Bye :name';
      var replacedSentence = StringUtils.replaceWithValues(
          sentence, <String, String>{'name': 'John'});
      var expectedSentence = 'Bye John';
      expect(replacedSentence, expectedSentence);
    });

    test('two_continous_values_with_numeric_keys', () {
      var sentence = ':var1:var2';
      var replacedSentence = StringUtils.replaceWithValues(
          sentence, <String, String>{'var1': 'Hello', 'var2': ' John'});
      var expectedSentence = 'Hello John';
      expect(replacedSentence, expectedSentence);
    });

    test('no_matching_value_in_string', () {
      var sentence = 'Car Chase';
      var replacedSentence = StringUtils.replaceWithValues(
          sentence, <String, String>{'var1': 'Hello', 'var2': ' John'});
      var expectedSentence = 'Car Chase';
      expect(replacedSentence, expectedSentence);
    });

    test('no_value_in_map_of_sentence', () {
      expect(() {
        var sentence = 'Bye :name';
        return StringUtils.replaceWithValues(
            sentence, <String, String>{'coincidence': 'bro'});
      }, throwsA(predicate((Error e) {
        return e is ArgumentError &&
            e.toString() == 'Invalid argument(s) (name): Must not be null';
      })));
    });
  });
}
