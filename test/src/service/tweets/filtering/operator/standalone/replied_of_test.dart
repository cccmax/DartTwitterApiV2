// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/replies_of.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = RepliesOf('1234');

      expect(actual.toString(), 'in_reply_to_tweet_id:1234');
    });

    test('when negated', () {
      final actual = RepliesOf.negated('1234');

      expect(actual.toString(), '-in_reply_to_tweet_id:1234');
    });

    test('when value is empty', () {
      final actual = RepliesOf('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The tweet id must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
