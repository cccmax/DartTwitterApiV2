// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class Place extends Operator {
  /// Returns the new instance of [Place].
  const Place(
    this.value, {
    bool negated = false,
  }) : super(negated);

  factory Place.negated(final String value) => Place(value, negated: true);

  /// The place
  final String value;

  @override
  ValidationResult validate() {
    if (value.isEmpty) {
      return ValidationResult.failed(
        'The place must not be an empty string.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => 'place:${toExactPhraseIfNecessary(value)}';
}
