// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../common/data.dart';

part 'filtering_rule_data.freezed.dart';
part 'filtering_rule_data.g.dart';

@freezed
class FilteringRuleData with _$FilteringRuleData implements Data {
  @JsonSerializable(includeIfNull: false)
  const factory FilteringRuleData({
    /// Unique identifier of this rule. This is returned as a string in order
    /// to avoid complications with languages and tools that cannot
    /// handle large integers.
    required String id,

    /// The rule text as submitted when creating the rule.
    required String value,

    /// The tag label as defined when creating the rule.
    String? tag,
  }) = _FilteringRuleData;

  factory FilteringRuleData.fromJson(Map<String, Object?> json) =>
      _$FilteringRuleDataFromJson(json);
}
