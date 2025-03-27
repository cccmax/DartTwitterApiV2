// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_banner_variant.freezed.dart';
part 'profile_banner_variant.g.dart';

@freezed
class ProfileBannerVariant with _$ProfileBannerVariant {
  const factory ProfileBannerVariant({
    /// The height of this image.
    @JsonKey(name: 'h') required int height,

    /// The height of this image.
    @JsonKey(name: 'w') required int width,

    /// The url of this image.
    required String url,
  }) = _ProfileBannerVariant;

  factory ProfileBannerVariant.fromJson(Map<String, Object?> json) =>
      _$ProfileBannerVariantFromJson(json);
}
