// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/client/client_context.dart';
import 'package:twitter_api_v2/src/core/client/oauth_tokens.dart';
import 'package:twitter_api_v2/src/core/client/user_context.dart';
import 'package:twitter_api_v2/src/service/response/twitter_response.dart';
import 'package:twitter_api_v2/src/service/trends/trend_data.dart';
import 'package:twitter_api_v2/src/service/trends/trending_location_data.dart';
import 'package:twitter_api_v2/src/service/trends/trends_service.dart';
import '../../../mocks/client_context_stubs.dart' as context;
import '../common_expectations.dart';

void main() {
  group('.searchAvailableLocations', () {
    test('normal case', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/available.json',
          'test/src/service/trends/data/search_available_locations.json',
          {},
        ),
      );

      final response = await trendsService.searchAvailableLocations();

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TrendingLocationData>>());
    });

    test('with invalid access token', () async {
      final trendsService = TrendsService(
        context: ClientContext(
          bearerToken: '',
          oauthTokens: OAuthTokens(
            consumerKey: '1234',
            consumerSecret: '1234',
            accessToken: '1234',
            accessTokenSecret: '1234',
          ),
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedException(
        () async => await trendsService.searchAvailableLocations(),
      );
    });

    test('with rate limit exceeded error', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/available.json',
          'test/src/service/trends/data/search_available_locations.json',
          statusCode: 429,
          {},
        ),
      );

      expectRateLimitExceededException(
        () async => await trendsService.searchAvailableLocations(),
      );
    });

    test('with errors', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/available.json',
          'test/src/service/trends/data/no_data.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await trendsService.searchAvailableLocations(),
      );
    });

    test('with no json', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/available.json',
          'test/src/service/trends/data/no_json.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await trendsService.searchAvailableLocations(),
      );
    });
  });

  group('.searchClosestLocations', () {
    test('normal case', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/closest.json',
          'test/src/service/trends/data/search_closest_locations.json',
          {
            'lat': '10.0',
            'long': '10.0',
          },
        ),
      );

      final response = await trendsService.searchClosestLocations(
        latitude: 10.0,
        longitude: 10.0,
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TrendingLocationData>>());
    });

    test('with invalid access token', () async {
      final trendsService = TrendsService(
        context: ClientContext(
          bearerToken: '',
          oauthTokens: OAuthTokens(
            consumerKey: '1234',
            consumerSecret: '1234',
            accessToken: '1234',
            accessTokenSecret: '1234',
          ),
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedException(
        () async => await trendsService.searchClosestLocations(
          latitude: 10.0,
          longitude: 10.0,
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/closest.json',
          'test/src/service/trends/data/search_closest_locations.json',
          statusCode: 429,
          {
            'lat': '10.0',
            'long': '10.0',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await trendsService.searchClosestLocations(
          latitude: 10.0,
          longitude: 10.0,
        ),
      );
    });

    test('with errors', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/closest.json',
          'test/src/service/trends/data/no_data.json',
          {
            'lat': '10.0',
            'long': '10.0',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await trendsService.searchClosestLocations(
          latitude: 10.0,
          longitude: 10.0,
        ),
      );
    });

    test('with no json', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/closest.json',
          'test/src/service/trends/data/no_json.json',
          {
            'lat': '10.0',
            'long': '10.0',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await trendsService.searchClosestLocations(
          latitude: 10.0,
          longitude: 10.0,
        ),
      );
    });
  });

  group('.lookupTrends', () {
    test('normal case', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/place.json',
          'test/src/service/trends/data/lookup_trends.json',
          {
            'id': '1234',
            'exclude': 'test,test2',
          },
        ),
      );

      final response = await trendsService.lookupTrends(
        locationId: 1234,
        excludeHashtags: [
          'test',
          'test2',
        ],
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TrendData>>());
    });

    test('with invalid access token', () async {
      final trendsService = TrendsService(
        context: ClientContext(
          bearerToken: '',
          oauthTokens: OAuthTokens(
            consumerKey: '1234',
            consumerSecret: '1234',
            accessToken: '1234',
            accessTokenSecret: '1234',
          ),
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedException(
        () async => await trendsService.lookupTrends(
          locationId: 1234,
          excludeHashtags: [
            'test',
            'test2',
          ],
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/place.json',
          'test/src/service/trends/data/lookup_trends.json',
          statusCode: 429,
          {
            'id': '1234',
            'exclude': 'test,test2',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await trendsService.lookupTrends(
          locationId: 1234,
          excludeHashtags: ['test', 'test2'],
        ),
      );
    });

    test('with errors', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/place.json',
          'test/src/service/trends/data/no_data.json',
          {
            'id': '1234',
            'exclude': 'test,test2',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await trendsService.lookupTrends(
          locationId: 1234,
          excludeHashtags: ['test', 'test2'],
        ),
      );
    });

    test('with no json', () async {
      final trendsService = TrendsService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/trends/place.json',
          'test/src/service/trends/data/no_json.json',
          {
            'id': '1234',
            'exclude': 'test,test2',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await trendsService.lookupTrends(
          locationId: 1234,
          excludeHashtags: ['test', 'test2'],
        ),
      );
    });
  });
}
