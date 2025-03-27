<p align="center">
  <a href="https://github.com/twitter-dart/twitter-api-v2">
    <img alt="twitter_api_v2" width="600px" src="https://user-images.githubusercontent.com/13072231/199728866-202b9742-d58e-4667-b046-e8096efd2339.png">
  </a>
</p>

<p align="center">
  <b>The Most Famous and Powerful Dart/Flutter Library for Twitter API v2.0 🐦</b>
</p>

---

[![Awesome](https://awesome.re/badge.svg)](https://github.com/andypiper/awesome-modern-twitter-api)
[![GitHub Sponsor](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=ff69b4)](https://github.com/sponsors/myConsciousness)
[![GitHub Sponsor](https://img.shields.io/static/v1?label=Maintainer&message=myConsciousness&logo=GitHub&color=00acee)](https://github.com/myConsciousness)

[![v2](https://img.shields.io/endpoint?url=https%3A%2F%2Ftwbadges.glitch.me%2Fbadges%2Fv2)](https://developer.twitter.com/en/docs/twitter-api)
[![pub package](https://img.shields.io/pub/v/twitter_api_v2.svg?logo=dart&logoColor=00b9fc)](https://pub.dartlang.org/packages/twitter_api_v2)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/twitter_api_v2)](https://pub.dev/packages/twitter_api_v2/)
[![Test](https://github.com/twitter-dart/twitter-api-v2/actions/workflows/test.yml/badge.svg)](https://github.com/twitter-dart/twitter-api-v2/actions/workflows/test.yml)
[![Analyzer](https://github.com/twitter-dart/twitter-api-v2/actions/workflows/analyzer.yml/badge.svg)](https://github.com/twitter-dart/twitter-api-v2/actions/workflows/analyzer.yml)
[![codecov](https://codecov.io/gh/twitter-dart/twitter-api-v2/branch/main/graph/badge.svg?token=J5GT1PF9Y3)](https://codecov.io/gh/twitter-dart/twitter-api-v2)
[![Issues](https://img.shields.io/github/issues/twitter-dart/twitter-api-v2?logo=github&logoColor=white)](https://github.com/twitter-dart/twitter-api-v2/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/twitter-dart/twitter-api-v2?logo=github&logoColor=white)](https://github.com/twitter-dart/twitter-api-v2/pulls)
[![Stars](https://img.shields.io/github/stars/twitter-dart/twitter-api-v2?logo=github&logoColor=white)](https://github.com/twitter-dart/twitter-api-v2)
[![Contributors](https://img.shields.io/github/contributors/twitter-dart/twitter-api-v2)](https://github.com/twitter-dart/twitter-api-v2/graphs/contributors)
[![Code size](https://img.shields.io/github/languages/code-size/twitter-dart/twitter-api-v2?logo=github&logoColor=white)](https://github.com/twitter-dart/twitter-api-v2)
[![Last Commits](https://img.shields.io/github/last-commit/twitter-dart/twitter-api-v2?logo=git&logoColor=white)](https://github.com/twitter-dart/twitter-api-v2/commits/main)
[![License](https://img.shields.io/github/license/twitter-dart/twitter-api-v2?logo=open-source-initiative&logoColor=green)](https://github.com/twitter-dart/twitter-api-v2/blob/main/LICENSE)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](https://github.com/twitter-dart/twitter-api-v2/blob/main/CODE_OF_CONDUCT.md)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Ftwitter-dart%2Ftwitter-api-v2.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Ftwitter-dart%2Ftwitter-api-v2?ref=badge_shield)

---

| English | [日本語](https://github.com/twitter-dart/twitter-api-v2/blob/main/i18n/README-JA.md) | [Français](https://github.com/twitter-dart/twitter-api-v2/blob/main/i18n/README-FR.md) | [Tiếng Việt](https://github.com/twitter-dart/twitter-api-v2/blob/main/i18n/README-VI.md) | [বাংলা](https://github.com/twitter-dart/twitter-api-v2/blob/main/i18n/README-BN.md) | [Español](https://github.com/twitter-dart/twitter-api-v2/blob/main/i18n/README-ES.md) | [Deutsch](https://github.com/twitter-dart/twitter-api-v2/blob/main/i18n/README-DE.md) | [Português](https://github.com/twitter-dart/twitter-api-v2/blob/main/i18n/README-PT.md) |

---

<!-- TOC -->

- [1. Guide 🌎](#1-guide-)
  - [1.1. Features 💎](#11-features-)
  - [1.2. Getting Started ⚡](#12-getting-started-)
    - [1.2.1. Install Library](#121-install-library)
    - [1.2.2. Import](#122-import)
    - [1.2.3. Implementation](#123-implementation)
  - [1.3. Supported Endpoints 👀](#13-supported-endpoints-)
    - [1.3.1. Tweets Service](#131-tweets-service)
      - [1.3.1.1. Tweet](#1311-tweet)
      - [1.3.1.2. Likes](#1312-likes)
      - [1.3.1.3. Retweets](#1313-retweets)
      - [1.3.1.4. Quote Tweets](#1314-quote-tweets)
      - [1.3.1.5. Search Tweets](#1315-search-tweets)
      - [1.3.1.6. Lookup Tweets](#1316-lookup-tweets)
      - [1.3.1.7. Tweet Counts](#1317-tweet-counts)
      - [1.3.1.8. Bookmarks](#1318-bookmarks)
      - [1.3.1.9. Timelines](#1319-timelines)
      - [1.3.1.10. Hide Replies](#13110-hide-replies)
      - [1.3.1.11. Volume Stream](#13111-volume-stream)
      - [1.3.1.12. Filtered Stream](#13112-filtered-stream)
    - [1.3.2. Users Service](#132-users-service)
      - [1.3.2.1. Follows](#1321-follows)
      - [1.3.2.2. Lookup Users](#1322-lookup-users)
      - [1.3.2.3. Users Mutes](#1323-users-mutes)
      - [1.3.2.4. Blocks](#1324-blocks)
      - [1.3.2.5. User Profile](#1325-user-profile)
      - [1.3.2.6. Report Spam](#1326-report-spam)
    - [1.3.3. Spaces Service](#133-spaces-service)
      - [1.3.3.1. Search Spaces](#1331-search-spaces)
      - [1.3.3.2. Lookup Spaces](#1332-lookup-spaces)
    - [1.3.4. Lists Service](#134-lists-service)
      - [1.3.4.1. Lookup Lists](#1341-lookup-lists)
      - [1.3.4.2. Pinnings](#1342-pinnings)
      - [1.3.4.3. Tweet Lookup](#1343-tweet-lookup)
      - [1.3.4.4. List Manage](#1344-list-manage)
      - [1.3.4.5. Follows](#1345-follows)
      - [1.3.4.6. Members](#1346-members)
    - [1.3.5. Media Service](#135-media-service)
      - [1.3.5.1. Upload Media](#1351-upload-media)
    - [1.3.6. Direct Messages Service](#136-direct-messages-service)
      - [1.3.6.1. Lookup Event](#1361-lookup-event)
      - [1.3.6.2. Manage Event](#1362-manage-event)
    - [1.3.7. Geo Service](#137-geo-service)
      - [1.3.7.1. Lookup Place](#1371-lookup-place)
      - [1.3.7.2. Search Locations](#1372-search-locations)
    - [1.3.8. Trends Service](#138-trends-service)
      - [1.3.8.1. Trending Location](#1381-trending-location)
      - [1.3.8.2. Trend](#1382-trend)
    - [1.3.9. Compliance Service](#139-compliance-service)
      - [1.3.9.1. Batch Compliance](#1391-batch-compliance)
  - [1.4. Tips 🏄](#14-tips-)
    - [1.4.1. Method Names](#141-method-names)
    - [1.4.2. Automatic REST Client Resolution](#142-automatic-rest-client-resolution)
    - [1.4.3. Generate App-Only Bearer Token](#143-generate-app-only-bearer-token)
    - [1.4.4. Refresh Access Token](#144-refresh-access-token)
    - [1.4.5. Null Parameter at Request](#145-null-parameter-at-request)
    - [1.4.6. Expand Object Fields with `expansions`](#146-expand-object-fields-with-expansions)
    - [1.4.7. Expand Object Fields with `fields`](#147-expand-object-fields-with-fields)
    - [1.4.8. JSON Serialization and Deserialization](#148-json-serialization-and-deserialization)
    - [1.4.9. OAuth 2.0 Authorization Code Flow with PKCE](#149-oauth-20-authorization-code-flow-with-pkce)
    - [1.4.10. Change the Timeout Duration](#1410-change-the-timeout-duration)
    - [1.4.11. Automatic Retry](#1411-automatic-retry)
      - [1.4.11.1. Exponential BackOff and Jitter](#14111-exponential-backoff-and-jitter)
      - [1.4.11.2. Do Something on Retry](#14112-do-something-on-retry)
    - [1.4.12. Thrown Exceptions](#1412-thrown-exceptions)
    - [1.4.13. Upload Media](#1413-upload-media)
    - [1.4.14. Check the Progress of Media Upload](#1414-check-the-progress-of-media-upload)
    - [1.4.15. Generate Filtering Rules Safely and Easily](#1415-generate-filtering-rules-safely-and-easily)
  - [1.5. Contribution 🏆](#15-contribution-)
  - [1.6. Contributors ✨](#16-contributors-)
  - [1.7. Support ❤️](#17-support-️)
  - [1.8. License 🔑](#18-license-)
  - [1.9. More Information 🧐](#19-more-information-)

<!-- /TOC -->

# 1. Guide 🌎

This library provides the easiest way to use [Twitter API v2.0](https://developer.twitter.com/en/docs/twitter-api/data-dictionary/introduction) in **Dart** and **Flutter** apps.

**Show some ❤️ and star the repo to support the project.**

We also provide [twitter_oauth2_pkce](https://pub.dev/packages/twitter_oauth2_pkce) for easy [OAuth 2.0 PKCE authentication](https://developer.twitter.com/en/docs/authentication/oauth-2-0/authorization-code) when using the Twitter API!

Also, this library is listed in the [Official Twitter page](https://developer.twitter.com/en/docs/twitter-api/tools-and-libraries/v2#dart) 🐦

## 1.1. Features 💎

✅ The **wrapper library** for **[Twitter API v2.0](https://developer.twitter.com/en/docs/twitter-api)**. </br>
✅ **Easily integrates** with the **Dart** & **Flutter** apps. </br>
✅ Provides response objects with a **guaranteed safe types.** </br>
✅ Supports **[all endpoints](https://developer.twitter.com/en/docs/api-reference-index)**. </br>
✅ Support **all request parameters and response fields**.</br>
✅ Supports **high-performance streaming** endpoints. </br>
✅ Supports **[expansions](https://developer.twitter.com/en/docs/twitter-api/expansions)** and **[fields](https://developer.twitter.com/en/docs/twitter-api/fields)** features. </br>
✅ **Well documented** and **well tested**.</br>
✅ Supports the powerful **automatic retry**.</br>
✅ Supports for **large media uploads (image, gif, video)**.</br>
✅ Supports **safe and powerful paging feature**.

## 1.2. Getting Started ⚡

### 1.2.1. Install Library

**With Dart:**

```bash
 dart pub add twitter_api_v2
```

**Or With Flutter:**

```bash
 flutter pub add twitter_api_v2
```

### 1.2.2. Import

```dart
import 'package:twitter_api_v2/twitter_api_v2';
```

### 1.2.3. Implementation

```dart
import 'dart:async';
import 'dart:io';

import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  //! You need to get keys and tokens at https://developer.twitter.com
  final twitter = v2.TwitterApi(
    //! Authentication with OAuth2.0 is the default.
    //!
    //! Note that to use endpoints that require certain user permissions,
    //! such as Tweets and Likes, you need a token issued by OAuth2.0 PKCE.
    //!
    //! The easiest way to achieve authentication with OAuth 2.0 PKCE is
    //! to use [twitter_oauth2_pkce](https://pub.dev/packages/twitter_oauth2_pkce)!
    bearerToken: 'YOUR_TOKEN_HERE',

    //! Or perhaps you would prefer to use the good old OAuth1.0a method
    //! over the OAuth2.0 PKCE method. Then you can use the following code
    //! to set the OAuth1.0a tokens.
    //!
    //! However, note that some endpoints cannot be used for OAuth 1.0a method
    //! authentication.
    oauthTokens: v2.OAuthTokens(
      consumerKey: 'YOUR_CONSUMER_KEY_HERE',
      consumerSecret: 'YOUR_CONSUMER_SECRET_HERE',
      accessToken: 'YOUR_ACCESS_TOKEN_HERE',
      accessTokenSecret: 'YOUR_ACCESS_TOKEN_SECRET_HERE',
    ),

    //! Automatic retry is available when network error or server error
    //! are happened.
    retryConfig: v2.RetryConfig(
      maxAttempts: 5,
      onExecute: (event) => print(
        'Retry after ${event.intervalInSeconds} seconds... '
        '[${event.retryCount} times]',
      ),
    ),

    //! The default timeout is 10 seconds.
    timeout: Duration(seconds: 20),
  );

  try {
    //! Get the authenticated user's profile.
    final me = await twitter.users.lookupMe();
    //! Get the tweets associated with the search query.
    final tweets = await twitter.tweets.searchRecent(
      query: '#ElonMusk',
      maxResults: 20,
      // You can expand the search result.
      expansions: [
        v2.TweetExpansion.authorId,
        v2.TweetExpansion.inReplyToUserId,
      ],
      tweetFields: [
        v2.TweetField.conversationId,
        v2.TweetField.publicMetrics,
        v2.TweetField.editControls,
      ],
      userFields: [
        v2.UserField.location,
        v2.UserField.verified,
        v2.UserField.entities,
        v2.UserField.publicMetrics,
      ],

      //! Safe paging is easy to implement.
      paging: (event) {
        print(event.response);

        if (event.count == 3) {
          return v2.ForwardPaginationControl.stop();
        }

        return v2.ForwardPaginationControl.next();
      },
    );

    //! You can serialize & deserialize JSON from response object
    //! and model object.
    final tweetJson = tweets.data.first.toJson();
    final tweet = v2.TweetData.fromJson(tweetJson);
    print(tweet);

    await twitter.tweets.createLike(
      userId: me.data.id,
      tweetId: tweets.data.first.id,
    );

    //! You can upload media such as image, gif and video.
    final uploadedMedia = await twitter.media.uploadMedia(
      file: File.fromUri(Uri.file('FILE_PATH')),
      altText: 'This is alt text.',

      //! You can check the upload progress.
      onProgress: (event) {
        switch (event.state) {
          case v2.UploadState.preparing:
            print('Upload is preparing...');
            break;
          case v2.UploadState.inProgress:
            print('${event.progress}% completed...');
            break;
          case v2.UploadState.completed:
            print('Upload has completed!');
            break;
        }
      },
      onFailed: (error) => print('Upload failed due to "${error.message}"'),
    );

    //! You can easily post a tweet with the uploaded media.
    await twitter.tweets.createTweet(
      text: 'Tweet with uploaded media',
      media: v2.TweetMediaParam(
        mediaIds: [uploadedMedia.data.id],
      ),
    );

    //! High-performance Volume Stream endpoint is available.
    final sampleStream = await twitter.tweets.connectSampleStream();
    await for (final response in sampleStream.stream.handleError(print)) {
      print(response);
    }

    //! Also high-performance Filtered Stream endpoint is available.
    await twitter.tweets.createFilteringRules(
      rules: [
        v2.FilteringRuleParam(value: '#ElonMusk'),

        //! You can easily build filtering rule using by "FilteringRule" object.
        v2.FilteringRuleParam(
          //! => #Tesla has:media
          value: v2.FilteringRule.of()
              .matchHashtag('Tesla')
              .and()
              .matchTweetContainsMedia()
              .build(),
        ),
        v2.FilteringRuleParam(
          //! => (#SpaceX has:media) OR (#SpaceX has:hashtags) sample:50
          value: v2.FilteringRule.ofSample(percent: 50)
              .group(
                v2.FilteringRule.of()
                    .matchHashtag('SpaceX')
                    .and()
                    .matchTweetContainsMedia(),
              )
              .or()
              .group(
                v2.FilteringRule.of()
                    .matchHashtag('SpaceX')
                    .and()
                    .matchTweetContainsHashtags(),
              )
              .build(),
        ),
      ],
    );

    final filteredStream = await twitter.tweets.connectFilteredStream();
    await for (final response in filteredStream.stream.handleError(print)) {
      print(response.data);
      print(response.matchingRules);
    }
  } on TimeoutException catch (e) {
    print(e);
  } on v2.UnauthorizedException catch (e) {
    print(e);
  } on v2.RateLimitExceededException catch (e) {
    print(e);
  } on v2.DataNotFoundException catch (e) {
    print(e);
  } on v2.TwitterUploadException catch (e) {
    print(e);
  } on v2.TwitterException catch (e) {
    print(e.response.headers);
    print(e.body);
    print(e);
  }}
```

## 1.3. Supported Endpoints 👀

### 1.3.1. Tweets Service

#### 1.3.1.1. Tweet

| Endpoint                                                                                                                      | Method Name                                                                                                        |
| ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| [POST /2/tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/manage-tweets/api-reference/post-tweets)            | [createTweet](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/createTweet.html)   |
| [DELETE /2/tweets/:id](https://developer.twitter.com/en/docs/twitter-api/tweets/manage-tweets/api-reference/delete-tweets-id) | [destroyTweet](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/destroyTweet.html) |

#### 1.3.1.2. Likes

| Endpoint                                                                                                                                           | Method Name                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| [POST /2/users/:id/likes](https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/post-users-id-likes)                        | [createLike](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/createLike.html)               |
| [DELETE /2/users/:id/likes/:tweet_id](https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/delete-users-id-likes-tweet_id) | [destroyLike](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/destroyLike.html)             |
| [GET /2/tweets/:id/liking_users](https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/get-tweets-id-liking_users)          | [lookupLikingUsers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupLikingUsers.html) |
| [GET /2/users/:id/liked_tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/get-users-id-liked_tweets)            | [lookupLikedTweets](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupLikedTweets.html) |

#### 1.3.1.3. Retweets

| Endpoint                                                                                                                                                           | Method Name                                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- |
| [POST /2/users/:id/retweets](https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/api-reference/post-users-id-retweets)                               | [createRetweet](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/createRetweet.html)               |
| [DELETE /2/users/:id/retweets/:source_tweet_id](https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/api-reference/delete-users-id-retweets-tweet_id) | [destroyRetweet](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/destroyRetweet.html)             |
| [GET /2/tweets/:id/retweeted_by](https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/api-reference/get-tweets-id-retweeted_by)                       | [lookupRetweetedUsers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupRetweetedUsers.html) |

#### 1.3.1.4. Quote Tweets

| Endpoint                                                                                                                                         | Method Name                                                                                                                  |
| ------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| [GET /2/tweets/:id/quote_tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/quote-tweets/api-reference/get-tweets-id-quote_tweets) | [lookupQuoteTweets](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupQuoteTweets.html) |

#### 1.3.1.5. Search Tweets

| Endpoint                                                                                                                              | Method Name                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| [GET /2/tweets/search/all](https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-all)       | [searchAll](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/searchAll.html)       |
| [GET /2/tweets/search/recent](https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent) | [searchRecent](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/searchRecent.html) |

#### 1.3.1.6. Lookup Tweets

| Endpoint                                                                                                         | Method Name                                                                                                      |
| ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| [GET /2/tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/lookup/api-reference/get-tweets)        | [lookupByIds](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupByIds.html) |
| [GET /2/tweets/:id](https://developer.twitter.com/en/docs/twitter-api/tweets/lookup/api-reference/get-tweets-id) | [lookupById](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupByIds.html)  |

#### 1.3.1.7. Tweet Counts

| Endpoint                                                                                                                              | Method Name                                                                                                      |
| ------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| [GET /2/tweets/counts/all](https://developer.twitter.com/en/docs/twitter-api/tweets/counts/api-reference/get-tweets-counts-all)       | [countAll](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/countAll.html)       |
| [GET /2/tweets/counts/recent](https://developer.twitter.com/en/docs/twitter-api/tweets/counts/api-reference/get-tweets-counts-recent) | [countRecent](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/countRecent.html) |

#### 1.3.1.8. Bookmarks

| Endpoint                                                                                                                                                       | Method Name                                                                                                              |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| [POST /2/users/:id/bookmarks](https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/post-users-id-bookmarks)                        | [createBookmark](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/createBookmark.html)   |
| [DELETE /2/users/:id/bookmarks/:tweet_id](https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/delete-users-id-bookmarks-tweet_id) | [destroyBookmark](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/destroyBookmark.html) |
| [GET /2/users/:id/bookmarks](https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/get-users-id-bookmarks)                          | [lookupBookmarks](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupBookmarks.html) |

#### 1.3.1.9. Timelines

| Endpoint                                                                                                                                                                | Method Name                                                                                                                    |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| [GET /2/users/:id/mentions](https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/api-reference/get-users-id-mentions)                                     | [lookupMentions](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupMentions.html)         |
| [GET /2/users/:id/tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/api-reference/get-users-id-tweets)                                         | [lookupTweets](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupTweets.html)             |
| [GET /2/users/:id/timelines/reverse_chronological](https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/api-reference/get-users-id-reverse-chronological) | [lookupHomeTimeline](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupHomeTimeline.html) |

#### 1.3.1.10. Hide Replies

| Endpoint                                                                                                                             | Method Name                                                                                                                    |
| ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ |
| [PUT /2/tweets/:id/hidden](https://developer.twitter.com/en/docs/twitter-api/tweets/hide-replies/api-reference/put-tweets-id-hidden) | [createHiddenReply](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/createHiddenReply.html)   |
| [PUT /2/tweets/:id/hidden](https://developer.twitter.com/en/docs/twitter-api/tweets/hide-replies/api-reference/put-tweets-id-hidden) | [destroyHiddenReply](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/destroyHiddenReply.html) |

#### 1.3.1.11. Volume Stream

| Endpoint                                                                                                                                          | Method Name                                                                                                                          |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| [GET /2/tweets/sample/stream](https://developer.twitter.com/en/docs/twitter-api/tweets/volume-streams/api-reference/get-tweets-sample-stream)     | [connectSampleStream](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/connectSampleStream.html)     |
| [GET /2/tweets/sample10/stream](https://developer.twitter.com/en/docs/twitter-api/tweets/volume-streams/api-reference/get-tweets-sample10-stream) | [connectSample10Stream](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/connectSample10Stream.html) |

#### 1.3.1.12. Filtered Stream

| Endpoint                                                                                                                                                     | Method Name                                                                                                                          |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| [POST /2/tweets/search/stream/rules](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/api-reference/post-tweets-search-stream-rules) | [createFilteringRules](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/createFilteringRules.html)   |
| [GET /2/tweets/search/stream/rules](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/api-reference/get-tweets-search-stream-rules)   | [lookupFilteringRules](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupFilteringRules.html)   |
| [GET /2/tweets/search/stream](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/api-reference/get-tweets-search-stream)               | [connectFilteredStream](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/connectFilteredStream.html) |

### 1.3.2. Users Service

#### 1.3.2.1. Follows

| Endpoint                                                                                                                                                                    | Method Name                                                                                                               |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| [POST /2/users/:id/following](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/post-users-source_user_id-following)                            | [createFollow](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/createFollow.html)         |
| [DELETE /2/users/:source_user_id/following/:target_user_id](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/delete-users-source_id-following) | [destroyFollow](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/destroyFollow.html)       |
| [GET /2/users/:id/followers](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/get-users-id-followers)                                          | [lookupFollowers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupFollowers.html)   |
| [GET /2/users/:id/following](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/get-users-id-following)                                          | [lookupFollowings](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupFollowings.html) |

#### 1.3.2.2. Lookup Users

| Endpoint                                                                                                                                          | Method Name                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| [GET /2/users](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users)                                            | [lookupByIds](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupByIds.html)     |
| [GET /2/users/:id](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-id)                                     | [lookupById](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupById.html)       |
| [GET /2/users/by](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by)                                      | [lookupByNames](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupByNames.html) |
| [GET /2/users/by/username/:username](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by-username-username) | [lookupByName](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupByName.html)   |
| [GET /2/users/me](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-me)                                      | [lookupMe](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupMe.html)           |

#### 1.3.2.3. Users Mutes

| Endpoint                                                                                                                                                          | Method Name                                                                                                                 |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| [POST /2/users/:id/muting](https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/post-users-user_id-muting)                                 | [createMute](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/createMute.html)               |
| [DELETE /2/users/:source_user_id/muting/:target_user_id](https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/delete-users-user_id-muting) | [destroyMute](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/destroyMute.html)             |
| [GET /2/users/:id/muting](https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/get-users-muting)                                           | [lookupMutingUsers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupMutingUsers.html) |

#### 1.3.2.4. Blocks

| Endpoint                                                                                                                                                               | Method Name                                                                                                                     |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| [POST /2/users/:id/blocking](https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/post-users-user_id-blocking)                                 | [createBlock](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/createBlock.html)                 |
| [DELETE /2/users/:source_user_id/blocking/:target_user_id](https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/delete-users-user_id-blocking) | [destroyBlock](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/destroyBlock.html)               |
| [GET /2/users/:id/blocking](https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/get-users-blocking)                                           | [lookupBlockingUsers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupBlockingUsers.html) |

#### 1.3.2.5. User Profile

> **Note**</br>
> Twitter API v1.1 endpoint is used because Twitter Official does not yet release the endpoints to manage user profile for Twitter API v2.0. Therefore, this service may be changed in the future.

| Endpoint                                                                                                                                                                                         | Method Name                                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| [POST /1.1/account/update_profile.json](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile)               | [updateProfile](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/updateProfile.html)                         |
| [POST /1.1/account/update_profile_image.json](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile_image)   | [updateProfileImage](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/updateProfileImage.html)               |
| [POST /1.1/account/update_profile_banner.json](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile_banner) | [updateProfileBanner](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/updateProfileBanner.html)             |
| [POST /1.1/account/remove_profile_banner.json](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-remove_profile_banner) | [destroyProfileBanner](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/destroyProfileBanner.html)           |
| [GET users/profile_banner.json](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-users-profile_banner)                          | [lookupProfileBannerById](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupProfileBannerById.html)     |
| [GET users/profile_banner.json](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-users-profile_banner)                          | [lookupProfileBannerByName](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupProfileBannerByName.html) |

#### 1.3.2.6. Report Spam

> **Note**</br>
> Twitter API v1.1 endpoint is used because Twitter Official does not yet release the endpoints to report spam for Twitter API v2.0. Therefore, this service may be changed in the future.

| Endpoint                                                                                                                                                                 | Method Name                                                                                                                   |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- |
| [POST /1.1/users/report_spam.json](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-users-report_spam) | [createReportById](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/createReportById.html)     |
| [POST /1.1/users/report_spam.json](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-users-report_spam) | [createReportByName](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/createReportByName.html) |

### 1.3.3. Spaces Service

#### 1.3.3.1. Search Spaces

| Endpoint                                                                                                                | Method Name                                                                                            |
| ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [GET /2/spaces/search](https://developer.twitter.com/en/docs/twitter-api/spaces/search/api-reference/get-spaces-search) | [search](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/SpacesService/search.html) |

#### 1.3.3.2. Lookup Spaces

| Endpoint                                                                                                                                | Method Name                                                                                                                    |
| --------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| [GET /2/spaces](https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces)                               | [lookupByIds](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/SpacesService/lookupByIds.html)               |
| [GET /2/spaces/:id](https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces-id)                        | [lookupById](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/SpacesService/lookupById.html)                 |
| [GET /2/spaces/:id/buyers](https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces-id-buyers)          | [lookupBuyers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/SpacesService/lookupBuyers.html)             |
| [GET /2/spaces/:id/tweets](https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces-id-tweets)          | [lookupTweets](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/SpacesService/lookupTweets.html)             |
| [GET /2/spaces/by/creator_ids](https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces-by-creator-ids) | [lookupByCreatorIds](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/SpacesService/lookupByCreatorIds.html) |

### 1.3.4. Lists Service

#### 1.3.4.1. Lookup Lists

| Endpoint                                                                                                                                   | Method Name                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| [GET /2/lists/:id](https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/api-reference/get-lists-id)                         | [lookupById](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupById.html)       |
| [GET /2/users/:id/owned_lists](https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/api-reference/get-users-id-owned_lists) | [lookupOwnedBy](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupOwnedBy.html) |

#### 1.3.4.2. Pinnings

| Endpoint                                                                                                                                                             | Method Name                                                                                                                 |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| [POST /2/users/:id/pinned_lists](https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/post-users-id-pinned-lists)                      | [createPinnedList](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/createPinnedList.html)   |
| [DELETE /2/users/:id/pinned_lists/:list_id](https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/delete-users-id-pinned-lists-list_id) | [destroyPinnedList](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/destroyPinnedList.html) |
| [GET /2/users/:id/pinned_lists](https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/get-users-id-pinned_lists)                        | [lookupPinnedLists](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupPinnedLists.html) |

#### 1.3.4.3. Tweet Lookup

| Endpoint                                                                                                                         | Method Name                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| [GET /2/lists/:id/tweets](https://developer.twitter.com/en/docs/twitter-api/lists/list-tweets/api-reference/get-lists-id-tweets) | [lookupTweets](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupTweets.html) |

#### 1.3.4.4. List Manage

| Endpoint                                                                                                                  | Method Name                                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| [POST /2/lists](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/post-lists)            | [createPublicList](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/createPublicList.html)       |
| [POST /2/lists](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/post-lists)            | [createPrivateList](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/createPrivateList.html)     |
| [DELETE /2/lists/:id](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/delete-lists-id) | [destroyList](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/destroyList.html)                 |
| [PUT /2/lists/:id](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/put-lists-id)       | [updateListAsPublic](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/updateListAsPublic.html)   |
| [PUT /2/lists/:id](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/put-lists-id)       | [updateListAsPrivate](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/updateListAsPrivate.html) |

#### 1.3.4.5. Follows

| Endpoint                                                                                                                                                                 | Method Name                                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------- |
| [POST /2/users/:id/followed_lists](https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/post-users-id-followed-lists)                      | [createFollow](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/createFollow.html)               |
| [DELETE /2/users/:id/followed_lists/:list_id](https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/delete-users-id-followed-lists-list_id) | [destroyFollow](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/destroyFollow.html)             |
| [GET /2/lists/:id/followers](https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/get-lists-id-followers)                                  | [lookupFollowers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupFollowers.html)         |
| [GET /2/users/:id/followed_lists](https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/get-users-id-followed_lists)                        | [lookupFollowedLists](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupFollowedLists.html) |

#### 1.3.4.6. Members

| Endpoint                                                                                                                                                   | Method Name                                                                                                                 |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| [POST /2/lists/:id/members](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/post-lists-id-members)                      | [createMember](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/createMember.html)           |
| [DELETE /2/lists/:id/members/:user_id](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/delete-lists-id-members-user_id) | [destroyMember](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/destroyMember.html)         |
| [GET /2/lists/:id/members](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/get-lists-id-members)                        | [lookupMembers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupMembers.html)         |
| [GET /2/users/:id/list_memberships](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/get-lists-id-members)               | [lookupMemberships](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupMemberships.html) |

### 1.3.5. Media Service

> **Note**</br>
> Twitter API v1.1 endpoint is used because Twitter Official does not yet release the Media endpoint for Twitter API v2.0. Therefore, this service may be changed in the future.

#### 1.3.5.1. Upload Media

| Endpoint                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Method Name                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| [POST /1.1/media/upload.json](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | [uploadImage](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/MediaService/uploadImage.html) |
| [POST /1.1/media/upload.json (INIT)](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-init)</br>[POST /1.1/media/upload.json (APPEND)](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-append)</br>[POST /1.1/media/upload.json (FINALIZE)](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-finalize)</br>[POST /1.1/media/upload.json (STATUS)](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/get-media-upload-status)</br> | [uploadMedia](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/MediaService/uploadMedia.html) |

### 1.3.6. Direct Messages Service

#### 1.3.6.1. Lookup Event

| Endpoint                                                                                                                                                                                            | Method Name                                                                                                                        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| [GET /2/dm_events](https://developer.twitter.com/en/docs/twitter-api/direct-messages/lookup/api-reference/get-dm_events)                                                                            | [lookupEvents](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/DirectMessagesService/dm_events.html)            |
| [GET /2/dm_conversations/with/:participant_id/dm_events](https://developer.twitter.com/en/docs/twitter-api/direct-messages/lookup/api-reference/get-dm_conversations-with-participant_id-dm_events) | [lookupEventsWith](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/DirectMessagesService/lookupEventsWith.html) |
| [GET /2/dm_conversations/:dm_conversation_id/dm_events](https://developer.twitter.com/en/docs/twitter-api/direct-messages/lookup/api-reference/get-dm_conversations-dm_conversation_id-dm_events)   | [lookupEventsIn](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/DirectMessagesService/lookupEventsIn.html)     |

#### 1.3.6.2. Manage Event

| Endpoint                                                                                                                                                                                            | Method Name                                                                                                                                      |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| [POST /2/dm_conversations/with/:participant_id/messages](https://developer.twitter.com/en/docs/twitter-api/direct-messages/manage/api-reference/post-dm_conversations-with-participant_id-messages) | [createConversation](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/DirectMessagesService/createConversation.html)           |
| [POST /2/dm_conversations](https://developer.twitter.com/en/docs/twitter-api/direct-messages/manage/api-reference/post-dm_conversations)                                                            | [createGroupConversation](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/DirectMessagesService/createGroupConversation.html) |
| [POST /2/dm_conversations/:dm_conversation_id/messages](https://developer.twitter.com/en/docs/twitter-api/direct-messages/manage/api-reference/post-dm_conversations-dm_conversation_id-messages)   | [createMessage](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/DirectMessagesService/createMessage.html)                     |

### 1.3.7. Geo Service

> **Note**</br>
> Twitter API v1.1 endpoint is used because Twitter Official does not yet release the Geo endpoint for Twitter API v2.0. Therefore, this service may be changed in the future.

#### 1.3.7.1. Lookup Place

| Endpoint                                                                                                                                                 | Method Name                                                                                                                                         |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| GET /1.1/geo/id/:placeId.json                                                                                                                            | [lookupById](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/GeoService/lookupById.html)                                         |
| [GET /1.1/geo/reverse_geocode.json](https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-reverse_geocode) | [lookupReverseGeocodedLocations](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/GeoService/lookupReverseGeocodedLocations.html) |

#### 1.3.7.2. Search Locations

| Endpoint                                                                                                                               | Method Name                                                                                                           |
| -------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| [GET /1.1/geo/search.json](https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-search) | [searchLocations](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/GeoService/searchLocations.html) |

### 1.3.8. Trends Service

> **Note**</br>
> Twitter API v1.1 endpoint is used because Twitter Official does not yet release the Trends endpoint for Twitter API v2.0. Therefore, this service may be changed in the future.

#### 1.3.8.1. Trending Location

| Endpoint                                                                                                                                                        | Method Name                                                                                                                                |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| [GET /1.1/trends/available.json](https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-available) | [searchAvailableLocations](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TrendsService/searchAvailableLocations.html) |
| [GET /1.1/trends/closest.json](https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-closest)     | [searchClosestLocations](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TrendsService/searchClosestLocations.html)     |

#### 1.3.8.2. Trend

| Endpoint                                                                                                                                     | Method Name                                                                                                        |
| -------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| [GET /1.1/trends/place.json](https://developer.twitter.com/en/docs/twitter-api/v1/trends/trends-for-location/api-reference/get-trends-place) | [lookupTrends](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TrendsService/lookupTrends.html) |

### 1.3.9. Compliance Service

#### 1.3.9.1. Batch Compliance

| Endpoint                                                                                                                                         | Method Name                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| [POST /2/compliance/jobs](https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/post-compliance-jobs)      | [createJob](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ComplianceService/createJob.html)   |
| [GET /2/compliance/jobs](https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/get-compliance-jobs)        | [lookupJobs](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ComplianceService/lookupJobs.html) |
| [GET /2/compliance/jobs/:id](https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/get-compliance-jobs-id) | [lookupJob](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ComplianceService/lookupJob.html)   |

## 1.4. Tips 🏄

### 1.4.1. Method Names

**twitter_api_v2** uses the following standard prefixes depending on endpoint characteristics. So it's very easy to find the method corresponding to the endpoint you want to use!

| Prefix      | Description                                                                                        |
| ----------- | -------------------------------------------------------------------------------------------------- |
| **lookup**  | This prefix is attached to endpoints that reference tweets, users, etc.                            |
| **search**  | This prefix is attached to endpoints that perform extensive searches.                              |
| **connect** | This prefix is attached to endpoints with high-performance streaming.                              |
| **count**   | This prefix is attached to the endpoint that counts a particular item.                             |
| **create**  | This prefix is attached to the endpoint performing the create state such as `Tweet` and `Follow`.  |
| **destroy** | This prefix is attached to the endpoint performing the destroy state such as `Tweet` and `Follow`. |
| **update**  | This prefix is attached to the endpoint performing the update state.                               |
| **upload**  | This prefix is attached to the endpoint performing the media uploading.                            |

### 1.4.2. Automatic REST Client Resolution

Some of the **Twitter API v2.0** endpoints support `OAuth 1.0a` method of authentication in parallel while assuming `OAuth 2.0`.

**twitter_api_v2** also supports this specification and provides a mechanism to automatically resolve the REST client for HTTP communication depending on the state and type of token specified when creating an instance of the `TwitterApi` object.

This is resolved by the following rules.

- **When you use v2 endpoints:**

| **When**                   | **bearerToken.isEmpty** | **bearerToken.isNotEmpty** |
| -------------------------- | :---------------------: | :------------------------: |
| **oauthTokens.isEmpty**    |  UnauthorizedException  |         OAuth 2.0          |
| **oauthTokens.isNotEmpty** |       OAuth 1.0a        |         OAuth 2.0          |

- **When you use v1 endpoints:**

| **When**                   | **bearerToken.isEmpty** | **bearerToken.isNotEmpty** |
| -------------------------- | :---------------------: | :------------------------: |
| **oauthTokens.isEmpty**    |  UnauthorizedException  |   UnauthorizedException    |
| **oauthTokens.isNotEmpty** |       OAuth 1.0a        |         OAuth 1.0a         |

### 1.4.3. Generate App-Only Bearer Token

**twitter_api_v2** provides utility to generate/find your app-only bearer token.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final bearerToken = await v2.OAuthUtils.generateAppOnlyBearerToken(
    consumerKey: 'YOUR_CONSUMER_KEY',
    consumerSecret: 'YOUR_CONSUMER_SECRET',
  );

  print(bearerToken);
}
```

### 1.4.4. Refresh Access Token

The advantage of access tokens issued by **OAuth 2.0 PKCE** is not only security, but also the ability to determine user access permissions in detail. However, the lifespan of this access token is short, expiring in about 2 hours.

And then, the `refresh token` is a mechanism to solve this problem. `Refresh token` can be used to reissue your expired access token.

You can implement it as follows.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final response = await v2.OAuthUtils.refreshAccessToken(
    clientId: 'YOUR_CLIENT_ID',
    clientSecret: 'YOUR_CLIENT_SECRET',
    refreshToken: 'REFRESH_TOKEN_YOU_GOT',
  );

  print(response.accessToken);
  print(response.refreshToken);
}
```

> **Note**:</br>
> If you are looking for a way to authenticate with **OAuth 2.0 PKCE**, use **[twitter_oauth2_pkce](https://pub.dev/packages/twitter_oauth2_pkce)**.</br>
> The `refresh token` is returned together with the access token by specifying the **`offline.access`** scope to the Twitter authentication server.

### 1.4.5. Null Parameter at Request

In this library, parameters that are not required at request time, i.e., optional parameters, are defined as nullable.
However, developers do not need to be aware of the null parameter when sending requests when using this library.

It means the parameters specified with a null value are safely removed and ignored before the request is sent.

For example, arguments specified with null are ignored in the following request.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(bearerToken: 'YOUR_TOKEN_HERE');

  await twitter.tweets.createTweet(
    text: 'Hello, World!',
    // These parameters are ignored at request because they are null.
    mediaIds: null,
    expansions: null,
  );
}
```

### 1.4.6. Expand Object Fields with `expansions`

For example, there may be a situation where data contains only an ID, and you want to retrieve the data object associated with that ID as well. In such cases, the `Twitter API v2.0` specification called `expansions` is useful, and this library supports that specification.

Basically it can be used in endpoints that perform GET communication such as `lookup` and `search` processing. Some fields may also be included in the `includes` property of [TwitterResponse](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TwitterResponse-class.html).

You can use `expansions` like below:

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(bearerToken: 'YOUR_TOKEN_HERE');

  try {
    final tweets = await twitter.tweets.searchRecent(
      query: '#ElonMusk',
      // Specify fields you need!
      expansions: [
        v2.TweetExpansion.authorId,
        v2.TweetExpansion.inReplyToUserId,
      ],
    );

    print(tweets);
  } on v2.TwitterException catch (e) {
    print(e);
  }
}
```

You can see more details about `expansions` from [Official Documentation](https://developer.twitter.com/en/docs/twitter-api/expansions).

### 1.4.7. Expand Object Fields with `fields`

`Twitter API v2.0` supports a very interesting specification, allowing users to control the amount of data contained in the response object for each endpoint depending on the situation. It's called `fields`, and this library supports this specification.

Basically it can be used in endpoints that perform GET communication such as `lookup` and `search` processing. Some fields may also be included in the `includes` field of [TwitterResponse](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TwitterResponse-class.html).

You can use `fields` like below:

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(bearerToken: 'YOUR_TOKEN_HERE');

  try {
    final tweets = await twitter.tweets.searchRecent(
      query: '#ElonMusk',
      maxResults: 20,
      expansions: v2.TweetExpansion.values,
      tweetFields: [
        v2.TweetField.conversationId,
        v2.TweetField.publicMetrics,
      ],
      userFields: [
        v2.UserField.location,
        v2.UserField.publicMetrics,
      ],
    );

    print(tweets);
  } on v2.TwitterException catch (e) {
    print(e);
  }
}
```

> **Note**</br>
> Some fields must be combined with `expansions`.

You can see more details about `fields` from [Official Documentation](https://developer.twitter.com/en/docs/twitter-api/fields).

### 1.4.8. JSON Serialization and Deserialization

All Twitter API responses obtained using **twitter_api_v2** are returned stored in a safe type object. However, there may be cases where the raw JSON returned from the Twitter API is needed when creating applications in combination with other libraries.

In that case, you can use the **`toJson`** method provided by the `TwitterResponse` or other model objects to convert it to the raw JSON format returned by the Twitter API.

The JSON converted by this **`toJson`** method is **completely equivalent to the JSON returned by the Twitter API** and can be deserialized by using the factory constructor **`fromJson`** provided with each model object.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(bearerToken: 'YOUR_BEARER_TOKEN');

  try {
    final response = await twitter.tweets.searchRecent(
      query: '#ElonMusk',
      maxResults: 10,
      expansions: v2.TweetExpansion.values,
    );

    //! You can get raw JSON from this response.
    print(response.toJson());

    //! Or you can get raw JSON from specific model object.
    print(response.data.first.toJson());
  } on v2.TwitterException catch (e) {
    print(e);
  }
}
```

You could also write like:

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(bearerToken: 'YOUR_BEARER_TOKEN');

  try {
    final response = await twitter.tweets.searchRecent(
      query: '#ElonMusk',
      maxResults: 10,
      expansions: v2.TweetExpansion.values,
    );

    //! Serialize & Deserialize
    final tweetJson = response.data.first.toJson();
    final tweet = v2.TweetData.fromJson(tweetJson);

    print(tweet);
  } on v2.TwitterException catch (e) {
    print(e);
  }
}
```

### 1.4.9. OAuth 2.0 Authorization Code Flow with PKCE

**Twitter API v2.0** supports authentication methods with [OAuth 2.0 PKCE](https://developer.twitter.com/en/docs/authentication/oauth-2-0/authorization-code), and it allows users of apps using **Twitter API v2.0** to request authorization for the minimum necessary [scope](https://developer.twitter.com/en/docs/authentication/guides/v2-authentication-mapping) of operation.

Since **OAuth2.0 PKCE** authentication requires going through a browser, **twitter_api_v2** does not provide this specification for compatibility with CLI applications. Instead, we provide [twitter_oauth2_pkce](https://pub.dev/packages/twitter_oauth2_pkce), a library for Flutter apps.

The **twitter_oauth2_pkce** is 100% compatible with **twitter_api_v2** and can be used. You can see more details from links below.

- [Repository](https://github.com/twitter-dart/twitter-oauth2-pkce)
- [Pub.dev](https://pub.dev/packages/twitter_oauth2_pkce)

Also, please refer to the next simple sample Flutter application that combines **twitter_api_v2** and **twitter_oauth2_pkce**.

- [Example Tweet App](https://github.com/twitter-dart/example-tweet-app-with-twitter-api-v2)

### 1.4.10. Change the Timeout Duration

The library specifies a default timeout of **10 seconds** for all API communications.

However, there may be times when you wish to specify an arbitrary timeout duration. If there is such a demand, an arbitrary timeout duration can be specified as follows.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() {
 final twitter = v2.TwitterApi(
    bearerToken: 'YOUR_TOKEN_HERE',

    //! The default timeout is 10 seconds.
    timeout: Duration(seconds: 5),
  );
}
```

### 1.4.11. Automatic Retry

Due to the nature of this library's communication with external systems, timeouts may occur due to inevitable communication failures or temporary crashes of the server to which requests are sent.

When such timeouts occur, an effective countermeasure in many cases is to send the request again after a certain interval. And **twitter_api_v2** provides an **automatic retry** feature as a solution to this problem.

The errors subject to retry are as follows.

- When the status code of the response returned from Twitter is `500` or `503`.
- When the network is temporarily lost and `SocketException` is thrown.
- When communication times out temporarily and `TimeoutException` is thrown

#### 1.4.11.1. Exponential BackOff and Jitter

The easiest way to perform an automatic retry is to stop the process at a certain time and rerun it until it succeeds. However, if there is a network outage on Twitter's servers, sending multiple requests to a specific server at the same time may further overload the server to which the request is sent and further reduce the success rate of retry attempts.

This problem can be solved by exponential number and adding a random number called **Jitter**, and this method is called the **Exponential BackOff and Jitter** algorithm. By adding a random number to the exponentially increasing retry interval, the retry interval can be distributed more flexibly.

It can be implemented as follows.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(
    bearerToken: 'YOUR_TOKEN_HERE',

    //! Add these lines.
    retryConfig: v2.RetryConfig(
      maxAttempts: 3,
    ),
  );
}
```

In the above implementation, the interval increases exponentially for each retry count with jitter. It can be expressed by next formula.

> **(2 ^ retryCount) + jitter(Random Number between 0 ~ 3)**

#### 1.4.11.2. Do Something on Retry

It would be useful to output logging on retries and a popup notifying the user that a retry has been executed. So **twitter_api_v2** provides callbacks that can perform arbitrary processing when retries are executed.

It can be implemented as follows.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(
    bearerToken: 'YOUR_TOKEN_HERE',

    retryConfig: v2.RetryConfig(
      maxAttempts: 3,

      //! Add this line.
      onExecute: (event) => print('Retrying... ${event.retryCount} times.'),
    ),
  );
}
```

The [RetryEvent](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/RetryEvent-class.html) passed to the callback contains information on retries.

### 1.4.12. Thrown Exceptions

**twitter_api_v2** provides a convenient exception object for easy handling of exceptional responses and errors returned from [Twitter API v2.0](https://developer.twitter.com/en/docs/twitter-api/data-dictionary/introduction).

| Exception                                                                                                                                  | Description                                                                                                            |
| ------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------- |
| [TwitterException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/TwitterException-class.html)                     | The most basic exception object. For example, it can be used to search for tweets that have already been deleted, etc. |
| [TwitterUploadException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/TwitterUploadException-class.html)         | Thrown when an exception occurs during media upload.                                                                   |
| [UnauthorizedException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/UnauthorizedException-class.html)           | Thrown when authentication fails with the specified access token.                                                      |
| [RateLimitExceededException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/RateLimitExceededException-class.html) | Thrown when the request rate limit is exceeded.                                                                        |
| [DataNotFoundException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/DataNotFoundException-class.html)           | Thrown when response has no body or data field in body string.                                                         |

Also, all of the above exceptions thrown from the **twitter_api_v2** process extend [TwitterException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/TwitterException-class.html). This means that you can take all exceptions as [TwitterException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/TwitterException-class.html) or handle them as certain exception types, depending on the situation.

However note that, if you receive an individual type exception, be sure to define the process so that the individual exception type is cached before [TwitterException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/TwitterException-class.html). Otherwise, certain type exceptions will also be caught as [TwitterException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/TwitterException-class.html).

Therefore, if you need to catch a specific type of exception in addition to [TwitterException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/TwitterException-class.html), be sure to catch [TwitterException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/TwitterException-class.html) in the bottom catch clause as in the following example.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(bearerToken: 'YOUR_TOKEN_HERE');

  try {
    final tweets = await twitter.tweets.searchRecent(
      query: '#ElonMusk',
      maxResults: 20,
    );

    print(tweets);
  } on v2.UnauthorizedException catch (e) {
    print(e);
  } on v2.RateLimitExceededException catch (e) {
    print(e);
  } on v2.DataNotFoundException catch (e) {
    print(e);
  } on v2.TwitterUploadException catch (e) {
    print(e);
  } on v2.TwitterException catch (e) {
    print(e);
  }
}
```

### 1.4.13. Upload Media

Uploading media on Twitter and sharing it with various people is a very interesting activity. Also, from a business perspective, accompanying tweets with media will attract even more interest from people.

**twitter_api_v2** provides strong support for this very high demand specification. All you have to do is prepare the media file to be uploaded and pass it to the methods, and specifically the following methods are available.

| Method Name                                                                                                     | Description                                                                       |
| --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| [uploadImage](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/MediaService/uploadImage.html) | Low capacity images can be uploaded, such as PNG and GIF.                         |
| [uploadMedia](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/MediaService/uploadMedia.html) | In addition to images, you can upload large media such as video. **(Preferable)** |

**Both methods are very easy to use.**

All the difficult uploading process is capsuled, and as noted earlier, all you have to do is simply pass the prepared media file to the method. For example, if you want to upload a large video to Twitter you can implement the following.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(
    bearerToken: 'NO_NEED_BEARER_TOKEN_BECAUSE_IT_IS_V1.1_ENDPOINT',

    //! You need to set OAuth 1.0a tokens,
    //! because this is the v1.1 endpoint.
    oauthTokens: v2.OAuthTokens(
      consumerKey: 'YOUR_CONSUMER_KEY_HERE',
      consumerSecret: 'YOUR_CONSUMER_SECRET_HERE',
      accessToken: 'YOUR_ACCESS_TOKEN_HERE',
      accessTokenSecret: 'YOUR_ACCESS_TOKEN_SECRET_HERE',
    ),
  );

  try {
    final uploadedResponse = await twitter.media.uploadMedia(
      file: File.fromUri(
        Uri.file('FILE_PATH'),
      ),
    );

    print(uploadedResponse);
  } on v2.TwitterUploadException catch (e) {
    print(e);
  }
}
```

This upload process works very safely, but note that [TwitterUploadException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/TwitterUploadException-class.html) will be thrown if media in a format not supported by Twitter is specified.

> **Note**</br>
> Also note that the v1.1 endpoint is used to achieve this specification in twitter_api_v2. This is because the official Twitter API v2.0 does not yet support media uploads. While I'm trying to keep the implementation as non-disruptive as possible in the future, there may be disruptive changes when media uploads are supported by the official Twitter API v2.0.

### 1.4.14. Check the Progress of Media Upload

Uploading small images to Twitter does not take long, but uploading large videos takes longer to complete. At that time, it would be very useful if you could show users how far along we are in the uploading process.

**twitter_api_v2** supports this specification and can be easily implemented as follows.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(
    bearerToken: 'NO_NEED_BEARER_TOKEN_BECAUSE_IT_IS_V1.1',

    //! You need to set OAuth 1.0a tokens,
    //! because this is the v1.1 endpoint.
    oauthTokens: v2.OAuthTokens(
      consumerKey: 'YOUR_CONSUMER_KEY_HERE',
      consumerSecret: 'YOUR_CONSUMER_SECRET_HERE',
      accessToken: 'YOUR_ACCESS_TOKEN_HERE',
      accessTokenSecret: 'YOUR_ACCESS_TOKEN_SECRET_HERE',
    ),
  );

  try {
    final uploadedResponse = await twitter.media.uploadMedia(
      file: File.fromUri(
        Uri.file('FILE_PATH'),
      ),

      //! Add this callback function.
      onProgress: (event) {
        switch (event.state) {
          case v2.UploadState.preparing:
            print('Upload is preparing...');
            break;
          case v2.UploadState.inProgress:
            print('${event.progress}% completed...');
            break;
          case v2.UploadState.completed:
            print('Upload has completed!');
            break;
        }
      },
    );

    print(uploadedResponse);
  } on v2.TwitterUploadException catch (e) {
    print(e);
  }
}
```

You can add processing when there is upload progress by specifying an `onProgress` callback for `uploadMedia`, as shown above.

The argument passed to this callback function is an `UploadEvent` object, which holds the **status** and **progress rate of the upload** at the time the callback function is called.

Importantly, there are 3 upload statuses, which transition from top to bottom during the upload process

| Status         | Description                                                                                                                                                                             |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **preparing**  | This indicates the start of the media upload process, up to the point where the media to be uploaded is sent to Twitter. The progress rate is always 0 at this point.                   |
| **inProgress** | This indicates that the media upload process is in progress on Twitter's server. This library polls Twitter's server at regular intervals to obtain the progress rate of media uploads. |
| **completed**  | This indicates that the media upload has been successfully completed.                                                                                                                   |

And the trigger that calls the `onProgress` callback is as follows. But if the media upload completes immediately and no polling is required, the `inProgress` status will not occur.

1. When the upload status becomes `preparing` (**Always called once at the start of processing**)
2. When the upload status becomes `inProgress` (**Per polling, and it's not called if polling is not required**)
3. When the upload status becomes `completed` (**Always called once at the end of processing**)

Note that media uploads may also fail for reasons such as broken media. In such cases, [TwitterUploadException](https://pub.dev/documentation/twitter_api_core/latest/twitter_api_core/TwitterUploadException-class.html) is always thrown.

### 1.4.15. Generate Filtering Rules Safely and Easily

Some endpoints in [Twitter API v2.0](https://developer.twitter.com/en/docs/twitter-api/data-dictionary/introduction) supports a number of operators for advanced searches, not just `keywords` and `hashtags`.

- [Filtered Stream: Build a Rule](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule)

For example, if you want to extract tweets with the hashtag "#ElonMusk" and the language of the tweeted content is English, you would create the following rule:

- `#ElonMusk lang:en`

Generating these filtering rules is simple at first glance, but the number of supported operators is so large that it's quite a painstaking task to look at the references for each rule you create. Also, there is a syntax specific to this filtering rule, and typos may occur when entering the rules manually.

So, [twitter_api_v2](https://github.com/twitter-dart/twitter-api-v2) provides [FilteringRule](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/FilteringRule-class.html) object that allows this filtering rule to be constructed safely and easily.

The previous filtering rule example would look like following with FilteringRule object.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

void main() {
  final rule = v2.FilteringRule.of()
      .matchHashtag('ElonMusk')
      .and()
      .matchLanguage(v2.Language.english);

  // -> #ElonMusk lang:en
  print(rule.build());
}
```

Okay, the specifications of this feature are difficult to explain in this `README` alone. For this reason, I have created a document for the **FilteringRule** object, which you should also review.

- [Getting Started with FilteringRule Object](https://github.com/twitter-dart/twitter-api-v2/tree/main/doc/getting-started-with-filtering-rule-object.md)

## 1.5. Contribution 🏆

If you would like to contribute to **twitter_api_v2**, please create an [issue](https://github.com/twitter-dart/twitter-api-v2/issues) or create a Pull Request.

There are many ways to contribute to the OSS. For example, the following subjects can be considered:

- There are request parameters or response fields that are not implemented.
- Documentation is outdated or incomplete.
- Have a better way or idea to achieve the functionality.
- etc...

You can see more details from resources below:

- [Contributor Covenant Code of Conduct](https://github.com/twitter-dart/twitter-api-v2/blob/main/CODE_OF_CONDUCT.md)
- [Contribution Guidelines](https://github.com/twitter-dart/twitter-api-v2/blob/main/CONTRIBUTING.md)
- [Style Guide](https://github.com/twitter-dart/twitter-api-v2/blob/main/STYLEGUIDE.md)

Or you can create a [discussion](https://github.com/twitter-dart/twitter-api-v2/discussions) if you like.

**Feel free to join this development, diverse opinions make software better!**

## 1.6. Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/myConsciousness"><img src="https://avatars.githubusercontent.com/u/13072231?v=4?s=100" width="100px;" alt="Kato Shinya / 加藤 真也"/><br /><sub><b>Kato Shinya / 加藤 真也</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=myConsciousness" title="Code">💻</a> <a href="#content-myConsciousness" title="Content">🖋</a> <a href="#data-myConsciousness" title="Data">🔣</a> <a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=myConsciousness" title="Documentation">📖</a> <a href="#design-myConsciousness" title="Design">🎨</a> <a href="#example-myConsciousness" title="Examples">💡</a> <a href="#fundingFinding-myConsciousness" title="Funding Finding">🔍</a> <a href="#ideas-myConsciousness" title="Ideas, Planning, & Feedback">🤔</a> <a href="#infra-myConsciousness" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="#maintenance-myConsciousness" title="Maintenance">🚧</a> <a href="#mentoring-myConsciousness" title="Mentoring">🧑‍🏫</a> <a href="#projectManagement-myConsciousness" title="Project Management">📆</a> <a href="#question-myConsciousness" title="Answering Questions">💬</a> <a href="https://github.com/twitter-dart/twitter-api-v2/pulls?q=is%3Apr+reviewed-by%3AmyConsciousness" title="Reviewed Pull Requests">👀</a> <a href="#security-myConsciousness" title="Security">🛡️</a> <a href="#translation-myConsciousness" title="Translation">🌍</a> <a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=myConsciousness" title="Tests">⚠️</a> <a href="#tutorial-myConsciousness" title="Tutorials">✅</a></td>
      <td align="center"><a href="https://github.com/andypiper"><img src="https://avatars.githubusercontent.com/u/552452?v=4?s=100" width="100px;" alt="Andy Piper"/><br /><sub><b>Andy Piper</b></sub></a><br /><a href="#content-andypiper" title="Content">🖋</a> <a href="#talk-andypiper" title="Talks">📢</a></td>
      <td align="center"><a href="https://github.com/XRayAdamo"><img src="https://avatars.githubusercontent.com/u/4430621?v=4?s=100" width="100px;" alt="Konstantin"/><br /><sub><b>Konstantin</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=XRayAdamo" title="Code">💻</a> <a href="#design-XRayAdamo" title="Design">🎨</a> <a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=XRayAdamo" title="Documentation">📖</a> <a href="#example-XRayAdamo" title="Examples">💡</a> <a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=XRayAdamo" title="Tests">⚠️</a></td>
      <td align="center"><a href="https://github.com/robertodoering"><img src="https://avatars.githubusercontent.com/u/20045287?v=4?s=100" width="100px;" alt="Roberto Doering"/><br /><sub><b>Roberto Doering</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=robertodoering" title="Code">💻</a> <a href="#design-robertodoering" title="Design">🎨</a> <a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=robertodoering" title="Documentation">📖</a> <a href="#example-robertodoering" title="Examples">💡</a> <a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=robertodoering" title="Tests">⚠️</a> <a href="#ideas-robertodoering" title="Ideas, Planning, & Feedback">🤔</a></td>
      <td align="center"><a href="https://github.com/niteshsh4rma"><img src="https://avatars.githubusercontent.com/u/58659088?v=4?s=100" width="100px;" alt="Nitesh Sharma"/><br /><sub><b>Nitesh Sharma</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=niteshsh4rma" title="Code">💻</a> <a href="#design-niteshsh4rma" title="Design">🎨</a> <a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=niteshsh4rma" title="Documentation">📖</a> <a href="#example-niteshsh4rma" title="Examples">💡</a> <a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=niteshsh4rma" title="Tests">⚠️</a> <a href="#ideas-niteshsh4rma" title="Ideas, Planning, & Feedback">🤔</a></td>
    </tr>
    <tr>
      <td align="center"><a href="https://github.com/ngoluuduythai"><img src="https://avatars.githubusercontent.com/u/12238262?v=4?s=100" width="100px;" alt="ngoluuduythai"/><br /><sub><b>ngoluuduythai</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=ngoluuduythai" title="Documentation">📖</a> <a href="#translation-ngoluuduythai" title="Translation">🌍</a></td>
      <td align="center"><a href="https://github.com/its-me-mahmud"><img src="https://avatars.githubusercontent.com/u/53822204?v=4?s=100" width="100px;" alt="Abdullah Al Mahmud"/><br /><sub><b>Abdullah Al Mahmud</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=its-me-mahmud" title="Documentation">📖</a> <a href="#translation-its-me-mahmud" title="Translation">🌍</a></td>
      <td align="center"><a href="https://github.com/omar6260"><img src="https://avatars.githubusercontent.com/u/82382673?v=4?s=100" width="100px;" alt="Oumar fall"/><br /><sub><b>Oumar fall</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=omar6260" title="Documentation">📖</a> <a href="#translation-omar6260" title="Translation">🌍</a></td>
      <td align="center"><a href="https://github.com/natastro"><img src="https://avatars.githubusercontent.com/u/17433156?v=4?s=100" width="100px;" alt="Natalie Stroud"/><br /><sub><b>Natalie Stroud</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=natastro" title="Documentation">📖</a> <a href="#translation-natastro" title="Translation">🌍</a></td>
      <td align="center"><a href="https://github.com/novas1r1"><img src="https://avatars.githubusercontent.com/u/2575205?v=4?s=100" width="100px;" alt="novas1r1"/><br /><sub><b>novas1r1</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=novas1r1" title="Documentation">📖</a> <a href="#translation-novas1r1" title="Translation">🌍</a> <a href="#ideas-novas1r1" title="Ideas, Planning, & Feedback">🤔</a></td>
    </tr>
    <tr>
      <td align="center"><a href="https://github.com/eltociear"><img src="https://avatars.githubusercontent.com/u/22633385?v=4?s=100" width="100px;" alt="Ikko Ashimine"/><br /><sub><b>Ikko Ashimine</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=eltociear" title="Documentation">📖</a></td>
      <td align="center"><a href="https://github.com/VinniciusJesus"><img src="https://avatars.githubusercontent.com/u/57817746?v=4?s=100" width="100px;" alt="Marcos Vinícius"/><br /><sub><b>Marcos Vinícius</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=VinniciusJesus" title="Documentation">📖</a> <a href="#translation-VinniciusJesus" title="Translation">🌍</a></td>
      <td align="center"><a href="https://github.com/MarkOSullivan94"><img src="https://avatars.githubusercontent.com/u/6950843?v=4?s=100" width="100px;" alt="Mark O'Sullivan"/><br /><sub><b>Mark O'Sullivan</b></sub></a><br /><a href="#ideas-MarkOSullivan94" title="Ideas, Planning, & Feedback">🤔</a></td>
      <td align="center"><a href="https://github.com/bors-ng"><img src="https://avatars.githubusercontent.com/u/24979321?v=4?s=100" width="100px;" alt="bors-ng"/><br /><sub><b>bors-ng</b></sub></a><br /><a href="#maintenance-bors-ng" title="Maintenance">🚧</a> <a href="https://github.com/twitter-dart/twitter-api-v2/pulls?q=is%3Apr+reviewed-by%3Abors-ng" title="Reviewed Pull Requests">👀</a></td>
      <td align="center"><a href="https://github.com/all-contributors"><img src="https://avatars.githubusercontent.com/u/46410174?v=4?s=100" width="100px;" alt="All Contributors"/><br /><sub><b>All Contributors</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=all-contributors" title="Documentation">📖</a></td>
    </tr>
    <tr>
      <td align="center"><a href="https://github.com/codecov"><img src="https://avatars.githubusercontent.com/u/8226205?v=4?s=100" width="100px;" alt="Codecov"/><br /><sub><b>Codecov</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=codecov" title="Tests">⚠️</a> <a href="#maintenance-codecov" title="Maintenance">🚧</a> <a href="#security-codecov" title="Security">🛡️</a></td>
      <td align="center"><a href="https://github.com/fossabot"><img src="https://avatars.githubusercontent.com/u/9543448?v=4?s=100" width="100px;" alt="FOSSA"/><br /><sub><b>FOSSA</b></sub></a><br /><a href="#maintenance-fossas" title="Maintenance">🚧</a> <a href="#security-fossas" title="Security">🛡️</a></td>
      <td align="center"><a href="https://github.com/yuto90"><img src="https://avatars.githubusercontent.com/u/53107639?v=4?s=100" width="100px;" alt="yuto90"/><br /><sub><b>yuto90</b></sub></a><br /><a href="#blog-yuto90" title="Blogposts">📝</a> <a href="#content-yuto90" title="Content">🖋</a> <a href="#example-yuto90" title="Examples">💡</a> <a href="#tutorial-yuto90" title="Tutorials">✅</a></td>
      <td align="center"><a href="https://github.com/normidar"><img src="https://avatars.githubusercontent.com/u/36730656?v=4?s=100" width="100px;" alt="normidar"/><br /><sub><b>normidar</b></sub></a><br /><a href="#ideas-normidar" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=normidar" title="Code">💻</a> <a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=normidar" title="Documentation">📖</a> <a href="#question-normidar" title="Answering Questions">💬</a></td>
      <td align="center"><a href="https://github.com/TSurkis"><img src="https://avatars.githubusercontent.com/u/10674270?v=4?s=100" width="100px;" alt="Tim Surkis"/><br /><sub><b>Tim Surkis</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/issues?q=author%3ATSurkis" title="Bug reports">🐛</a> <a href="#ideas-TSurkis" title="Ideas, Planning, & Feedback">🤔</a> <a href="#question-TSurkis" title="Answering Questions">💬</a> <a href="#userTesting-TSurkis" title="User Testing">📓</a></td>
    </tr>
    <tr>
      <td align="center"><a href="https://github.com/shinobi-art"><img src="https://avatars.githubusercontent.com/u/79818229?v=4?s=100" width="100px;" alt="shinobi-art"/><br /><sub><b>shinobi-art</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/issues?q=author%3Ashinobi-art" title="Bug reports">🐛</a> <a href="#question-shinobi-art" title="Answering Questions">💬</a></td>
      <td align="center"><a href="https://github.com/Tushar-Mishra999"><img src="https://avatars.githubusercontent.com/u/75738710?v=4?s=100" width="100px;" alt="Tushar Mishra"/><br /><sub><b>Tushar Mishra</b></sub></a><br /><a href="https://github.com/twitter-dart/twitter-api-v2/commits?author=Tushar-Mishra999" title="Code">💻</a></td>
      <td align="center"><a href="https://github.com/azkadev"><img src="https://avatars.githubusercontent.com/u/82513502?v=4?s=100" width="100px;" alt="Azka Full Snack Developer:)"/><br /><sub><b>Azka Full Snack Developer:)</b></sub></a><br /><a href="#question-azkadev" title="Answering Questions">💬</a> <a href="#ideas-azkadev" title="Ideas, Planning, & Feedback">🤔</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## 1.7. Support ❤️

The simplest way to show us your support is by **giving the project a star** at [GitHub](https://github.com/twitter-dart/twitter-api-v2) and [Pub.dev](https://pub.dev/packages/twitter_api_v2).

You can also support this project by **becoming a sponsor** on GitHub:

<div align="left">
  <p>
    <a href="https://github.com/sponsors/myconsciousness">
      <img src="https://cdn.ko-fi.com/cdn/kofi3.png?v=3" height="50" width="210" alt="myconsciousness" />
    </a>
  </p>
</div>

You can also show on your repository that your app is made with **twitter_api_v2** by using one of the following badges:

[![Powered by twitter_api_v2](https://img.shields.io/badge/Powered%20by-twitter_api_v2-00acee.svg)](https://github.com/twitter-dart/twitter-api-v2)
[![Powered by twitter_api_v2](https://img.shields.io/badge/Powered%20by-twitter_api_v2-00acee.svg?style=flat-square)](https://github.com/twitter-dart/twitter-api-v2)
[![Powered by twitter_api_v2](https://img.shields.io/badge/Powered%20by-twitter_api_v2-00acee.svg?style=for-the-badge)](https://github.com/twitter-dart/twitter-api-v2)

```
[![Powered by twitter_api_v2](https://img.shields.io/badge/Powered%20by-twitter_api_v2-00acee.svg)](https://github.com/twitter-dart/twitter-api-v2)
[![Powered by twitter_api_v2](https://img.shields.io/badge/Powered%20by-twitter_api_v2-00acee.svg?style=flat-square)](https://github.com/twitter-dart/twitter-api-v2)
[![Powered by twitter_api_v2](https://img.shields.io/badge/Powered%20by-twitter_api_v2-00acee.svg?style=for-the-badge)](https://github.com/twitter-dart/twitter-api-v2)
```

## 1.8. License 🔑

All resources of **twitter_api_v2** is provided under the `BSD-3` license.

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Ftwitter-dart%2Ftwitter-api-v2.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Ftwitter-dart%2Ftwitter-api-v2?ref=badge_large)

> **Note**</br>
> License notices in the source are strictly validated based on `.github/header-checker-lint.yml`. Please check [header-checker-lint.yml](https://github.com/twitter-dart/twitter-api-v2/tree/main/.github/header-checker-lint.yml) for the permitted standards.

## 1.9. More Information 🧐

**twitter_api_v2** was designed and implemented by **_Kato Shinya ([@myConsciousness](https://github.com/myConsciousness))_**.

- [Creator Profile](https://github.com/myConsciousness)
- [License](https://github.com/twitter-dart/twitter-api-v2/blob/main/LICENSE)
- [API Document](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/twitter_api_v2-library.html)
- [Release Note](https://github.com/twitter-dart/twitter-api-v2/releases)
- [Bug Report](https://github.com/twitter-dart/twitter-api-v2/issues)
