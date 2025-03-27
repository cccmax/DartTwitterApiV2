// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/user_bio_name.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = UserBioName('Me');

      expect(actual.toString(), 'bio_name:Me');
    });

    test('when negated', () {
      final actual = UserBioName.negated('Me');

      expect(actual.toString(), '-bio_name:Me');
    });

    test('when value is empty', () {
      final actual = UserBioName('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The bio name must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
