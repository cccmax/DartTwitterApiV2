// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/user_bio_location.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = UserBioLocation('Japan');

      expect(actual.toString(), 'bio_location:Japan');
    });

    test('when value is the exact phrase', () {
      final actual = UserBioLocation('Tokyo, Japan');

      expect(actual.toString(), 'bio_location:"Tokyo, Japan"');
    });

    test('when negated', () {
      final actual = UserBioLocation.negated('Japan');

      expect(actual.toString(), '-bio_location:Japan');
    });

    test('when value is empty', () {
      final actual = UserBioLocation('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The bio location must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
