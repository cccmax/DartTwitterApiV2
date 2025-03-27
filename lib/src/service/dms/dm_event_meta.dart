// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../pagination/pageable.dart';

part 'dm_event_meta.freezed.dart';
part 'dm_event_meta.g.dart';

@freezed
class DMEventMeta with _$DMEventMeta implements Pageable {
  @JsonSerializable(includeIfNull: false)
  const factory DMEventMeta({
    /// The number of results in the current page.
    required int resultCount,

    /// A value that encodes the next 'page' of results that can be requested,
    /// via the `pagination_token` request parameter.
    String? nextToken,

    /// A value that encodes the previous 'page' of results that can be
    /// requested, via the `pagination_token` request parameter.
    String? previousToken,
  }) = _DMEventMeta;

  factory DMEventMeta.fromJson(Map<String, Object?> json) =>
      _$DMEventMetaFromJson(json);
}
