// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/language.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/tweet_lang.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = TweetLang(Language.amharic);

      expect(actual.toString(), 'lang:am');
    });

    test('when negated', () {
      final actual = TweetLang.negated(Language.amharic);

      expect(actual.toString(), '-lang:am');
    });
  });
}
