// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../../../core/country.dart' as core;
import '../../../common/range.dart';
import '../../distance_unit.dart';
import '../operator/standalone/bounding_box.dart';
import '../operator/standalone/cashtag.dart';
import '../operator/standalone/context.dart';
import '../operator/standalone/conversation.dart';
import '../operator/standalone/country.dart';
import '../operator/standalone/entity.dart';
import '../operator/standalone/hashtag.dart';
import '../operator/standalone/keyword.dart';
import '../operator/standalone/place.dart';
import '../operator/standalone/point_radius.dart';
import '../operator/standalone/range_operator.dart';
import '../operator/standalone/range_operator_type.dart';
import '../operator/standalone/replies_of.dart';
import '../operator/standalone/retweeted_by.dart';
import '../operator/standalone/retweets_of.dart';
import '../operator/standalone/tweet_from.dart';
import '../operator/standalone/tweet_to.dart';
import '../operator/standalone/url.dart';
import '../operator/standalone/url_contains.dart';
import '../operator/standalone/url_description.dart';
import '../operator/standalone/url_title.dart';
import '../operator/standalone/user_bio.dart';
import '../operator/standalone/user_bio_location.dart';
import '../operator/standalone/user_bio_name.dart';
import '../operator/standalone/username.dart';

class StandaloneOperation {
  /// Returns the new instance of [StandaloneOperation].
  const StandaloneOperation();

  /// Returns the new instance of [Keyword] based on [value].
  Keyword createKeyword(final String value) => Keyword(value);

  /// Returns the new instance of negated [Keyword] based on [value].
  Keyword createNegatedKeyword(final String value) => Keyword.negated(value);

  /// Returns the new instance of [Hashtag] based on [value].
  Hashtag createHashtag(final String value) => Hashtag(value);

  /// Returns the new instance of negated [Hashtag] based on [value].
  Hashtag createNegatedHashtag(final String value) => Hashtag.negated(value);

  /// Returns the new instance of [Cashtag] based on [value].
  Cashtag createCashtag(final String value) => Cashtag(value);

  /// Returns the new instance of negated [Cashtag] based on [value].
  Cashtag createNegatedCashtag(final String value) => Cashtag.negated(value);

  /// Returns the new instance of [Username] based on [username].
  Username createUsername(final String username) => Username(username);

  /// Returns the new instance of negated [Username] based on [username].
  Username createNegatedUsername(final String username) =>
      Username.negated(username);

  /// Returns the new instance of [TweetFrom] based on [user].
  TweetFrom createTweetFrom(final String user) => TweetFrom(user);

  /// Returns the new instance of negated [TweetFrom] based on [user].
  TweetFrom createNegatedTweetFrom(final String user) =>
      TweetFrom.negated(user);

  /// Returns the new instance of [TweetTo] based on [user].
  TweetTo createTweetTo(final String user) => TweetTo(user);

  /// Returns the new instance of negated [TweetTo] based on [user].
  TweetTo createNegatedTweetTo(final String user) => TweetTo.negated(user);

  /// Returns the new instance of [Url] based on [value].
  Url createUrl(final String value) => Url(value);

  /// Returns the new instance of negated [Url] based on [value].
  Url createNegatedUrl(final String value) => Url.negated(value);

  /// Returns the new instance of [RetweetedBy] based on [user].
  RetweetedBy createRetweetedBy(final String user) => RetweetedBy(user);

  /// Returns the new instance of negated [RetweetedBy] based on [user].
  RetweetedBy createNegatedRetweetedBy(final String user) =>
      RetweetedBy.negated(user);

  /// Returns the new instance of [Context] based on [value].
  Context createContext(final String value) => Context(value);

  /// Returns the new instance of negated [Context] based on [value].
  Context createNegatedContext(final String value) => Context.negated(value);

  /// Returns the new instance of [Entity] based on [value].
  Entity createEntity(final String value) => Entity(value);

  /// Returns the new instance of negated [Entity] based on [value].
  Entity createNegatedEntity(final String value) => Entity.negated(value);

  /// Returns the new instance of [Conversation] based on [tweetId].
  Conversation createConversation(final String tweetId) =>
      Conversation(tweetId);

  /// Returns the new instance of negated [Conversation] based on [tweetId].
  Conversation createNegatedConversation(final String tweetId) =>
      Conversation.negated(tweetId);

  /// Returns the new instance of [UserBio] based on [value].
  UserBio createUserBio(final String value) => UserBio(value);

  /// Returns the new instance of negated [UserBio] based on [value].
  UserBio createNegatedUserBio(final String value) => UserBio.negated(value);

  /// Returns the new instance of [UserBioName] based on [value].
  UserBioName createUserBioName(final String value) => UserBioName(value);

  /// Returns the new instance of negated [UserBioName] based on [value].
  UserBioName createNegatedUserBioName(final String value) =>
      UserBioName.negated(value);

  /// Returns the new instance of [UserBioLocation] based on [value].
  UserBioLocation createUserBioLocation(final String value) =>
      UserBioLocation(value);

