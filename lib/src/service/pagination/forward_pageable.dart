// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../common/meta.dart';

abstract class ForwardPageable implements Meta {
  /// Returns the new instance of [ForwardPageable].
  const ForwardPageable();

  /// Returns the token for next page.
  String? get nextToken;
}
