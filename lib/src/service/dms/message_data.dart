// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'message_data.freezed.dart';
part 'message_data.g.dart';

@freezed
class MessageData with _$MessageData implements Data {
  const factory MessageData({
    /// The `id` of the event sent in this conversation.
    @JsonKey(name: 'dm_event_id') required String eventId,

    /// The `id` of the DM conversation.
    @JsonKey(name: 'dm_conversation_id') required String conversationId,
  }) = _MessageData;

  factory MessageData.fromJson(Map<String, Object?> json) =>
      _$MessageDataFromJson(json);
}
