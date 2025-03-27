// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../tweets/matching_rule.dart';
import '../tweets/tweet_data.dart';
import 'twitter_response.dart';

class FilteredStreamResponse extends TwitterResponse<TweetData, void> {
  /// Returns the new instance of [FilteredStreamResponse].
  const FilteredStreamResponse({
    required super.headers,
    required super.status,
    required super.request,
    required super.rateLimit,
    required super.data,
    super.includes,
    required this.matchingRules,
  });

  /// The matching rules
  final List<MatchingRule> matchingRules;

  @override
  String toString() {
    final StringBuffer buffer = StringBuffer();
    buffer.write('FilteredStreamResponse(');
    buffer.write('rateLimit: $rateLimit, ');
    buffer.write('data: $data, ');
    buffer.write('includes: $includes, ');
    buffer.write('meta: null, ');
    buffer.write('matchingRules: $matchingRules');
    buffer.write(')');

    return buffer.toString();
  }
}
