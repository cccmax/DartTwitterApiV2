// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'channel/entry_channel.dart';
import 'channel/logical_channel.dart';
import 'channel/post_logical_channel.dart';
import 'operator/conjunction/singleton/has_operator.dart';
import 'operator/conjunction/singleton/is_operator.dart';
import 'operator/conjunction/singleton/sample.dart';
import 'operator/conjunction/singleton/singleton_operator.dart';
import 'operator/filtering_rule_operator.dart';
import 'operator/logical/and.dart';
import 'operator/logical/group.dart';
import 'operator/logical/logical_operator.dart';
import 'operator/operator.dart';

class FilteringRuleGroup {
  /// Returns the new instance of [FilteringRuleGroup].
  FilteringRuleGroup([int? samplePercent])
      : _sample = samplePercent != null ? Sample(samplePercent) : null {
    _entryChannel = EntryChannel(this);
    _logicalChannel = LogicalChannel(this);
    _postLogicalChannel = PostLogicalChannel(this);
  }

  final _singletonError = UnsupportedError('''
The same singleton operators cannot be used within a single group.

If you want to use multiple combinations of the same singleton operator,
use in nested groups or outside of groups.

❌ You Should Not
#TwitterDev has:retweet OR #TwitterAPI -has:retweet

✅ Instead, You Should
(#TwitterDev has:retweet) OR (#TwitterAPI -has:retweet)
            ''');

  /// The operators
  final _operators = <FilteringRuleOperator>[];

  /// The sample
  final Sample? _sample;

  late EntryChannel _entryChannel;
  late LogicalChannel _logicalChannel;
  late PostLogicalChannel _postLogicalChannel;

  /// Returns the entry channel.
  EntryChannel get entryChannel => _entryChannel;

  LogicalChannel appendOperator(
    final Operator operator,
  ) {
    _operators.add(operator);

    return _logicalChannel;
  }

  LogicalChannel appendSingletonOperator(
    final SingletonOperator operator,
  ) {
    for (final $operator in _operators) {
      if (($operator is IsOperator && operator is IsOperator) ||
          ($operator is HasOperator && operator is HasOperator)) {
        if (($operator as dynamic).type == (operator as dynamic).type) {
          throw _singletonError;
        }
      }
    }

    _operators.add(operator);

    return _logicalChannel;
  }

  PostLogicalChannel appendLogicalOperator(
    final LogicalOperator operator,
  ) {
    _operators.add(operator);

    return _postLogicalChannel;
  }

  LogicalChannel appendGroup(
    final Group group,
  ) {
    _operators.add(group);

    return _logicalChannel;
  }

  String build() {
    if (_sample != null) {
      //! Add sampling rule
      appendLogicalOperator(And());
      appendSingletonOperator(_sample!);
    }

    final buffer = StringBuffer();

    for (final operator in _operators) {
      buffer.write(operator.toString());
    }

    return buffer.toString();
  }
}
