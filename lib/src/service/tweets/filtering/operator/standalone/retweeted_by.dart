// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class RetweetedBy extends Operator {
  /// Returns the new instance of [RetweetedBy].
  const RetweetedBy(
    this.user, {
    bool negated = false,
  }) : super(negated);

  factory RetweetedBy.negated(final String user) =>
      RetweetedBy(user, negated: true);

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
  String format() => 'retweets_of:$user';
}
