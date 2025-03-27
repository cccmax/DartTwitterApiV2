// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'variant.freezed.dart';
part 'variant.g.dart';

@freezed
class Variant with _$Variant {
  @JsonSerializable(includeIfNull: false)
  const factory Variant({
    /// The number of bit rates in the content.
    ///
    /// It may be null when content type is `application/x-mpegURL`.
    int? bitRate,

    /// The content type.
    required String contentType,

    /// The url to the content.
    required String url,
  }) = _Variant;

  factory Variant.fromJson(Map<String, Object?> json) =>
      _$VariantFromJson(json);
}
