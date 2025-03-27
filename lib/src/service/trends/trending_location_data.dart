// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../../core/country.dart';
import '../common/data.dart';

part 'trending_location_data.freezed.dart';
part 'trending_location_data.g.dart';

@freezed
class TrendingLocationData with _$TrendingLocationData implements Data {
  @JsonSerializable(includeIfNull: false)
  const factory TrendingLocationData({
    /// The identifier of location for trending topics.
    @JsonKey(name: 'woeid') required int id,

    /// The identifier for parent location.
    @JsonKey(name: 'parentid') required int parentId,

    /// The name of this location.
    required String name,

    /// The country name of this location.
    @JsonKey(name: 'country') required String countryName,

    /// The country code of this location.
    @JsonKey(name: 'countryCode') required Country? country,
  }) = _TrendingLocationData;

  factory TrendingLocationData.fromJson(Map<String, Object?> json) =>
      _$TrendingLocationDataFromJson(json);
}
