// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'reply_state_data.freezed.dart';
part 'reply_state_data.g.dart';

@freezed
class ReplyStateData with _$ReplyStateData implements Data {
  const factory ReplyStateData({
    /// Indicates if the Tweet was successfully hidden or unhidden.
    @JsonKey(name: 'hidden') required bool isHidden,
  }) = _ReplyStateData;

  factory ReplyStateData.fromJson(Map<String, Object?> json) =>
      _$ReplyStateDataFromJson(json);
}
