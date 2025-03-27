// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class Url extends Operator {
  /// Returns the new instance of [Url].
  const Url(
    this.value, {
    bool negated = false,
  }) : super(negated);

  factory Url.negated(final String value) => Url(value, negated: true);

  /// The url
  final String value;

  @override
  ValidationResult validate() {
    if (value.isEmpty) {
      return ValidationResult.failed(
        'The url must not be an empty string.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => 'url:"$value"';
}
