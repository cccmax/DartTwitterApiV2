// ignore_for_file: public_member_api_docs, sort_constructors_first
// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'reply_setting.dart';
import 'tweet_geo_param.dart';
import 'tweet_media_param.dart';
import 'tweet_poll_param.dart';
import 'tweet_reply_param.dart';

class TweetParam {
  /// Returns the new instance of [TweetParam].
  const TweetParam({
    required this.text,
    this.quoteTweetId,
    this.forSuperFollowersOnly,
    this.replySetting,
    this.directMessageDeepLink,
    this.media,
    this.geo,
    this.poll,
    this.reply,
  });

  /// The text
  final String text;

  /// The tweet id for quote
  final String? quoteTweetId;

  /// The flag indicates that this tweet is for super followers or not
  final bool? forSuperFollowersOnly;

  /// The settings for reply
  final ReplySetting? replySetting;

  /// The deep link for direct message
  final String? directMessageDeepLink;

  /// The parameters for media
  final TweetMediaParam? media;

  /// The parameters for geo
  final TweetGeoParam? geo;

  /// The parameters for poll
  final TweetPollParam? poll;

  /// The parameters for reply
  final TweetReplyParam? reply;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('TweetParam(')
      ..write('text: $text, ')
      ..write('quoteTweetId: $quoteTweetId, ')
      ..write('forSuperFollowersOnly: $forSuperFollowersOnly, ')
      ..write('replySetting: $replySetting, ')
      ..write('directMessageDeepLink: $directMessageDeepLink, ')
      ..write('media: $media, ')
      ..write('geo: $geo, ')
      ..write('poll: $poll, ')
      ..write('reply: $reply')
      ..write(');');

    return buffer.toString();
  }

  @override
  bool operator ==(covariant TweetParam other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.quoteTweetId == quoteTweetId &&
        other.forSuperFollowersOnly == forSuperFollowersOnly &&
        other.replySetting == replySetting &&
        other.directMessageDeepLink == directMessageDeepLink &&
        other.media == media &&
        other.geo == geo &&
        other.poll == poll &&
        other.reply == reply;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        quoteTweetId.hashCode ^
        forSuperFollowersOnly.hashCode ^
        replySetting.hashCode ^
        directMessageDeepLink.hashCode ^
        media.hashCode ^
        geo.hashCode ^
        poll.hashCode ^
        reply.hashCode;
  }
}
