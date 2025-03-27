// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'forward_pageable.dart';

abstract class Pageable implements ForwardPageable {
  const Pageable();

  /// Returns the token for previous page.
  String? get previousToken;
}
