// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

class MessageAttachmentsParam {
  /// Returns the new instance of [MessageAttachmentsParam].
  const MessageAttachmentsParam({
    required this.mediaIds,
  });

  /// A single Media ID being attached to the Direct Message
  final List<String> mediaIds;

  @override
  String toString() => 'MessageAttachmentsParam(mediaIds: $mediaIds)';

  @override
  bool operator ==(covariant MessageAttachmentsParam other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.mediaIds, mediaIds);
  }

  @override
  int get hashCode => mediaIds.hashCode;
}
