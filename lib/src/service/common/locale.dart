// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../../core/country.dart';
import '../../core/language.dart';

part 'locale.freezed.dart';
part 'locale.g.dart';

@freezed
class Locale with _$Locale {
  const factory Locale({
    /// The language
    required Language lang,

    /// The country
    required Country country,
  }) = _Locale;

  factory Locale.fromJson(Map<String, Object?> json) => _$LocaleFromJson(json);
}
