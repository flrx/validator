import 'package:flrx_validator/src/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('routes replaceWithValues function test', () {
    test('no_param_route_test', () {
      String route = "/provider";
      String paramRoute =
          StringUtils.replaceWithValues(route, <String, String>{});
      String expectedRoute = "/provider";
      expect(paramRoute, expectedRoute);
    });

    test('one_param_route_test', () {
      String route = "/provider/:providerId";
      String paramRoute = StringUtils.replaceWithValues(
          route, <String, String>{'providerId': '1'});
      String expectedRoute = "/provider/1";
      expect(paramRoute, expectedRoute);
    });

    test('multiple_param_route_test', () {
      String route = "/provider/:providerId/booking/:bookingId";
      String paramRoute = StringUtils.replaceWithValues(
          route, <String, String>{'providerId': '1', 'bookingId': '2'});
      String expectedRoute = "/provider/1/booking/2";
      expect(paramRoute, expectedRoute);
    });

    test('multiple_continuous_params_route_test', () {
      String route = "/provider/:providerId/:bookingId";
      String paramRoute = StringUtils.replaceWithValues(
          route, <String, String>{'providerId': '1', 'bookingId': '2'});
      String expectedRoute = "/provider/1/2";
      expect(paramRoute, expectedRoute);
    });

    test('single_null_param_route_test', () {
      String paramName = "providerId";
      expect(() {
        String route = "/provider/:$paramName";
        return StringUtils.replaceWithValues(
            route, <String, String>{paramName: null});
      }, throwsA(predicate((Error e) {
        return e is ArgumentError &&
            e.message == 'Value cannot be null. $paramName is passed as null';
      })));
    });

    test('single_paramname_no_param_route_test', () {
      String paramName = "providerId";
      expect(() {
        String route = "/provider/:$paramName";
        return StringUtils.replaceWithValues(route, <String, String>{});
      }, throwsA(predicate((Error e) {
        return e is ArgumentError &&
            e.message == 'Value cannot be null. $paramName is passed as null';
      })));
    });

    test('one_param_with_underscore_route_test', () {
      String route = "/provider/:provider_id";
      String paramRoute = StringUtils.replaceWithValues(
          route, <String, String>{'provider_id': '1'});
      String expectedRoute = "/provider/1";
      expect(paramRoute, expectedRoute);
    });
  });

  group('routes replaceWithValues function test', () {
    test('no_value_in_sentence', () {
      String sentence = "this is a sentence";
      String replacedSentence =
          StringUtils.replaceWithValues(sentence, <String, String>{});
      String expectedSentence = "this is a sentence";
      expect(replacedSentence, expectedSentence);
    });

    test('one_value_in_sentence', () {
      String sentence = "this is a sentence with a :value";
      String replacedSentence = StringUtils.replaceWithValues(
          sentence, <String, String>{"value": "donut"});
      String expectedSentence = "this is a sentence with a donut";
      expect(replacedSentence, expectedSentence);
    });

    test('one_value_in_beginning_of_sentence', () {
      String sentence = ":name, Hello";
      String replacedSentence = StringUtils.replaceWithValues(
          sentence, <String, String>{"name": "John"});
      String expectedSentence = "John, Hello";
      expect(replacedSentence, expectedSentence);
    });

    test('one_value_at_end_of_sentence', () {
      String sentence = "Bye :name";
      String replacedSentence = StringUtils.replaceWithValues(
          sentence, <String, String>{"name": "John"});
      String expectedSentence = "Bye John";
      expect(replacedSentence, expectedSentence);
    });

    test('two_continous_values_with_numeric_keys', () {
      String sentence = ":var1:var2";
      String replacedSentence = StringUtils.replaceWithValues(
          sentence, <String, String>{"var1": "Hello", "var2": " John"});
      String expectedSentence = "Hello John";
      expect(replacedSentence, expectedSentence);
    });

    test('no_matching_value_in_string', () {
      String sentence = "Car Chase";
      String replacedSentence = StringUtils.replaceWithValues(
          sentence, <String, String>{"var1": "Hello", "var2": " John"});
      String expectedSentence = "Car Chase";
      expect(replacedSentence, expectedSentence);
    });

    test('no_value_in_map_of_sentence', () {
      expect(() {
        String sentence = "Bye :name";
        return StringUtils.replaceWithValues(
            sentence, <String, String>{'coincidence': 'bro'});
      }, throwsA(predicate((Error e) {
        return e is ArgumentError &&
            e.message == 'Value cannot be null. name is passed as null';
      })));
    });
  });
}
