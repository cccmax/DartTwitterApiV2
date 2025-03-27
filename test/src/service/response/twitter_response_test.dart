// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/http_method.dart';
import 'package:twitter_api_v2/src/core/https_status.dart';
import 'package:twitter_api_v2/src/service/common/includes.dart';
import 'package:twitter_api_v2/src/service/common/rate_limit.dart';
import 'package:twitter_api_v2/src/service/response/twitter_request.dart';
import 'package:twitter_api_v2/src/service/response/twitter_response.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_data.dart';

void main() {
  test('.hasIncludes', () {
    final response = TwitterResponse<bool, bool>(
      headers: {},
      status: HttpStatus.ok,
      request: TwitterRequest(
        method: HttpMethod.get,
        url: Uri(),
      ),
      rateLimit: RateLimit(
        limitCount: 0,
        remainingCount: 0,
        resetAt: DateTime.now(),
      ),
      data: true,
      includes: Includes(),
      meta: false,
    );

    expect(response.hasIncludes, isTrue);
    expect(response.hasNotIncludes, isFalse);
  });

  test('.hasNotIncludes', () {
    final response = TwitterResponse<bool, bool>(
        headers: {},
        status: HttpStatus.ok,
        request: TwitterRequest(
          method: HttpMethod.get,
          url: Uri(),
        ),
        rateLimit: RateLimit(
          limitCount: 0,
          remainingCount: 0,
          resetAt: DateTime.now(),
        ),
        data: true,
        meta: null);

    expect(response.hasNotIncludes, isTrue);
    expect(response.hasIncludes, isFalse);
  });

  test('.hasMeta', () {
    final response = TwitterResponse<bool, bool>(
        headers: {},
        status: HttpStatus.ok,
        request: TwitterRequest(
          method: HttpMethod.get,
          url: Uri(),
        ),
        rateLimit: RateLimit(
          limitCount: 0,
          remainingCount: 0,
          resetAt: DateTime.now(),
        ),
        data: true,
        meta: false);

    expect(response.hasMeta, isTrue);
    expect(response.hasNotMeta, isFalse);
  });

  test('.hasNotMeta', () {
    final response = TwitterResponse<bool, bool>(
        headers: {},
        status: HttpStatus.ok,
        request: TwitterRequest(
          method: HttpMethod.get,
          url: Uri(),
        ),
        rateLimit: RateLimit(
          limitCount: 0,
          remainingCount: 0,
          resetAt: DateTime.now(),
        ),
        data: true,
        meta: null);

    expect(response.hasNotMeta, isTrue);
    expect(response.hasMeta, isFalse);
  });

  group('.toJson', () {
    test('with multiple data', () {
      final response = TwitterResponse<TweetData, void>(
        headers: {},
        status: HttpStatus.ok,
        request: TwitterRequest(
          method: HttpMethod.get,
          url: Uri(),
        ),
        rateLimit: RateLimit(
          limitCount: 0,
          remainingCount: 0,
          resetAt: DateTime.now(),
        ),
        data: TweetData(id: 'test1', text: 'test2'),
        includes: Includes(
          tweets: [
            TweetData(id: 'test1', text: 'test2'),
            TweetData(id: 'test3', text: 'test4')
          ],
        ),
      );

      expect(response.toJson(), {
        'data': {'id': 'test1', 'text': 'test2'},
        'includes': {
          'tweets': [
            {'id': 'test1', 'text': 'test2'},
            {'id': 'test3', 'text': 'test4'}
          ],
        }
      });
    });

    test('with multiple data', () {
      final response = TwitterResponse<List<TweetData>, void>(
        headers: {},
        status: HttpStatus.ok,
        request: TwitterRequest(
          method: HttpMethod.get,
          url: Uri(),
        ),
        rateLimit: RateLimit(
          limitCount: 0,
          remainingCount: 0,
          resetAt: DateTime.now(),
        ),
        data: [
          TweetData(id: 'test1', text: 'test2'),
          TweetData(id: 'test3', text: 'test4')
        ],
        includes: null,
      );

      expect(response.toJson(), {
        'data': [
          {'id': 'test1', 'text': 'test2'},
          {'id': 'test3', 'text': 'test4'}
        ]
      });
    });
  });

  test('.toString', () {
    final now = DateTime.now();

    final response = TwitterResponse<bool, bool>(
      headers: {},
      status: HttpStatus.ok,
      request: TwitterRequest(
        method: HttpMethod.get,
        url: Uri(),
      ),
      rateLimit: RateLimit(
        limitCount: 0,
        remainingCount: 0,
        resetAt: now,
      ),
      data: true,
      includes: Includes(),
      meta: false,
    );

    expect(
        response.toString(),
        'TwitterResponse('
        'rateLimit: RateLimit(limitCount: 0, remainingCount: 0, '
        'resetAt: $now), data: true, '
        'includes: Includes(tweets: null, users: null, '
        'media: null, places: null, polls: null, topics: null), '
        'meta: false)');
  });
}
