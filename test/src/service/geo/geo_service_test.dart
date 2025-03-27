// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/client/client_context.dart';
import 'package:twitter_api_v2/src/core/client/oauth_tokens.dart';
import 'package:twitter_api_v2/src/core/client/user_context.dart';
import 'package:twitter_api_v2/src/service/geo/geo_granularity.dart';
import 'package:twitter_api_v2/src/service/geo/geo_service.dart';
import 'package:twitter_api_v2/src/service/geo/place_data.dart';
import 'package:twitter_api_v2/src/service/response/twitter_response.dart';
import '../../../mocks/client_context_stubs.dart' as context;
import '../common_expectations.dart';

void main() {
  group('.lookupById', () {
    test('normal case', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/id/1111.json',
          'test/src/service/geo/data/lookup_by_id.json',
          {},
        ),
      );

      final response = await geoService.lookupById(
        placeId: '1111',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<PlaceData>());
    });

    test('with invalid access token', () async {
      final geoService = GeoService(
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
        () async => await geoService.lookupById(
          placeId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/id/1111.json',
          'test/src/service/geo/data/lookup_by_id.json',
          statusCode: 429,
          {},
        ),
      );

      expectRateLimitExceededException(
        () async => await geoService.lookupById(
          placeId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/id/1111.json',
          'test/src/service/geo/data/no_data.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await geoService.lookupById(placeId: '1111'),
      );
    });

    test('with no json', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/id/1111.json',
          'test/src/service/geo/data/no_json.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await geoService.lookupById(placeId: '1111'),
      );
    });
  });

  group('.searchLocations', () {
    test('normal case', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/search.json',
          'test/src/service/geo/data/search_locations.json',
          {
            'query': '1111',
            'granularity': 'admin',
            'max_results': '10',
            'lat': '10.0',
            'long': '20.0',
            'ip': '10.0.1',
          },
        ),
      );

      final response = await geoService.searchLocations(
        query: '1111',
        granularity: GeoGranularity.admin,
        maxResults: 10,
        latitude: 10.0,
        longitude: 20.0,
        ipAddress: '10.0.1',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<PlaceData>>());
    });

    test('with invalid access token', () async {
      final geoService = GeoService(
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
        () async => await geoService.searchLocations(query: 'test'),
      );
    });

    test('with rate limit exceeded error', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/search.json',
          'test/src/service/geo/data/search_locations.json',
          statusCode: 429,
          {
            'query': '1111',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await geoService.searchLocations(
          query: '1111',
        ),
      );
    });

    test('with errors', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/search.json',
          'test/src/service/geo/data/no_data.json',
          {
            'query': '1111',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await geoService.searchLocations(query: '1111'),
      );
    });

    test('with no json', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/search.json',
          'test/src/service/geo/data/no_json.json',
          {
            'query': '1111',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await geoService.searchLocations(query: '1111'),
      );
    });
  });

  group('.lookupReverseGeocodedLocations', () {
    test('normal case', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/reverse_geocode.json',
          'test/src/service/geo/data/lookup_reversed_geocoded_locations.json',
          {
            'lat': '10.0',
            'long': '20.0',
            'max_results': '10',
            'accuracy': '5',
            'granularity': 'country',
          },
        ),
      );

      final response = await geoService.lookupReverseGeocodedLocations(
        latitude: 10.0,
        longitude: 20.0,
        maxResults: 10,
        accuracy: '5',
        granularity: GeoGranularity.country,
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<PlaceData>>());
    });

    test('with invalid access token', () async {
      final geoService = GeoService(
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
        () async => await geoService.lookupReverseGeocodedLocations(
          latitude: 10.0,
          longitude: 20.0,
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/reverse_geocode.json',
          'test/src/service/geo/data/lookup_reversed_geocoded_locations.json',
          statusCode: 429,
          {
            'lat': '10.0',
            'long': '20.0',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await geoService.lookupReverseGeocodedLocations(
          latitude: 10.0,
          longitude: 20.0,
        ),
      );
    });

    test('with errors', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/reverse_geocode.json',
          'test/src/service/geo/data/no_data.json',
          {
            'lat': '10.0',
            'long': '20.0',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await geoService.lookupReverseGeocodedLocations(
          latitude: 10.0,
          longitude: 20.0,
        ),
      );
    });

    test('with no json', () async {
      final geoService = GeoService(
        context: context.buildGetStub(
          UserContext.oauth1Only,
          '/1.1/geo/reverse_geocode.json',
          'test/src/service/geo/data/no_json.json',
          {
            'lat': '10.0',
            'long': '20.0',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await geoService.lookupReverseGeocodedLocations(
          latitude: 10.0,
          longitude: 20.0,
        ),
      );
    });
  });
}
