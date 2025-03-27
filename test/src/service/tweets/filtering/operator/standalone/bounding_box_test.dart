// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/bounding_box.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = BoundingBox(10.0, 10.0, 10.0, 10.0);

      expect(actual.toString(), 'bounding_box:[10.0 10.0 10.0 10.0]');
    });

    test('when negated', () {
      final actual = BoundingBox.negated(10.0, 10.0, 10.0, 10.0);

      expect(actual.toString(), '-bounding_box:[10.0 10.0 10.0 10.0]');
    });

    test('when westLongitude is 180', () {
      final actual = BoundingBox(180.0, 10.0, 10.0, 10.0);

      expect(actual.toString(), 'bounding_box:[180.0 10.0 10.0 10.0]');
    });

    test('when westLongitude is -180', () {
      final actual = BoundingBox(-180.0, 10.0, 10.0, 10.0);

      expect(actual.toString(), 'bounding_box:[-180.0 10.0 10.0 10.0]');
    });

    test('when eastLongitude is 180', () {
      final actual = BoundingBox(180.0, 10.0, 180.0, 10.0);

      expect(actual.toString(), 'bounding_box:[180.0 10.0 180.0 10.0]');
    });

    test('when eastLongitude is -180', () {
      final actual = BoundingBox(-180.0, 10.0, -180.0, 10.0);

      expect(actual.toString(), 'bounding_box:[-180.0 10.0 -180.0 10.0]');
    });

    test('when southLatitude is 90', () {
      final actual = BoundingBox(180.0, 90.0, 180.0, 10.0);

      expect(actual.toString(), 'bounding_box:[180.0 90.0 180.0 10.0]');
    });

    test('when southLatitude is -90', () {
      final actual = BoundingBox(-180.0, -90.0, -180.0, 10.0);

      expect(actual.toString(), 'bounding_box:[-180.0 -90.0 -180.0 10.0]');
    });

    test('when northLatitude is 90', () {
      final actual = BoundingBox(180.0, 90.0, 180.0, 90.0);

      expect(actual.toString(), 'bounding_box:[180.0 90.0 180.0 90.0]');
    });

    test('when northLatitude is -90', () {
      final actual = BoundingBox(-180.0, -90.0, -180.0, -90.0);

      expect(actual.toString(), 'bounding_box:[-180.0 -90.0 -180.0 -90.0]');
    });

    test('when westLongitude is 181', () {
      final actual = BoundingBox(181.0, 10.0, 10.0, 10.0);

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

    test('when westLongitude is -181', () {
      final actual = BoundingBox(-181.0, 10.0, 10.0, 10.0);

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

    test('when eastLongitude is 181', () {
      final actual = BoundingBox(180.0, 10.0, 181.0, 10.0);

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

    test('when eastLongitude is -181', () {
      final actual = BoundingBox(-180.0, 10.0, -181.0, 10.0);

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

    test('when southLatitude is 91', () {
      final actual = BoundingBox(180.0, 91.0, 180.0, 10.0);

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

    test('when southLatitude is -91', () {
      final actual = BoundingBox(-180.0, -91.0, -180.0, 10.0);

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

    test('when northLatitude is 91', () {
      final actual = BoundingBox(180.0, 90.0, 180.0, 91.0);

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

    test('when northLatitude is -91', () {
      final actual = BoundingBox(-180.0, -90.0, -180.0, -91.0);

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
  });
}
