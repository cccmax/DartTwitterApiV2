// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/cashtag.dart';

void main() {
  group('.toString', () {
    test('with \$ symbol', () {
      final actual = Cashtag('\$test');

      expect(actual.toString(), '\$test');
    });

    test('without \$ symbol', () {
      final actual = Cashtag('test');

      expect(actual.toString(), '\$test');
    });

    test('when negated', () {
      final actual = Cashtag.negated('test');

      expect(actual.toString(), '-\$test');
    });

    test('when value is just \$ symbol', () {
      final actual = Cashtag('\$');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message ==
                  'The symbol "\$" was specified but the cashtag value '
                      'does not exist.',
            ),
          ),
        ),
      );
    });

    test('when value is empty', () {
      final actual = Cashtag('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The cashtag must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
