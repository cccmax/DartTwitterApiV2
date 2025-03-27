// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../../common/range.dart';
import 'validation_result.dart';

abstract class FilteringRuleOperator {
  const FilteringRuleOperator(this.negated);

  /// The flag this operator is negated or not.
  final bool negated;

  /// Returns the formatted rule literal.
  String format();

  /// Returns the result of validation.
  ValidationResult validate() => ValidationResult.succeeded();

  /// Returns the [value] as the exact phrase format if [value] contains
  /// a space.
  String toExactPhraseIfNecessary(final String value) {
    if (value.contains(' ')) {
      return '"$value"';
    }

    return value;
  }

  String toRangeString(final Range range) {
    if (range.isPoint) {
      return '${range.to}';
    }

    return '${range.from}..${range.to}';
  }

  @override
  String toString() {
    final result = validate();

    if (result.hasError) {
      throw ArgumentError(result.message);
    }

    if (negated) {
      return '-${format()}';
    }

    return format();
  }
}
