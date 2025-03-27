// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class Cashtag extends Operator {
  /// Returns the new instance of [Cashtag].
  const Cashtag(
    this.value, {
    bool negated = false,
  }) : super(negated);

  factory Cashtag.negated(final String value) => Cashtag(value, negated: true);

  /// The value
  final String value;

  @override
  ValidationResult validate() {
    if (value.startsWith('\$') && value.length == 1) {
      return ValidationResult.failed(
        'The symbol "\$" was specified but the cashtag value does not exist.',
      );
    }

    if (value.isEmpty) {
      return ValidationResult.failed(
        'The cashtag must not be an empty string.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() {
    if (value.startsWith('\$')) {
      return value;
    }

    return '\$$value';
  }
}
