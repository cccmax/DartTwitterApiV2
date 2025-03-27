// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../../../core/language.dart';
import '../channel/logical_channel.dart';
import '../filtering_rule_group.dart';
import '../operation/conjunction_required_operation.dart';
import 'standalone_syntax.dart';

/// The object representing the syntax of a conjunction required operator.
///
/// **Conjunction required operators** cannot be used by themselves in a rule;
/// they can only be used when at least one standalone operator is included
/// in the rule. This is because using these operators alone would be far
/// too general, and would match on an extremely high volume of Tweets.
abstract class ConjunctionRequiredSyntax extends StandaloneSyntax {
  /// Returns the new instance of [ConjunctionRequiredSyntax].
  const ConjunctionRequiredSyntax(super.buffer) : _buffer = buffer;

  /// The conjunction required operation
  static const _conjunctionRequiredOperation = ConjunctionRequiredOperation();

  /// The buffer
  final FilteringRuleGroup _buffer;

  /// Matches on Retweets that match the rest of the specified rule.
  ///
  /// This operator looks only for true Retweets
  /// (for example, those generated using the Retweet button).
  ///
  /// Quote Tweets will not be matched by this operator.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchRetweet() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createIsRetweet(),
      );

  /// The negated representation of [matchRetweet].
  LogicalChannel notMatchRetweet() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedIsRetweet(),
      );

  /// Deliver only explicit replies that match a rule.
  ///
  /// Can also be negated to exclude replies that match a rule from delivery.
  ///
  /// When used with the filtered stream, this operator matches on replies to
  /// an original Tweet, replies in quoted Tweets and replies in Retweets.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchReply() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createIsReply(),
      );

  /// The negated representation of [matchReply].
  LogicalChannel notMatchReply() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedIsReply(),
      );

  /// Returns all Quote Tweets, also known as Tweets with comments.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchQuote() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createIsQuote(),
      );

  /// The negated representation of [matchQuote].
  LogicalChannel notMatchQuote() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedIsQuote(),
      );

  /// Deliver only Tweets whose authors are verified by Twitter.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchVerifiedUser() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createIsVerified(),
      );

  /// The negated representation of [matchVerifiedUser].
  LogicalChannel notMatchVerifiedUser() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedIsVerified(),
      );

  /// Removes Tweets created for promotion only on ads.twitter.com that have a
  /// "source":"Twitter for Advertisers (legacy)" or "source":"Twitter for
  /// Advertisers".
  ///
  /// This operator must be negated.
  ///
  /// For more info on Nullcasted Tweets,
  /// see page on [Tweet availability](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/guides/tweet-availability).
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel notMatchNullcastTweet() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedIsNullCast(),
      );

  /// Matches Tweets that contain at least one hashtag.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetContainsHashtags() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createHasHashtags(),
      );

  /// The negated representation of [matchTweetContainsHashtags].
  LogicalChannel notMatchTweetContainsHashtags() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedHasHashtags(),
      );

  /// Matches Tweets that contain a cashtag symbol
  /// (with a leading ‘$’ character. For example, $tag).
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetContainsCashtags() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createHasCashtags(),
      );

  /// The negated representation of [matchTweetContainsCashtags].
  LogicalChannel notMatchTweetContainsCashtags() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedHasCashtags(),
      );

  /// This operator matches Tweets which contain links and media in the
  /// Tweet body.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetContainsLinks() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createHasLinks(),
      );

  /// The negated representation of [matchTweetContainsLinks].
  LogicalChannel notMatchTweetContainsLinks() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedHasLinks(),
      );

  /// Matches Tweets that mention another Twitter user.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetContainsMentions() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createHasMentions(),
      );

  /// The negated representation of [matchTweetContainsMentions].
  LogicalChannel notMatchTweetContainsMentions() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedHasMentions(),
      );

  /// Matches Tweets that contain a media object, such as a photo, GIF, or
  /// video, as determined by Twitter.
  ///
  /// This will not match on media created with Periscope,
  /// or Tweets with links to other media hosting sites.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetContainsMedia() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createHasMedia(),
      );

  /// The negated representation of [matchTweetContainsMedia].
  LogicalChannel notMatchTweetContainsMedia() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedHasMedia(),
      );

  /// Matches Tweets that contain a recognized URL to an image.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetContainsImages() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createHasImages(),
      );

  /// The negated representation of [matchTweetContainsImages].
  LogicalChannel notMatchTweetContainsImages() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedHasImages(),
      );

  /// Matches Tweets that contain native Twitter videos, uploaded directly to
  /// Twitter.
  ///
  /// This will not match on videos created with Periscope,
  /// or Tweets with links to other video hosting sites.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetContainsVideoLink() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createHasVideoLink(),
      );

  /// The negated representation of [matchTweetContainsVideoLink].
  LogicalChannel notMatchTweetContainsVideoLink() =>
      _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedHasVideoLink(),
      );

  /// Matches Tweets that have Tweet-specific geo location data
  /// provided by the Twitter user.
  ///
  /// This can be either a location in the form of a Twitter place,
  /// with the corresponding display name, geo polygon, and other fields,
  /// or in rare cases, a geo lat-long coordinate.
  ///
  /// > Note: Operators matching on place (Tweet geo) will only include matches
  /// > from original tweets. Retweets do not contain any place data.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetContainsGeo() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createHasGeo(),
      );

  /// The negated representation of [matchTweetContainsGeo].
  LogicalChannel notMatchTweetContainsGeo() => _buffer.appendSingletonOperator(
        _conjunctionRequiredOperation.createNegatedHasGeo(),
      );

  /// Matches Tweets that have been classified by Twitter as being of a
  /// particular language (if, and only if, the tweet has been classified).
  ///
  /// It is important to note that each Tweet is currently only classified as
  /// being of one language, so AND’ing together multiple languages will yield
  /// no results.
  ///
  /// You can only pass a single BCP 47 language identifier per this operator.
  ///
  /// > Note: if no language classification can be made the provided result
  /// is [core.TweetLanguage.undefined] (for undefined).
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchLanguage(final Language language) =>
      _buffer.appendOperator(
        _conjunctionRequiredOperation.createTweetLang(language),
      );

  /// The negated representation of [matchLanguage].
  LogicalChannel notMatchLanguage(final Language language) =>
      _buffer.appendOperator(
        _conjunctionRequiredOperation.createNegatedTweetLang(language),
      );

  /// Matches any Tweet generated by the given source application.
  ///
  /// The value must be either the name of the application or
  /// the application’s URL. Cannot be used alone.
  ///
  /// > Note: As a Twitter app developer, Tweets created programmatically
  /// > by your application will have the source of your application Name and
  /// > Website URL set in your app settings.
  ///
  /// ## Type
  ///
  /// - [Conjunction Required](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchSource(final String value) => _buffer.appendOperator(
        _conjunctionRequiredOperation.createSource(value),
      );

  /// The negated representation of [matchSource].
  LogicalChannel notMatchSource(final String value) => _buffer.appendOperator(
        _conjunctionRequiredOperation.createNegatedSource(value),
      );
}
