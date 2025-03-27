// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class Entity extends Operator {
  /// Returns the new instance of [Entity].
  const Entity(
    this.value, {
    bool negated = false,
  }) : super(negated);

  factory Entity.negated(final String value) => Entity(value, negated: true);

  /// The value
  final String value;

  @override
  ValidationResult validate() {
    if (value.isEmpty) {
      return ValidationResult.failed(
        'The entity must not be an empty string.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => 'entity:"$value"';
}
