// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'bookmark_state_data.freezed.dart';
part 'bookmark_state_data.g.dart';

@freezed
class BookmarkStateData with _$BookmarkStateData implements Data {
  const factory BookmarkStateData({
    /// Indicates whether the user bookmarks the specified Tweet as a result
    /// of this request.
    @JsonKey(name: 'bookmarked') required bool isBookmarked,
  }) = _BookmarkStateData;

  factory BookmarkStateData.fromJson(Map<String, Object?> json) =>
      _$BookmarkStateDataFromJson(json);
}
