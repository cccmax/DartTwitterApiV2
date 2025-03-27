// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'update_state_data.freezed.dart';
part 'update_state_data.g.dart';

@freezed
class UpdateStateData with _$UpdateStateData implements Data {
  const factory UpdateStateData({
    /// Indicates whether the content specified in the request has been updated.
    @JsonKey(name: 'updated') required bool isUpdated,
  }) = _UpdateStateData;

  factory UpdateStateData.fromJson(Map<String, Object?> json) =>
      _$UpdateStateDataFromJson(json);
}
