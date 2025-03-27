// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/retweeted_by.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = RetweetedBy('me');

      expect(actual.toString(), 'retweets_of:me');
    });

    test('when negated', () {
      final actual = RetweetedBy.negated('me');

      expect(actual.toString(), '-retweets_of:me');
    });

    test('when value is empty', () {
      final actual = RetweetedBy('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message ==
                  'The user identifier must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
