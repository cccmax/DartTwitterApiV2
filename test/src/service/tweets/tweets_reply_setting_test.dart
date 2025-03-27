// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/reply_setting.dart';

void main() {
  test('.name', () {
    expect(ReplySetting.everyone.name == 'everyone', isTrue);
    expect(ReplySetting.following.name == 'following', isTrue);
    expect(ReplySetting.mentionedUsers.name == 'mentionedUsers', isTrue);
  });

  test('.value', () {
    expect(ReplySetting.everyone.value == 'everyone', isTrue);
    expect(ReplySetting.following.value == 'following', isTrue);
    expect(ReplySetting.mentionedUsers.value == 'mentionedUsers', isTrue);
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(ReplySetting.valueOf('following'), ReplySetting.following);
    });

    test('when value is unsupported', () {
      expect(
          () => ReplySetting.valueOf('test'), throwsA(isA<UnsupportedError>()));
    });
  });
}
