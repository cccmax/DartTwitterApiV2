// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class UserBioLocation extends Operator {
  /// Returns the new instance of [UserBioLocation].
  const UserBioLocation(
    this.value, {
    bool negated = false,
  }) : super(negated);

  factory UserBioLocation.negated(final String value) =>
      UserBioLocation(value, negated: true);

  /// The bio location
  final String value;

  @override
  ValidationResult validate() {
    if (value.isEmpty) {
      return ValidationResult.failed(
        'The bio location must not be an empty string.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => 'bio_location:${toExactPhraseIfNecessary(value)}';
}
