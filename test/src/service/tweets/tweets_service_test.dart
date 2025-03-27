// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/client/client_context.dart';
import 'package:twitter_api_v2/src/core/client/oauth_tokens.dart';
import 'package:twitter_api_v2/src/core/client/user_context.dart';
import 'package:twitter_api_v2/src/core/exception/data_not_found_exception.dart';
import 'package:twitter_api_v2/src/service/common/delete_state_data.dart';
import 'package:twitter_api_v2/src/service/common/empty_data.dart';
import 'package:twitter_api_v2/src/service/pagination/forward_pagination_control.dart';
import 'package:twitter_api_v2/src/service/pagination/pagination_control.dart';
import 'package:twitter_api_v2/src/service/response/filtered_stream_response.dart';
import 'package:twitter_api_v2/src/service/response/pagination_response.dart';
import 'package:twitter_api_v2/src/service/response/twitter_response.dart';
import 'package:twitter_api_v2/src/service/response/twitter_stream_response.dart';
import 'package:twitter_api_v2/src/service/tweets/bookmark_state_data.dart';
import 'package:twitter_api_v2/src/service/tweets/decahose_partition.dart';
import 'package:twitter_api_v2/src/service/tweets/exclude_tweet_type.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering_rule_data.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering_rule_meta.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering_rule_param.dart';
import 'package:twitter_api_v2/src/service/tweets/like_state_data.dart';
import 'package:twitter_api_v2/src/service/tweets/matching_rule.dart';
import 'package:twitter_api_v2/src/service/tweets/reply_state_data.dart';
import 'package:twitter_api_v2/src/service/tweets/retweet_state_data.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_count_data.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_count_meta.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_data.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_expansion.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_field.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_geo_param.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_media_param.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_meta.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_poll_param.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_reply_param.dart';
import 'package:twitter_api_v2/src/service/tweets/tweets_service.dart';
import 'package:twitter_api_v2/src/service/users/user_data.dart';
import 'package:twitter_api_v2/src/service/users/user_meta.dart';
import '../../../mocks/client_context_stubs.dart' as context;
import '../common_expectations.dart';

