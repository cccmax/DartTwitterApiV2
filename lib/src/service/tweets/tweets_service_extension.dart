// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../response/twitter_response.dart';
import 'reply_setting.dart';
import 'tweet_data.dart';
import 'tweet_geo_param.dart';
import 'tweet_media_param.dart';
import 'tweet_param.dart';
import 'tweet_poll_param.dart';
import 'tweet_reply_param.dart';
import 'tweets_service.dart';

extension TweetServiceExtension on TweetsService {
  /// This is a convenience method for creating a reply.
  ///
  /// [tweetId] should be the ID of the tweet for which you want to
  /// create a reply. If [tweetId] is an empty string,
  /// an [ArgumentError] will always occur.
  ///
  /// ## Parameters
  ///
  /// - [tweetId]: The ID of the tweet for which you want to create
  ///              a reply.
  ///
  /// - [text]: Text of the Tweet being created.
  ///           This field is required if media.media_ids is not present.
  ///
  /// - [quoteTweetId]: Link to the Tweet being quoted.
  ///
  /// - [forSuperFollowersOnly]: Allows you to Tweet exclusively for
  ///                           [Super Followers](https://help.twitter.com/en/using-twitter/super-follows).
  ///
  /// - [replySetting]: Settings to indicate who can reply to the Tweet.
  ///                   Options include `mentionedUsers` and `following`.
  ///                   The default to `everyone`.
  ///
  /// - [directMessageDeepLink]: Tweets a link directly to a
  ///                            [Direct Message conversation](https://business.twitter.com/en/help/campaign-editing-and-optimization/public-to-private-conversation.html)
  ///                           with an account.
  ///
  /// - [media]: The object that contains media information being attached to
  ///            created Tweet. This is mutually exclusive from Quote Tweet ID
  ///            and Poll.
  ///
  /// - [geo]: A JSON object that contains location information for a Tweet.
  ///          You can only add a location to Tweets if you have geo enabled in
  ///          your profile settings. If you don't have geo enabled, you can
  ///          still add a location parameter in your request body, but it won't
  ///          get attached to your Tweet
  ///
  /// - [poll]: The object that contains options for a Tweet with a poll.
  ///           This is mutually exclusive from Media and Quote Tweet ID.
  ///
  /// - [reply]: The object that contains information of the Tweet being
  ///            replied to.
  ///
  /// - [excludeReplyUserIds]: A list of IDs of users you want to exclude
  ///                          from replies when you create a thread.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - tweet.write
  /// - users.read
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///     200 requests per 15-minute window per each authenticated user
  Future<TwitterResponse<TweetData, void>> createReply({
    required String tweetId,
    required String text,
    String? quoteTweetId,
    bool? forSuperFollowersOnly,
    ReplySetting? replySetting,
    String? directMessageDeepLink,
    TweetMediaParam? media,
    TweetGeoParam? geo,
    TweetPollParam? poll,
    List<String>? excludeReplyUserIds,
  }) async {
    if (tweetId.isEmpty) {
      throw ArgumentError(
        'The Tweet ID is required to create a reply.',
      );
    }

    return await createTweet(
      text: text,
      quoteTweetId: quoteTweetId,
      forSuperFollowersOnly: forSuperFollowersOnly,
      replySetting: replySetting,
      directMessageDeepLink: directMessageDeepLink,
      media: media,
      geo: geo,
      poll: poll,
      reply: TweetReplyParam(
        inReplyToTweetId: tweetId,
        excludeReplyUserIds: excludeReplyUserIds,
      ),
    );
  }

  /// Create a threaded tweet based on the [tweets] parameter.
  ///
  /// Threads are created in the order in which the [tweets] list is stored.
  /// This means that an element with an index of 0 will be the root tweet,
  /// and an element with `tweets.length - 1` will be the lowest threaded tweet.
  ///
  /// If the threaded tweet you are creating is a reply to a specific tweet,
  /// specify [TweetReplyParam] in the root [TweetParam].
  ///
  /// You can set a [TweetReplyParam] object to a non-root [TweetParam],
  /// but it will be ignored for non-root tweets. If the [tweets] element is
  /// less than 2, an [ArgumentError] is always raised because the requirement
  /// to create threaded tweets is not met.
  ///
  /// This method also internally uses [createTweet] to create a tweet.
  /// So, note that this means that if the rate limit for [createTweet] is
  /// reached using the [createThreads] method,
  /// `RateLimitExceededException` will always be raised.
  ///
  /// ## Parameters
  ///
  /// - [tweets]: List of tweet data to be posted when creating a thread.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/tweets
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - tweet.write
  /// - users.read
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///     200 requests per 15-minute window per each authenticated user
  Future<List<TwitterResponse<TweetData, void>>> createThreads({
    required List<TweetParam> tweets,
  }) async {
    if (tweets.length < 2) {
      throw ArgumentError(
        'At least 2 tweet datasets are required to create a threaded tweet.',
      );
    }

    final responses = <TwitterResponse<TweetData, void>>[];

    final root = tweets.first;
    final rootTweet = await createTweet(
      text: root.text,
      quoteTweetId: root.quoteTweetId,
      forSuperFollowersOnly: root.forSuperFollowersOnly,
      replySetting: root.replySetting,
      directMessageDeepLink: root.directMessageDeepLink,
      media: root.media,
      geo: root.geo,
      poll: root.poll,
      reply: root.reply,
    );

    responses.add(rootTweet);

    String parentTweetId = rootTweet.data.id;
    for (final tweet in tweets.sublist(1)) {
      final childTweet = await createReply(
        tweetId: parentTweetId,
        text: tweet.text,
        quoteTweetId: tweet.quoteTweetId,
        forSuperFollowersOnly: tweet.forSuperFollowersOnly,
        replySetting: tweet.replySetting,
        directMessageDeepLink: tweet.directMessageDeepLink,
        media: tweet.media,
        geo: tweet.geo,
        poll: tweet.poll,
        excludeReplyUserIds: tweet.reply?.excludeReplyUserIds,
      );

      responses.add(childTweet);

      parentTweetId = childTweet.data.id;
    }

    return responses;
  }
}
