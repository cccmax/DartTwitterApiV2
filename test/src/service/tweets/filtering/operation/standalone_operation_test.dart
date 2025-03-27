// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/country.dart' as core;
import 'package:twitter_api_v2/src/service/common/range.dart';
import 'package:twitter_api_v2/src/service/tweets/distance_unit.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operation/standalone_operation.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/bounding_box.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/cashtag.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/context.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/conversation.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/country.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/entity.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/hashtag.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/keyword.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/place.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/point_radius.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/range_operator.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/range_operator_type.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/replies_of.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/retweeted_by.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/retweets_of.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/tweet_from.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/tweet_to.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/url.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/url_contains.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/url_description.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/url_title.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/user_bio.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/user_bio_location.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/user_bio_name.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/username.dart';

void main() {
  test('.createKeyword', () {
    final actual = StandaloneOperation().createKeyword('test');

    expect(actual, isA<Keyword>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedKeyword', () {
    final actual = StandaloneOperation().createNegatedKeyword('test');

    expect(actual, isA<Keyword>());
    expect(actual.negated, isTrue);
  });

  test('.createHashtag', () {
    final actual = StandaloneOperation().createHashtag('test');

    expect(actual, isA<Hashtag>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedHashtag', () {
    final actual = StandaloneOperation().createNegatedHashtag('test');

    expect(actual, isA<Hashtag>());
    expect(actual.negated, isTrue);
  });

  test('.createCashtag', () {
    final actual = StandaloneOperation().createCashtag('test');

    expect(actual, isA<Cashtag>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedCashtag', () {
    final actual = StandaloneOperation().createNegatedCashtag('test');

    expect(actual, isA<Cashtag>());
    expect(actual.negated, isTrue);
  });

  test('.createUsername', () {
    final actual = StandaloneOperation().createUsername('test');

    expect(actual, isA<Username>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedUsername', () {
    final actual = StandaloneOperation().createNegatedUsername('test');

    expect(actual, isA<Username>());
    expect(actual.negated, isTrue);
  });

  test('.createTweetFrom', () {
    final actual = StandaloneOperation().createTweetFrom('test');

    expect(actual, isA<TweetFrom>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedTweetFrom', () {
    final actual = StandaloneOperation().createNegatedTweetFrom('test');

    expect(actual, isA<TweetFrom>());
    expect(actual.negated, isTrue);
  });

  test('.createTweetTo', () {
    final actual = StandaloneOperation().createTweetTo('test');

    expect(actual, isA<TweetTo>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedTweetTo', () {
    final actual = StandaloneOperation().createNegatedTweetTo('test');

    expect(actual, isA<TweetTo>());
    expect(actual.negated, isTrue);
  });

  test('.createUrl', () {
    final actual = StandaloneOperation().createUrl('test');

    expect(actual, isA<Url>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedUrl', () {
    final actual = StandaloneOperation().createNegatedUrl('test');

    expect(actual, isA<Url>());
    expect(actual.negated, isTrue);
  });

  test('.createRetweetedBy', () {
    final actual = StandaloneOperation().createRetweetedBy('test');

    expect(actual, isA<RetweetedBy>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedRetweetedBy', () {
    final actual = StandaloneOperation().createNegatedRetweetedBy('test');

    expect(actual, isA<RetweetedBy>());
    expect(actual.negated, isTrue);
  });

  test('.createContext', () {
    final actual = StandaloneOperation().createContext('test');

    expect(actual, isA<Context>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedContext', () {
    final actual = StandaloneOperation().createNegatedContext('test');

    expect(actual, isA<Context>());
    expect(actual.negated, isTrue);
  });

  test('.createEntity', () {
    final actual = StandaloneOperation().createEntity('test');

    expect(actual, isA<Entity>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedEntity', () {
    final actual = StandaloneOperation().createNegatedEntity('test');

    expect(actual, isA<Entity>());
    expect(actual.negated, isTrue);
  });

  test('.createConversation', () {
    final actual = StandaloneOperation().createConversation('test');

    expect(actual, isA<Conversation>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedConversation', () {
    final actual = StandaloneOperation().createNegatedConversation('test');

    expect(actual, isA<Conversation>());
    expect(actual.negated, isTrue);
  });

  test('.createUserBio', () {
    final actual = StandaloneOperation().createUserBio('test');

    expect(actual, isA<UserBio>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedUserBio', () {
    final actual = StandaloneOperation().createNegatedUserBio('test');

    expect(actual, isA<UserBio>());
    expect(actual.negated, isTrue);
  });

  test('.createUserBioName', () {
    final actual = StandaloneOperation().createUserBioName('test');

    expect(actual, isA<UserBioName>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedUserBioName', () {
    final actual = StandaloneOperation().createNegatedUserBioName('test');

    expect(actual, isA<UserBioName>());
    expect(actual.negated, isTrue);
  });

  test('.createUserBioLocation', () {
    final actual = StandaloneOperation().createUserBioLocation('test');

    expect(actual, isA<UserBioLocation>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedUserBioLocation', () {
    final actual = StandaloneOperation().createNegatedUserBioLocation('test');

    expect(actual, isA<UserBioLocation>());
    expect(actual.negated, isTrue);
  });

  test('.createPlace', () {
    final actual = StandaloneOperation().createPlace('test');

    expect(actual, isA<Place>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedPlace', () {
    final actual = StandaloneOperation().createNegatedPlace('test');

    expect(actual, isA<Place>());
    expect(actual.negated, isTrue);
  });

  test('.createCountry', () {
    final actual =
        StandaloneOperation().createCountry(core.Country.afghanistan);

    expect(actual, isA<Country>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedCountry', () {
    final actual =
        StandaloneOperation().createNegatedCountry(core.Country.afghanistan);

    expect(actual, isA<Country>());
    expect(actual.negated, isTrue);
  });

  test('.createPointRadius', () {
    final actual = StandaloneOperation().createPointRadius(
      DistanceUnit.kilometers,
      10.0,
      10.0,
      10.0,
    );

    expect(actual, isA<PointRadius>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedPointRadius', () {
    final actual = StandaloneOperation().createNegatedPointRadius(
      DistanceUnit.kilometers,
      10.0,
      10.0,
      10.0,
    );
    expect(actual, isA<PointRadius>());
    expect(actual.negated, isTrue);
  });

  test('.createBoundingBox', () {
    final actual = StandaloneOperation().createBoundingBox(
      10.0,
      10.0,
      10.0,
      10.0,
    );

    expect(actual, isA<BoundingBox>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedBoundingBox', () {
    final actual = StandaloneOperation().createNegatedBoundingBox(
      10.0,
      10.0,
      10.0,
      10.0,
    );
    expect(actual, isA<BoundingBox>());
    expect(actual.negated, isTrue);
  });

  test('.createFollowersCount', () {
    final actual = StandaloneOperation().createFollowersCount(
      Range.point(1),
    );

    expect(actual, isA<RangeOperator>());
    expect(actual.type, RangeOperatorType.followersCount);
    expect(actual.negated, isFalse);
  });

  test('.createNegatedFollowersCount', () {
    final actual = StandaloneOperation().createNegatedFollowersCount(
      Range.point(1),
    );

    expect(actual, isA<RangeOperator>());
    expect(actual.type, RangeOperatorType.followersCount);
    expect(actual.negated, isTrue);
  });

  test('.createTweetsCount', () {
    final actual = StandaloneOperation().createTweetsCount(
      Range.point(1),
    );

    expect(actual, isA<RangeOperator>());
    expect(actual.type, RangeOperatorType.tweetsCount);
    expect(actual.negated, isFalse);
  });

  test('.createNegatedTweetsCount', () {
    final actual = StandaloneOperation().createNegatedTweetsCount(
      Range.point(1),
    );

    expect(actual, isA<RangeOperator>());
    expect(actual.type, RangeOperatorType.tweetsCount);
    expect(actual.negated, isTrue);
  });

  test('.createFollowingCount', () {
    final actual = StandaloneOperation().createFollowingCount(
      Range.point(1),
    );

    expect(actual, isA<RangeOperator>());
    expect(actual.type, RangeOperatorType.followingCount);
    expect(actual.negated, isFalse);
  });

  test('.createNegatedFollowingCount', () {
    final actual = StandaloneOperation().createNegatedFollowingCount(
      Range.point(1),
    );

    expect(actual, isA<RangeOperator>());
    expect(actual.type, RangeOperatorType.followingCount);
    expect(actual.negated, isTrue);
  });

  test('.createListedCount', () {
    final actual = StandaloneOperation().createListedCount(
      Range.point(1),
    );

    expect(actual, isA<RangeOperator>());
    expect(actual.type, RangeOperatorType.listedCount);
    expect(actual.negated, isFalse);
  });

  test('.createNegatedListedCount', () {
    final actual = StandaloneOperation().createNegatedListedCount(
      Range.point(1),
    );

    expect(actual, isA<RangeOperator>());
    expect(actual.type, RangeOperatorType.listedCount);
    expect(actual.negated, isTrue);
  });

  test('.createUrlTitle', () {
    final actual = StandaloneOperation().createUrlTitle('test');

    expect(actual, isA<UrlTitle>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedUrlTitle', () {
    final actual = StandaloneOperation().createNegatedUrlTitle('test');

    expect(actual, isA<UrlTitle>());
    expect(actual.negated, isTrue);
  });

  test('.createUrlDescription', () {
    final actual = StandaloneOperation().createUrlDescription('test');

    expect(actual, isA<UrlDescription>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedUrlDescription', () {
    final actual = StandaloneOperation().createNegatedUrlDescription('test');

    expect(actual, isA<UrlDescription>());
    expect(actual.negated, isTrue);
  });

  test('.createUrlContains', () {
    final actual = StandaloneOperation().createUrlContains('test');

    expect(actual, isA<UrlContains>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedUrlContains', () {
    final actual = StandaloneOperation().createNegatedUrlContains('test');

    expect(actual, isA<UrlContains>());
    expect(actual.negated, isTrue);
  });

  test('.createRepliesOf', () {
    final actual = StandaloneOperation().createRepliesOf('test');

    expect(actual, isA<RepliesOf>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedRepliesOf', () {
    final actual = StandaloneOperation().createNegatedRepliesOf('test');

    expect(actual, isA<RepliesOf>());
    expect(actual.negated, isTrue);
  });

  test('.createRetweetsOf', () {
    final actual = StandaloneOperation().createRetweetsOf('test');

    expect(actual, isA<RetweetsOf>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedRetweetsOf', () {
    final actual = StandaloneOperation().createNegatedRetweetsOf('test');

    expect(actual, isA<RetweetsOf>());
    expect(actual.negated, isTrue);
  });
}
