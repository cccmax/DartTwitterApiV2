// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

enum RangeOperatorType {
  followersCount('followers_count'),
  followingCount('following_count'),
  listedCount('listed_count'),
  tweetsCount('tweets_count');

  /// The value
  final String value;

  const RangeOperatorType(this.value);
}
