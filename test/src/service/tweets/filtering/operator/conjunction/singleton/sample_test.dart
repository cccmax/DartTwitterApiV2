// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/sample.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = Sample(100);

      expect(actual.toString(), 'sample:100');
    });

    test('when percent is 101', () {
      final actual = Sample(101);

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) => e.message == 'The percent must be from 1 to 100.',
            ),
          ),
        ),
      );
    });

    test('when percent is 0', () {
      final actual = Sample(0);

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) => e.message == 'The percent must be from 1 to 100.',
            ),
          ),
        ),
      );
    });
  });
}
