// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/client/oauth_tokens.dart';
import 'package:twitter_api_v2/src/core/exception/twitter_exception.dart';
import 'package:twitter_api_v2/src/core/exception/unauthorized_exception.dart';
import 'package:twitter_api_v2/src/service/compliance/compliance_service.dart';
import 'package:twitter_api_v2/src/service/lists/lists_service.dart';
import 'package:twitter_api_v2/src/service/response/twitter_response.dart';
import 'package:twitter_api_v2/src/service/response/twitter_stream_response.dart';
import 'package:twitter_api_v2/src/service/spaces/spaces_service.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_data.dart';
import 'package:twitter_api_v2/src/service/tweets/tweets_service.dart';
import 'package:twitter_api_v2/src/service/users/users_service.dart';
import 'package:twitter_api_v2/src/twitter_api.dart';

void main() {
  test('when there are no tokens', () {
    expect(
      () => TwitterApi(bearerToken: ''),
      throwsA(isA<ArgumentError>()),
    );
  });

  group('services', () {
    test('.tweets', () {
      final twitter = TwitterApi(bearerToken: 'XXX');

      expect(twitter.tweets, isNotNull);
      expect(twitter.tweets, isA<TweetsService>());
    });

    test('.users', () {
      final twitter = TwitterApi(bearerToken: 'XXX');

      expect(twitter.users, isNotNull);
      expect(twitter.users, isA<UsersService>());
    });

    test('.spaces', () {
      final twitter = TwitterApi(bearerToken: 'XXX');

      expect(twitter.spaces, isNotNull);
      expect(twitter.spaces, isA<SpacesService>());
    });

    test('.lists', () {
      final twitter = TwitterApi(bearerToken: 'XXX');

      expect(twitter.lists, isNotNull);
      expect(twitter.lists, isA<ListsService>());
    });

    test('.compliance', () {
      final twitter = TwitterApi(bearerToken: 'XXX');

      expect(twitter.compliance, isNotNull);
      expect(twitter.compliance, isA<ComplianceService>());
    });
  });

  //! Since authentication information cannot be shared,
  //! only that the communication is established is verified.
  group('HTTP client in OAuth 2.0', () {
    test('GET', () {
      final twitter = TwitterApi(bearerToken: 'XXX');

      expect(
        () async => await twitter.tweets.lookupById(tweetId: ''),
        throwsA(isA<UnauthorizedException>()),
      );
    });

    test('GET Stream', () async {
      final twitter = TwitterApi(bearerToken: 'XXX');
      final response = await twitter.tweets.connectSampleStream();

      //! Stream does not raise an exception when retrieving.
      expect(response, isNotNull);
      expect(response,
          isA<TwitterStreamResponse<TwitterResponse<TweetData, void>>>());
    });

    test('POST', () {
      final twitter = TwitterApi(bearerToken: 'XXX');

      expect(
        () async => await twitter.tweets.createTweet(text: ''),
        throwsA(isA<TwitterException>()),
      );
    });

    test('DELETE', () {
      final twitter = TwitterApi(bearerToken: 'XXX');

      expect(
        () async => await twitter.tweets.destroyTweet(tweetId: ''),
        throwsA(isA<TwitterException>()),
      );
    });

    test('PUT', () {
      final twitter = TwitterApi(bearerToken: 'XXX');

      expect(
        () async => await twitter.lists.updateListAsPrivate(listId: ''),
        throwsA(isA<TwitterException>()),
      );
    });
  });

  //! Since authentication information cannot be shared,
  //! only that the communication is established is verified.
  group('HTTP client in OAuth 1.0a', () {
    test('GET', () {
      final twitter = TwitterApi(
        bearerToken: '',
        oauthTokens: OAuthTokens(
          consumerKey: '',
          consumerSecret: '',
          accessToken: '',
          accessTokenSecret: '',
        ),
      );

      expect(
        () async => await twitter.tweets.lookupById(tweetId: ''),
        throwsA(isA<UnauthorizedException>()),
      );
    });

    test('POST', () {
      final twitter = TwitterApi(
        bearerToken: '',
        oauthTokens: OAuthTokens(
          consumerKey: '',
          consumerSecret: '',
          accessToken: '',
          accessTokenSecret: '',
        ),
      );

      expect(
        () async => await twitter.tweets.createTweet(text: ''),
        throwsA(isA<UnauthorizedException>()),
      );
    });

    test('DELETE', () {
      final twitter = TwitterApi(
        bearerToken: '',
        oauthTokens: OAuthTokens(
          consumerKey: '',
          consumerSecret: '',
          accessToken: '',
          accessTokenSecret: '',
        ),
      );

      expect(
        () async => await twitter.tweets.destroyTweet(tweetId: ''),
        throwsA(isA<TwitterException>()),
      );
    });

    test('PUT', () {
      final twitter = TwitterApi(
        bearerToken: '',
        oauthTokens: OAuthTokens(
          consumerKey: '',
          consumerSecret: '',
          accessToken: '',
          accessTokenSecret: '',
        ),
      );

      expect(
        () async => await twitter.lists.updateListAsPrivate(listId: ''),
        throwsA(isA<TwitterException>()),
      );
    });
  });
}
