// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator.dart';
import '../validation_result.dart';

class BoundingBox extends Operator {
  /// Returns the new instance of [BoundingBox].
  const BoundingBox(
    this.westLongitude,
    this.southLatitude,
    this.eastLongitude,
    this.northLatitude, {
    bool negated = false,
  }) : super(negated);

  factory BoundingBox.negated(
    final double westLongitude,
    final double southLatitude,
    final double eastLongitude,
    final double northLatitude,
  ) =>
      BoundingBox(
        westLongitude,
        southLatitude,
        eastLongitude,
        northLatitude,
        negated: true,
      );

  /// The west longitude
  final double westLongitude;

  /// The south latitude
  final double southLatitude;

  /// The east longitude
  final double eastLongitude;

  /// The north latitude
  final double northLatitude;

  @override
  ValidationResult validate() {
    if (!(-180 <= westLongitude && westLongitude <= 180) ||
        !(-180 <= eastLongitude && eastLongitude <= 180)) {
      return ValidationResult.failed(
        'The longitude must be in the range of ±180.',
      );
    }

    if (!(-90 <= southLatitude && southLatitude <= 90) ||
        !(-90 <= northLatitude && northLatitude <= 90)) {
      return ValidationResult.failed(
        'The latitude must be in the range of ±90.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() {
    final buffer = StringBuffer()
      ..write('bounding_box:[')
      ..write(westLongitude)
      ..write(' ')
      ..write(southLatitude)
      ..write(' ')
      ..write(eastLongitude)
      ..write(' ')
      ..write(northLatitude)
      ..write(']');

    return buffer.toString();
  }
}
