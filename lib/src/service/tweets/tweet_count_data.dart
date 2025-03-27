// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'tweet_count_data.freezed.dart';
part 'tweet_count_data.g.dart';

@freezed
class TweetCountData with _$TweetCountData implements Data {
  const factory TweetCountData({
    /// Start time for the granularity.
    required DateTime start,

    /// End time for the granularity.
    required DateTime end,

    /// Count of the volume of Tweets that match the query.
    @JsonKey(name: 'tweet_count') required int count,
  }) = _TweetCountData;

  factory TweetCountData.fromJson(Map<String, Object?> json) =>
      _$TweetCountDataFromJson(json);
}
