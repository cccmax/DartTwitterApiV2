// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'message_attachments_param.dart';

class MessageParam {
  /// Returns the new instance of [MessageParam].
  const MessageParam({
    required this.text,
    this.attachments,
  });

  /// Text of the Direct Message being created
  final String text;

  /// Attachment of the Direct Message being created
  final MessageAttachmentsParam? attachments;

  @override
  String toString() => 'MessageParam(text: $text, attachments: $attachments)';

  @override
  bool operator ==(covariant MessageParam other) {
    if (identical(this, other)) return true;

    return other.text == text && other.attachments == attachments;
  }

  @override
  int get hashCode => text.hashCode ^ attachments.hashCode;
}
