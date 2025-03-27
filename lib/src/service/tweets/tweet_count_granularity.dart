// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

/// It represents the granularity of the tweet count.
enum TweetCountGranularity implements Serializable {
  minute,
  hour,
  day;

  @override
  String get value => name;

  static TweetCountGranularity valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const TweetCountGranularity();
}
