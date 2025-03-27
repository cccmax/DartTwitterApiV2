// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'member_state_data.freezed.dart';
part 'member_state_data.g.dart';

@freezed
class MemberStateData with _$MemberStateData implements Data {
  const factory MemberStateData({
    /// Indicates whether the member specified in the request has been added
    /// to the List.
    required bool isMember,
  }) = _ListMemberStateData;

  factory MemberStateData.fromJson(Map<String, Object?> json) =>
      _$MemberStateDataFromJson(json);
}
