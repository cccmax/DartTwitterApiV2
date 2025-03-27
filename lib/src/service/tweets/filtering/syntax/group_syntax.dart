// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../channel/logical_channel.dart';
import '../filtering_rule_group.dart';
import '../operation/logical_operation.dart';
import 'conclusion.dart';
import 'filtering_rule_syntax.dart';

/// The object representing the syntax of a group operator.
abstract class GroupSyntax implements FilteringRuleSyntax {
  const GroupSyntax(this._buffer);

  /// The logical operation
  static const _logicalOperation = LogicalOperation();

  /// The buffer
  final FilteringRuleGroup _buffer;

  /// Add grouped rules.
  LogicalChannel group(final Conclusion conclusion) => _buffer.appendGroup(
        _logicalOperation.createGroup(conclusion),
      );
}
