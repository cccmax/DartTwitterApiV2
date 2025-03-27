// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/media/media_category.dart';

void main() {
  test('.name', () {
    expect(MediaCategory.tweet.name, 'tweet');
    expect(MediaCategory.directMessage.name, 'directMessage');
  });

  test('.value', () {
    expect(MediaCategory.tweet.value, 'TWEET');
    expect(MediaCategory.directMessage.value, 'DM');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(MediaCategory.valueOf('TWEET'), MediaCategory.tweet);
    });

    test('when value is unsupported', () {
      expect(() => MediaCategory.valueOf('test'),
          throwsA(isA<UnsupportedError>()));
    });
  });
}
