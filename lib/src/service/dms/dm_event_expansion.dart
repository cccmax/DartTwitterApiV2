// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

enum DMEventExpansion implements Serializable {
  /// `attachments.media_keys`
  attachmentsMediaKeys('attachments.media_keys'),

  /// `referenced_tweets.id`
  referencedTweetsId('referenced_tweets.id'),

  /// `sender_id`
  senderId('sender_id'),

  /// `participant_id/;s`
  participantIds('participant_ids');

  @override
  final String value;

  static DMEventExpansion valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const DMEventExpansion(this.value);
}
