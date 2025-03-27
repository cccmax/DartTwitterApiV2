// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/common/range.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/range_operator.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/range_operator_type.dart';

void main() {
  group('.toString', () {
    test('when range is the point', () {
      final actual = RangeOperator(
        RangeOperatorType.followersCount,
        Range.point(10),
      );

      expect(actual.toString(), 'followers_count:10');
    });

    test('when range is not the point', () {
      final actual = RangeOperator(
          RangeOperatorType.followersCount, Range.between(10, 15));

      expect(actual.toString(), 'followers_count:10..15');
    });

    test('when negated', () {
      final actual = RangeOperator.negated(
          RangeOperatorType.followersCount, Range.point(10));

      expect(actual.toString(), '-followers_count:10');
    });

    test('when "from" in range is negative', () {
      final actual =
          RangeOperator(RangeOperatorType.followersCount, Range.between(-1, 5));

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) => e.message == 'The range must not be negative.',
            ),
          ),
        ),
      );
    });
  });
}
