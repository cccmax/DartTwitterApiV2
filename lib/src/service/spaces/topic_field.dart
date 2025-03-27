// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

enum TopicField implements Serializable {
  /// `id`
  id('id'),

  /// `name`
  name('name'),

  /// `description`
  description('description');

  @override
  final String value;

  static TopicField valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const TopicField(this.value);
}
