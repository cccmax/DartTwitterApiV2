// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../syntax/conclusion.dart';
import 'logical_operator.dart';

class Group extends LogicalOperator {
  /// Returns the new instance of [Group].
  const Group(this.conclusion) : super(false);

  /// The conclusion of rule
  final Conclusion conclusion;

  @override
  String format() => '(${conclusion.build()})';
}
