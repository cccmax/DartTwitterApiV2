// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/exception/data_not_found_exception.dart';
import 'package:twitter_api_v2/src/core/exception/rate_limit_exceeded_exception.dart';
import 'package:twitter_api_v2/src/core/exception/twitter_exception.dart';
import 'package:twitter_api_v2/src/core/exception/unauthorized_exception.dart';

void expectUnauthorizedException(Function fn) {
  expect(
    () async => await fn.call(),
    throwsA(
      allOf(
        isA<UnauthorizedException>(),
      ),
    ),
  );
}

void expectUnauthorizedExceptionForOAuth1(Function fn) {
  expect(
    () async => await fn.call(),
    throwsA(
      allOf(
        isA<UnauthorizedException>(),
        predicate(
          (dynamic e) =>
              e.message ==
              'Required tokens were not passed for an endpoint that '
                  'requires OAuth 1.0a.',
        ),
      ),
    ),
  );
}

void expectUnauthorizedExceptionForOAuth2(Function fn) {
  expect(
    () async => await fn.call(),
    throwsA(
      allOf(
        isA<UnauthorizedException>(),
        predicate(
          (dynamic e) =>
              e.message ==
              'Required access token was not passed for an endpoint that '
                  'requires OAuth 2.0.',
        ),
      ),
    ),
  );
}

void expectRateLimitExceededException(Function fn) {
  expect(
    () async => fn.call(),
    throwsA(
      allOf(
        isA<RateLimitExceededException>(),
        predicate((RateLimitExceededException e) =>
            e.message == 'Rate limit exceeded.'),
      ),
    ),
  );
}

void expectDataNotFoundExceptionDueToNoData(Function fn) {
  expect(
    () async => await fn.call(),
    throwsA(
      allOf(
        isA<DataNotFoundException>(),
        predicate(
          (DataNotFoundException e) =>
              e.message == 'No data exists in response.',
        ),
      ),
    ),
  );
}

void expectDataNotFoundExceptionDueToNoJson(Function fn) {
  expect(
    () async => await fn.call(),
    throwsA(
      allOf(
        isA<DataNotFoundException>(),
        predicate(
          (DataNotFoundException e) =>
              e.message == 'No body exists in response.',
        ),
      ),
    ),
  );
}

void expectTwitterExceptionDueToInvalidRequest(Function fn) {
  expect(
    () async => await fn.call(),
    throwsA(
      allOf(isA<TwitterException>()),
    ),
  );
}
