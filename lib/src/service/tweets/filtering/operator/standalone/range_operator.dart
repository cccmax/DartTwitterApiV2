// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../../../common/range.dart';
import '../operator.dart';
import '../validation_result.dart';
import 'range_operator_type.dart';

class RangeOperator extends Operator {
  /// Returns the new instance of [RangeOperator].
  const RangeOperator(
    this.type,
    this.range, {
    bool negated = false,
  }) : super(negated);

  factory RangeOperator.negated(
    final RangeOperatorType type,
    final Range range,
  ) =>
      RangeOperator(type, range, negated: true);

  /// The range type
  final RangeOperatorType type;

  /// The range
  final Range range;

  @override
  ValidationResult validate() {
    if (range.from.isNegative || range.to.isNegative) {
      return ValidationResult.failed(
        'The range must not be negative.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => '${type.value}:${toRangeString(range)}';
}
