// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/tweet_param.dart';

void main() {
  test('.toString', () {
    final param = TweetParam(text: 'test');

    expect(
      param.toString(),
      'TweetParam(text: test, quoteTweetId: null, '
      'forSuperFollowersOnly: null, replySetting: null, '
      'directMessageDeepLink: null, media: null, geo: null, poll: null, '
      'reply: null);',
    );
  });

  group('==', () {
    test('when equals', () {
      final param1 = TweetParam(text: 'test');
      final param2 = TweetParam(text: 'test');

      expect(param1 == param2, isTrue);
    });

    test('when not equals', () {
      final param1 = TweetParam(text: 'test');
      final param2 = TweetParam(text: 'test1');

      expect(param1 == param2, isFalse);
    });
  });
}
