// ignore_for_file: public_member_api_docs, sort_constructors_first
// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../common/rate_limit.dart';

class TwitterStreamResponse<T> {
  /// Returns the new instance of [TwitterStreamResponse].
  const TwitterStreamResponse({
    required this.rateLimit,
    required this.stream,
  });

  /// The rate limit
  final RateLimit rateLimit;

  /// The stream
  final Stream<T> stream;

  @override
  String toString() =>
      'TwitterStreamResponse(rateLimit: $rateLimit, stream: $stream)';
}
