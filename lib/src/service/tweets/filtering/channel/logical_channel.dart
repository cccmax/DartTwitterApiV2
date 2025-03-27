// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../syntax/logical_syntax.dart';
import 'filtering_rule_channel.dart';

class LogicalChannel extends LogicalSyntax implements FilteringRuleChannel {
  /// Returns the new instance of [LogicalChannel].
  const LogicalChannel(super.buffer);
}
