// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

enum MediaCategory implements Serializable {
  tweet('TWEET'),
  directMessage('DM');

  @override
  final String value;

  static MediaCategory valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const MediaCategory(this.value);
}
