// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dm_attachments.freezed.dart';
part 'dm_attachments.g.dart';

@freezed
class DMAttachments with _$DMAttachments {
  const factory DMAttachments({
    /// List of unique identifiers of media attached to this Tweet. These
    /// identifiers use the same media key format as those returned by the
    /// Media Library.
    ///
    /// You can obtain the expanded object in includes.media by adding
    /// `TweetExpansion.attachmentsMediaKeys` in the request's query parameter.
    required List<String> mediaKeys,
  }) = _DMAttachments;

  factory DMAttachments.fromJson(Map<String, Object?> json) =>
      _$DMAttachmentsFromJson(json);
}
