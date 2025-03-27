// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:http/http.dart';

// 🌎 Project imports:
import '../../core/client/client_context.dart';
import '../../core/client/user_context.dart';
import '../../core/exception/data_not_found_exception.dart';
import '../../core/http_method.dart';
import '../../core/https_status.dart';
import '../base_service.dart';
import '../common/rate_limit.dart';
import '../response/twitter_request.dart';
import '../response/twitter_response.dart';
import 'trend_data.dart';
import 'trending_location_data.dart';

/// This class provides methods to easily access endpoints based on Trends.
abstract class TrendsService {
  /// Returns the new instance of [TrendsService].
  factory TrendsService({required ClientContext context}) =>
      _TrendsService(context: context);

  /// Returns the locations that Twitter has trending topic information for.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/1.1/trends/available.json
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 1.0a
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 1.0a)**:
  ///    75 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-available
  Future<TwitterResponse<List<TrendingLocationData>, void>>
      searchAvailableLocations();

  /// Returns the locations that Twitter has trending topic information for,
  /// closest to a specified location.
  ///
  /// ## Parameters
  ///
  /// - [latitude]: Latitude of the location you want to search.
  ///
  /// - [longitude]: Longitude of the location you want to search.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/1.1/trends/available.json
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 1.0a
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 1.0a)**:
  ///    75 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-closest
  Future<TwitterResponse<List<TrendingLocationData>, void>>
      searchClosestLocations({
    required double latitude,
    required double longitude,
  });

  /// Returns the top 50 trending topics for a specific id, if trending
  /// information is available for it.
  ///
  /// ## Parameters
  ///
  /// - [locationId]: ID of where the trend is occurring.
  ///
  /// - [excludeHashtags]: List of hashtags to exclude from search results
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/1.1/trends/place.json
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 1.0a
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 1.0a)**:
  ///    75 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/v1/trends/trends-for-location/api-reference/get-trends-place
  Future<TwitterResponse<List<TrendData>, void>> lookupTrends({
    required int locationId,
    List<String>? excludeHashtags,
  });
}

class _TrendsService extends BaseService implements TrendsService {
  /// Returns the new instance of [_TrendsService].
  _TrendsService({required super.context});

  @override
  Future<TwitterResponse<List<TrendingLocationData>, void>>
      searchAvailableLocations() async {
    final response = await super.get(
      UserContext.oauth1Only,
      '/1.1/trends/available.json',
    );

    final locations = _checkResponse(response);

    return TwitterResponse(
      headers: response.headers,
      status: HttpStatus.valueOf(response.statusCode),
      request: TwitterRequest(
        method: HttpMethod.valueOf(response.request!.method),
        url: response.request!.url,
      ),
      rateLimit: RateLimit.fromJson(
        rateLimitConverter.convert(response.headers),
      ),
      data: locations
          .map<TrendingLocationData>(
              (json) => TrendingLocationData.fromJson(json))
          .toList(),
    );
  }

  @override
  Future<TwitterResponse<List<TrendingLocationData>, void>>
      searchClosestLocations({
    required double latitude,
    required double longitude,
  }) async {
    final response = await super.get(
      UserContext.oauth1Only,
      '/1.1/trends/closest.json',
      queryParameters: {
        'lat': latitude,
        'long': longitude,
      },
    );

    final locations = _checkResponse(response);

    return TwitterResponse(
      headers: response.headers,
      status: HttpStatus.valueOf(response.statusCode),
      request: TwitterRequest(
        method: HttpMethod.valueOf(response.request!.method),
        url: response.request!.url,
      ),
      rateLimit: RateLimit.fromJson(
        rateLimitConverter.convert(response.headers),
      ),
      data: locations
          .map<TrendingLocationData>(
              (json) => TrendingLocationData.fromJson(json))
          .toList(),
    );
  }

  @override
  Future<TwitterResponse<List<TrendData>, void>> lookupTrends({
    required int locationId,
    List<String>? excludeHashtags,
  }) async {
    final response = await super.get(
      UserContext.oauth1Only,
      '/1.1/trends/place.json',
      queryParameters: {
        'id': locationId,
        'exclude': excludeHashtags,
      },
    );

    final locations = _checkResponse(response).first['trends'];

    return TwitterResponse(
      headers: response.headers,
      status: HttpStatus.valueOf(response.statusCode),
      request: TwitterRequest(
        method: HttpMethod.valueOf(response.request!.method),
        url: response.request!.url,
      ),
      rateLimit: RateLimit.fromJson(
        rateLimitConverter.convert(response.headers),
      ),
      data:
          locations.map<TrendData>((json) => TrendData.fromJson(json)).toList(),
    );
  }

  dynamic _checkResponse(final Response response) {
    final json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      if (json.containsKey('errors')) {
        throw DataNotFoundException(
          'No data exists in response.',
          response,
        );
      }
    }

    return json;
  }
}
