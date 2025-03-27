// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../../distance_unit.dart';
import '../operator.dart';
import '../validation_result.dart';

class PointRadius extends Operator {
  /// Returns the new instance of [PointRadius].
  const PointRadius(
    this.distanceUnit,
    this.longitude,
    this.latitude,
    this.radius, {
    bool negated = false,
  }) : super(negated);

  factory PointRadius.negated(
    final DistanceUnit distanceUnit,
    final double longitude,
    final double latitude,
    final double radius,
  ) =>
      PointRadius(
        distanceUnit,
        longitude,
        latitude,
        radius,
        negated: true,
      );

  /// The distance unit
  final DistanceUnit distanceUnit;

  /// The longitude
  final double longitude;

  /// The latitude
  final double latitude;

  /// The radius
  final double radius;

  @override
  ValidationResult validate() {
    if (!(-180 <= longitude && longitude <= 180)) {
      return ValidationResult.failed(
        'The longitude must be in the range of ±180.',
      );
    }

    if (!(-90 <= latitude && latitude <= 90)) {
      return ValidationResult.failed(
        'The latitude must be in the range of ±90.',
      );
    }

    if (radius < 0) {
      return ValidationResult.failed(
        'The radius must not be negative.',
      );
    }

    switch (distanceUnit) {
      case DistanceUnit.miles:
        if (radius > 25) {
          return ValidationResult.failed(
            'The radius must be less than 25 in miles.',
          );
        }

        break;
      case DistanceUnit.kilometers:
        if (radius > 40) {
          return ValidationResult.failed(
            'The radius must be less than 40 in kilometers.',
          );
        }

        break;
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() =>
      'point_radius:[$longitude $latitude $radius$_distanceUnitName]';

  /// Returns the name of distance unit.
  String get _distanceUnitName {
    switch (distanceUnit) {
      case DistanceUnit.miles:
        return 'mi';
      case DistanceUnit.kilometers:
        return 'km';
    }
  }
}
