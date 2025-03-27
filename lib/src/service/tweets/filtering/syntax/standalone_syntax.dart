// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../../../core/country.dart' as core;
import '../../../common/range.dart';
import '../../distance_unit.dart';
import '../channel/logical_channel.dart';
import '../filtering_rule_group.dart';
import '../operation/standalone_operation.dart';
import 'group_syntax.dart';

/// The object representing the syntax of a standalone operator.
///
/// **Standalone operators** can be used alone or together with any other
/// operators (including those that require conjunction).
abstract class StandaloneSyntax extends GroupSyntax {
  /// Returns the new instance of [StandaloneSyntax].
  const StandaloneSyntax(super.buffer) : _buffer = buffer;

  /// The standalone operation
  static const _standaloneOperation = StandaloneOperation();

  /// The buffer
  final FilteringRuleGroup _buffer;

  /// Matches a keyword within the body of a Tweet.
  ///
  /// This is a tokenized match, meaning that your keyword string will be
  /// matched against the tokenized text of the Tweet body. Tokenization splits
  /// words based on punctuation, symbols, and Unicode basic plane separator
  /// characters.
  ///
  /// ## Parameters
  ///
  /// - [value]: String to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchKeyword(final String value) => _buffer.appendOperator(
        _standaloneOperation.createKeyword(value),
      );

  /// The negated representation of [matchKeyword].
  LogicalChannel notMatchKeyword(final String value) => _buffer.appendOperator(
        _standaloneOperation.createNegatedKeyword(value),
      );

  /// Matches any Tweet containing a recognized hashtag, if the hashtag is a
  /// recognized entity in a Tweet.
  ///
  /// This operator performs an exact match, NOT a tokenized match, meaning
  /// the rule #CocaCola will match posts with the exact hashtag #CocaCola,
  /// but not those with the hashtag #CocaCola.
  ///
  /// The string passed to this method does not need to be prefixed with
  /// the symbol "#" to indicate a hashtag. However, if you pass a string
  /// prefixed with "#", it will still work.
  ///
  /// ## Parameters
  ///
  /// - [value]: Hashtag value to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchHashtag(final String value) => _buffer.appendOperator(
        _standaloneOperation.createHashtag(value),
      );

  /// The negated representation of [matchHashtag].
  LogicalChannel notMatchHashtag(final String value) => _buffer.appendOperator(
        _standaloneOperation.createNegatedHashtag(value),
      );

  /// Matches any Tweet that contains the specified ‘cashtag’
  /// (where the leading character of the token is the ‘$’ character).
  ///
  /// Note that the cashtag operator relies on Twitter’s ‘symbols’ entity
  /// extraction to match cashtags, rather than trying to extract the cashtag
  /// from the body itself.
  ///
  /// The string passed to this method does not need to be prefixed with
  /// the symbol "$" to indicate a cashtag. However, if you pass a string
  /// prefixed with "$", it will still work.
  ///
  /// ## Parameters
  ///
  /// - [value]: Cashtag value to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchCashtag(final String value) => _buffer.appendOperator(
        _standaloneOperation.createCashtag(value),
      );

  /// The negated representation of [matchCashtag].
  LogicalChannel notMatchCashtag(final String value) => _buffer.appendOperator(
        _standaloneOperation.createNegatedCashtag(value),
      );

  /// Matches any Tweet that mentions the given username, if the username
  /// is a recognized entity.
  ///
  /// The string passed to this method does not need to be prefixed with
  /// the symbol "@" to indicate a username. However, if you pass a string
  /// prefixed with "@", it will still work.
  ///
  /// ## Parameters
  ///
  /// - [username]: Username value to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchUsername(final String username) => _buffer.appendOperator(
        _standaloneOperation.createUsername(username),
      );

  /// The negated representation of [matchUsername].
  LogicalChannel notMatchUsername(final String username) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedUsername(username),
      );

  /// Matches any Tweet from a specific user.
  ///
  /// The value can be either the username (excluding the @ character) or
  /// the user’s numeric user ID.
  ///
  /// You can only pass a single username/ID.
  ///
  /// ## Parameters
  ///
  /// - [user]: Username or user id to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetFrom(final String user) => _buffer.appendOperator(
        _standaloneOperation.createTweetFrom(user),
      );

  /// The negated representation of [matchTweetFrom].
  LogicalChannel notMatchTweetFrom(final String user) => _buffer.appendOperator(
        _standaloneOperation.createNegatedTweetFrom(user),
      );

  /// Matches any Tweet that is in reply to a particular user.
  ///
  /// The value can be either the username
  /// (excluding the @ character) or the user’s numeric user ID.
  ///
  /// You can only pass a single username/ID.
  ///
  /// ## Parameters
  ///
  /// - [user]: Username or user id to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetTo(final String user) => _buffer.appendOperator(
        _standaloneOperation.createTweetTo(user),
      );

  /// The negated representation of [matchTweetTo].
  LogicalChannel notMatchTweetTo(final String user) => _buffer.appendOperator(
        _standaloneOperation.createNegatedTweetTo(user),
      );

  /// Performs a tokenized match on any validly-formatted URL of a Tweet.
  ///
  /// This operator can matches on the contents of both the url or expanded_url
  /// fields. For example, a Tweet containing "You should check out
  /// Twitter Developer Labs: https://t.co/c0A36SWil4"
  /// (with the short URL redirecting to https://developer.twitter.com)
  /// will match both the following rules:
  ///
  /// > from:TwitterDev url:"https://developer.twitter.com"</br>
  /// > (because it will match the contents of entities.urls.expanded_url)
  ///
  /// > from:TwitterDev url:"https://t.co"</br>
  /// > (because it will match the contents of entities.urls.url)
  ///
  /// You can only pass a single URL per this operator.
  ///
  /// ## Parameters
  ///
  /// - [value]: Url string to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchUrl(final String value) => _buffer.appendOperator(
        _standaloneOperation.createUrl(value),
      );

  /// The negated representation of [matchUrl].
  LogicalChannel notMatchUrl(final String value) => _buffer.appendOperator(
        _standaloneOperation.createNegatedUrl(value),
      );

  /// Matches Tweets that are Retweets of the specified user.
  ///
  /// The value can be either the username (excluding the @ character)
  /// or the user’s numeric user ID.
  ///
  /// You can only pass a single username/ID per retweets_of: operator.
  ///
  /// Example: retweets_of:twitterdev OR retweets_of:twitterapi
  ///
  /// ## Parameters
  ///
  /// - [user]: Username or user id to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchRetweetedBy(final String user) => _buffer.appendOperator(
        _standaloneOperation.createRetweetedBy(user),
      );

  /// The negated representation of [matchRetweetedBy].
  LogicalChannel notMatchRetweetedBy(final String user) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedRetweetedBy(user),
      );

  /// Matches Tweets with a specific domain id and/or domain id,
  /// entity id pair where * represents a wildcard.
  ///
  /// To learn more about this operator, please visit
  /// [page on Tweet annotations](https://developer.twitter.com/en/docs/twitter-api/annotations/overview).
  ///
  /// You can only pass a single domain/entity per this operator.
  ///
  /// ## Parameters
  ///
  /// - [value]: Context value to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchContext(final String value) => _buffer.appendOperator(
        _standaloneOperation.createContext(value),
      );

  /// The negated representation of [matchEntity].
  LogicalChannel notMatchContext(final String value) => _buffer.appendOperator(
        _standaloneOperation.createNegatedContext(value),
      );

  /// Matches Tweets with a specific entity string value.
  ///
  /// To learn more about this operator, please visit
  /// [page on annotations](https://developer.twitter.com/en/docs/twitter-api/annotations/overview).
  ///
  /// You can only pass a single entity per this operator.
  ///
  /// ## Parameters
  ///
  /// - [value]: Entity value to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchEntity(final String value) => _buffer.appendOperator(
        _standaloneOperation.createEntity(value),
      );

  /// The negated representation of [matchEntity].
  LogicalChannel notMatchEntity(final String value) => _buffer.appendOperator(
        _standaloneOperation.createNegatedEntity(value),
      );

  /// Matches Tweets that share a common conversation ID. A conversation ID
  /// is set to the Tweet ID of a Tweet that started a conversation.
  ///
  /// As Replies to a Tweet are posted, even Replies to Replies,
  /// the conversation_id is added to its JSON payload.
  ///
  /// You can only pass a single conversation ID per this operator.
  ///
  /// ## Parameters
  ///
  /// - [tweetId]: Tweet ID to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchConversation(final String tweetId) =>
      _buffer.appendOperator(
        _standaloneOperation.createConversation(tweetId),
      );

  /// The negated representation of [matchConversation].
  LogicalChannel notMatchConversation(final String tweetId) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedConversation(tweetId),
      );

  /// Matches a keyword or phrase within the Tweet publisher's bio.
  ///
  /// ## Parameters
  ///
  /// - [value]: User bio to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchUserBio(final String value) => _buffer.appendOperator(
        _standaloneOperation.createUserBio(value),
      );

  /// The negated representation of [matchUserBio].
  LogicalChannel notMatchUserBio(final String value) => _buffer.appendOperator(
        _standaloneOperation.createNegatedUserBio(value),
      );

  /// Matches a keyword within the Tweet publisher's user bio name.
  ///
  /// ## Parameters
  ///
  /// - [value]: User bio name to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchUserBioName(final String value) => _buffer.appendOperator(
        _standaloneOperation.createUserBioName(value),
      );

  /// The negated representation of [matchUserBioName].
  LogicalChannel notMatchUserBioName(final String value) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedUserBioName(value),
      );

  /// Matches Tweets that are published by users whose location contains
  /// the specified keyword or phrase. This operator performs a tokenized match,
  /// similar to the normal keyword rules on the message body.
  ///
  /// This location is part of the User object, matches on the
  /// 'location' field, and is a non-normalized, user-generated,
  /// free-form string. It is also different from a Tweet's location
  /// (see [matchPlace]).
  ///
  /// ## Parameters
  ///
  /// - [value]: User bio location to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchUserBioLocation(final String value) =>
      _buffer.appendOperator(
        _standaloneOperation.createUserBioLocation(value),
      );

  /// The negated representation of [matchUserBioLocation].
  LogicalChannel notMatchUserBioLocation(final String value) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedUserBioLocation(value),
      );

  /// Matches Tweets tagged with the specified location or Twitter place ID.
  ///
  /// Multi-word place names (“New York City”, “Palo Alto”)
  /// should be enclosed in quotes.
  ///
  /// You can only pass a single place per place: operator.
  /// > Note: This operator will not match on Retweets,
  /// > since Retweet's places are attached to the original Tweet.
  /// > It will also not match on places attached to the original Tweet of a
  /// > Quote Tweet.
  ///
  /// ## Parameters
  ///
  /// - [value]: Place string to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Elevated
  LogicalChannel matchPlace(final String value) => _buffer.appendOperator(
        _standaloneOperation.createPlace(value),
      );

  /// The negated representation of [matchPlace].
  LogicalChannel notMatchPlace(final String value) => _buffer.appendOperator(
        _standaloneOperation.createNegatedPlace(value),
      );

  /// Matches Tweets where the country code associated with a tagged
  /// place/location matches the given ISO alpha-2 character code.
  ///
  /// You can only pass a single ISO code per this operator.
  ///
  /// > Note: This operator will not match on Retweets,
  /// > since Retweet's places are attached to the original Tweet.
  /// > It will also not match on places attached to the original Tweet
  /// > of a Quote Tweet.
  ///
  /// ## Parameters
  ///
  /// - [value]: Country enumeration to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Elevated
  LogicalChannel matchCountry(final core.Country country) =>
      _buffer.appendOperator(
        _standaloneOperation.createCountry(country),
      );

  /// The negated representation of [matchCountry].
  LogicalChannel notMatchCountry(core.Country country) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedCountry(country),
      );

  /// Matches against the `place.geo.coordinates` object of the Tweet when
  /// present, and in Twitter, against a place geo polygon, where the Place
  /// polygon is fully contained within the defined region.
  ///
  /// This method specifies the Radius value in miles.
  /// Use [matchPointRadiusInKilometers] to specify the value in kilometers.
  ///
  /// - Radius must be less than 25mi
  /// - Longitude is in the range of ±180
  /// - Latitude is in the range of ±90
  /// - All coordinates are in decimal degrees
  /// - Rule arguments are contained within brackets, space delimited
  ///
  /// You can only pass a single geo polygon per this operator.
  ///
  /// > Note: This operator will not match on Retweets, since Retweet's places
  /// > are attached to the original Tweet. It will also not match on places
  /// > attached to the original Tweet of a Quote Tweet.
  ///
  /// ## Parameters
  ///
  /// - [longitude]: Longitude to be matched.
  ///
  /// - [latitude]: Latitude to be matched.
  ///
  /// - [radius]: Radius to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Elevated
  LogicalChannel matchPointRadiusInMiles({
    required double longitude,
    required double latitude,
    required double radius,
  }) =>
      _buffer.appendOperator(
        _standaloneOperation.createPointRadius(
          DistanceUnit.miles,
          longitude,
          latitude,
          radius,
        ),
      );

  /// The negated representation of [matchPointRadiusInMiles].
  LogicalChannel notMatchPointRadiusInMiles({
    required double longitude,
    required double latitude,
    required double radius,
  }) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedPointRadius(
          DistanceUnit.miles,
          longitude,
          latitude,
          radius,
        ),
      );

  /// Matches against the `place.geo.coordinates` object of the Tweet when
  /// present, and in Twitter, against a place geo polygon, where the Place
  /// polygon is fully contained within the defined region.
  ///
  /// This method specifies the Radius value in kilometers.
  /// Use [matchPointRadiusInMiles] to specify the value in miles.
  ///
  /// - Radius must be less than 40km
  /// - Longitude is in the range of ±180
  /// - Latitude is in the range of ±90
  /// - All coordinates are in decimal degrees
  /// - Rule arguments are contained within brackets, space delimited
  ///
  /// You can only pass a single geo polygon per this operator.
  ///
  /// > Note: This operator will not match on Retweets, since Retweet's places
  /// > are attached to the original Tweet. It will also not match on places
  /// > attached to the original Tweet of a Quote Tweet.
  ///
  /// ## Parameters
  ///
  /// - [longitude]: Longitude to be matched.
  ///
  /// - [latitude]: Latitude to be matched.
  ///
  /// - [radius]: Radius to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Elevated
  LogicalChannel matchPointRadiusInKilometers({
    required double longitude,
    required double latitude,
    required double radius,
  }) =>
      _buffer.appendOperator(
        _standaloneOperation.createPointRadius(
          DistanceUnit.kilometers,
          longitude,
          latitude,
          radius,
        ),
      );

  /// The negated representation of [matchPointRadiusInKilometers].
  LogicalChannel notMatchPointRadiusInKilometers({
    required double longitude,
    required double latitude,
    required double radius,
  }) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedPointRadius(
          DistanceUnit.kilometers,
          longitude,
          latitude,
          radius,
        ),
      );

  /// Matches against the `place.geo.coordinates` object of the Tweet when
  /// present, and in Twitter, against a place geo polygon, where the place
  /// polygon is fully contained within the defined region.
  ///
  /// - [westLongitude], [southLatitude] represent the southwest corner of
  /// the bounding box where [westLongitude] is the longitude of that point,
  /// and [southLatitude] is the latitude.
  ///
  /// - [eastLongitude] [northLatitude] represent the northeast corner of
  /// the bounding box, where [eastLongitude] is the longitude of
  /// that point, and [northLatitude] is the latitude.
  ///
  /// - Width and height of the bounding box must be less than 25mi
  /// - Longitude is in the range of ±180
  /// - Latitude is in the range of ±90
  /// - All coordinates are in decimal degrees.
  /// - Rule arguments are contained within brackets, space delimited.
  ///
  /// You can only pass a single geo polygons per this operator.
  ///
  /// > Note: This operator will not match on Retweets, since Retweet's places
  /// > are attached to the original Tweet. It will also not match on places
  /// > attached to the original Tweet of a Quote Tweet.
  ///
  /// ## Parameters
  ///
  /// - [westLongitude]: West Longitude to be matched.
  ///
  /// - [southLatitude]: South Latitude to be matched.
  ///
  /// - [eastLongitude]: East Longitude to be matched.
  ///
  /// - [northLatitude]: North Latitude to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Elevated
  LogicalChannel matchBoundingBox({
    required double westLongitude,
    required double southLatitude,
    required double eastLongitude,
    required double northLatitude,
  }) =>
      _buffer.appendOperator(
        _standaloneOperation.createBoundingBox(
          westLongitude,
          southLatitude,
          eastLongitude,
          northLatitude,
        ),
      );

  /// The negated representation of [matchBoundingBox].
  LogicalChannel notMatchBoundingBox({
    required double westLongitude,
    required double southLatitude,
    required double eastLongitude,
    required double northLatitude,
  }) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedBoundingBox(
          westLongitude,
          southLatitude,
          eastLongitude,
          northLatitude,
        ),
      );

  /// Matches Tweets when the author has a followers count within the given
  /// range.
  ///
  /// If a single number is specified, any number equal to or higher will match.
  ///
  /// Additionally, a range can be specified to match any number in the given
  /// range.
  ///
  /// ## Parameters
  ///
  /// - [range]: The range to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchFollowersCount(final Range range) =>
      _buffer.appendOperator(
        _standaloneOperation.createFollowersCount(range),
      );

  /// The negated representation of [matchFollowersCount].
  LogicalChannel notMatchFollowersCount(final Range range) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedFollowersCount(range),
      );

  /// Matches Tweets when the author has posted a number of Tweets that falls
  /// within the given range.
  ///
  /// If a single number is specified, any number equal to or higher will match.
  ///
  /// Additionally, a range can be specified to match any number in the given
  /// range.
  ///
  /// ## Parameters
  ///
  /// - [range]: The range to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchTweetsCount(final Range range) => _buffer.appendOperator(
        _standaloneOperation.createTweetsCount(range),
      );

  /// The negated representation of [matchTweetsCount].
  LogicalChannel notMatchTweetsCount(final Range range) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedTweetsCount(range),
      );

  /// Matches Tweets when the author has a friends count (the number of users
  /// they follow) that falls within the given range.
  ///
  /// If a single number is specified, any number equal to or higher will match.
  ///
  /// Additionally, a range can be specified to match any number in the given
  /// range.
  ///
  /// ## Parameters
  ///
  /// - [range]: The range to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchFollowingCount(final Range range) =>
      _buffer.appendOperator(
        _standaloneOperation.createFollowingCount(range),
      );

  /// The negated representation of [matchFollowingCount].
  LogicalChannel notMatchFollowingCount(final Range range) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedFollowingCount(range),
      );

  /// Matches Tweets when the author is included in the specified number of
  /// Lists.
  ///
  /// If a single number is specified, any number equal to or higher will match.
  ///
  /// Additionally, a range can be specified to match any number in the given
  /// range.
  ///
  /// ## Parameters
  ///
  /// - [range]: The range to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchListedCount(final Range range) => _buffer.appendOperator(
        _standaloneOperation.createListedCount(range),
      );

  /// The negated representation of [matchListedCount].
  LogicalChannel notMatchListedCount(final Range range) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedListedCount(range),
      );

  /// Performs a keyword/phrase match on the expanded URL HTML title metadata.
  ///
  /// ## Parameters
  ///
  /// - [value]: HTML title to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchUrlTitle(final String value) => _buffer.appendOperator(
        _standaloneOperation.createUrlTitle(value),
      );

  /// The negated representation of [matchUrlTitle].
  LogicalChannel notMatchUrlTitle(final String value) => _buffer.appendOperator(
        _standaloneOperation.createNegatedUrlTitle(value),
      );

  /// Performs a keyword/phrase match on the expanded page description metadata.
  ///
  /// ## Parameters
  ///
  /// - [value]: HTML description to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchUrlDescription(final String value) =>
      _buffer.appendOperator(
        _standaloneOperation.createUrlDescription(value),
      );

  /// The negated representation of [matchUrlDescription].
  LogicalChannel notMatchUrlDescription(final String value) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedUrlDescription(value),
      );

  /// Matches Tweets with URLs that literally contain the given phrase or
  /// keyword.
  ///
  /// To search for patterns with punctuation in them (i.e. google.com) enclose
  /// the search term in quotes.
  ///
  /// > Note: This will match against the expanded URL as well.
  ///
  /// ## Parameters
  ///
  /// - [value]: Keyword to be partially matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchUrlPartially(final String value) =>
      _buffer.appendOperator(
        _standaloneOperation.createUrlContains(value),
      );

  /// The negated representation of [matchUrlPartially].
  LogicalChannel notMatchUrlPartially(final String value) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedUrlContains(value),
      );

  /// Deliver only explicit Replies to the specified Tweet.
  ///
  /// ## Parameters
  ///
  /// - [tweetId]: Tweet ID to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchRepliesTo(final String tweetId) => _buffer.appendOperator(
        _standaloneOperation.createRepliesOf(tweetId),
      );

  /// The negated representation of [matchRepliesTo].
  LogicalChannel notMatchRepliesTo(final String tweetId) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedRepliesOf(tweetId),
      );

  /// Deliver only explicit (or native) Retweets of the specified Tweet.
  ///
  /// > Note that the status ID used should be the ID of an original
  /// > Tweet and not a Retweet.
  ///
  /// Deliver only explicit Replies to the specified Tweet.
  ///
  /// ## Parameters
  ///
  /// - [tweetId]: Tweet ID to be matched.
  ///
  /// ## Type
  ///
  /// - [Standalone](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule#types)
  ///
  /// ## Availability
  ///
  /// - Essential
  LogicalChannel matchRetweetOf(final String tweetId) => _buffer.appendOperator(
        _standaloneOperation.createRetweetsOf(tweetId),
      );

  /// The negated representation of [matchRetweetOf].
  LogicalChannel notMatchRetweetOf(final String tweetId) =>
      _buffer.appendOperator(
        _standaloneOperation.createNegatedRetweetsOf(tweetId),
      );
}