void main() {
  group('.createTweet', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets',
          'test/src/service/tweets/data/create_tweet.json',
        ),
      );

      final response = await tweetsService.createTweet(
        text: 'Hello, World!',
        media: TweetMediaParam(mediaIds: [], taggedUserIds: []),
        geo: TweetGeoParam(placeId: ''),
        poll: TweetPollParam(duration: Duration(days: 7), options: []),
        reply: TweetReplyParam(inReplyToTweetId: '', excludeReplyUserIds: []),
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<TweetData>());
      expect(response.data.id, '1445880548472328192');
      expect(response.data.text, 'Hello, World!');
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
        context: ClientContext(
          bearerToken: '',
          oauthTokens: OAuthTokens(
            consumerKey: '1234',
            consumerSecret: '1234',
            accessToken: '1234',
            accessTokenSecret: '1234',
          ),
          timeout: const Duration(seconds: 10),
        ),
      );

      expectUnauthorizedException(
        () async => await tweetsService.createTweet(
          text: 'Throw UnauthorizedException',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.createTweet(
          text: 'Throw TwitterException',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.createTweet(
          text: 'Throw RateLimitExceededException',
        ),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets',
          'test/src/service/tweets/data/no_json.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.createTweet(
          text: 'Throw TwitterException',
        ),
      );
    });
  });

  group('.destroyTweet', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/destroy_tweet.json',
        ),
      );

      final response = await tweetsService.destroyTweet(tweetId: '1111');

      expect(response, isA<TwitterResponse<DeleteStateData, void>>());
      expect(response.data.isDeleted, isTrue);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.destroyTweet(
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.destroyTweet(tweetId: '1111'),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.destroyTweet(tweetId: '1111'),
      );
    });
  });

  group('.createLike', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/likes',
          'test/src/service/tweets/data/create_like.json',
        ),
      );

      final response = await tweetsService.createLike(
        userId: '0000',
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse<LikeStateData, void>>());
      expect(response.data.isLiked, isTrue);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.createLike(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/likes',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.createLike(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/likes',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.createLike(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });
  });

  group('.destroyLike', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/likes/1111',
          'test/src/service/tweets/data/destroy_like.json',
        ),
      );

      final response = await tweetsService.destroyLike(
        userId: '0000',
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse<LikeStateData, void>>());
      expect(response.data.isLiked, isFalse);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.destroyLike(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/likes/1111',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.destroyLike(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/likes/1111',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.destroyLike(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });
  });

  group('.createRetweet', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/retweets',
          'test/src/service/tweets/data/create_retweet.json',
        ),
      );

      final response = await tweetsService.createRetweet(
        userId: '0000',
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse<RetweetStateData, void>>());
      expect(response.data.isRetweeted, isTrue);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.createRetweet(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/retweets',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.createRetweet(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/retweets',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.createRetweet(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });
  });

  group('.destroyRetweet', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/retweets/1111',
          'test/src/service/tweets/data/destroy_retweet.json',
        ),
      );

      final response = await tweetsService.destroyRetweet(
        userId: '0000',
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse<RetweetStateData, void>>());
      expect(response.data.isRetweeted, isFalse);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.destroyRetweet(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/retweets/1111',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.destroyRetweet(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/retweets/1111',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.destroyRetweet(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });
  });

  group('.lookupLikingUsers', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/liking_users',
          'test/src/service/tweets/data/lookup_liking_users.json',
          {},
        ),
      );

      final response = await tweetsService.lookupLikingUsers(
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<UserData>>());
      expect(response.meta, isA<UserMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.lookupLikingUsers(
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/liking_users',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {},
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupLikingUsers(
          tweetId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/liking_users',
          'test/src/service/tweets/data/no_data.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupLikingUsers(tweetId: '1111'),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/liking_users',
          'test/src/service/tweets/data/no_json.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupLikingUsers(tweetId: '1111'),
      );
    });

    test('with paging', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/users/dataset_1.json',
            'test/src/service/pagination/data/users/dataset_2.json',
            'test/src/service/pagination/data/users/dataset_3.json',
            'test/src/service/pagination/data/users/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupLikingUsers(
        tweetId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasPreviousPage, isFalse);
          expect(event.hasNotNextPage, isFalse);
          expect(event.hasNotPreviousPage, isTrue);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<UserData>>());
          expect(event.response.meta, isA<UserMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          if (event.count == 3) {
            return PaginationControl.stop();
          }

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<UserData>>());
      expect(response.meta, isA<UserMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with paging and no more next pages', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/users/dataset_1.json',
            'test/src/service/pagination/data/users/dataset_2.json',
            'test/src/service/pagination/data/users/dataset_3.json',
            'test/src/service/pagination/data/users/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupLikingUsers(
        tweetId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasPreviousPage, isFalse);
          expect(event.hasNotPreviousPage, isTrue);

          if (event.count < 4) {
            expect(event.hasNextPage, isTrue);
            expect(event.hasNotNextPage, isFalse);
          } else {
            expect(event.hasNextPage, isFalse);
            expect(event.hasNotNextPage, isTrue);
          }

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<UserData>>());
          expect(event.response.meta, isA<UserMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<UserData>>());
      expect(response.meta, isA<UserMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });
  });

  group('.lookupLikedTweets', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/liked_tweets',
          'test/src/service/tweets/data/lookup_liked_tweets.json',
          {},
        ),
      );

      final response = await tweetsService.lookupLikedTweets(
        userId: '0000',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.lookupLikedTweets(
          userId: '0000',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/liked_tweets',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {},
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupLikedTweets(
          userId: '0000',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/liked_tweets',
          'test/src/service/tweets/data/no_data.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupLikedTweets(userId: '0000'),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/liking_users',
          'test/src/service/tweets/data/no_json.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupLikingUsers(tweetId: '1111'),
      );
    });

    test('with paging', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupLikedTweets(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasPreviousPage, isFalse);
          expect(event.hasNotNextPage, isFalse);
          expect(event.hasNotPreviousPage, isTrue);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          if (event.count == 3) {
            return PaginationControl.stop();
          }

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with paging and no more next pages', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupLikedTweets(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasPreviousPage, isFalse);
          expect(event.hasNotPreviousPage, isTrue);

          if (event.count < 4) {
            expect(event.hasNextPage, isTrue);
            expect(event.hasNotNextPage, isFalse);
          } else {
            expect(event.hasNextPage, isFalse);
            expect(event.hasNotNextPage, isTrue);
          }

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });
  });

  group('.lookupRetweetedUsers', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/retweeted_by',
          'test/src/service/tweets/data/lookup_retweeted_users.json',
          {},
        ),
      );

      final response = await tweetsService.lookupRetweetedUsers(
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<UserData>>());
      expect(response.meta, isA<UserMeta>());
      expect(response.data.length, 3);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 3);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.lookupRetweetedUsers(
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/retweeted_by',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {},
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupRetweetedUsers(
          tweetId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/retweeted_by',
          'test/src/service/tweets/data/no_data.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupRetweetedUsers(tweetId: '1111'),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/retweeted_by',
          'test/src/service/tweets/data/no_json.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupRetweetedUsers(tweetId: '1111'),
      );
    });

    test('with paging', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/users/dataset_1.json',
            'test/src/service/pagination/data/users/dataset_2.json',
            'test/src/service/pagination/data/users/dataset_3.json',
            'test/src/service/pagination/data/users/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupRetweetedUsers(
        tweetId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasPreviousPage, isFalse);
          expect(event.hasNotNextPage, isFalse);
          expect(event.hasNotPreviousPage, isTrue);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<UserData>>());
          expect(event.response.meta, isA<UserMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          if (event.count == 3) {
            return PaginationControl.stop();
          }

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<UserData>>());
      expect(response.meta, isA<UserMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with paging and no more next pages', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/users/dataset_1.json',
            'test/src/service/pagination/data/users/dataset_2.json',
            'test/src/service/pagination/data/users/dataset_3.json',
            'test/src/service/pagination/data/users/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupRetweetedUsers(
        tweetId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasPreviousPage, isFalse);
          expect(event.hasNotPreviousPage, isTrue);

          if (event.count < 4) {
            expect(event.hasNextPage, isTrue);
            expect(event.hasNotNextPage, isFalse);
          } else {
            expect(event.hasNextPage, isFalse);
            expect(event.hasNotNextPage, isTrue);
          }

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<UserData>>());
          expect(event.response.meta, isA<UserMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<UserData>>());
      expect(response.meta, isA<UserMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });
  });

  group('.lookupQuoteTweets', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/quote_tweets',
          'test/src/service/tweets/data/lookup_quote_tweets.json',
          {},
        ),
      );

      final response = await tweetsService.lookupQuoteTweets(
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 10);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 10);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.lookupQuoteTweets(
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/quote_tweets',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {},
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupQuoteTweets(
          tweetId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/quote_tweets',
          'test/src/service/tweets/data/no_data.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupQuoteTweets(tweetId: '1111'),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111/quote_tweets',
          'test/src/service/tweets/data/no_json.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupQuoteTweets(tweetId: '1111'),
      );
    });

    test('with paging', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupQuoteTweets(
        tweetId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasPreviousPage, isFalse);
          expect(event.hasNotNextPage, isFalse);
          expect(event.hasNotPreviousPage, isTrue);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          if (event.count == 3) {
            return PaginationControl.stop();
          }

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with paging and no more next pages', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupQuoteTweets(
        tweetId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasPreviousPage, isFalse);
          expect(event.hasNotPreviousPage, isTrue);

          if (event.count < 4) {
            expect(event.hasNextPage, isTrue);
            expect(event.hasNotNextPage, isFalse);
          } else {
            expect(event.hasNextPage, isFalse);
            expect(event.hasNotNextPage, isTrue);
          }

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });
  });

  group('.searchRecent', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/search/recent',
          'test/src/service/tweets/data/search_recent.json',
          {'query': 'hello'},
        ),
      );

      final response = await tweetsService.searchRecent(
        query: 'hello',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 6);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 6);
    });

    test('with various fields', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/search/recent',
          'test/src/service/tweets/data/search_recent_with_various_fields.json',
          {'query': 'hello'},
        ),
      );

      final response = await tweetsService.searchRecent(
        query: 'hello',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 6);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 6);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.searchRecent(
          query: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/search/recent',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {'query': 'hello'},
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.searchRecent(
          query: 'hello',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/search/recent',
          'test/src/service/tweets/data/no_data.json',
          {'query': 'hello'},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.searchRecent(query: 'hello'),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/search/recent',
          'test/src/service/tweets/data/no_json.json',
          {'query': 'hello'},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.searchRecent(query: 'hello'),
      );
    });

    test('with paging', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.searchRecent(
        query: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          if (event.count == 3) {
            return ForwardPaginationControl.stop();
          }

          count++;

          return ForwardPaginationControl.next();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with paging and no more next pages', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.searchRecent(
        query: '1111',
        paging: (event) {
          expect(event.count, count);

          if (event.count < 4) {
            expect(event.hasNextPage, isTrue);
            expect(event.hasNotNextPage, isFalse);
          } else {
            expect(event.hasNextPage, isFalse);
            expect(event.hasNotNextPage, isTrue);
          }

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          count++;

          return ForwardPaginationControl.next();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });
  });

  group('.searchAll', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/search/all',
          'test/src/service/tweets/data/search_all.json',
          {'query': 'hello'},
        ),
      );

      final response = await tweetsService.searchAll(
        query: 'hello',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 6);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 6);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
        context: ClientContext(
          bearerToken: '',
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth2(
        () async => await tweetsService.searchAll(
          query: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/search/all',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {'query': 'hello'},
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.searchAll(
          query: 'hello',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/search/all',
          'test/src/service/tweets/data/no_data.json',
          {'query': 'hello'},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.searchAll(query: 'hello'),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/search/all',
          'test/src/service/tweets/data/no_json.json',
          {'query': 'hello'},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.searchAll(query: 'hello'),
      );
    });

    test('with paging', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.appOnly,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.searchAll(
        query: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          if (event.count == 3) {
            return ForwardPaginationControl.stop();
          }

          count++;

          return ForwardPaginationControl.next();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with paging and no more next pages', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.appOnly,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.searchAll(
        query: '1111',
        paging: (event) {
          expect(event.count, count);

          if (event.count < 4) {
            expect(event.hasNextPage, isTrue);
            expect(event.hasNotNextPage, isFalse);
          } else {
            expect(event.hasNextPage, isFalse);
            expect(event.hasNotNextPage, isTrue);
          }

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          count++;

          return ForwardPaginationControl.next();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });
  });

  group('.lookupById', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/lookup_by_id.json',
          {},
        ),
      );

      final response = await tweetsService.lookupById(
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<TweetData>());
      expect(response.data.id, '1067094924124872705');

      final editControls = response.data.editControls!;

      expect(editControls.toJson(), {
        'is_edit_eligible': true,
        'edits_remaining': 4,
        'editable_until': '2022-08-21T09:35:20.311'
      });
    });

    test('with expansions', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/lookup_by_id.json',
          {
            'expansions': 'author_id',
          },
        ),
      );

      final response = await tweetsService.lookupById(
        tweetId: '1111',
        expansions: [TweetExpansion.authorId],
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<TweetData>());
      expect(response.data.id, '1067094924124872705');
    });

    test('with multiple expansions', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/lookup_by_id.json',
          {
            'expansions': 'author_id,attachments.media_keys',
          },
        ),
      );

      final response = await tweetsService.lookupById(
        tweetId: '1111',
        expansions: [
          TweetExpansion.authorId,
          TweetExpansion.attachmentsMediaKeys
        ],
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<TweetData>());
      expect(response.data.id, '1067094924124872705');
    });

    test('with fields', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/lookup_by_id.json',
          {
            'tweet.fields': 'attachments',
          },
        ),
      );

      final response = await tweetsService.lookupById(
        tweetId: '1111',
        tweetFields: [TweetField.attachments],
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<TweetData>());
      expect(response.data.id, '1067094924124872705');
    });

    test('with multiple fields', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/lookup_by_id.json',
          {
            'tweet.fields': 'attachments,author_id',
          },
        ),
      );

      final response = await tweetsService.lookupById(
        tweetId: '1111',
        tweetFields: [
          TweetField.attachments,
          TweetField.authorId,
        ],
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<TweetData>());
      expect(response.data.id, '1067094924124872705');
    });

    test('with media', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/lookup_by_id_with_media.json',
          {},
        ),
      );

      final response = await tweetsService.lookupById(
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<TweetData>());
      expect(response.data.id, '1067094924124872705');
    });

    test('with polls', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/lookup_by_id_with_polls.json',
          {},
        ),
      );

      final response = await tweetsService.lookupById(
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<TweetData>());
      expect(response.data.id, '1067094924124872705');
    });

    test('with places', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/lookup_by_id_with_places.json',
          {},
        ),
      );

      final response = await tweetsService.lookupById(
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<TweetData>());
      expect(response.data.id, '1067094924124872705');
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.lookupById(
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {},
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupById(
          tweetId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/no_data.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupById(tweetId: '1111'),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets/1111',
          'test/src/service/tweets/data/no_json.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupById(tweetId: '1111'),
      );
    });
  });

  group('.lookupByIds', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets',
          'test/src/service/tweets/data/lookup_by_ids.json',
          {'ids': '1261326399320715264,1278347468690915330'},
        ),
      );

      final response = await tweetsService.lookupByIds(
        tweetIds: ['1261326399320715264', '1278347468690915330'],
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.data.length, 2);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.lookupByIds(
          tweetIds: ['1261326399320715264', '1278347468690915330'],
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {'ids': '1261326399320715264,1278347468690915330'},
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupByIds(
          tweetIds: ['1261326399320715264', '1278347468690915330'],
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets',
          'test/src/service/tweets/data/no_data.json',
          {'ids': '1261326399320715264,1278347468690915330'},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupByIds(
          tweetIds: ['1261326399320715264', '1278347468690915330'],
        ),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/tweets',
          'test/src/service/tweets/data/no_json.json',
          {'ids': '1261326399320715264,1278347468690915330'},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupByIds(
          tweetIds: ['1261326399320715264', '1278347468690915330'],
        ),
      );
    });
  });

  group('.countRecent', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/counts/recent',
          'test/src/service/tweets/data/counts_recent.json',
          {
            'query': 'hello',
            'since_id': '1111',
            'until_id': '2222',
          },
        ),
      );

      final response = await tweetsService.countRecent(
        query: 'hello',
        sinceTweetId: '1111',
        untilTweetId: '2222',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetCountData>>());
      expect(response.meta, isA<TweetCountMeta>());
      expect(response.meta!.total, 744364);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
        context: ClientContext(
          bearerToken: '',
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth2(
        () async => await tweetsService.countRecent(
          query: 'hello',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/counts/recent',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'query': 'hello',
            'since_id': '1111',
            'until_id': '2222',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.countRecent(
          query: 'hello',
          sinceTweetId: '1111',
          untilTweetId: '2222',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/counts/recent',
          'test/src/service/tweets/data/no_data.json',
          {
            'query': 'hello',
            'since_id': '1111',
            'until_id': '2222',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.countRecent(
          query: 'hello',
          sinceTweetId: '1111',
          untilTweetId: '2222',
        ),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/counts/recent',
          'test/src/service/tweets/data/no_json.json',
          {
            'query': 'hello',
            'since_id': '1111',
            'until_id': '2222',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.countRecent(
          query: 'hello',
          sinceTweetId: '1111',
          untilTweetId: '2222',
        ),
      );
    });
  });

  group('.countsAll', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/counts/all',
          'test/src/service/tweets/data/counts_all.json',
          {
            'query': 'hello',
            'since_id': '1111',
            'until_id': '2222',
          },
        ),
      );

      final response = await tweetsService.countAll(
        query: 'hello',
        sinceTweetId: '1111',
        untilTweetId: '2222',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetCountData>>());
      expect(response.meta, isA<TweetCountMeta>());
      expect(response.meta!.total, 744364);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
        context: ClientContext(
          bearerToken: '',
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth2(
        () async => await tweetsService.countAll(
          query: 'hello',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/counts/all',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'query': 'hello',
            'since_id': '1111',
            'until_id': '2222',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.countAll(
          query: 'hello',
          sinceTweetId: '1111',
          untilTweetId: '2222',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/counts/all',
          'test/src/service/tweets/data/no_data.json',
          {
            'query': 'hello',
            'since_id': '1111',
            'until_id': '2222',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.countAll(
          query: 'hello',
          sinceTweetId: '1111',
          untilTweetId: '2222',
        ),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/tweets/counts/all',
          'test/src/service/tweets/data/no_json.json',
          {
            'query': 'hello',
            'since_id': '1111',
            'until_id': '2222',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.countAll(
          query: 'hello',
          sinceTweetId: '1111',
          untilTweetId: '2222',
        ),
      );
    });

    test('with paging', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.appOnly,
          [
            'test/src/service/pagination/data/tweets/count_dataset_1.json',
            'test/src/service/pagination/data/tweets/count_dataset_2.json',
            'test/src/service/pagination/data/tweets/count_dataset_3.json',
            'test/src/service/pagination/data/tweets/count_dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.countAll(
        query: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetCountData>>());
          expect(event.response.meta, isA<TweetCountMeta>());
          expect(event.response.data.length, 169);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.total, 744364);

          if (event.count == 3) {
            return ForwardPaginationControl.stop();
          }

          count++;

          return ForwardPaginationControl.next();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetCountData>>());
      expect(response.meta, isA<TweetCountMeta>());
      expect(response.data.length, 169);
      expect(response.meta, isNotNull);
      expect(response.meta!.total, 744364);
    });

    test('with paging and no more next pages', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.appOnly,
          [
            'test/src/service/pagination/data/tweets/count_dataset_1.json',
            'test/src/service/pagination/data/tweets/count_dataset_2.json',
            'test/src/service/pagination/data/tweets/count_dataset_3.json',
            'test/src/service/pagination/data/tweets/count_dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.countAll(
        query: '1111',
        paging: (event) {
          expect(event.count, count);

          if (event.count < 4) {
            expect(event.hasNextPage, isTrue);
            expect(event.hasNotNextPage, isFalse);
          } else {
            expect(event.hasNextPage, isFalse);
            expect(event.hasNotNextPage, isTrue);
          }

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetCountData>>());
          expect(event.response.meta, isA<TweetCountMeta>());
          expect(event.response.data.length, 169);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.total, 744364);

          count++;

          return ForwardPaginationControl.next();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetCountData>>());
      expect(response.meta, isA<TweetCountMeta>());
      expect(response.data.length, 169);
      expect(response.meta, isNotNull);
      expect(response.meta!.total, 744364);
    });
  });

  group('.createBookmark', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2Only,
          '/2/users/0000/bookmarks',
          'test/src/service/tweets/data/create_bookmark.json',
        ),
      );

      final response = await tweetsService.createBookmark(
        userId: '0000',
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse<BookmarkStateData, void>>());
      expect(response.data.isBookmarked, isTrue);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
        context: ClientContext(
          bearerToken: '',
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth2(
        () async => await tweetsService.createBookmark(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2Only,
          '/2/users/0000/bookmarks',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.createBookmark(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2Only,
          '/2/users/0000/bookmarks',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.createBookmark(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });
  });

  group('.destroyBookmark', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2Only,
          '/2/users/0000/bookmarks/1111',
          'test/src/service/tweets/data/destroy_bookmark.json',
        ),
      );

      final response = await tweetsService.destroyBookmark(
        userId: '0000',
        tweetId: '1111',
      );

      expect(response, isA<TwitterResponse<BookmarkStateData, void>>());
      expect(response.data.isBookmarked, isFalse);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
        context: ClientContext(
          bearerToken: '',
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth2(
        () async => await tweetsService.destroyBookmark(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2Only,
          '/2/users/0000/bookmarks/1111',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.destroyBookmark(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildDeleteStub(
          UserContext.oauth2Only,
          '/2/users/0000/bookmarks/1111',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.destroyBookmark(
          userId: '0000',
          tweetId: '1111',
        ),
      );
    });
  });

  group('.lookupBookmarks', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2Only,
          '/2/users/0000/bookmarks',
          'test/src/service/tweets/data/lookup_bookmarks.json',
          {},
        ),
      );

      final response = await tweetsService.lookupBookmarks(userId: '0000');

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
        context: ClientContext(
          bearerToken: '',
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth2(
        () async => await tweetsService.lookupBookmarks(userId: '0000'),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2Only,
          '/2/users/0000/bookmarks',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {},
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupBookmarks(
          userId: '0000',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2Only,
          '/2/users/0000/bookmarks',
          'test/src/service/tweets/data/no_data.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupBookmarks(
          userId: '0000',
        ),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2Only,
          '/2/users/0000/bookmarks',
          'test/src/service/tweets/data/no_json.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupBookmarks(userId: '0000'),
      );
    });
  });

  group('.createHiddenReply', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildPutStub(
          '/2/tweets/0000/hidden',
          'test/src/service/tweets/data/create_hidden_reply.json',
        ),
      );

      final response = await tweetsService.createHiddenReply(tweetId: '0000');

      expect(response, isA<TwitterResponse<ReplyStateData, void>>());
      expect(response.data.isHidden, isTrue);
    });

    test('when forbidden', () async {
      final tweetsService = TweetsService(
        context: context.buildPutStub(
          '/2/tweets/0000/hidden',
          'test/src/service/tweets/data/create_hidden_reply.json',
          statusCode: 403,
        ),
      );

      expectTwitterExceptionDueToInvalidRequest(
        () async => await tweetsService.createHiddenReply(tweetId: '0000'),
      );
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.createHiddenReply(
          tweetId: '0000',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildPutStub(
          '/2/tweets/0000/hidden',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.createHiddenReply(
          tweetId: '0000',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildPutStub(
          '/2/tweets/0000/hidden',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.createHiddenReply(
          tweetId: '0000',
        ),
      );
    });
  });

  group('.destroyHiddenReply', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildPutStub(
          '/2/tweets/0000/hidden',
          'test/src/service/tweets/data/destroy_hidden_reply.json',
        ),
      );

      final response = await tweetsService.destroyHiddenReply(tweetId: '0000');

      expect(response, isA<TwitterResponse<ReplyStateData, void>>());
      expect(response.data.isHidden, isFalse);
    });

    test('when forbidden', () async {
      final tweetsService = TweetsService(
        context: context.buildPutStub(
          '/2/tweets/0000/hidden',
          'test/src/service/tweets/data/destroy_hidden_reply.json',
          statusCode: 403,
        ),
      );

      expectTwitterExceptionDueToInvalidRequest(
        () async => await tweetsService.destroyHiddenReply(tweetId: '0000'),
      );
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.destroyHiddenReply(
          tweetId: '0000',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildPutStub(
          '/2/tweets/0000/hidden',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.destroyHiddenReply(
          tweetId: '0000',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildPutStub(
          '/2/tweets/0000/hidden',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.destroyHiddenReply(
          tweetId: '0000',
        ),
      );
    });
  });

  group('.lookupMentions', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/mentions',
          'test/src/service/tweets/data/lookup_mentions.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      final response = await tweetsService.lookupMentions(
        userId: '0000',
        maxResults: 10,
        paginationToken: 'TOKEN',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta!.resultCount, 5);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.lookupMentions(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/mentions',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupMentions(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/mentions',
          'test/src/service/tweets/data/no_data.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupMentions(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/mentions',
          'test/src/service/tweets/data/no_json.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupMentions(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with paging', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupMentions(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          if (event.count == 3) {
            return PaginationControl.stop();
          }

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with paging and no more next pages', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupMentions(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);

          if (event.count < 4) {
            expect(event.hasNextPage, isTrue);
            expect(event.hasNotNextPage, isFalse);
          } else {
            expect(event.hasNextPage, isFalse);
            expect(event.hasNotNextPage, isTrue);
          }

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });
  });

  group('.lookupTweets', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/tweets',
          'test/src/service/tweets/data/lookup_tweets.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      final response = await tweetsService.lookupTweets(
        userId: '0000',
        maxResults: 10,
        paginationToken: 'TOKEN',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 10);
      expect(response.meta!.resultCount, 10);
    });

    test('with exclude', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/tweets',
          'test/src/service/tweets/data/lookup_tweets.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
            'exclude': 'replies',
          },
        ),
      );

      final response = await tweetsService.lookupTweets(
        userId: '0000',
        maxResults: 10,
        paginationToken: 'TOKEN',
        excludes: [ExcludeTweetType.replies],
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 10);
      expect(response.meta!.resultCount, 10);
    });

    test('with excludes', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/tweets',
          'test/src/service/tweets/data/lookup_tweets.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
            'exclude': 'retweets,replies',
          },
        ),
      );

      final response = await tweetsService.lookupTweets(
        userId: '0000',
        maxResults: 10,
        paginationToken: 'TOKEN',
        excludes: ExcludeTweetType.values,
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 10);
      expect(response.meta!.resultCount, 10);
    });

    test('with date time in ISO format', () async {
      final now = DateTime.now();

      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/tweets',
          'test/src/service/tweets/data/lookup_tweets.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
            'start_time': now.toUtc().toIso8601String(),
          },
        ),
      );

      final response = await tweetsService.lookupTweets(
        userId: '0000',
        maxResults: 10,
        paginationToken: 'TOKEN',
        startTime: now,
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 10);
      expect(response.meta!.resultCount, 10);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.lookupTweets(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/tweets',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupTweets(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/tweets',
          'test/src/service/tweets/data/no_data.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupTweets(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/tweets',
          'test/src/service/tweets/data/no_json.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupTweets(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with paging', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupTweets(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          if (event.count == 3) {
            return PaginationControl.stop();
          }

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with paging and no more next pages', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupTweets(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);

          if (event.count < 4) {
            expect(event.hasNextPage, isTrue);
            expect(event.hasNotNextPage, isFalse);
          } else {
            expect(event.hasNextPage, isFalse);
            expect(event.hasNotNextPage, isTrue);
          }

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });
  });

  group('.lookupHomeTimeline', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/timelines/reverse_chronological',
          'test/src/service/tweets/data/lookup_home_timeline.json',
          {
            'max_results': '5',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      final response = await tweetsService.lookupHomeTimeline(
        userId: '0000',
        maxResults: 5,
        paginationToken: 'TOKEN',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta!.resultCount, 5);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
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
        () async => await tweetsService.lookupHomeTimeline(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/timelines/reverse_chronological',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupHomeTimeline(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/timelines/reverse_chronological',
          'test/src/service/tweets/data/no_data.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupHomeTimeline(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/timelines/reverse_chronological',
          'test/src/service/tweets/data/no_json.json',
          {
            'max_results': '5',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupHomeTimeline(
          userId: '0000',
          maxResults: 5,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with paging', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupHomeTimeline(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          if (event.count == 3) {
            return PaginationControl.stop();
          }

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });

    test('with paging and no more next pages', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/tweets/dataset_1.json',
            'test/src/service/pagination/data/tweets/dataset_2.json',
            'test/src/service/pagination/data/tweets/dataset_3.json',
            'test/src/service/pagination/data/tweets/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await tweetsService.lookupHomeTimeline(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);

          if (event.count < 4) {
            expect(event.hasNextPage, isTrue);
            expect(event.hasNotNextPage, isFalse);
          } else {
            expect(event.hasNextPage, isFalse);
            expect(event.hasNotNextPage, isTrue);
          }

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<TweetData>>());
          expect(event.response.meta, isA<TweetMeta>());
          expect(event.response.data.length, 5);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 5);

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 5);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 5);
    });
  });

  group('.connectSampleStream', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildSendStub(
          UserContext.oauth2Only,
          'test/src/service/tweets/data/connect_sample_stream.json',
          const {'backfill_minutes': '5'},
        ),
      );

      final response = await tweetsService.connectSampleStream(
        backfillMinutes: 5,
      );

      final data = await response.stream.toList();

      expect(response,
          isA<TwitterStreamResponse<TwitterResponse<TweetData, void>>>());
      expect(data, isA<List<TwitterResponse<TweetData, void>>>());
      expect(data.length, 70);
    });

    test('with error', () async {
      final tweetsService = TweetsService(
        context: context.buildSendStub(
          UserContext.oauth2Only,
          'test/src/service/tweets/data/connect_sample_stream_with_error.json',
          const {'backfill_minutes': '5'},
        ),
      );

      final response = await tweetsService.connectSampleStream(
        backfillMinutes: 5,
      );

      final data = <TwitterResponse<TweetData, void>>[];
      final errors = <dynamic>[];

      final stream = response.stream;

      await for (final event in stream.handleError(errors.add)) {
        data.add(event);
      }

      expect(data.length, 5);
      expect(errors.length, 1);
      expect(errors.single, isA<DataNotFoundException>());
    });
  });

  group('.connectSample10Stream', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildSendStub(
          UserContext.oauth2Only,
          'test/src/service/tweets/data/connect_sample10_stream.json',
          const {
            'partition': '1',
            'backfill_minutes': '5',
          },
        ),
      );

      final response = await tweetsService.connectSample10Stream(
        partition: DecahosePartition.section1,
        backfillMinutes: 5,
      );

      final data = await response.stream.toList();

      expect(response,
          isA<TwitterStreamResponse<TwitterResponse<TweetData, void>>>());
      expect(data, isA<List<TwitterResponse<TweetData, void>>>());
      expect(data.length, 70);
    });

    test('with error', () async {
      final tweetsService = TweetsService(
        context: context.buildSendStub(
          UserContext.oauth2Only,
          'test/src/service/tweets/data/connect_sample10_stream_with_error.json',
          const {
            'partition': '2',
            'backfill_minutes': '5',
          },
        ),
      );

      final response = await tweetsService.connectSample10Stream(
        partition: DecahosePartition.section2,
        backfillMinutes: 5,
      );

      final data = <TwitterResponse<TweetData, void>>[];
      final errors = <dynamic>[];

      final stream = response.stream;

      await for (final event in stream.handleError(errors.add)) {
        data.add(event);
      }

      expect(data.length, 5);
      expect(errors.length, 1);
      expect(errors.single, isA<DataNotFoundException>());
    });
  });

  test('.connectFilteredStream', () async {
    final tweetsService = TweetsService(
      context: context.buildSendStub(
        UserContext.oauth2Only,
        'test/src/service/tweets/data/connect_filtered_stream.json',
        const {'backfill_minutes': '5'},
      ),
    );

    final response = await tweetsService.connectFilteredStream(
      backfillMinutes: 5,
    );

    final data = await response.stream.toList();

    expect(response, isA<TwitterStreamResponse<FilteredStreamResponse>>());
    expect(data.first, isA<FilteredStreamResponse>());
    expect(data.first.data, isA<TweetData>());
    expect(data.first.matchingRules, isA<List<MatchingRule>>());
    expect(data.first.matchingRules.isNotEmpty, isTrue);
  });

  group('.createFilteringRules', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2Only,
          '/2/tweets/search/stream/rules',
          'test/src/service/tweets/data/create_filtering_rules.json',
        ),
      );

      final response = await tweetsService.createFilteringRules(rules: [
        FilteringRuleParam(value: 'test'),
        FilteringRuleParam(value: 'hello'),
      ]);

      expect(
        response,
        isA<TwitterResponse<List<FilteringRuleData>, FilteringRuleMeta>>(),
      );
      expect(response.data, isA<List<FilteringRuleData>>());
      expect(response.meta, isA<FilteringRuleMeta>());
      expect(response.meta!.summary!.createdCount, 4);
      expect(response.meta!.summary!.notCreatedCount, 0);
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
        context: ClientContext(
          bearerToken: '',
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth2(
        () async => await tweetsService.createFilteringRules(rules: []),
      );
    });
  });

  group('.destroyFilteringRules', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2Only,
          '/2/tweets/search/stream/rules',
          'test/src/service/tweets/data/destroy_filtering_rules.json',
        ),
      );

      final response = await tweetsService.destroyFilteringRules(
        ruleIds: ['XXXX', 'YYYY'],
      );

      expect(response, isA<TwitterResponse<EmptyData, void>>());
      expect(response.data, isA<EmptyData>());
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
        context: ClientContext(
          bearerToken: '',
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth2(
        () async => await tweetsService.destroyFilteringRules(ruleIds: []),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2Only,
          '/2/tweets/search/stream/rules',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.destroyFilteringRules(
          ruleIds: ['XXXX', 'YYYY'],
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildPostStub(
          UserContext.oauth2Only,
          '/2/tweets/search/stream/rules',
          'test/src/service/tweets/data/no_data.json',
        ),
      );

      final response = await tweetsService.destroyFilteringRules(
        ruleIds: ['XXXX', 'YYYY'],
      );

      expect(response, isA<TwitterResponse<EmptyData, void>>());
      expect(response.data, isA<EmptyData>());
    });
  });

  group('.lookupFilteringRules', () {
    test('normal case', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2Only,
          '/2/tweets/search/stream/rules',
          'test/src/service/tweets/data/lookup_filtering_rules.json',
          {
            'ids': 'XXXX,YYYY',
          },
        ),
      );

      final response = await tweetsService.lookupFilteringRules(
        ruleIds: ['XXXX', 'YYYY'],
      );

      expect(
        response,
        isA<TwitterResponse<List<FilteringRuleData>, FilteringRuleMeta>>(),
      );
      expect(response.data, isA<List<FilteringRuleData>>());
      expect(response.meta, isA<FilteringRuleMeta>());
    });

    test('with invalid access token', () async {
      final tweetsService = TweetsService(
        context: ClientContext(
          bearerToken: '',
          timeout: Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth2(
        () async => await tweetsService.lookupFilteringRules(ruleIds: []),
      );
    });

    test('with rate limit exceeded error', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2Only,
          '/2/tweets/search/stream/rules',
          'test/src/service/tweets/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'ids': 'XXXX,YYYY',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await tweetsService.lookupFilteringRules(
          ruleIds: ['XXXX', 'YYYY'],
        ),
      );
    });

    test('with errors', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2Only,
          '/2/tweets/search/stream/rules',
          'test/src/service/tweets/data/no_data.json',
          {
            'ids': 'XXXX,YYYY',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await tweetsService.lookupFilteringRules(
          ruleIds: ['XXXX', 'YYYY'],
        ),
      );
    });

    test('with no json', () async {
      final tweetsService = TweetsService(
        context: context.buildGetStub(
          UserContext.oauth2Only,
          '/2/tweets/search/stream/rules',
          'test/src/service/tweets/data/no_json.json',
          {
            'ids': 'XXXX,YYYY',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await tweetsService.lookupFilteringRules(
          ruleIds: ['XXXX', 'YYYY'],
        ),
      );
    });
  });
}
