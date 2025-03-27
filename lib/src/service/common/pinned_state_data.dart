// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'pinned_state_data.freezed.dart';
part 'pinned_state_data.g.dart';

@freezed
class PinnedStateData with _$PinnedStateData implements Data {
  const factory PinnedStateData({
    /// Indicates whether the user pinned the specified List as a result
    /// of the request.
    @JsonKey(name: 'pinned') required bool isPinned,
  }) = _PinnedStateData;

  factory PinnedStateData.fromJson(Map<String, Object?> json) =>
      _$PinnedStateDataFromJson(json);
}
