// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/common/rate_limit.dart';

void main() {
  group('.isExceeded', () {
    test('when rate limit is exceeded', () {
      final rateLimit = RateLimit(
        limitCount: 150,
        remainingCount: 0,
        resetAt: DateTime.now(),
      );

      expect(rateLimit.isExceeded, isTrue);
    });

    test('when rate limit is not exceeded', () {
      final rateLimit = RateLimit(
        limitCount: 150,
        remainingCount: 1,
        resetAt: DateTime.now(),
      );

      expect(rateLimit.isExceeded, isFalse);
    });
  });

  group('.isNotExceeded', () {
    test('when rate limit is exceeded', () {
      final rateLimit = RateLimit(
        limitCount: 150,
        remainingCount: 0,
        resetAt: DateTime.now(),
      );

      expect(rateLimit.isNotExceeded, isFalse);
    });

    test('when rate limit is not exceeded', () {
      final rateLimit = RateLimit(
        limitCount: 150,
        remainingCount: 1,
        resetAt: DateTime.now(),
      );

      expect(rateLimit.isNotExceeded, isTrue);
    });
  });
}
