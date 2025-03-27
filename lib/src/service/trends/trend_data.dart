// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'trend_data.freezed.dart';
part 'trend_data.g.dart';

@freezed
class TrendData with _$TrendData implements Data {
  @JsonSerializable(includeIfNull: false)
  const factory TrendData({
    /// The name of this trend.
    ///
    /// It includes "#" as prefix if it's a hashtag trend.
    required String name,
  }) = _TrendData;

  factory TrendData.fromJson(Map<String, Object?> json) =>
      _$TrendDataFromJson(json);
}
