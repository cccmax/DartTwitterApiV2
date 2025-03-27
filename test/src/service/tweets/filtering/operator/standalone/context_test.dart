// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/context.dart';

void main() {
  group('.toString', () {
    test('with string value', () {
      final actual = Context('10.799022225751871488');

      expect(actual.toString(), 'context:10.799022225751871488');
    });

    test('when negated', () {
      final actual = Context.negated('domain_id.*');

      expect(actual.toString(), '-context:domain_id.*');
    });

    test('when value is empty', () {
      final actual = Context('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The context must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
