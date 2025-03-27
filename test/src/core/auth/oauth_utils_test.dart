// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/exception/twitter_exception.dart';
import 'package:twitter_api_v2/src/core/util/oauth_utils.dart';

void main() {
  //! Since it is difficult to add the case where the access token can be
  //! obtained as a unit test, only the case where an exception occurs should be
  //! tested.
  group('.generateAppOnlyBearerToken', () {
    test('throws TwitterException', () {
      expect(
        () async => await OAuthUtils.generateAppOnlyBearerToken(
          consumerKey: '',
          consumerSecret: '',
        ),
        throwsA(isA<TwitterException>()),
      );
    });
  });

  //! Since it is difficult to add the case where the access token can be
  //! obtained as a unit test, only the case where an exception occurs should be
  //! tested.
  group('.refreshAccessToken', () {
    test('throws TwitterException', () {
      expect(
        () async => await OAuthUtils.refreshAccessToken(
          clientId: 'aaaa',
          clientSecret: 'bbbb',
          refreshToken: 'test',
        ),
        throwsA(isA<TwitterException>()),
      );
    });
  });
}
