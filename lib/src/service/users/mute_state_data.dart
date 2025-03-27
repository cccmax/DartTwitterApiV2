// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'mute_state_data.freezed.dart';
part 'mute_state_data.g.dart';

@freezed
class MuteStateData with _$MuteStateData implements Data {
  const factory MuteStateData({
    /// Indicates whether the user is muting the specified user as a result of
    /// this request.
    ///
    /// The returned value is `false` for a successful unmute request.
    @JsonKey(name: 'muting') required bool isMuting,
  }) = _MuteStateData;

  factory MuteStateData.fromJson(Map<String, Object?> json) =>
      _$MuteStateDataFromJson(json);
}
