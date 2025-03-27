// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/language.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operation/conjunction_required_operation.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/has_operator.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/has_operator_type.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/is_operator.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/is_operator_type.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/source.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/tweet_lang.dart';

void main() {
  test('.createIsRetweet', () {
    final actual = ConjunctionRequiredOperation().createIsRetweet();

    expect(actual, isA<IsOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, IsOperatorType.retweet);
  });

  test('.createNegatedIsRetweet', () {
    final actual = ConjunctionRequiredOperation().createNegatedIsRetweet();

    expect(actual, isA<IsOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, IsOperatorType.retweet);
  });

  test('.createIsReply', () {
    final actual = ConjunctionRequiredOperation().createIsReply();

    expect(actual, isA<IsOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, IsOperatorType.reply);
  });

  test('.createNegatedIsReply', () {
    final actual = ConjunctionRequiredOperation().createNegatedIsReply();

    expect(actual, isA<IsOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, IsOperatorType.reply);
  });

  test('.createIsQuote', () {
    final actual = ConjunctionRequiredOperation().createIsQuote();

    expect(actual, isA<IsOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, IsOperatorType.quote);
  });

  test('.createNegatedIsQuote', () {
    final actual = ConjunctionRequiredOperation().createNegatedIsQuote();

    expect(actual, isA<IsOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, IsOperatorType.quote);
  });

  test('.createIsVerified', () {
    final actual = ConjunctionRequiredOperation().createIsVerified();

    expect(actual, isA<IsOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, IsOperatorType.verified);
  });

  test('.createNegatedIsVerified', () {
    final actual = ConjunctionRequiredOperation().createNegatedIsVerified();

    expect(actual, isA<IsOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, IsOperatorType.verified);
  });

  test('.createNegatedIsNullCast', () {
    final actual = ConjunctionRequiredOperation().createNegatedIsNullCast();

    expect(actual, isA<IsOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, IsOperatorType.nullcast);
  });

  test('.createHasHashtags', () {
    final actual = ConjunctionRequiredOperation().createHasHashtags();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, HasOperatorType.hashtags);
  });

  test('.createNegatedHasHashtags', () {
    final actual = ConjunctionRequiredOperation().createNegatedHasHashtags();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, HasOperatorType.hashtags);
  });

  test('.createHasCashtags', () {
    final actual = ConjunctionRequiredOperation().createHasCashtags();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, HasOperatorType.cashtags);
  });

  test('.createNegatedHasCashtags', () {
    final actual = ConjunctionRequiredOperation().createNegatedHasCashtags();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, HasOperatorType.cashtags);
  });

  test('.createHasLinks', () {
    final actual = ConjunctionRequiredOperation().createHasLinks();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, HasOperatorType.links);
  });

  test('.createNegatedHasLinks', () {
    final actual = ConjunctionRequiredOperation().createNegatedHasLinks();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, HasOperatorType.links);
  });

  test('.createHasMentions', () {
    final actual = ConjunctionRequiredOperation().createHasMentions();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, HasOperatorType.mentions);
  });

  test('.createNegatedHasMentions', () {
    final actual = ConjunctionRequiredOperation().createNegatedHasMentions();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, HasOperatorType.mentions);
  });

  test('.createHasMedia', () {
    final actual = ConjunctionRequiredOperation().createHasMedia();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, HasOperatorType.media);
  });

  test('.createNegatedHasMedia', () {
    final actual = ConjunctionRequiredOperation().createNegatedHasMedia();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, HasOperatorType.media);
  });

  test('.createHasImages', () {
    final actual = ConjunctionRequiredOperation().createHasImages();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, HasOperatorType.images);
  });

  test('.createNegatedHasImages', () {
    final actual = ConjunctionRequiredOperation().createNegatedHasImages();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, HasOperatorType.images);
  });

  test('.createHasVideoLink', () {
    final actual = ConjunctionRequiredOperation().createHasVideoLink();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, HasOperatorType.videoLink);
  });

  test('.createNegatedHasVideoLink', () {
    final actual = ConjunctionRequiredOperation().createNegatedHasVideoLink();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, HasOperatorType.videoLink);
  });

  test('.createHasGeo', () {
    final actual = ConjunctionRequiredOperation().createHasGeo();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isFalse);
    expect(actual.type, HasOperatorType.geo);
  });

  test('.createNegatedHasGeo', () {
    final actual = ConjunctionRequiredOperation().createNegatedHasGeo();

    expect(actual, isA<HasOperator>());
    expect(actual.negated, isTrue);
    expect(actual.type, HasOperatorType.geo);
  });

  test('.createTweetLang', () {
    final actual = ConjunctionRequiredOperation().createTweetLang(
      Language.amharic,
    );

    expect(actual, isA<TweetLang>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedTweetLang', () {
    final actual = ConjunctionRequiredOperation().createNegatedTweetLang(
      Language.amharic,
    );

    expect(actual, isA<TweetLang>());
    expect(actual.negated, isTrue);
  });

  test('.createSource', () {
    final actual = ConjunctionRequiredOperation().createSource('test');

    expect(actual, isA<Source>());
    expect(actual.negated, isFalse);
  });

  test('.createNegatedSource', () {
    final actual = ConjunctionRequiredOperation().createNegatedSource('test');

    expect(actual, isA<Source>());
    expect(actual.negated, isTrue);
  });
}
