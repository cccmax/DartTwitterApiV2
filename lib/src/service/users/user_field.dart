// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

enum UserField implements Serializable {
  /// `id`
  id('id'),

  /// `description`
  description('description'),

  /// `name`
  name('name'),

  /// `username`
  username('username'),

  /// `url`
  url('url'),

  /// `profile_image_url`
  profileImageUrl('profile_image_url'),

  /// `location`
  location('location'),

  /// `pinned_tweet_id`
  pinnedTweetId('pinned_tweet_id'),

  /// `protected`
  protected('protected'),

  /// `verified`
  verified('verified'),

  /// `verified_type`
  verifiedType('verified_type'),

  /// `public_metrics`
  publicMetrics('public_metrics'),

  /// `entities`
  entities('entities'),

  /// `created_at`
  createdAt('created_at'),

  /// `withheld`
  withheld('withheld');

  @override
  final String value;

  static UserField valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const UserField(this.value);
}
