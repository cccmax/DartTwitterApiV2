// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/country.dart';
import 'package:twitter_api_v2/src/core/language.dart';
import 'package:twitter_api_v2/src/service/common/range.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/channel/logical_channel.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/channel/post_logical_channel.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/filtering_rule.dart';

void main() {
  group('standalone syntaxes', () {
    test('.matchKeyword', () {
      final actual = FilteringRule.of().matchKeyword('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test');
    });

    test('.notMatchKeyword', () {
      final actual = FilteringRule.of().notMatchKeyword('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-test');
    });

    test('.matchHashtag', () {
      final actual = FilteringRule.of().matchHashtag('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '#test');
    });

    test('.notMatchHashtag', () {
      final actual = FilteringRule.of().notMatchHashtag('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-#test');
    });

    test('.matchCashtag', () {
      final actual = FilteringRule.of().matchCashtag('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '\$test');
    });

    test('.notMatchCashtag', () {
      final actual = FilteringRule.of().notMatchCashtag('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-\$test');
    });

    test('.matchUsername', () {
      final actual = FilteringRule.of().matchUsername('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '@test');
    });

    test('.notMatchUsername', () {
      final actual = FilteringRule.of().notMatchUsername('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-@test');
    });

    test('.matchTweetFrom', () {
      final actual = FilteringRule.of().matchTweetFrom('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'from:test');
    });

    test('.notMatchTweetFrom', () {
      final actual = FilteringRule.of().notMatchTweetFrom('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-from:test');
    });

    test('.matchTweetTo', () {
      final actual = FilteringRule.of().matchTweetTo('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'to:test');
    });

    test('.notMatchTweetTo', () {
      final actual = FilteringRule.of().notMatchTweetTo('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-to:test');
    });

    test('.matchUrl', () {
      final actual = FilteringRule.of().matchUrl('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'url:"test"');
    });

    test('.notMatchUrl', () {
      final actual = FilteringRule.of().notMatchUrl('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-url:"test"');
    });

    test('.matchRetweetedBy', () {
      final actual = FilteringRule.of().matchRetweetedBy('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'retweets_of:test');
    });

    test('.notMatchRetweetedBy', () {
      final actual = FilteringRule.of().notMatchRetweetedBy('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-retweets_of:test');
    });

    test('.matchContext', () {
      final actual = FilteringRule.of().matchContext('domain_id.*');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'context:domain_id.*');
    });

    test('.notMatchContext', () {
      final actual =
          FilteringRule.of().notMatchContext('10.799022225751871488');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-context:10.799022225751871488');
    });

    test('.matchEntity', () {
      final actual = FilteringRule.of().matchEntity('test aaa');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'entity:"test aaa"');
    });

    test('.notMatchEntity', () {
      final actual = FilteringRule.of().notMatchEntity('test aaa');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-entity:"test aaa"');
    });

    test('.matchConversation', () {
      final actual = FilteringRule.of().matchConversation('1234');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'conversation_id:1234');
    });

    test('.notMatchConversation', () {
      final actual = FilteringRule.of().notMatchConversation('1234');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-conversation_id:1234');
    });

    test('.matchUserBio', () {
      final actual = FilteringRule.of().matchUserBio('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'bio:test');
    });

    test('.notMatchUserBio', () {
      final actual = FilteringRule.of().notMatchUserBio('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-bio:test');
    });

    test('.matchUserBioName', () {
      final actual = FilteringRule.of().matchUserBioName('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'bio_name:test');
    });

    test('.notMatchUserBioName', () {
      final actual = FilteringRule.of().notMatchUserBioName('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-bio_name:test');
    });

    test('.matchUserBioLocation', () {
      final actual = FilteringRule.of().matchUserBioLocation('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'bio_location:test');
    });

    test('.notMatchUserBioLocation', () {
      final actual = FilteringRule.of().notMatchUserBioLocation('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-bio_location:test');
    });

    test('.matchPlace', () {
      final actual = FilteringRule.of().matchPlace('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'place:test');
    });

    test('.notMatchPlace', () {
      final actual = FilteringRule.of().notMatchPlace('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-place:test');
    });

    test('.matchCountry', () {
      final actual = FilteringRule.of().matchCountry(Country.afghanistan);

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'place_country:AF');
    });

    test('.notMatchCountry', () {
      final actual = FilteringRule.of().notMatchCountry(Country.afghanistan);

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-place_country:AF');
    });

    test('.matchPointRadiusInMiles', () {
      final actual = FilteringRule.of().matchPointRadiusInMiles(
        longitude: 10.0,
        latitude: 10.0,
        radius: 10.0,
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'point_radius:[10.0 10.0 10.0mi]');
    });

    test('.notMatchPointRadiusInMiles', () {
      final actual = FilteringRule.of().notMatchPointRadiusInMiles(
        longitude: 10.0,
        latitude: 10.0,
        radius: 10.0,
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-point_radius:[10.0 10.0 10.0mi]');
    });

    test('.matchPointRadiusInKilometers', () {
      final actual = FilteringRule.of().matchPointRadiusInKilometers(
        longitude: 10.0,
        latitude: 10.0,
        radius: 10.0,
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'point_radius:[10.0 10.0 10.0km]');
    });

    test('.notMatchPointRadiusInKilometers', () {
      final actual = FilteringRule.of().notMatchPointRadiusInKilometers(
        longitude: 10.0,
        latitude: 10.0,
        radius: 10.0,
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-point_radius:[10.0 10.0 10.0km]');
    });

    test('.matchBoundingBox', () {
      final actual = FilteringRule.of().matchBoundingBox(
        westLongitude: 10.0,
        southLatitude: 10.0,
        eastLongitude: 10.0,
        northLatitude: 10.0,
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'bounding_box:[10.0 10.0 10.0 10.0]');
    });

    test('.notMatchBoundingBox', () {
      final actual = FilteringRule.of().notMatchBoundingBox(
        westLongitude: 10.0,
        southLatitude: 10.0,
        eastLongitude: 10.0,
        northLatitude: 10.0,
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-bounding_box:[10.0 10.0 10.0 10.0]');
    });

    test('.matchFollowersCount', () {
      final actual = FilteringRule.of().matchFollowersCount(
        Range.point(10),
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'followers_count:10');
    });

    test('.notMatchFollowersCount', () {
      final actual = FilteringRule.of().notMatchFollowersCount(
        Range.point(10),
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-followers_count:10');
    });

    test('.matchTweetsCount', () {
      final actual = FilteringRule.of().matchTweetsCount(
        Range.point(10),
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'tweets_count:10');
    });

    test('.notMatchTweetsCount', () {
      final actual = FilteringRule.of().notMatchTweetsCount(
        Range.point(10),
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-tweets_count:10');
    });

    test('.matchFollowingCount', () {
      final actual = FilteringRule.of().matchFollowingCount(
        Range.point(10),
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'following_count:10');
    });

    test('.notMatchFollowingCount', () {
      final actual = FilteringRule.of().notMatchFollowingCount(
        Range.point(10),
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-following_count:10');
    });

    test('.matchListedCount', () {
      final actual = FilteringRule.of().matchListedCount(
        Range.point(10),
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'listed_count:10');
    });

    test('.notMatchListedCount', () {
      final actual = FilteringRule.of().notMatchListedCount(
        Range.point(10),
      );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-listed_count:10');
    });

    test('.matchUrlTitle', () {
      final actual = FilteringRule.of().matchUrlTitle('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'url_title:test');
    });

    test('.notMatchUrlTitle', () {
      final actual = FilteringRule.of().notMatchUrlTitle('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-url_title:test');
    });

    test('.matchUrlDescription', () {
      final actual = FilteringRule.of().matchUrlDescription('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'url_description:test');
    });

    test('.notMatchUrlDescription', () {
      final actual = FilteringRule.of().notMatchUrlDescription('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-url_description:test');
    });

    test('.matchUrlPartially', () {
      final actual = FilteringRule.of().matchUrlPartially('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'url_contains:test');
    });

    test('.notMatchUrlPartially', () {
      final actual = FilteringRule.of().notMatchUrlPartially('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-url_contains:test');
    });

    test('.matchRepliesTo', () {
      final actual = FilteringRule.of().matchRepliesTo('1234');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'in_reply_to_tweet_id:1234');
    });

    test('.notMatchRepliesTo', () {
      final actual = FilteringRule.of().notMatchRepliesTo('1234');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-in_reply_to_tweet_id:1234');
    });

    test('.matchRetweetOf', () {
      final actual = FilteringRule.of().matchRetweetOf('1234');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'retweets_of_tweet_id:1234');
    });

    test('.notMatchRetweetOf', () {
      final actual = FilteringRule.of().notMatchRetweetOf('1234');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), '-retweets_of_tweet_id:1234');
    });
  });

  group('conjunction required syntaxes', () {
    test('.matchRetweet', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().matchRetweet();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test is:retweet');
    });

    test('.notMatchRetweet', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().notMatchRetweet();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -is:retweet');
    });

    test('.matchReply', () {
      final actual = FilteringRule.of().matchKeyword('test').and().matchReply();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test is:reply');
    });

    test('.notMatchReply', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().notMatchReply();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -is:reply');
    });

    test('.matchQuote', () {
      final actual = FilteringRule.of().matchKeyword('test').and().matchQuote();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test is:quote');
    });

    test('.notMatchQuote', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().notMatchQuote();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -is:quote');
    });

    test('.matchVerifiedUser', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().matchVerifiedUser();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test is:verified');
    });

    test('.notMatchVerifiedUser', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().notMatchVerifiedUser();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -is:verified');
    });

    test('.notMatchNullcast', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().notMatchNullcastTweet();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -is:nullcast');
    });

    test('.matchTweetContainsHashtags', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .matchTweetContainsHashtags();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test has:hashtags');
    });

    test('.notMatchTweetContainsHashtags', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .notMatchTweetContainsHashtags();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -has:hashtags');
    });

    test('.matchTweetContainsCashtags', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .matchTweetContainsCashtags();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test has:cashtags');
    });

    test('.notMatchTweetContainsCashtags', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .notMatchTweetContainsCashtags();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -has:cashtags');
    });

    test('.matchTweetContainsLinks', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .matchTweetContainsLinks();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test has:links');
    });

    test('.notMatchTweetContainsLinks', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .notMatchTweetContainsLinks();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -has:links');
    });

    test('.matchTweetContainsMentions', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .matchTweetContainsMentions();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test has:mentions');
    });

    test('.notMatchTweetContainsMentions', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .notMatchTweetContainsMentions();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -has:mentions');
    });

    test('.matchTweetContainsMedia', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .matchTweetContainsMedia();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test has:media');
    });

    test('.notMatchTweetContainsMedia', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .notMatchTweetContainsMedia();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -has:media');
    });

    test('.matchTweetContainsImages', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .matchTweetContainsImages();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test has:images');
    });

    test('.notMatchTweetContainsImages', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .notMatchTweetContainsImages();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -has:images');
    });

    test('.matchTweetContainsVideoLinks', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .matchTweetContainsVideoLink();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test has:video_link');
    });

    test('.notMatchTweetContainsVideoLinks', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .notMatchTweetContainsVideoLink();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -has:video_link');
    });

    test('.matchTweetContainsGeo', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().matchTweetContainsGeo();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test has:geo');
    });

    test('.notMatchTweetContainsGeo', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .notMatchTweetContainsGeo();

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -has:geo');
    });

    test('.matchLanguage', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().matchLanguage(
                Language.amharic,
              );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test lang:am');
    });

    test('.notMatchLanguage', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().notMatchLanguage(
                Language.amharic,
              );

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -lang:am');
    });

    test('.matchSource', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().matchSource('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test source:test');
    });

    test('.notMatchSource', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().notMatchSource('test');

      expect(actual, isA<LogicalChannel>());
      expect(actual.build(), 'test -source:test');
    });
  });

  group('logical syntaxes', () {
    test('.and', () {
      final actual = FilteringRule.of().matchKeyword('test').and();

      expect(actual, isA<PostLogicalChannel>());
    });

    test('.or', () {
      final actual = FilteringRule.of().matchKeyword('test').or();

      expect(actual, isA<PostLogicalChannel>());
    });
  });

  group('singleton operators', () {
    test('when there are no duplicates in IsOperator', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .or()
          .matchRetweet()
          .or()
          .matchQuote();

      expect(actual.build(), 'test OR is:retweet OR is:quote');
    });

    test('when there are no duplicates in HasOperator', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .or()
          .matchTweetContainsCashtags()
          .or()
          .matchTweetContainsHashtags();

      expect(actual.build(), 'test OR has:cashtags OR has:hashtags');
    });

    test('when there are duplicates in IsOperator', () {
      expect(
        () => FilteringRule.of()
            .matchKeyword('test')
            .or()
            .matchRetweet()
            .or()
            .matchRetweet(),
        throwsA(
          allOf(
            isA<UnsupportedError>(),
            predicate(
              (dynamic e) =>
                  e.message ==
                  '''
The same singleton operators cannot be used within a single group.

If you want to use multiple combinations of the same singleton operator,
use in nested groups or outside of groups.

❌ You Should Not
#TwitterDev has:retweet OR #TwitterAPI -has:retweet

✅ Instead, You Should
(#TwitterDev has:retweet) OR (#TwitterAPI -has:retweet)
            ''',
            ),
          ),
        ),
      );
    });

    test('when there are duplicates in HasOperator', () {
      expect(
        () => FilteringRule.of()
            .matchKeyword('test')
            .or()
            .matchTweetContainsGeo()
            .or()
            .matchTweetContainsGeo(),
        throwsA(
          allOf(
            isA<UnsupportedError>(),
            predicate(
              (dynamic e) =>
                  e.message ==
                  '''
The same singleton operators cannot be used within a single group.

If you want to use multiple combinations of the same singleton operator,
use in nested groups or outside of groups.

❌ You Should Not
#TwitterDev has:retweet OR #TwitterAPI -has:retweet

✅ Instead, You Should
(#TwitterDev has:retweet) OR (#TwitterAPI -has:retweet)
            ''',
            ),
          ),
        ),
      );
    });

    test('when there are duplicates in negated IsOperator', () {
      expect(
        () => FilteringRule.of()
            .matchKeyword('test')
            .or()
            .matchRetweet()
            .or()
            .notMatchRetweet(),
        throwsA(
          allOf(
            isA<UnsupportedError>(),
            predicate(
              (dynamic e) =>
                  e.message ==
                  '''
The same singleton operators cannot be used within a single group.

If you want to use multiple combinations of the same singleton operator,
use in nested groups or outside of groups.

❌ You Should Not
#TwitterDev has:retweet OR #TwitterAPI -has:retweet

✅ Instead, You Should
(#TwitterDev has:retweet) OR (#TwitterAPI -has:retweet)
            ''',
            ),
          ),
        ),
      );
    });

    test('when there are duplicates in negated HasOperator', () {
      expect(
        () => FilteringRule.of()
            .matchKeyword('test')
            .or()
            .matchTweetContainsGeo()
            .or()
            .notMatchTweetContainsGeo(),
        throwsA(
          allOf(
            isA<UnsupportedError>(),
            predicate(
              (dynamic e) =>
                  e.message ==
                  '''
The same singleton operators cannot be used within a single group.

If you want to use multiple combinations of the same singleton operator,
use in nested groups or outside of groups.

❌ You Should Not
#TwitterDev has:retweet OR #TwitterAPI -has:retweet

✅ Instead, You Should
(#TwitterDev has:retweet) OR (#TwitterAPI -has:retweet)
            ''',
            ),
          ),
        ),
      );
    });
  });

  test('.ofSample', () {
    final actual = FilteringRule.ofSample(percent: 70).matchKeyword('test');

    expect(actual.build(), 'test sample:70');
  });

  group('patterns', () {
    test('test is:verified', () {
      final actual =
          FilteringRule.of().matchKeyword('test').and().matchVerifiedUser();

      expect(actual.build(), 'test is:verified');
    });

    test('test is:verified OR (test has:hashtags)', () {
      final actual = FilteringRule.of()
          .matchKeyword('test')
          .and()
          .matchVerifiedUser()
          .or()
          .group(
            FilteringRule.of()
                .matchKeyword('test')
                .and()
                .matchTweetContainsHashtags(),
          );

      expect(actual.build(), 'test is:verified OR (test has:hashtags)');
    });

    test('(test is:verified) OR (test has:hashtags)', () {
      final actual = FilteringRule.of()
          .group(
              FilteringRule.of().matchKeyword('test').and().matchVerifiedUser())
          .or()
          .group(
            FilteringRule.of()
                .matchKeyword('test')
                .and()
                .matchTweetContainsHashtags(),
          );

      expect(actual.build(), '(test is:verified) OR (test has:hashtags)');
    });

    test('(test is:verified) OR test has:hashtags', () {
      final actual = FilteringRule.of()
          .group(
              FilteringRule.of().matchKeyword('test').and().matchVerifiedUser())
          .or()
          .matchKeyword('test')
          .and()
          .matchTweetContainsHashtags();

      expect(actual.build(), '(test is:verified) OR test has:hashtags');
    });

    test('(test OR is:verified) OR test has:hashtags', () {
      final actual = FilteringRule.of()
          .group(
              FilteringRule.of().matchKeyword('test').or().matchVerifiedUser())
          .or()
          .matchKeyword('test')
          .and()
          .matchTweetContainsHashtags();

      expect(actual.build(), '(test OR is:verified) OR test has:hashtags');
    });

    test('(test is:verified) OR (test -has:hashtags)', () {
      final actual = FilteringRule.of()
          .group(
              FilteringRule.of().matchKeyword('test').and().matchVerifiedUser())
          .or()
          .group(
            FilteringRule.of()
                .matchKeyword('test')
                .and()
                .notMatchTweetContainsHashtags(),
          );

      expect(actual.build(), '(test is:verified) OR (test -has:hashtags)');
    });
  });
}
