// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import '../exception/twitter_exception.dart';
import '../oauth_response.dart';

/// Provides the convenience utils for OAuth.
class OAuthUtils {
  const OAuthUtils._();

  /// Returns the App-Only bearer token associated with
  /// [consumerKey] and [consumerSecret].
  static Future<String> generateAppOnlyBearerToken({
    required String consumerKey,
    required String consumerSecret,
  }) async {
    final credentials = base64Encode('$consumerKey:$consumerSecret'.codeUnits);

    final response = await http.post(
      Uri.https('api.twitter.com', '/oauth2/token'),
      headers: {
        'Authorization': 'Basic $credentials',
        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
      },
      body: {
        'grant_type': 'client_credentials',
      },
    );

    if (response.statusCode != 200) {
      throw TwitterException('Failed to obtain a bearer token.', response);
    }

    return jsonDecode(response.body)['access_token'];
  }

  /// Reissue the access token using the refresh token.
  static Future<OAuthResponse> refreshAccessToken({
    required String clientId,
    required String clientSecret,
    required String refreshToken,
  }) async {
    final credentials = base64.encode(utf8.encode('$clientId:$clientSecret'));

    final response = await http.post(
      Uri.https('api.twitter.com', '/2/oauth2/token'),
      headers: {
        'Authorization': 'Basic $credentials',
      },
      body: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
      },
    );

    if (response.statusCode != 200) {
      throw TwitterException('Failed to refresh an access token.', response);
    }

    return OAuthResponse.fromJson(
      jsonDecode(response.body),
    );
  }
}
