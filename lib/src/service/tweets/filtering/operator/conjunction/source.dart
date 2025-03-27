// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class Source extends Operator {
  /// Returns the new instance of [Source].
  const Source(
    this.value, {
    bool negated = false,
  }) : super(negated);

  factory Source.negated(final String value) => Source(value, negated: true);

  /// The value
  final String value;

  @override
  ValidationResult validate() {
    if (value.isEmpty) {
      return ValidationResult.failed(
        'The source must not be an empty string.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => 'source:$value';
}
