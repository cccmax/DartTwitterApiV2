// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'retweet_state_data.freezed.dart';
part 'retweet_state_data.g.dart';

@freezed
class RetweetStateData with _$RetweetStateData implements Data {
  const factory RetweetStateData({
    /// Indicates whether the user Retweets the specified Tweet as a result
    /// of this request.
    @JsonKey(name: 'retweeted') required bool isRetweeted,
  }) = _RetweetStateData;

  factory RetweetStateData.fromJson(Map<String, Object?> json) =>
      _$RetweetStateDataFromJson(json);
}
