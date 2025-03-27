// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/mention.dart';
import '../common/tag.dart';
import '../common/url.dart';
import 'tweet_annotation.dart';

part 'tweet_entities.freezed.dart';
part 'tweet_entities.g.dart';

@freezed
class TweetEntities with _$TweetEntities {
  @JsonSerializable(includeIfNull: false)
  const factory TweetEntities({
    /// Contains details about annotations relative to the text within a Tweet.
    List<TweetAnnotation>? annotations,

    /// Contains details about text recognized as a Hashtag.
    List<Tag>? hashtags,

    /// Contains details about text recognized as a Cashtag.
    List<Tag>? cashtags,

    /// Contains details about text recognized as a user mention.
    List<Mention>? mentions,

    /// Contains details about text recognized as a URL.
    List<Url>? urls,
  }) = _TweetEntities;

  factory TweetEntities.fromJson(Map<String, Object?> json) =>
      _$TweetEntitiesFromJson(json);
}
