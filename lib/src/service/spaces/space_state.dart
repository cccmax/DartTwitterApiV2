// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

/// This enum represents the state of the space.
enum SpaceState implements Serializable {
  /// "scheduled"
  scheduled,

  /// "live"
  live,

  /// "ended"
  ended;

  @override
  String get value => name;

  static SpaceState valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const SpaceState();
}
