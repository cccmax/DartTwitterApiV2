// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../../core/serializable.dart';

enum DMEventType implements Serializable {
  /// `MessageCreate`
  @JsonValue('MessageCreate')
  messageCreate('MessageCreate'),

  /// `ParticipantsJoin`
  @JsonValue('ParticipantsJoin')
  participantsJoin('ParticipantsJoin'),

  /// `ParticipantsLeave`
  @JsonValue('ParticipantsLeave')
  participantsLeave('ParticipantsLeave');

  @override
  final String value;

  static DMEventType valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const DMEventType(this.value);
}
