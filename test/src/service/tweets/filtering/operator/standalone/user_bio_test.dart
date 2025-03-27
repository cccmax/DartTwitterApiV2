// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/user_bio.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = UserBio('Something');

      expect(actual.toString(), 'bio:Something');
    });

    test('when value is the exact phrase', () {
      final actual = UserBio('Something and something...');

      expect(actual.toString(), 'bio:"Something and something..."');
    });

    test('when negated', () {
      final actual = UserBio.negated('Something');

      expect(actual.toString(), '-bio:Something');
    });

    test('when value is empty', () {
      final actual = UserBio('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The bio must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
