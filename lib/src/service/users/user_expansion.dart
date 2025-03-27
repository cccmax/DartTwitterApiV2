// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

/// Represents an extensible field about User.
enum UserExpansion implements Serializable {
  /// `pinned_tweet_id`
  pinnedTweetId('pinned_tweet_id');

  @override
  final String value;

  static UserExpansion valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const UserExpansion(this.value);
}
