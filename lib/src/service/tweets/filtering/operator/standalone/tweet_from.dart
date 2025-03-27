// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class TweetFrom extends Operator {
  /// Returns the new instance of [TweetFrom].
  const TweetFrom(
    this.user, {
    bool negated = false,
  }) : super(negated);

  factory TweetFrom.negated(final String user) =>
      TweetFrom(user, negated: true);

  /// The username
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
  String format() => 'from:$user';
}
