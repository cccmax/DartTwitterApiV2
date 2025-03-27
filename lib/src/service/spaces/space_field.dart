// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

enum SpaceField implements Serializable {
  /// `id`
  id('id'),

  /// `title`
  title('title'),

  /// `state`
  state('state'),

  /// `creator_id`
  creatorId('creator_id'),

  /// `lang`
  lang('lang'),

  /// `host_ids`
  hostIds('host_ids'),

  /// `topic_ids`
  topicIds('topic_ids'),

  /// `speaker_ids`
  speakerIds('speaker_ids'),

  /// `invited_user_ids`
  invitedUserIds('invited_user_ids'),

  /// `subscriber_count`
  subscriberCount('subscriber_count'),

  /// `participant_count`
  participantCount('participant_count'),

  /// `is_ticketed`
  ticketed('is_ticketed'),

  /// `scheduled_start`
  scheduledStart('scheduled_start'),

  /// `started_at`
  startedAt('started_at'),

  /// `ended_at`
  endedAt('ended_at'),

  /// `created_at`
  createdAt('created_at'),

  /// `updated_at`
  updatedAt('updated_at');

  @override
  final String value;

  static SpaceField valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const SpaceField(this.value);
}
