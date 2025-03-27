// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../../../../core/language.dart';
import '../operator.dart';

class TweetLang extends Operator {
  /// Returns the new instance of [TweetLang].
  const TweetLang(
    this.language, {
    bool negated = false,
  }) : super(negated);

  factory TweetLang.negated(final Language language) =>
      TweetLang(language, negated: true);

  /// The BCP 47 language
  final Language language;

  @override
  String format() => 'lang:${language.code}';
}
