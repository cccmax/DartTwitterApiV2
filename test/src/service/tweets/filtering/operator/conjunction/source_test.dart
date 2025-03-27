// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/source.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = Source('iPhone');

      expect(actual.toString(), 'source:iPhone');
    });

    test('whe negated', () {
      final actual = Source.negated('iPhone');

      expect(actual.toString(), '-source:iPhone');
    });

    test('when value is empty', () {
      final actual = Source('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The source must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
