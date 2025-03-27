// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/tweet_count_granularity.dart';

void main() {
  test('.name', () {
    expect(TweetCountGranularity.minute.name, 'minute');
    expect(TweetCountGranularity.hour.name, 'hour');
    expect(TweetCountGranularity.day.name, 'day');
  });

  test('.value', () {
    expect(TweetCountGranularity.minute.value, 'minute');
    expect(TweetCountGranularity.hour.value, 'hour');
    expect(TweetCountGranularity.day.value, 'day');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(TweetCountGranularity.valueOf('day'), TweetCountGranularity.day);
    });

    test('when value is unsupported', () {
      expect(() => TweetCountGranularity.valueOf('test'),
          throwsA(isA<UnsupportedError>()));
    });
  });
}
