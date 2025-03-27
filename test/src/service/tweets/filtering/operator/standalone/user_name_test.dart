// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/username.dart';

void main() {
  group('.toString', () {
    test('with @ symbol', () {
      final actual = Username('@me');

      expect(actual.toString(), '@me');
    });

    test('without @ symbol', () {
      final actual = Username('me');

      expect(actual.toString(), '@me');
    });

    test('when negated', () {
      final actual = Username.negated('me');

      expect(actual.toString(), '-@me');
    });

    test('when value is just @ symbol', () {
      final actual = Username('@');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message ==
                  'The symbol "@" was specified but the username value '
                      'does not exist.',
            ),
          ),
        ),
      );
    });

    test('when value is empty', () {
      final actual = Username('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The username must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
