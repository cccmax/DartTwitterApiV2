// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class Conversation extends Operator {
  /// Returns the new instance of [Conversation].
  const Conversation(
    this.tweetId, {
    bool negated = false,
  }) : super(negated);

  factory Conversation.negated(final String tweetId) =>
      Conversation(tweetId, negated: true);

  /// The tweet id
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
  String format() => 'conversation_id:$tweetId';
}
