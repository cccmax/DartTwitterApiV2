// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class TweetTo extends Operator {
  /// Returns the new instance of [TweetTo].
  const TweetTo(
    this.user, {
    bool negated = false,
  }) : super(negated);

  factory TweetTo.negated(final String user) => TweetTo(user, negated: true);

  /// The user
  final String user;

  @override
  ValidationResult validate() {
    if (user.isEmpty) {
      return ValidationResult.failed(
        'The user identifier must not be an empty string.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => 'to:$user';
}
