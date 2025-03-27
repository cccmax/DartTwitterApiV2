// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

/// Represents an extensible field about Space.
enum SpaceExpansion implements Serializable {
  /// `invited_user_ids`
  invitedUserIds('invited_user_ids'),

  /// `speaker_ids`
  speakerIds('speaker_ids'),

  /// `creator_id`
  creatorId('creator_id'),

  /// `host_ids`
  hostIds('host_ids'),

  /// `topic_ids`
  topicIds('topic_ids');

  @override
  final String value;

  static SpaceExpansion valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const SpaceExpansion(this.value);
}
