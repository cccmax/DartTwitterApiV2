// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class RetweetsOf extends Operator {
  /// Returns the new instance of [RetweetsOf].
  const RetweetsOf(
    this.tweetId, {
    bool negated = false,
  }) : super(negated);

  factory RetweetsOf.negated(final String tweetId) =>
      RetweetsOf(tweetId, negated: true);

  /// The value
  final String tweetId;

  @override
  ValidationResult validate() {
    if (tweetId.isEmpty) {
      return ValidationResult.failed(
        'The tweet id must not be an empty string.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => 'retweets_of_tweet_id:$tweetId';
}
