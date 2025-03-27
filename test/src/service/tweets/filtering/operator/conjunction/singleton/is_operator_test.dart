// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/is_operator.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/is_operator_type.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = IsOperator(IsOperatorType.retweet);

      expect(actual.toString(), 'is:retweet');
    });

    test('when negated', () {
      final actual = IsOperator(IsOperatorType.retweet, negated: true);

      expect(actual.toString(), '-is:retweet');
    });
  });
}
