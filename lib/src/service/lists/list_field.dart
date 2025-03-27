// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

enum ListField implements Serializable {
  /// `created_at`
  createdAt('created_at'),

  /// `follower_count`
  followerCount('follower_count'),

  /// `member_count`
  memberCount('member_count'),

  /// `private`
  private('private'),

  /// `description`
  description('description'),

  /// `owner_id`
  ownerId('owner_id');

  @override
  final String value;

  static ListField valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const ListField(this.value);
}
