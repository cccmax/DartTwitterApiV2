// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_error.freezed.dart';
part 'upload_error.g.dart';

@freezed
class UploadError with _$UploadError {
  const factory UploadError({
    /// The error code.
    required int code,

    /// The error name.
    required String name,

    /// The error message.
    required String message,
  }) = _UploadError;

  factory UploadError.fromJson(Map<String, Object?> json) =>
      _$UploadErrorFromJson(json);
}
