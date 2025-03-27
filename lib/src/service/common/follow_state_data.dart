// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'follow_state_data.freezed.dart';
part 'follow_state_data.g.dart';

@freezed
class FollowStateData with _$FollowStateData implements Data {
  const factory FollowStateData({
    /// Indicates whether the user followed the specified List as a result
    /// of the request.
    @JsonKey(name: 'following') required bool isFollowing,

    /// Indicates whether the target user will need to approve the follow
    /// request.
    ///
    /// Note that the authenticated user will follow the target user only
    /// when they approve the incoming follower request.
    @JsonKey(name: 'pending_follow') @Default(false) bool isPending,
  }) = _FollowStateData;

  factory FollowStateData.fromJson(Map<String, Object?> json) =>
      _$FollowStateDataFromJson(json);
}
