// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/range_operator_type.dart';

void main() {
  test('.name', () {
    expect(RangeOperatorType.followersCount.name, 'followersCount');
    expect(RangeOperatorType.followingCount.name, 'followingCount');
    expect(RangeOperatorType.listedCount.name, 'listedCount');
    expect(RangeOperatorType.tweetsCount.name, 'tweetsCount');
  });

  test('.value', () {
    expect(RangeOperatorType.followersCount.value, 'followers_count');
    expect(RangeOperatorType.followingCount.value, 'following_count');
    expect(RangeOperatorType.listedCount.value, 'listed_count');
    expect(RangeOperatorType.tweetsCount.value, 'tweets_count');
  });
}
