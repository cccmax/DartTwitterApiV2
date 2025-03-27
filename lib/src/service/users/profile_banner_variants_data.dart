// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';
import 'profile_banner_variant.dart';

part 'profile_banner_variants_data.freezed.dart';
part 'profile_banner_variants_data.g.dart';

@freezed
class ProfileBannerVariantsData
    with _$ProfileBannerVariantsData
    implements Data {
  const factory ProfileBannerVariantsData({
    /// The banner image for ipad.
    required ProfileBannerVariant ipad,

    /// The banner image for ipad retina.
    required ProfileBannerVariant ipadRetina,

    /// The banner image for web.
    required ProfileBannerVariant web,

    /// The banner image for web retina.
    required ProfileBannerVariant webRetina,

    /// The banner image for mobile.
    required ProfileBannerVariant mobile,

    /// The banner image for mobile retina.
    required ProfileBannerVariant mobileRetina,
  }) = _ProfileBannerVariantsData;

  factory ProfileBannerVariantsData.fromJson(Map<String, Object?> json) =>
      _$ProfileBannerVariantsDataFromJson(json);
}
