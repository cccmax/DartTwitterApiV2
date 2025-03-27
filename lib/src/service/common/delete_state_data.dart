// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'delete_state_data.freezed.dart';
part 'delete_state_data.g.dart';

@freezed
class DeleteStateData with _$DeleteStateData implements Data {
  const factory DeleteStateData({
    /// Indicates whether the content specified in the request has been deleted.
    @JsonKey(name: 'deleted') required bool isDeleted,
  }) = _DeleteStateData;

  factory DeleteStateData.fromJson(Map<String, Object?> json) =>
      _$DeleteStateDataFromJson(json);
}
