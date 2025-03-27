// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dm_referenced_tweet.freezed.dart';
part 'dm_referenced_tweet.g.dart';

@freezed
class DMReferencedTweet with _$DMReferencedTweet {
  const factory DMReferencedTweet({
    /// The id of a "shared" Tweet in the Direct Message.
    required String id,
  }) = _ReferencedTweet;

  factory DMReferencedTweet.fromJson(Map<String, Object?> json) =>
      _$DMReferencedTweetFromJson(json);
}
