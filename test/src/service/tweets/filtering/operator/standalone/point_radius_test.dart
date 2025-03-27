// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/distance_unit.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/point_radius.dart';

void main() {
  group('.toString', () {
    test('normal case with miles', () {
      final actual = PointRadius(DistanceUnit.miles, 180.0, 90.0, 25.0);

      expect(
        actual.toString(),
        'point_radius:[180.0 90.0 25.0mi]',
      );
    });

    test('normal case with kilometers', () {
      final actual = PointRadius(DistanceUnit.kilometers, 180.0, 90.0, 40.0);

      expect(
        actual.toString(),
        'point_radius:[180.0 90.0 40.0km]',
      );
    });

    test('when negated', () {
      final actual = PointRadius.negated(DistanceUnit.miles, 180.0, 90.0, 25.0);

      expect(
        actual.toString(),
        '-point_radius:[180.0 90.0 25.0mi]',
      );
    });

    test('when longitude is 181', () {
      final actual = PointRadius(DistanceUnit.miles, 181.0, 90.0, 25.0);

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The longitude must be in the range of ±180.',
            ),
          ),
        ),
      );
    });

    test('when longitude is -181', () {
      final actual = PointRadius(DistanceUnit.miles, -181.0, 90.0, 25.0);

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The longitude must be in the range of ±180.',
            ),
          ),
        ),
      );
    });

    test('when latitude is 91', () {
      final actual = PointRadius(DistanceUnit.miles, 180.0, 91.0, 25.0);

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The latitude must be in the range of ±90.',
            ),
          ),
        ),
      );
    });

    test('when latitude is -91', () {
      final actual = PointRadius(DistanceUnit.miles, 180.0, -91.0, 25.0);

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The latitude must be in the range of ±90.',
            ),
          ),
        ),
      );
    });

    test('when radius is negative', () {
      final actual = PointRadius(DistanceUnit.miles, 180.0, -90.0, -1);

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) => e.message == 'The radius must not be negative.',
            ),
          ),
        ),
      );
    });

    test('when radius is greater than 25 with miles', () {
      final actual = PointRadius(DistanceUnit.miles, 180.0, -90.0, 26);

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The radius must be less than 25 in miles.',
            ),
          ),
        ),
      );
    });

    test('when radius is greater than 40 with kilometers', () {
      final actual = PointRadius(DistanceUnit.kilometers, 180.0, -90.0, 41);

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The radius must be less than 40 in kilometers.',
            ),
          ),
        ),
      );
    });
  });
}
