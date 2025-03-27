// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet_edit_controls.freezed.dart';
part 'tweet_edit_controls.g.dart';

@freezed
class TweetEditControls with _$TweetEditControls {
  const factory TweetEditControls({
    /// A flag indicating whether the tweet is editable or not.
    ///
    /// Editable Tweets can be edited for the first 30 minutes after creation.
    @JsonKey(name: 'is_edit_eligible') required bool isEditable,

    /// A number indicating how many more tweets will be allowed to be edited.
    ///
    /// Tweet can be edited up to 5 times.
    @JsonKey(name: 'edits_remaining') required int remainingCount,

    /// Indicates when the permission to edit tweets will expire.
    @JsonKey(name: 'editable_until') required DateTime expireAt,
  }) = _TweetEditControls;

  factory TweetEditControls.fromJson(Map<String, Object?> json) =>
      _$TweetEditControlsFromJson(json);
}