  /// Returns the new instance of negated [UserBioLocation] based on [value].
  UserBioLocation createNegatedUserBioLocation(final String value) =>
      UserBioLocation.negated(value);

  /// Returns the new instance of [Place] based on [value].
  Place createPlace(final String value) => Place(value);

  /// Returns the new instance of negated [Place] based on [value].
  Place createNegatedPlace(final String value) => Place.negated(value);

  /// Returns the new instance of [Country] based on [country].
  Country createCountry(final core.Country country) => Country(country);

  /// Returns the new instance of negated [Place] based on [country].
  Country createNegatedCountry(final core.Country country) =>
      Country.negated(country);

  /// Returns the new instance of [PointRadius].
  PointRadius createPointRadius(
    final DistanceUnit distanceUnit,
    final double longitude,
    final double latitude,
    final double radius,
  ) =>
      PointRadius(
        distanceUnit,
        longitude,
        latitude,
        radius,
      );

  /// Returns the new instance of negated [PointRadius].
  PointRadius createNegatedPointRadius(
    final DistanceUnit distanceUnit,
    final double longitude,
    final double latitude,
    final double radius,
  ) =>
      PointRadius.negated(
        distanceUnit,
        longitude,
        latitude,
        radius,
      );

  /// Returns the new instance of [BoundingBox].
  BoundingBox createBoundingBox(
    final double westLongitude,
    final double southLatitude,
    final double eastLongitude,
    final double northLatitude,
  ) =>
      BoundingBox(
        westLongitude,
        southLatitude,
        eastLongitude,
        northLatitude,
      );

  /// Returns the new instance of negated [BoundingBox].
  BoundingBox createNegatedBoundingBox(
    final double westLongitude,
    final double southLatitude,
    final double eastLongitude,
    final double northLatitude,
  ) =>
      BoundingBox.negated(
        westLongitude,
        southLatitude,
        eastLongitude,
        northLatitude,
      );

  /// Returns the new instance of [RangeOperator] based on [range].
  RangeOperator createFollowersCount(final Range range) =>
      RangeOperator(RangeOperatorType.followersCount, range);

  /// Returns the new instance of negated [RangeOperator]
  /// based on [range].
  RangeOperator createNegatedFollowersCount(final Range range) =>
      RangeOperator.negated(RangeOperatorType.followersCount, range);

  /// Returns the new instance of [RangeOperator] based on [range].
  RangeOperator createTweetsCount(final Range range) =>
      RangeOperator(RangeOperatorType.tweetsCount, range);

  /// Returns the new instance of negated [RangeOperator]
  /// based on [range].
  RangeOperator createNegatedTweetsCount(final Range range) =>
      RangeOperator.negated(RangeOperatorType.tweetsCount, range);

  /// Returns the new instance of [RangeOperator] based on [range].
  RangeOperator createFollowingCount(final Range range) =>
      RangeOperator(RangeOperatorType.followingCount, range);

  /// Returns the new instance of negated [RangeOperator]
  /// based on [range].
  RangeOperator createNegatedFollowingCount(final Range range) =>
      RangeOperator.negated(RangeOperatorType.followingCount, range);

  /// Returns the new instance of [RangeOperator] based on [range].
  RangeOperator createListedCount(final Range range) =>
      RangeOperator(RangeOperatorType.listedCount, range);

  /// Returns the new instance of negated [RangeOperator]
  /// based on [range].
  RangeOperator createNegatedListedCount(final Range range) =>
      RangeOperator.negated(RangeOperatorType.listedCount, range);

  /// Returns the new instance of [UrlTitle] based on [value].
  UrlTitle createUrlTitle(final String value) => UrlTitle(value);

  /// Returns the new instance of negated [UrlTitle]
  /// based on [value].
  UrlTitle createNegatedUrlTitle(final String value) => UrlTitle.negated(value);

  /// Returns the new instance of [UrlDescription] based on [value].
  UrlDescription createUrlDescription(final String value) =>
      UrlDescription(value);

  /// Returns the new instance of negated [UrlDescription]
  /// based on [value].
  UrlDescription createNegatedUrlDescription(final String value) =>
      UrlDescription.negated(value);

  /// Returns the new instance of [UrlContains] based on [value].
  UrlContains createUrlContains(final String value) => UrlContains(value);

  /// Returns the new instance of negated [UrlContains]
  /// based on [value].
  UrlContains createNegatedUrlContains(final String value) =>
      UrlContains.negated(value);

  /// Returns the new instance of [RepliesOf] based on [tweetId].
  RepliesOf createRepliesOf(final String tweetId) => RepliesOf(tweetId);

  /// Returns the new instance of negated [RepliesOf]
  /// based on [tweetId].
  RepliesOf createNegatedRepliesOf(final String tweetId) =>
      RepliesOf.negated(tweetId);

  /// Returns the new instance of [RetweetsOf] based on [tweetId].
  RetweetsOf createRetweetsOf(final String tweetId) => RetweetsOf(tweetId);

  /// Returns the new instance of negated [RetweetsOf]
  /// based on [tweetId].
  RetweetsOf createNegatedRetweetsOf(final String tweetId) =>
      RetweetsOf.negated(tweetId);
}
