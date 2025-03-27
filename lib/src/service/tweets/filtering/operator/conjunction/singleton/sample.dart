// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../validation_result.dart';
import 'singleton_operator.dart';

class Sample extends SingletonOperator {
  /// Returns the new instance of [Sample].
  const Sample(this.percent) : super(false);

  /// The percent
  final int percent;

  @override
  ValidationResult validate() {
    if (!(1 <= percent && percent <= 100)) {
      return ValidationResult.failed(
        'The percent must be from 1 to 100.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => 'sample:$percent';
}
