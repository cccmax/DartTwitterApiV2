// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'like_state_data.freezed.dart';
part 'like_state_data.g.dart';

@freezed
class LikeStateData with _$LikeStateData implements Data {
  const factory LikeStateData({
    /// Indicates whether the user likes the specified Tweet
    /// as a result of this request.
    @JsonKey(name: 'liked') required bool isLiked,
  }) = _LikeStateData;

  factory LikeStateData.fromJson(Map<String, Object?> json) =>
      _$LikeStateDataFromJson(json);
}
