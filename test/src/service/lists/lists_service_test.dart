// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/client/client_context.dart';
import 'package:twitter_api_v2/src/core/client/oauth_tokens.dart';
import 'package:twitter_api_v2/src/core/client/user_context.dart';
import 'package:twitter_api_v2/src/service/common/delete_state_data.dart';
import 'package:twitter_api_v2/src/service/common/follow_state_data.dart';
import 'package:twitter_api_v2/src/service/common/member_state_data.dart';
import 'package:twitter_api_v2/src/service/common/pinned_state_data.dart';
import 'package:twitter_api_v2/src/service/common/update_state_data.dart';
import 'package:twitter_api_v2/src/service/lists/list_data.dart';
import 'package:twitter_api_v2/src/service/lists/list_meta.dart';
import 'package:twitter_api_v2/src/service/lists/lists_service.dart';
import 'package:twitter_api_v2/src/service/pagination/pagination_control.dart';
import 'package:twitter_api_v2/src/service/response/pagination_response.dart';
import 'package:twitter_api_v2/src/service/response/twitter_response.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_data.dart';
import 'package:twitter_api_v2/src/service/tweets/tweet_meta.dart';
import 'package:twitter_api_v2/src/service/users/user_data.dart';
import 'package:twitter_api_v2/src/service/users/user_meta.dart';
import '../../../mocks/client_context_stubs.dart' as context;
import '../common_expectations.dart';

