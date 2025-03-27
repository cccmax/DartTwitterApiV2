// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';
import '../common/locale.dart';

part 'uploaded_media_data.freezed.dart';
part 'uploaded_media_data.g.dart';

/// This object represents uploaded media data.
@freezed
class UploadedMediaData with _$UploadedMediaData implements Data {
  @JsonSerializable(includeIfNull: false)
  const factory UploadedMediaData({
    /// The identifier for the uploaded media.
    @JsonKey(name: 'media_id_string') required String id,

    /// The date and time this media will expire.
    required DateTime expiresAt,

    /// The locale of this media.
    ///
    /// This field is only set if a .srt file is uploaded.
    Locale? locale,
  }) = _UploadedMediaData;

  factory UploadedMediaData.fromJson(Map<String, Object?> json) =>
      _$UploadedMediaDataFromJson(json);
}
