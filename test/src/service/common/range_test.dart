// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/common/range.dart';

void main() {
  test('.point', () {
    final actual = Range.point(10);

    expect(actual.from, 10);
    expect(actual.to, 10);
  });

  group('.between', () {
    test('normal case', () {
      final actual = Range.between(10, 20);

      expect(actual.from, 10);
      expect(actual.to, 20);
    });

    test('when "from" is greater than "to"', () {
      expect(
        () => Range.between(11, 10),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The "from" parameter must be less than "to".',
            ),
          ),
        ),
      );
    });
  });

  group('.isPoint', () {
    test('when range is point', () {
      final actual = Range.point(10);

      expect(actual.isPoint, isTrue);
    });

    test('when range is not point', () {
      final actual = Range.between(10, 11);

      expect(actual.isPoint, isFalse);
    });
  });
}