void main() {
  group('.lookupById', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/5555',
          'test/src/service/lists/data/lookup_by_id.json',
          {},
        ),
      );

      final response = await listsService.lookupById(listId: '5555');

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<ListData>());
      expect(response.data.id, '84839422');
      expect(response.data.name, 'Official Twitter Accounts');
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.lookupById(listId: '5555'),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/5555',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {},
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.lookupById(listId: '5555'),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/5555',
          'test/src/service/lists/data/no_data.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.lookupById(listId: '5555'),
      );
    });

    test('with no json', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/5555',
          'test/src/service/lists/data/no_json.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await listsService.lookupById(listId: '5555'),
      );
    });
  });

  group('.lookupOwnedBy', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/owned_lists',
          'test/src/service/lists/data/lookup_owned_by.json',
          {
            'max_results': '50',
            'pagination_token': 'PAGINATION_TOKEN',
          },
        ),
      );

      final response = await listsService.lookupOwnedBy(
        userId: '5555',
        maxResults: 50,
        paginationToken: 'PAGINATION_TOKEN',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<ListData>>());
      expect(response.meta, isA<ListMeta>());
      expect(response.data.length, 1);
      expect(response.meta!.resultCount, 1);
      expect(response.meta!.nextToken, 'NEXT_TOKEN');
      expect(response.meta!.previousToken, 'PREVIOUS_TOKEN');
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.lookupOwnedBy(
          userId: '5555',
          maxResults: 50,
          paginationToken: 'PAGINATION_TOKEN',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/owned_lists',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'max_results': '50',
            'pagination_token': 'PAGINATION_TOKEN',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.lookupOwnedBy(
          userId: '5555',
          maxResults: 50,
          paginationToken: 'PAGINATION_TOKEN',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/owned_lists',
          'test/src/service/lists/data/no_data.json',
          {
            'max_results': '50',
            'pagination_token': 'PAGINATION_TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.lookupOwnedBy(
          userId: '5555',
          maxResults: 50,
          paginationToken: 'PAGINATION_TOKEN',
        ),
      );
    });

    test('with no json', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/owned_lists',
          'test/src/service/lists/data/no_json.json',
          {
            'max_results': '50',
            'pagination_token': 'PAGINATION_TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await listsService.lookupOwnedBy(
          userId: '5555',
          maxResults: 50,
          paginationToken: 'PAGINATION_TOKEN',
        ),
      );
    });

    test('with paging', () async {
      final listsService = ListsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/lists/dataset_1.json',
            'test/src/service/pagination/data/lists/dataset_2.json',
            'test/src/service/pagination/data/lists/dataset_3.json',
            'test/src/service/pagination/data/lists/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await listsService.lookupOwnedBy(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<ListData>>());
          expect(event.response.meta, isA<ListMeta>());
          expect(event.response.data.length, 1);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 1);

          if (event.count == 3) {
            return PaginationControl.stop();
          }

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<ListData>>());
      expect(response.meta, isA<ListMeta>());
      expect(response.data.length, 1);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 1);
    });

    test('with paging and no more next pages', () async {
      final listsService = ListsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/lists/dataset_1.json',
            'test/src/service/pagination/data/lists/dataset_2.json',
            'test/src/service/pagination/data/lists/dataset_3.json',
            'test/src/service/pagination/data/lists/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await listsService.lookupOwnedBy(
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
          expect(event.response.data, isA<List<ListData>>());
          expect(event.response.meta, isA<ListMeta>());
          expect(event.response.data.length, 1);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 1);

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<ListData>>());
      expect(response.meta, isA<ListMeta>());
      expect(response.data.length, 1);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 1);
    });
  });

  group('.createPinnedList', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/pinned_lists',
          'test/src/service/lists/data/create_pinned_list.json',
        ),
      );

      final response = await listsService.createPinnedList(
        userId: '5555',
        listId: '1111',
      );

      expect(response, isA<TwitterResponse<PinnedStateData, void>>());
      expect(response.data.isPinned, isTrue);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.createPinnedList(
          userId: '5555',
          listId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/pinned_lists',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.createPinnedList(
          userId: '5555',
          listId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/pinned_lists',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.createPinnedList(
          userId: '5555',
          listId: '1111',
        ),
      );
    });
  });

  group('.destroyPinnedList', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/pinned_lists/1111',
          'test/src/service/lists/data/destroy_pinned_list.json',
        ),
      );

      final response = await listsService.destroyPinnedList(
        userId: '5555',
        listId: '1111',
      );

      expect(response, isA<TwitterResponse<PinnedStateData, void>>());
      expect(response.data.isPinned, isFalse);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.destroyPinnedList(
          userId: '5555',
          listId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/pinned_lists/1111',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.destroyPinnedList(
          userId: '5555',
          listId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/pinned_lists/1111',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.destroyPinnedList(
          userId: '5555',
          listId: '1111',
        ),
      );
    });
  });

  group('.lookupPinnedLists', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/pinned_lists',
          'test/src/service/lists/data/lookup_pinned_lists.json',
          {},
        ),
      );

      final response = await listsService.lookupPinnedLists(userId: '5555');

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<ListData>>());
      expect(response.meta, isA<ListMeta>());
      expect(response.data.length, 1);
      expect(response.meta!.resultCount, 1);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.lookupPinnedLists(userId: '5555'),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/pinned_lists',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {},
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.lookupPinnedLists(userId: '5555'),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/pinned_lists',
          'test/src/service/lists/data/no_data.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.lookupPinnedLists(userId: '5555'),
      );
    });

    test('with no json', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/5555/pinned_lists',
          'test/src/service/lists/data/no_json.json',
          {},
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await listsService.lookupPinnedLists(userId: '5555'),
      );
    });
  });

  group('.lookupTweets', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/1111/tweets',
          'test/src/service/lists/data/lookup_tweets.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      final response = await listsService.lookupTweets(
        listId: '1111',
        maxResults: 10,
        paginationToken: 'TOKEN',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<TweetData>>());
      expect(response.meta, isA<TweetMeta>());
      expect(response.data.length, 1);
      expect(response.meta!.resultCount, 1);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.lookupTweets(
          listId: '1111',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/1111/tweets',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.lookupTweets(
          listId: '1111',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/1111/tweets',
          'test/src/service/lists/data/no_data.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.lookupTweets(
          listId: '1111',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with no json', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/1111/tweets',
          'test/src/service/lists/data/no_json.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await listsService.lookupTweets(
          listId: '1111',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with paging', () async {
      final listsService = ListsService(
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
      final response = await listsService.lookupTweets(
        listId: '1111',
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
      final listsService = ListsService(
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
      final response = await listsService.lookupTweets(
        listId: '1111',
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

  group('.createPublicList', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists',
          'test/src/service/lists/data/create_list.json',
        ),
      );

      final response = await listsService.createPublicList(
        name: 'test',
        description: 'test description',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<ListData>());
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.createPublicList(
          name: 'test',
          description: 'test description',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.createPublicList(
          name: 'test',
          description: 'test description',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.createPublicList(
          name: 'test',
          description: 'test description',
        ),
      );
    });

    test('with no json', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists',
          'test/src/service/lists/data/no_json.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await listsService.createPublicList(
          name: 'test',
          description: 'test description',
        ),
      );
    });
  });

  group('.createPrivateList', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists',
          'test/src/service/lists/data/create_list.json',
        ),
      );

      final response = await listsService.createPrivateList(
        name: 'test',
        description: 'test description',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<ListData>());
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.createPrivateList(
          name: 'test',
          description: 'test description',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.createPrivateList(
          name: 'test',
          description: 'test description',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.createPrivateList(
          name: 'test',
          description: 'test description',
        ),
      );
    });

    test('with no json', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists',
          'test/src/service/lists/data/no_json.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await listsService.createPrivateList(
          name: 'test',
          description: 'test description',
        ),
      );
    });
  });

  group('.destroyList', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/1111',
          'test/src/service/lists/data/destroy_list.json',
        ),
      );

      final response = await listsService.destroyList(listId: '1111');

      expect(response, isA<TwitterResponse<DeleteStateData, void>>());
      expect(response.data.isDeleted, isTrue);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.destroyList(listId: '1111'),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/1111',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.destroyList(listId: '1111'),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/1111',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.destroyList(listId: '1111'),
      );
    });
  });

  group('.updateListAdPublic', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildPutStub(
          '/2/lists/1111',
          'test/src/service/lists/data/update_list.json',
        ),
      );

      final response = await listsService.updateListAsPublic(
        listId: '1111',
        name: 'test',
        description: 'test description',
      );

      expect(response, isA<TwitterResponse<UpdateStateData, void>>());
      expect(response.data.isUpdated, isTrue);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.updateListAsPublic(
          listId: '1111',
          name: 'test',
          description: 'test description',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildPutStub(
          '/2/lists/1111',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.updateListAsPublic(
          listId: '1111',
          name: 'test',
          description: 'test description',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildPutStub(
          '/2/lists/1111',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.updateListAsPublic(
          listId: '1111',
          name: 'test',
          description: 'test description',
        ),
      );
    });
  });

  group('.updateListAsPrivate', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildPutStub(
          '/2/lists/1111',
          'test/src/service/lists/data/update_list.json',
        ),
      );

      final response = await listsService.updateListAsPrivate(
        listId: '1111',
        name: 'test',
        description: 'test description',
      );

      expect(response, isA<TwitterResponse<UpdateStateData, void>>());
      expect(response.data.isUpdated, isTrue);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.updateListAsPrivate(
          listId: '1111',
          name: 'test',
          description: 'test description',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildPutStub(
          '/2/lists/1111',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.updateListAsPrivate(
          listId: '1111',
          name: 'test',
          description: 'test description',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildPutStub(
          '/2/lists/1111',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.updateListAsPrivate(
          listId: '1111',
          name: 'test',
          description: 'test description',
        ),
      );
    });
  });

  group('.createFollow', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/1111/followed_lists',
          'test/src/service/lists/data/create_follow.json',
        ),
      );

      final response = await listsService.createFollow(
        userId: '1111',
        listId: '2222',
      );

      expect(response, isA<TwitterResponse<FollowStateData, void>>());
      expect(response.data.isFollowing, isTrue);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.createFollow(
          userId: '1111',
          listId: '2222',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/1111/followed_lists',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.createFollow(
          userId: '1111',
          listId: '2222',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/1111/followed_lists',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.createFollow(
          userId: '1111',
          listId: '2222',
        ),
      );
    });
  });

  group('.destroyFollow', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/1111/followed_lists/2222',
          'test/src/service/lists/data/destroy_follow.json',
        ),
      );

      final response = await listsService.destroyFollow(
        userId: '1111',
        listId: '2222',
      );

      expect(response, isA<TwitterResponse<FollowStateData, void>>());
      expect(response.data.isFollowing, isFalse);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.destroyFollow(
          userId: '1111',
          listId: '2222',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/1111/followed_lists/2222',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.destroyFollow(
          userId: '1111',
          listId: '2222',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/1111/followed_lists/2222',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.destroyFollow(
          userId: '1111',
          listId: '2222',
        ),
      );
    });
  });

  group('.lookupFollowers', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/followers',
          'test/src/service/lists/data/lookup_followers.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      final response = await listsService.lookupFollowers(
        listId: '0000',
        maxResults: 10,
        paginationToken: 'TOKEN',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<UserData>>());
      expect(response.meta, isA<UserMeta>());
      expect(response.data.length, 5);
      expect(response.meta!.resultCount, 5);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.lookupFollowers(
          listId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/followers',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.lookupFollowers(
          listId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/followers',
          'test/src/service/lists/data/no_data.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.lookupFollowers(
          listId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with no json', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/followers',
          'test/src/service/lists/data/no_json.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await listsService.lookupFollowers(
          listId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with paging', () async {
      final listsService = ListsService(
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
      final response = await listsService.lookupFollowers(
        listId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

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
      final listsService = ListsService(
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
      final response = await listsService.lookupFollowers(
        listId: '1111',
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

  group('.lookupFollowedLists', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/1111/followed_lists',
          'test/src/service/lists/data/lookup_followed_lists.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      final response = await listsService.lookupFollowedLists(
        userId: '1111',
        maxResults: 10,
        paginationToken: 'TOKEN',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<ListData>>());
      expect(response.meta, isA<ListMeta>());
      expect(response.data.length, 1);
      expect(response.meta!.resultCount, 1);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.lookupFollowedLists(
          userId: '1111',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/1111/followed_lists',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.lookupFollowedLists(
          userId: '1111',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/1111/followed_lists',
          'test/src/service/lists/data/no_data.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.lookupFollowedLists(
          userId: '1111',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with no json', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/1111/followed_lists',
          'test/src/service/lists/data/no_json.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await listsService.lookupFollowedLists(
          userId: '1111',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with paging', () async {
      final listsService = ListsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/lists/dataset_1.json',
            'test/src/service/pagination/data/lists/dataset_2.json',
            'test/src/service/pagination/data/lists/dataset_3.json',
            'test/src/service/pagination/data/lists/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await listsService.lookupFollowedLists(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<ListData>>());
          expect(event.response.meta, isA<ListMeta>());
          expect(event.response.data.length, 1);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 1);

          if (event.count == 3) {
            return PaginationControl.stop();
          }

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<ListData>>());
      expect(response.meta, isA<ListMeta>());
      expect(response.data.length, 1);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 1);
    });

    test('with paging and no more next pages', () async {
      final listsService = ListsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/lists/dataset_1.json',
            'test/src/service/pagination/data/lists/dataset_2.json',
            'test/src/service/pagination/data/lists/dataset_3.json',
            'test/src/service/pagination/data/lists/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await listsService.lookupFollowedLists(
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
          expect(event.response.data, isA<List<ListData>>());
          expect(event.response.meta, isA<ListMeta>());
          expect(event.response.data.length, 1);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 1);

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<ListData>>());
      expect(response.meta, isA<ListMeta>());
      expect(response.data.length, 1);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 1);
    });
  });

  group('.createMember', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/members',
          'test/src/service/lists/data/create_member.json',
        ),
      );

      final response = await listsService.createMember(
        listId: '0000',
        userId: '1111',
      );

      expect(response, isA<TwitterResponse<MemberStateData, void>>());
      expect(response.data.isMember, isTrue);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.createMember(
          listId: '0000',
          userId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/members',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.createMember(
          listId: '0000',
          userId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildPostStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/members',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.createMember(
          listId: '0000',
          userId: '1111',
        ),
      );
    });
  });

  group('.destroyMember', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/members/1111',
          'test/src/service/lists/data/destroy_member.json',
        ),
      );

      final response = await listsService.destroyMember(
        listId: '0000',
        userId: '1111',
      );

      expect(response, isA<TwitterResponse<MemberStateData, void>>());
      expect(response.data.isMember, isFalse);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.destroyMember(
          listId: '0000',
          userId: '1111',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/members/1111',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.destroyMember(
          listId: '0000',
          userId: '1111',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildDeleteStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/members/1111',
          'test/src/service/lists/data/no_data.json',
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.destroyMember(
          listId: '0000',
          userId: '1111',
        ),
      );
    });
  });

  group('.lookupMembers', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/members',
          'test/src/service/lists/data/lookup_members.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      final response = await listsService.lookupMembers(
        listId: '0000',
        maxResults: 10,
        paginationToken: 'TOKEN',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<UserData>>());
      expect(response.meta, isA<UserMeta>());
      expect(response.data.length, 5);
      expect(response.meta!.resultCount, 5);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.lookupMembers(
          listId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/members',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.lookupMembers(
          listId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/members',
          'test/src/service/lists/data/no_data.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.lookupMembers(
          listId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with no json', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/lists/0000/members',
          'test/src/service/lists/data/no_json.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await listsService.lookupMembers(
          listId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with paging', () async {
      final listsService = ListsService(
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
      final response = await listsService.lookupMembers(
        listId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

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
      final listsService = ListsService(
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
      final response = await listsService.lookupMembers(
        listId: '1111',
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

  group('.lookupMemberShips', () {
    test('normal case', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/list_memberships',
          'test/src/service/lists/data/lookup_memberships.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      final response = await listsService.lookupMemberships(
        userId: '0000',
        maxResults: 10,
        paginationToken: 'TOKEN',
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<ListData>>());
      expect(response.meta, isA<ListMeta>());
      expect(response.data.length, 3);
      expect(response.meta!.resultCount, 3);
    });

    test('with invalid access token', () async {
      final listsService = ListsService(
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
        () async => await listsService.lookupMemberships(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with rate limit exceeded error', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/list_memberships',
          'test/src/service/lists/data/rate_limit_exceeded_error.json',
          statusCode: 429,
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectRateLimitExceededException(
        () async => await listsService.lookupMemberships(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with errors', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/list_memberships',
          'test/src/service/lists/data/no_data.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoData(
        () async => await listsService.lookupMemberships(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with no json', () async {
      final listsService = ListsService(
        context: context.buildGetStub(
          UserContext.oauth2OrOAuth1,
          '/2/users/0000/list_memberships',
          'test/src/service/lists/data/no_json.json',
          {
            'max_results': '10',
            'pagination_token': 'TOKEN',
          },
        ),
      );

      expectDataNotFoundExceptionDueToNoJson(
        () async => await listsService.lookupMemberships(
          userId: '0000',
          maxResults: 10,
          paginationToken: 'TOKEN',
        ),
      );
    });

    test('with paging', () async {
      final listsService = ListsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/lists/dataset_1.json',
            'test/src/service/pagination/data/lists/dataset_2.json',
            'test/src/service/pagination/data/lists/dataset_3.json',
            'test/src/service/pagination/data/lists/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await listsService.lookupMemberships(
        userId: '1111',
        paging: (event) {
          expect(event.count, count);
          expect(event.hasNextPage, isTrue);
          expect(event.hasNotNextPage, isFalse);

          expect(event.response, isA<PaginationResponse>());
          expect(event.response.data, isA<List<ListData>>());
          expect(event.response.meta, isA<ListMeta>());
          expect(event.response.data.length, 1);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 1);

          if (event.count == 3) {
            return PaginationControl.stop();
          }

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<ListData>>());
      expect(response.meta, isA<ListMeta>());
      expect(response.data.length, 1);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 1);
    });

    test('with paging and no more next pages', () async {
      final listsService = ListsService(
        context: context.buildGetStubWithAnyUriAndMultiResources(
          UserContext.oauth2OrOAuth1,
          [
            'test/src/service/pagination/data/lists/dataset_1.json',
            'test/src/service/pagination/data/lists/dataset_2.json',
            'test/src/service/pagination/data/lists/dataset_3.json',
            'test/src/service/pagination/data/lists/dataset_4.json',
          ],
        ),
      );

      int count = 1;
      final response = await listsService.lookupMemberships(
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
          expect(event.response.data, isA<List<ListData>>());
          expect(event.response.meta, isA<ListMeta>());
          expect(event.response.data.length, 1);
          expect(event.response.meta, isNotNull);
          expect(event.response.meta!.resultCount, 1);

          count++;

          return PaginationControl.forward();
        },
      );

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<List<ListData>>());
      expect(response.meta, isA<ListMeta>());
      expect(response.data.length, 1);
      expect(response.meta, isNotNull);
      expect(response.meta!.resultCount, 1);
    });
  });
}
