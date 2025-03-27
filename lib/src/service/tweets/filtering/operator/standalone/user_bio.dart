// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class UserBio extends Operator {
  /// Returns the new instance of [UserBio].
  const UserBio(
    this.value, {
    bool negated = false,
  }) : super(negated);

  factory UserBio.negated(final String value) => UserBio(value, negated: true);

  /// The bio
  final String value;

  @override
  ValidationResult validate() {
    if (value.isEmpty) {
      return ValidationResult.failed(
        'The bio must not be an empty string.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => 'bio:${toExactPhraseIfNecessary(value)}';
}
