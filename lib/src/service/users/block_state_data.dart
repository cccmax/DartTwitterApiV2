// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'block_state_data.freezed.dart';
part 'block_state_data.g.dart';

@freezed
class BlockStateData with _$BlockStateData implements Data {
  const factory BlockStateData({
    /// Indicates whether the user is blocking the specified user as a result
    /// of this request.
    @JsonKey(name: 'blocking') required bool isBlocking,
  }) = _BlockStateData;

  factory BlockStateData.fromJson(Map<String, Object?> json) =>
      _$BlockStateDataFromJson(json);
}
