// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/has_operator.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/has_operator_type.dart';

// Project imports:

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = HasOperator(HasOperatorType.hashtags);

      expect(actual.toString(), 'has:hashtags');
    });

    test('when negated', () {
      final actual = HasOperator(HasOperatorType.hashtags, negated: true);

      expect(actual.toString(), '-has:hashtags');
    });
  });
}
