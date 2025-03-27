// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/place.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = Place('Costco');

      expect(actual.toString(), 'place:Costco');
    });

    test('with exact phrase', () {
      final actual = Place('Costco, Riverside');

      expect(actual.toString(), 'place:"Costco, Riverside"');
    });

    test('when negated', () {
      final actual = Place.negated('Costco');

      expect(actual.toString(), '-place:Costco');
    });

    test('when value is empty', () {
      final actual = Place('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The place must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
