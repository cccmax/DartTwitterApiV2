# Release Note

## v4.9.4

- Fixed some named parameters as nullable. ([#657](https://github.com/twitter-dart/twitter-api-v2/issues/657))

## v4.9.3

- Added `exclude` parameter to `TweetsService.lookupQuoteTweets`. ([#647](https://github.com/twitter-dart/twitter-api-v2/issues/647))

## v4.9.2

- Added `202 Accepted` in `HttpStatus`. ([#651](https://github.com/twitter-dart/twitter-api-v2/issues/651))

## v4.9.1

- Added `verifiedType` in `UserField`. ([#646](https://github.com/twitter-dart/twitter-api-v2/issues/646))

## v4.9.0

- The return type of `TwitterResponse<bool, void>` has been modified to assign an object corresponding to each endpoint. ([#644](https://github.com/twitter-dart/twitter-api-v2/issues/644))

## v4.8.3

- Exposed `Serializable`. ([#641](https://github.com/twitter-dart/twitter-api-v2/issues/641))

## v4.8.2

- Added `valueOf` method in Enum objects. You can convert from a string returned from the API to an Enum. ([#635](https://github.com/twitter-dart/twitter-api-v2/issues/635))
- Added `HttpStatus`, `headers`, and `request` to response information. ([#637](https://github.com/twitter-dart/twitter-api-v2/issues/637))

## v4.8.1

- Supported `GET users/profile_banner`. ([#590](https://github.com/twitter-dart/twitter-api-v2/issues/590))

## v4.8.0

- Supported `POST account/update_profile_image`. ([#617](https://github.com/twitter-dart/twitter-api-v2/issues/617))
- Supported `POST account/update_profile_banner`. ([#614](https://github.com/twitter-dart/twitter-api-v2/issues/614))
- Supported `POST account/remove_profile_banner`. ([#616](https://github.com/twitter-dart/twitter-api-v2/issues/616))
- Supported `POST users/report_spam`. ([#618](https://github.com/twitter-dart/twitter-api-v2/issues/618))
- Fixed `tweets.searchRecent` to work with user context tokens as well as AppOnly tokens. ([#619](https://github.com/twitter-dart/twitter-api-v2/issues/619))
- Supported `POST account/update_profile`. ([#615](https://github.com/twitter-dart/twitter-api-v2/issues/615))

## v4.7.1

- Upgraded dependencies.

## v4.7.0

- Reintegrated core packages. ([#598](https://github.com/twitter-dart/twitter-api-v2/issues/598))
- Supported retry algorithm have been changed to only `Exponential BackOff and Jitter` recommended by official Twitter. All of the following factory constructors provided until now are deprecated and should be modified by `v5.0.0` to use the default constructor of `RetryConfig`. The following deprecated factory constructors will be removed in `v5.0.0`, and the `Exponential BackOff and Jitter` algorithm will always be used regardless of constructor. ([#601](https://github.com/twitter-dart/twitter-api-v2/issues/601))
  - `ofRegularIntervals`
  - `ofExponentialBackOff`
  - `ofExponentialBackOffAndJitter`
- For endpoints that can use both OAuth 2.0 and OAuth 1.0a authentication methods, the resolution of both has been improved. Starting with this version, OAuth 2.0 is the highest priority authentication method. For example, if OAuth 2.0 and OAuth 1.0a tokens are specified at the same time, the OAuth 2.0 client is always used for v2 endpoints. ([#596](https://github.com/twitter-dart/twitter-api-v2/issues/596))
- A utility has been added to this package to allow access token refresh. `OAuthUtils.refreshAccessToken` can be used to refresh access tokens issued by OAuth 2.0 PKCE. ([#604](https://github.com/twitter-dart/twitter-api-v2/issues/604))

## v4.6.1

- Internal processing has been improved to set `false` in the data field of `TwitterResponse` when a `403` error is returned in `POST`, `PUT` and `DELETE` communication. ([#592](https://github.com/twitter-dart/twitter-api-v2/issues/592))

## v4.6.0

- Supported `Trends` service. ([#582](https://github.com/twitter-dart/twitter-api-v2/issues/582))
  - `GET /1.1/trends/place.json`
  - `GET /1.1/trends/available.json`
  - `GET /1.1/trends/closest.json`
- Supported `/1.1/geo/reverse_geocode.json` endpoint for `Geo` service. ([#584](https://github.com/twitter-dart/twitter-api-v2/issues/584))

## v4.5.0

- Supported `Geo` service. ([#578](https://github.com/twitter-dart/twitter-api-v2/issues/578))
  - `GET /1.1/geo/search.json`
  - `GET /1.1/geo/id/$placeId.json`

## v4.4.4

- Supported additional language codes. ([#570](https://github.com/twitter-dart/twitter-api-v2/issues/570))
  - `qam` for tweets with mentions only (works for tweets since 2022-06-14)
  - `qct` for tweets with cashtags only (works for tweets since 2022-06-14)
  - `qht` for tweets with hashtags only (works for tweets since 2022-06-14)
  - `qme` for tweets with media links (works for tweets since 2022-06-14)
  - `qst` for tweets with a very short text (works for tweets since 2022-06-14)
  - `zxx` for tweets with either media or Twitter Card only, without any additional text (works for tweets since 2022-06-14)

## v4.4.3

- Fixed a bug that `TweetEditControls.remainingCount` had a different type. ([#571](https://github.com/twitter-dart/twitter-api-v2/issues/571))
- Fixed to exclude null fields when performing `toJson` on `TwitterResponse` and other model objects. With this fix, the JSON obtained from `toJson` is now fully equivalent to the raw JSON returned by Twitter. ([#569](https://github.com/twitter-dart/twitter-api-v2/issues/569))

## v4.4.2

- Improved internal process for checking rate limit. ([#562](https://github.com/twitter-dart/twitter-api-v2/issues/562))
- Supported `entity:` filtering rule operator. You can use this operator with following methods. ([#557](https://github.com/twitter-dart/twitter-api-v2/issues/557))
  - `matchEntity`
  - `notMatchEntity`
- Supported `context:` filtering rule operator. You can use this operator with following methods. ([#556](https://github.com/twitter-dart/twitter-api-v2/issues/556))
  - `matchContext`
  - `notMatchContext`
- Added documentation about `FilteringRule` object. ([#558](https://github.com/twitter-dart/twitter-api-v2/issues/558))
  - [Filtered Stream: Build a Rule](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule)

## v4.4.1

- Fixed bug that retry count does not increment correctly. ([#560](https://github.com/twitter-dart/twitter-api-v2/issues/560))

## v4.4.0

- Added service for `Direct Message`. You can use endpoints for `Direct Message` using by `TwitterApi.directMessages` property.
- Added `Direct Messages Lookup`. ([#533](https://github.com/twitter-dart/twitter-api-v2/issues/533))
  - `GET /2/dm_events`
  - `GET /2/dm_conversations/with/:participant_id/dm_events`
  - `GET /2/dm_conversations/:dm_conversation_id/dm_events`
- Added `Manage Direct Messages`. ([#534](https://github.com/twitter-dart/twitter-api-v2/issues/534))
  - `POST /2/dm_conversations/:dm_conversation_id/messages`
  - `POST /2/dm_conversations/with/:participant_id/messages`
  - `POST /2/dm_conversations`
- Removed deprecated property and constructor.
  - Removed `UploadedMediaData.mediaId` and use `UploadedMediaData.id` instead.
  - `FilteringRule.sampleOf` and use `FilteringRule.ofSample` instead.
- Supported upload media for direct message. Please specify `MediaCategory.directMessage` to the option in `MediaService.uploadMedia`. ([#547](https://github.com/twitter-dart/twitter-api-v2/issues/547))

## v4.3.5

- `TwitterUploadException` extended `TwitterException`. ([#510](https://github.com/twitter-dart/twitter-api-v2/issues/510))
- `UnauthorizedException` extended `TwitterException`. ([#528](https://github.com/twitter-dart/twitter-api-v2/issues/528))
- Added `DataNotFoundException`. This exception extends `TwitterException` and is thrown when there is no response body or the response body does not contain a data field. In other words, this exception is thrown when the target tweet does not exist when searching for a specific tweet, etc. ([#490](https://github.com/twitter-dart/twitter-api-v2/issues/490))

## v4.3.4

- Added support for an endpoint that associates uploaded videos with subtitles. ([#437](https://github.com/twitter-dart/twitter-api-v2/issues/437))
  - `media.createSubtitle`
- Added support for an endpoint to delete subtitles associated with uploaded videos. ([#436](https://github.com/twitter-dart/twitter-api-v2/issues/436))
  - `media.destroySubtitle`

## v4.3.3

- Supported upload for caption files (.srt). You can upload caption files by using `uploadMedia`. ([#508](https://github.com/twitter-dart/twitter-api-v2/issues/508))
- Renamed enumeration from `TweetLanguage` to `Language`. Please replace name if you're using `TweetLanguage`.

## v4.3.2

- Deprecated `FilteringRule.sampleOf` and added `FilteringRule.ofSample`. Deprecated `FilteringRule.sampleOf` will be removed in v4.4.0. ([#515](https://github.com/twitter-dart/twitter-api-v2/issues/515))

## v4.3.1

- Deprecated `UploadedMediaData.mediaId` and added `UploadedMediaData.id`. Use `UploadedMediaData.id` and `UploadedMediaData.mediaId` will be removed in v4.4.0.

## v4.3.0

- Removed deprecated methods.
  - Use `tweets.connectSampleStream` instead of `tweets.connectVolumeStream`.
  - Use `tweets.createThreads` instead of `createThreadTweets`.
- Added `WithheldCountry` enum. This is an enumeration that supports country codes according to the ISO Alpha2 standard, an international standard, as well as `XX` (all countries) and `XY` (DMCA Request), which are supported by Twitter. With the addition of this enumeration, the following response object types have been modified to be safer. Also, refactored field names. ([#500](https://github.com/twitter-dart/twitter-api-v2/issues/500))
  - From `TweetWithheld.countryCodes` to `TweetWithheld.countries`
  - From `UserWithheld.countryCodes` to `UserWithheld.countries`
- Added an object that allows easy and safe generation of filtering rules for FilteredStream. You can generate filtering rules fluently and easily from the `FilteringRule` object. ([#248](https://github.com/twitter-dart/twitter-api-v2/issues/248))

## v4.2.4

- Renamed from `createThread` to `createReply`.

## v4.2.3

- Fixed dependency structure.

## v4.2.2

- Added `tweets.createThreads` method and deprecated `tweets.createThreadTweets`. ([#495](https://github.com/twitter-dart/twitter-api-v2/issues/495))
- Added `tweets.createThread` method. You can create a single threaded tweet safely with this method.

## v4.2.1

- Added detail information in `RateLimitExceededException`. Also, now it extends `TwitterException`.
- Added `tweets.createThreadTweets` method. You can create threaded tweets with this method in a very simple way. ([#411](https://github.com/twitter-dart/twitter-api-v2/issues/411))

## v4.2.0

- Deprecated properties in `TwitterApi` below and added new properties. It will be removed in v5.0.0, so please replace them to new property names. ([#483](https://github.com/twitter-dart/twitter-api-v2/issues/483))
  - From `tweetsService` to `tweets`
  - From `usersService` to `users`
  - From `spacesService` to `spaces`
  - From `listsService` to `lists`
  - From `mediaService` to `media`
  - From `complianceService` to `compliance`
- For endpoints that can be paged, a callback function has been added to allow safe paging. Bidirectional or unidirectional paging can be performed by specifying the `paging` callback function in the following methods. ([#477](https://github.com/twitter-dart/twitter-api-v2/issues/477))
  - `Tweets Service`
    - [lookupLikingUsers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupLikingUsers.html)
    - [lookupLikedTweets](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupLikedTweets.html)
    - [lookupRetweetedUsers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupRetweetedUsers.html)
    - [lookupQuoteTweets](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupQuoteTweets.html)
    - [lookupMentions](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupMentions.html)
    - [lookupTweets](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupTweets.html)
    - [lookupHomeTimeline](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/lookupHomeTimeline.html)
    - [searchRecent](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/searchRecent.html)
    - [searchAll](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/searchAll.html)
    - [countAll](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/TweetsService/countAll.html)
  - `Users Service`
    - [lookupFollowers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupFollowers.html)
    - [lookupFollowings](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupFollowings.html)
    - [lookupMutingUsers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupMutingUsers.html)
    - [lookupBlockingUsers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/UsersService/lookupBlockingUsers.html)
  - `Lists Service`
    - [lookupOwnedBy](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupOwnedBy.html)
    - [lookupTweets](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupTweets.html)
    - [lookupFollowers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupFollowers.html)
    - [lookupFollowedLists](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupFollowedLists.html)
    - [lookupMembers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupMembers.html)
    - [lookupMemberships](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/ListsService/lookupMemberships.html)

## v4.1.5

- Added `TweetEditControls` object. This object holds information about the editing of tweets. You can use it from `TweetData.editControls`, and also you must pass the `editControls` element to `tweetFields`. ([#472](https://github.com/twitter-dart/twitter-api-v2/issues/472))
- Added `editHistoryTweetIds` field in `TweetData`. ([#471](https://github.com/twitter-dart/twitter-api-v2/issues/471))

## v4.1.4

- Renamed object from `ComplianceData` to `BatchComplianceData`. If you are using the object name `ComplianceData` explicitly, modify it to `BatchComplianceData`. ([#462](https://github.com/twitter-dart/twitter-api-v2/issues/462))
- Deprecated `connectVolumeStream` and added `connectSampleStream` instead. Please replace method name from `connectVolumeStream` to `connectSampleStream`. ([#479](https://github.com/twitter-dart/twitter-api-v2/issues/479))
- Supported `connectSample10Stream` in Tweets Service. This feature is available to Enterprise levels of access. Also, this is commonly referred to as the **Decahose**. ([#473](https://github.com/twitter-dart/twitter-api-v2/issues/473))

## v4.1.3

- Added the feature to set Alt Text when uploading media. Please set the Alt Text you want to set to the argument `altText` of the following method within 1000 characters. However, Alt Text can be set only for images and GIFs. Alt Text for videos will be ignored. ([#435](https://github.com/twitter-dart/twitter-api-v2/issues/435))
  - `uploadImage`
  - `uploadMedia`

## v4.1.2

- Improved handling of `uploadMedia` method when using the `onProgress` callback. In previous versions, if the media upload was completed immediately, the `completed` event would not be notified, but from this version you will always get a `completed` event at the end of process. ([#466](https://github.com/twitter-dart/twitter-api-v2/issues/466))
- Added `onFailed` callback to `uploadMedia` method. You can check error information when upload is failed. ([#456](https://github.com/twitter-dart/twitter-api-v2/issues/456))

## v4.1.1

- Added a callback function to check the progress of uploading large media from `uploadMedia`. You can get the `state` of the upload and the `progress` in percent from the `UploadEvent` object passed from the callback function. ([#454](https://github.com/twitter-dart/twitter-api-v2/issues/454))

## v4.1.0

- Supported the upload media (GIF, Video...). ([#434](https://github.com/twitter-dart/twitter-api-v2/issues/434))

## v4.0.2

- Fixed the process for response from the `uploadImage` method so that the rate limit is set correctly. ([#447](https://github.com/twitter-dart/twitter-api-v2/issues/447))

## v4.0.1

- The utility has been added to check if the rate has been exceeded or not. You can use these methods from `RateLimit` object. ([#444](https://github.com/twitter-dart/twitter-api-v2/issues/444))
  - `isExceeded`
  - `isNotExceeded`

## v4.0.0

### New Feature

- Supported the feature for getting the rate limit of each endpoints from response. Now you can get `RateLimit` object from response and it has `limitCount`, `remainingCount` and `resetAt` fields. ([#440](https://github.com/twitter-dart/twitter-api-v2/issues/440))

### Destructive Change

- It was necessary to modify the response structure for endpoints that use `Stream` to include a `RateLimit` object in each endpoint response. The modified methods are following.
  - `connectVolumeStream`
  - `connectFilteredStream`

- Also, methods that previously returned the result of processing as a `bool` have been modified to return a `TwitterResponse`. This is to have a `RateLimit` object as above. So, for example, the `createLike` method can also obtain a `RateLimit` object, and the `bool` value of the processing result can be obtained from the TwitterResponse's `data` field.

And now the responses from the modified methods can be used as follows:

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(bearerToken: 'YOUR_TOKEN_HERE');

  try {
    final response = await twitter.tweetsService.connectFilteredStream();
    print(response.rateLimit);

    final stream = response.stream;
    await for (final event in stream.handleError(print)) {
      print(event);
    }
  } on v2.TwitterException catch (e) {
    print(e);
  }
}
```

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  final twitter = v2.TwitterApi(bearerToken: 'YOUR_TOKEN_HERE');

  try {
    final me = await twitter.usersService.lookupMe();
    final tweets = await twitter.tweetsService.searchRecent(query: '#ElonMusk');

    final response = await twitter.tweetsService.createLike(
      userId: me.data.id,
      tweetId: tweets.data.first.id,
    );

    print(response.rateLimit);
    print(response.data); // true or false
  } on v2.TwitterException catch (e) {
    print(e);
  }
}
```

## v3.2.3

- Refactored the internal process for `MediaService`.

## v3.2.2

- Exposed objects below.
  - `MediaService`
  - `UploadedMediaData`

## v3.2.1

- Renamed from `MediaService.uploadMedia` to `MediaService.uploadImage`. Also, renamed the parameter from `imageFile` to `file`. ([#427](https://github.com/twitter-dart/twitter-api-v2/issues/427))

## v3.2.0

- Added `MediaService`, and supported the feature for image upload. ([#406](https://github.com/twitter-dart/twitter-api-v2/issues/406))

## v3.1.0

- The following refactoring was done for the internal processing of the package. There are no disruptive changes resulting from this refactoring. ([#419](https://github.com/twitter-dart/twitter-api-v2/issues/419))
  - Generic features has been separated into a `core` package.
  - `const` is now given to the constructors of all objects that do not require rebuilding after the instance has been created.

## v3.0.4

- The constructor of `RetryConfig` has been modified. ([#409](https://github.com/twitter-dart/twitter-api-v2/issues/409))
  - **Deprecated**
    - `regularIntervals`
    - `exponentialBackOff`
    - `exponentialBackOffAndJitter`
  - **Use instead**
    - `ofRegularIntervals`
    - `ofExponentialBackOff`
    - `ofExponentialBackOffAndJitter`

## v3.0.3

- Fixed the `linkClickCount` field in the following metric objects to be nullable. ([#407](https://github.com/twitter-dart/twitter-api-v2/issues/407))
  - `OrganicTweetMetrics`
  - `PrivateTweetMetrics`
  - `PromotedTweetMetrics`

## v3.0.2

- Fixed analyzing warnings. ([#403](https://github.com/twitter-dart/twitter-api-v2/issues/403))

## v3.0.1

- Fixed repository link in pubspec.yaml. ([#396](https://github.com/twitter-dart/twitter-api-v2/issues/396))

## v3.0.0

- Improved specification of data returned from POST, DELETE, and PUT communication endpoints. The previous specification always returned true regardless of whether the process was successful or not, but now returns false if an `errors` object exists in the response. ([#381](https://github.com/twitter-dart/twitter-api-v2/issues/381))

### Breaking Changes

- Changed return type of `destroyFilteringRules` from `FilteringRuleMeta` to `bool`. This is because there is no use for the `FilteringRuleMeta` object that was returned after the deletion of a filtering rule in the previous specification. If the deletion succeeds, true is returned; if the deletion fails for some reason, false is returned. ([#382](https://github.com/twitter-dart/twitter-api-v2/issues/382))

## v2.10.0

- Fixed to raise `TwitterException` if response object cannot be converted to JSON. ([#347](https://github.com/twitter-dart/twitter-api-v2/issues/347))
- Enforced the specification of access token in `OAuth 2.0` or `OAuth 1.0a` method when creating an instance of `TwitterApi` object. If either access token is not passed, an `ArgumentError` will be thrown. ([#352](https://github.com/twitter-dart/twitter-api-v2/issues/352))
- Added `UnauthorizedException`. Thrown when unauthorized with the specified access token. ([#348](https://github.com/twitter-dart/twitter-api-v2/issues/348))
- Added **Automatic Retry** feature. **Automatic retry** can be enabled by setting `RetryConfig` when creating the `TwitterApi` object. If `RetryConfig` is not passed to the `TwitterApi` object, automatic retry will not be triggered. ([#251](https://github.com/twitter-dart/twitter-api-v2/issues/251))
  - Regular Intervals
  - Exponential Backoff
  - Exponential Backoff and Jitter

## v2.9.0

- Added `state` parameter for `SpacesService.search`. ([#324](https://github.com/twitter-dart/twitter-api-v2/issues/324))
- Added `topicFields` parameters. ([#185](https://github.com/twitter-dart/twitter-api-v2/issues/185))
  - GET /2/spaces/search
  - GET /2/spaces
  - GET /2/spaces/:id
  - GET /2/spaces/by/creator_ids
- Added `SpaceExpansion.topicIds`. ([#185](https://github.com/twitter-dart/twitter-api-v2/issues/185))
- Added `ended` element for `SpaceState`. ([#333](https://github.com/twitter-dart/twitter-api-v2/issues/333))
- Removed HTTP status code checking process. With this modification, no exception will be thrown if, for example, you try to retweet a particular tweet and the tweet has already been deleted by its owner. However, a `TwitterException` will still be thrown if there is no Data field in the response. ([#329](https://github.com/twitter-dart/twitter-api-v2/issues/329))
- Added `RateLimitExceededException`. ([#331](https://github.com/twitter-dart/twitter-api-v2/issues/329))

## v2.8.1

- Changed the field type of `TweetPollParam`'s `durationInMinutes` to `Duration` and changed the name to `duration`. ([#322](https://github.com/twitter-dart/twitter-api-v2/issues/322))

## v2.8.0

### Breaking Changes

- Migration is required for fields that existed in previous versions due to objectification of some of the `createTweet` request parameters. ([#304](https://github.com/twitter-dart/twitter-api-v2/issues/304))
  - Use `TweetMediaParam` object to specify `mediaIds` and `taggedUserIds`.
  - Use `TweetReplyParam` object to specify `inReplyToTweetId`
- Migration is required for `createFilteringRules`. ([#312](https://github.com/twitter-dart/twitter-api-v2/issues/312))
  - Use `FilteringRuleParam` object to specify filtering rules.

### Bug Fixes

- Removed `expansions` parameter from `createTweet` method because this is not the supported parameter. ([#288](https://github.com/twitter-dart/twitter-api-v2/issues/288))

### New Features

- Added `timeout` option to `TwitterApi`. The default timeout duration is **10 seconds**. ([#252](https://github.com/twitter-dart/twitter-api-v2/issues/252))
- Added `sortOrder` parameter to `TweetsService.searchRecent` and `TweetsService.searchAll`. ([#284](https://github.com/twitter-dart/twitter-api-v2/issues/284))
- Added `startTime` and `endTime` parameters. ([#240](https://github.com/twitter-dart/twitter-api-v2/issues/240))
  - GET /2/tweets/search/all
  - GET /2/tweets/search/recent
  - GET /2/users/:id/mentions
  - GET /2/users/:id/timelines/reverse_chronological
  - GET /2/users/:id/tweets
  - GET /2/tweets/counts/all
  - GET /2/tweets/counts/recent
- Added `variants` field to `MediaData` object. You can get this field by using `MediaField.variants`. ([#265](https://github.com/twitter-dart/twitter-api-v2/issues/265))
- Added `sinceTweetId` parameter. ([#285](https://github.com/twitter-dart/twitter-api-v2/issues/285))
  - GET /2/tweets/search/all
  - GET /2/tweets/search/recent
- Added `untilTweetId` parameter. ([#286](https://github.com/twitter-dart/twitter-api-v2/issues/286))
  - GET /2/tweets/search/all
  - GET /2/tweets/search/recent
- Added `directMessageDeepLink` parameter to `createTweet`. ([#279](https://github.com/twitter-dart/twitter-api-v2/issues/279))
- Added `geo` parameter to `createTweet`. ([#280](https://github.com/twitter-dart/twitter-api-v2/issues/280))([#304](https://github.com/twitter-dart/twitter-api-v2/issues/304))
- Added `poll` parameter to `createTweet`. ([#282](https://github.com/twitter-dart/twitter-api-v2/issues/282))([#304](https://github.com/twitter-dart/twitter-api-v2/issues/304))
- Added objects for request parameter of `createTweet`. ([#304](https://github.com/twitter-dart/twitter-api-v2/issues/304))
  - `TweetMediaParam`
  - `TweetGeoParam`
  - `TweetPollParam`
  - `TweetReplyParam`
- Added `sinceTweetId` and `untilTweetId` parameters to `countAll` and `countRecent`. ([#311](https://github.com/twitter-dart/twitter-api-v2/issues/311))
  - GET /2/tweets/counts/all
  - GET /2/tweets/counts/recent
- Added `granularity` parameter to `countAll` and `countRecent`. ([#310](https://github.com/twitter-dart/twitter-api-v2/issues/310))
  - GET /2/tweets/counts/all
  - GET /2/tweets/counts/recent
- Added `sinceTweetId` and `untilTweetId` parameters to `TweetsService.lookupTweets`. ([#309](https://github.com/twitter-dart/twitter-api-v2/issues/309))
- Added `excludes` parameter to `TweetsService.lookupTweets`. ([#308](https://github.com/twitter-dart/twitter-api-v2/issues/308))
- Added `sinceTweetId` and `untilTweetId` parameters to `lookupHomeTimeline`. ([#307](https://github.com/twitter-dart/twitter-api-v2/issues/307))
- Added `excludes` parameter to `lookupHomeTimeline`. ([#306](https://github.com/twitter-dart/twitter-api-v2/issues/306))
- Added `sinceTweetId` and `untilTweetId` parameters to `lookupMentions`. ([#305](https://github.com/twitter-dart/twitter-api-v2/issues/305))

## v2.7.0

- Added metrics field for `TweetField`. ([#268](https://github.com/twitter-dart/twitter-api-v2/issues/268))
  - `non_public_metrics`
  - `organic_metrics`
  - `promoted_metrics`
- The `toJson` method of the response data object has been improved. Nested objects are now converted to JSON at the same time as the parent object's `toJson`. ([#272](https://github.com/twitter-dart/twitter-api-v2/issues/272))
- Added `toJson` method to `TwitterResponse`. ([#274](https://github.com/twitter-dart/twitter-api-v2/issues/274))

## v2.6.2

- Added dart documentations about authentication methods and required scopes. ([#263](https://github.com/twitter-dart/twitter-api-v2/issues/263))

## v2.6.1

- Added documents for response fields. ([#247](https://github.com/twitter-dart/twitter-api-v2/issues/247))

## v2.6.0

- Added `FilteredStreamResponse` as the return type of `Filtered Stream` endpoint. And now we can see the IDs and tags of the rules matched in the streaming from the `FilteredStreamResponse.matchingRules` field. The `FilteredStreamResponse` extends `TwitterResponse`, so there are no destructive changes. ([#226](https://github.com/twitter-dart/twitter-api-v2/issues/226))
- Added translated READMEs. ([#213](https://github.com/twitter-dart/twitter-api-v2/issues/213))
  - Japanese
  - French
  - Vietnamese
  - Bengali
- Added `mediaFields` arguments. ([#183](https://github.com/twitter-dart/twitter-api-v2/issues/183))
  - GET /2/users/:id/bookmarks
  - GET /2/tweets/search/stream
  - GET /2/tweets/:id/liking_users
  - GET /2/users/:id/liked_tweets
  - GET /2/tweets/:id/quote_tweets
  - GET /2/tweets/:id/retweeted_by
  - GET /2/tweets/search/all
  - GET /2/tweets/search/recent
  - GET /2/users/:id/mentions
  - GET /2/users/:id/timelines/reverse_chronological
  - GET /2/users/:id/tweets
  - GET /2/tweets
  - GET /2/tweets/:id
  - GET /2/tweets/sample/stream
  - GET /2/spaces/:id/buyers
  - GET /2/spaces/:id/tweets
- Added `mediaFields` arguments. ([#186](https://github.com/twitter-dart/twitter-api-v2/issues/186))
  - GET /2/users/:id/followed_lists
  - GET /2/lists/:id
  - GET /2/users/:id/owned_lists
  - GET /2/users/:id/list_memberships
  - GET /2/users/:id/pinned_lists

## v2.5.0

- Added `spaceFields` argument. ([#184](https://github.com/twitter-dart/twitter-api-v2/issues/184))
  - GET /2/spaces/search
  - GET /2/spaces
  - GET /2/spaces/:id
  - GET /2/spaces/by/creator_ids
- Added `pollFields` argument. ([#181](https://github.com/twitter-dart/twitter-api-v2/issues/181))
  - GET /2/users/:id/bookmarks
  - GET /2/tweets/search/stream
  - GET /2/tweets/:id/liking_users
  - GET /2/users/:id/liked_tweets
  - GET /2/tweets/:id/quote_tweets
  - GET /2/tweets/:id/retweeted_by
  - GET /2/tweets/search/all
  - GET /2/tweets/search/recent
  - GET /2/users/:id/mentions
  - GET /2/users/:id/timelines/reverse_chronological
  - GET /2/users/:id/tweets
  - GET /2/tweets
  - GET /2/tweets/:id
  - GET /2/tweets/sample/stream
  - GET /2/spaces/:id/buyers
  - GET /2/spaces/:id/tweets
- Added `placeFields` argument. ([#182](https://github.com/twitter-dart/twitter-api-v2/issues/182))
  - GET /2/users/:id/bookmarks
  - GET /2/tweets/search/stream
  - GET /2/tweets/:id/liking_users
  - GET /2/users/:id/liked_tweets
  - GET /2/tweets/:id/quote_tweets
  - GET /2/tweets/:id/retweeted_by
  - GET /2/tweets/search/all
  - GET /2/tweets/search/recent
  - GET /2/users/:id/mentions
  - GET /2/users/:id/timelines/reverse_chronological
  - GET /2/users/:id/tweets
  - GET /2/tweets
  - GET /2/tweets/:id
  - GET /2/tweets/sample/stream
  - GET /2/spaces/:id/buyers
  - GET /2/spaces/:id/tweets
- `PlaceData` class is migrated to `Geo` class, and updated `PlaceData` parameters.
- `PlaceCoordinates` class is migrated to `GeoCoordinates` class, and updated `PlaceCoordinates` parameters.
- Changed the type of `lang` field from `String?` to `TweetLanguage?`. ([#207](https://github.com/twitter-dart/twitter-api-v2/issues/207))

## v2.4.2

- Fixed field names in `UserData`. ([#202](https://github.com/twitter-dart/twitter-api-v2/issues/202))
  - From `protected` to `isProtected`.
  - From `verified` to `isVerified`.

## v2.4.1

- Fixed `README.md`. ([#200](https://github.com/twitter-dart/twitter-api-v2/issues/200))

## v2.4.0

- Added `userFields` argument. ([#180](https://github.com/twitter-dart/twitter-api-v2/issues/180))
  - GET /2/users/:id/bookmarks
  - GET /2/tweets/search/stream
  - GET /2/tweets/:id/liking_users
  - GET /2/users/:id/liked_tweets
  - GET /2/tweets/:id/quote_tweets
  - GET /2/tweets/search/all
  - GET /2/tweets/search/recent
  - GET /2/users/:id/mentions
  - GET /2/users/:id/timelines/reverse_chronological
  - GET /2/users/:id/tweetsGET /2/tweets
  - GET /2/tweets/:id
  - GET /2/tweets/sample/stream
  - GET /2/users/:id/blocking
  - GET /2/users/:id/followers
  - GET /2/users/:id/following
  - GET /2/users/:id/muting
  - GET /2/users
  - GET /2/users/:id
  - GET /2/users/by
  - GET /2/users/by/username/:username
  - GET /2/users/me
  - GET /2/spaces/search
  - GET /2/spaces
  - GET /2/spaces/:id
  - GET /2/spaces/:id/buyers
  - GET /2/spaces/:id/tweets
  - GET /2/spaces/by/creator_ids
  - GET /2/lists/:id/tweets
  - GET /2/lists/:id/followers
  - GET /2/users/:id/followed_lists
  - GET /2/lists/:id
  - GET /2/users/:id/owned_lists
  - GET /2/lists/:id/members
  - GET /2/users/:id/list_memberships
  - GET /2/users/:id/pinned_lists

## v2.3.0

- Added `tweetFields` argument. ([#179](https://github.com/twitter-dart/twitter-api-v2/issues/179))
  - GET /2/users/:id/bookmarks
  - GET /2/tweets/search/stream
  - GET /2/tweets/:id/liking_users
  - GET /2/users/:id/liked_tweets
  - GET /2/tweets/:id/quote_tweets
  - GET /2/tweets/:id/retweeted_by
  - GET /2/tweets/search/all
  - GET /2/tweets/search/recent
  - GET /2/users/:id/mentions
  - GET /2/users/:id/timelines/reverse_chronological
  - GET /2/users/:id/tweets
  - GET /2/tweets
  - GET /2/tweets/:id
  - GET /2/tweets/sample/stream
  - GET /2/users/:id/blocking
  - GET /2/users/:id/followers
  - GET /2/users/:id/following
  - GET /2/users/:id/muting
  - GET /2/users
  - GET /2/users/:id
  - GET /2/users/by
  - GET /2/users/by/username/:username
  - GET /2/users/me
  - GET /2/spaces/:id/buyers
  - GET /2/spaces/:id/tweets
  - GET /2/lists/:id/tweets
  - GET /2/lists/:id/members
- Changed object name from `ReferencedTweetData` to `ReferencedTweet`.
- Changed field type of `type` in `ReferencedTweet` to `TweetType` from `String`.
- Changed field type of `type` in `MediaData` to `MediaType` from `String.`
- Added `key` field to `MediaData`. It represents a unique identifier of the media.

## v2.2.0

- Added `Reverse Chronological Timelines` endpoint. ([#164](https://github.com/twitter-dart/twitter-api-v2/issues/164))
  - GET /2/users/:id/timelines/reverse_chronological
- Added `expansions` argument to `UsersService`. ([#142](https://github.com/twitter-dart/twitter-api-v2/issues/142))
  - GET /2/users/:id/blocking
  - GET /2/users/:id/followers
  - GET /2/users/:id/following
  - GET /2/users/:id/muting
  - GET /2/users
  - GET /2/users/:id
  - GET /2/users/by
  - GET /2/users/by/username/:username
  - GET /2/users/me
- Added `expansions` argument to `SpacesService`. ([#171](https://github.com/twitter-dart/twitter-api-v2/issues/171))
  - GET /2/spaces/search
  - GET /2/spaces
  - GET /2/spaces/:id
  - GET /2/spaces/:id/buyers
  - GET /2/spaces/:id/tweets
  - GET /2/spaces/by/creator_ids
- Added `expansions` argument to `ListsService`. ([#172](https://github.com/twitter-dart/twitter-api-v2/issues/172))
  - GET /2/lists/:id/tweets
  - GET /2/lists/:id/followers
  - GET /2/users/:id/followed_lists
  - GET /2/lists/:id
  - GET /2/users/:id/owned_lists
  - GET /2/lists/:id/members
  - GET /2/users/:id/list_memberships
  - GET /2/users/:id/pinned_lists
- Fixed method name from `tweetsService.connectVolumeStreams` to `tweetsService.connectVolumeStream`.
- Fixed return type of `tweetsService.connectVolumeStream` from `Future<Stream<TweetData>>` to `Future<Stream<TwitterResponse<TweetData, void>>>`.
- Added `Filtered Stream` endpoint. ([#4](https://github.com/twitter-dart/twitter-api-v2/issues/4))
  - GET /2/tweets/search/stream
  - GET /2/tweets/search/stream/rules
  - POST /2/tweets/search/stream/rules

## v2.1.0

- Added `expansions` argument to `TweetsService`. ([#141](https://github.com/twitter-dart/twitter-api-v2/issues/141))
  - [GET /2/users/:id/bookmarks](https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/get-users-id-bookmarks)
  - [GET /2/tweets/:id/liking_users](https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/get-tweets-id-liking_users)
  - [GET /2/users/:id/liked_tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/get-users-id-liked_tweets)
  - [GET /2/tweets/:id/quote_tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/quote-tweets/api-reference/get-tweets-id-quote_tweets)
  - [GET /2/tweets/:id](https://developer.twitter.com/en/docs/twitter-api/tweets/lookup/api-reference/get-tweets-id)
  - [GET /2/tweets/:id/retweeted_by](https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/api-reference/get-tweets-id-retweeted_by)
  - [GET /2/tweets/search/all](https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-all)
  - [GET /2/tweets/search/recent](https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent)
  - [GET /2/users/:id/mentions](https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/api-reference/get-users-id-mentions)
  - [GET /2/users/:id/tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/api-reference/get-users-id-tweets)
  - [GET /2/tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/lookup/api-reference/get-tweets)
- Added expanded fields to `TweetData`. ([#141](https://github.com/twitter-dart/twitter-api-v2/issues/141))
  - `authorId`
  - `inReplyToUserId`
  - `referencedTweets`
  - `entities`
  - `attachments`
  - `geo`
- Added `includes` field to `TwitterResponse`. ([#144](https://github.com/twitter-dart/twitter-api-v2/issues/144))
- With the addition of the `includes` field to `TwitterResponse`, the following objects have been added. ([#144](https://github.com/twitter-dart/twitter-api-v2/issues/144))
  - `MediaData`
  - `PollData`
- Added **Volume Stream** endpoint. ([#14](https://github.com/twitter-dart/twitter-api-v2/issues/14))
  - GET /2/tweets/sample/stream

## v2.0.0

- Exposed service classes. ([#122](https://github.com/twitter-dart/twitter-api-v2/issues/122)
  - `TweetsService`
  - `UsersService`
  - `ListsService`
  - `SpacesService`
  - `ComplianceService`
- Added arguments to `tweetsService.createTweet`. ([#130](https://github.com/twitter-dart/twitter-api-v2/issues/130)) ([#90](https://github.com/twitter-dart/twitter-api-v2/issues/90))
  - `inReplyToTweetId`
  - `replySetting`
  - `mediaIds`
  - `taggedUserIds`
- Improved processing when the data field does not exist in the response body returned from the Twitter API. ([#124](https://github.com/twitter-dart/twitter-api-v2/issues/124))
  - In previous versions, `POST` and `DELETE` communications for deleted content would raise a `TwitterException`, but this release has been modified to always return a boolean instead of an exception in this case.
- Internal processing has been refactored to improve scalability and maintainability. There are no disruptive changes as a result of this refactoring.
- Added convenience utility for OAuth. ([#102](https://github.com/twitter-dart/twitter-api-v2/issues/102))
  - `OAuthUtils.generateAppOnlyBearerToken`

## v1.8.0

- Added **Lists Manage** endpoints. ([#30](https://github.com/twitter-dart/twitter-api-v2/issues/30))
  - DELETE /2/lists/:id
  - PUT /2/lists/:id
  - POST /2/lists
- Added **Lists Follows** endpoints. ([#27](https://github.com/twitter-dart/twitter-api-v2/issues/27))
  - DELETE /2/users/:id/followed_lists/:list_id
  - GET /2/lists/:id/followers
  - GET /2/users/:id/followed_lists
  - POST /2/users/:id/followed_lists
- Added **Lists Members** endpoints. ([#29](https://github.com/twitter-dart/twitter-api-v2/issues/29))
  - DELETE /2/lists/:id/members/:user_id
  - GET /2/lists/:id/members
  - GET /2/users/:id/list_memberships
  - POST /2/lists/:id/members

## v1.7.0

- Added **Tweets Timelines** endpoints. ([#11](https://github.com/twitter-dart/twitter-api-v2/issues/11))
  - GET /2/users/:id/mentions
  - GET /2/users/:id/tweets
- Added **Users Blocks** endpoints. ([#20](https://github.com/twitter-dart/twitter-api-v2/issues/20))
  - DELETE /2/users/:source_user_id/blocking/:target_user_id
  - GET /2/users/:id/blocking
  - POST /2/users/:id/blocking
- Added **Lists Pinnings** endpoints. ([#31](https://github.com/twitter-dart/twitter-api-v2/issues/31))
  - DELETE /2/users/:id/pinned_lists/:list_id
  - GET /2/users/:id/pinned_lists
  - POST /2/users/:id/pinned_lists
- Added **Lists Tweet Lookup** endpoint. ([#26](https://github.com/twitter-dart/twitter-api-v2/issues/26))
  - GET /2/lists/:id/tweets

---

- Refactored method names. Prefixes for methods that perform `GET` communication other than the search endpoint have been unified with `lookup`. This makes it a destructive change, but please refer to the following correspondence table for details of the change.
  - **Tweets Service**
    - From `likingUsers` to `lookupLikingUsers`
    - From `likingTweets` to `lookupLikedTweets`
    - From `retweetedBy` to `lookupRetweetedUsers`
    - From `quoteTweets` to `lookupQuoteTweets`
    - From `bookmarks` to `lookupBookmarks`
  - **Users Service**
    - From `followers` to `lookupFollowers`
    - From `followings` to `lookupFollowings`
    - From `mutingUsers` to `lookupMutingUsers`
  - **Lists Service**
    - From `pinnedLists` to `lookupPinnedLists`

## v1.6.0

- Fixed a bug in `DELETE` communication.
- Improved error message from `TwitterException`. ([#93](https://github.com/twitter-dart/twitter-api-v2/issues/93))
- Added **Batch Compliance** endpoints. ([#32](https://github.com/twitter-dart/twitter-api-v2/issues/32))
  - GET /2/compliance/jobs
  - GET /2/compliance/jobs/:id
  - POST /2/compliance/jobs
- Added **Users Mutes** endpoints. ([#22](https://github.com/twitter-dart/twitter-api-v2/issues/22))
  - DELETE /2/users/:source_user_id/muting/:target_user_id
  - GET /2/users/:id/muting
  - POST /2/users/:id/muting
- Added **Tweets Hide Replies** endpoints. ([#5](https://github.com/twitter-dart/twitter-api-v2/issues/5))
  - PUT /2/tweets/:id/hidden

## v1.5.0

- Renamed method name in **TweetsService**. ([#79](https://github.com/twitter-dart/twitter-api-v2/issues/79))
  - Renamed method from `tweetsService.lookupTweet` to `tweetsService.lookupById.`
  - Renamed method from `tweetsService.lookupTweets` to `tweetsService.lookupByIds.`
- Added **Spaces Lookup** endpoints. ([#25](https://github.com/twitter-dart/twitter-api-v2/issues/25))
  - GET /2/spaces
  - GET /2/spaces/:id
  - GET /2/spaces/:id/buyers
  - GET /2/spaces/:id/tweets
  - GET /2/spaces/by/creator_ids
- Added **Lists Lookup** endpoints. ([#28](https://github.com/twitter-dart/twitter-api-v2/issues/28))
  - GET /2/lists/:id
  - GET /2/users/:id/owned_lists

## v1.4.0

- Fixed response handling.
  - The HTTP status of a response was regarded as an exception for data other than 200, but the HTTP status in the 200s is now regarded as a normal completion.
- Improved and added parameters for endpoints already implemented in this library. ([#66](https://github.com/twitter-dart/twitter-api-v2/issues/66))
  - Added parameters to `tweetsService.createTweet`.
    - `quoteTweetId`
    - `forSuperFollowersOnly`
  - Added a parameter to `tweetsService.linkingUsers`.
    - `maxResults`
  - Added a parameter to `tweetsService.linkingTweets`.
    - `maxResults`
  - Added a parameter to `tweetsService.retweetedBy`.
    - `maxResults`
  - Added a parameter to `tweetsService.quoteTweets`.
    - `maxResults`
  - Added a parameter to `tweetsService.searchRecent`.
    - `maxResults`
  - Added a parameter to `tweetsService.searchAll`.
    - `maxResults`
  - Added a parameter to `usersService.followers`.
    - `maxResults`
  - Added a parameter to `usersService.followings`.
    - `maxResults`

## v1.3.0

- Improved the error message from `TwitterException`. ([#48](https://github.com/twitter-dart/twitter-api-v2/issues/48))
- Added `previousToken` to `tweet_meta` and `tweet_count_meta`, and added `paginationToken` or `nextToken` argument for endpoints that support pagination. ([#60](https://github.com/twitter-dart/twitter-api-v2/issues/60))
- Added `previousToken` to `user_meta`, and added `paginationToken` argument for endpoints that support pagination. ([#60](https://github.com/twitter-dart/twitter-api-v2/issues/60))

## v1.2.0

- Fixed typo from `tweetService` to `tweetsService` in `TwitterApi`.
- Improved error handling. ([#41](https://github.com/twitter-dart/twitter-api-v2/issues/41))

## v1.1.0

- Added **Tweet Counts** endpoints. ([#12](https://github.com/twitter-dart/twitter-api-v2/issues/12))
  - GET /2/tweets/counts/all
  - GET /2/tweets/counts/recent
- Added **Tweet Bookmarks** endpoints. ([#2](https://github.com/twitter-dart/twitter-api-v2/issues/2))
  - GET /2/tweets/counts/all
  - GET /2/tweets/counts/recent
- Added **Users Lookup** endpoints. ([#23](https://github.com/twitter-dart/twitter-api-v2/issues/23))
  - GET /2/users
  - GET /2/users/:id
  - GET /2/users/by
  - GET /2/users/by/username/:username
  - GET /2/users/me
- Added **Spaces Search** endpoints. ([#23](https://github.com/twitter-dart/twitter-api-v2/issues/23))
  - GET /2/spaces/search

## v1.0.0

- Specification changes and improvements have been made to the authentication method. ([#44](https://github.com/twitter-dart/twitter-api-v2/issues/44))
- Added **Quote Tweets** endpoint. ([#8](https://github.com/twitter-dart/twitter-api-v2/issues/8))
  - GET /2/tweets/:id/quote_tweets
- Added **Tweets Search** endpoints. ([#10](https://github.com/twitter-dart/twitter-api-v2/issues/10))
  - GET /2/tweets/search/all
  - GET /2/tweets/search/recent
- Added **Tweets Lookup** endpoints. ([#13](https://github.com/twitter-dart/twitter-api-v2/issues/13))
  - GET /2/tweets
  - GET /2/tweets/:id

## v0.1.0

- Added **Tweets Likes** endpoints. ([#6](https://github.com/twitter-dart/twitter-api-v2/issues/6))
  - DELETE /2/users/:id/likes/:tweet_id
  - GET /2/tweets/:id/liking_users
  - GET /2/users/:id/liked_tweets
  - POST /2/users/:id/likes
- Added **Tweets Manage** endpoints. ([#7](https://github.com/twitter-dart/twitter-api-v2/issues/7))
  - DELETE /2/tweets/:id
  - POST /2/tweets
- Added **Tweets Retweet** endpoints. ([#9](https://github.com/twitter-dart/twitter-api-v2/issues/9))
  - DELETE /2/users/:id/retweets/:source_tweet_id
  - GET /2/tweets/:id/retweeted_by
  - POST /2/users/:id/retweets
- Added **Users Follows** endpoints. ([#21](https://github.com/twitter-dart/twitter-api-v2/issues/21))
  - DELETE /2/users/:source_user_id/following/:target_user_id
  - GET /2/users/:id/followers
  - GET /2/users/:id/following
  - POST /2/users/:id/following

## v0.0.1

- First Release
