// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

/// This enum is used to control who can reply to Tweet.
///
/// [everyone]: Everyone can reply. This is default value
///
/// [mentionedUsers]: Only mentioned users can reply
///
/// [following]: Only people you follow can reply
enum ReplySetting implements Serializable {
  /// Everyone can reply
  everyone,

  /// Only mentioned users can reply
  mentionedUsers,

  /// Only people you follow can reply
  following;

  @override
  String get value => name;

  static ReplySetting valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const ReplySetting();
}
