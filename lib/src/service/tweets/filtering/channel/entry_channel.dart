// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../syntax/standalone_syntax.dart';
import 'filtering_rule_channel.dart';

class EntryChannel extends StandaloneSyntax implements FilteringRuleChannel {
  /// Returns the new instance of [EntryChannel].
  const EntryChannel(super.buffer);
}
