// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../operator/logical/and.dart';
import '../operator/logical/group.dart';
import '../operator/logical/or.dart';
import '../syntax/conclusion.dart';

class LogicalOperation {
  /// Returns the new instance of [LogicalOperation].
  const LogicalOperation();

  static const _and = And();
  static const _or = Or();

  /// Returns the new instance of [And].
  And createAnd() => _and;

  /// Returns the new instance of [Or].
  Or createOr() => _or;

  /// Returns the new instance of [Group] based on [conclusion].
  Group createGroup(final Conclusion conclusion) => Group(conclusion);
}
