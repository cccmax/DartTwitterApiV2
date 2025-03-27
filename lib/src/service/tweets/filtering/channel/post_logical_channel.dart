// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../syntax/conjunction_required_syntax.dart';
import 'filtering_rule_channel.dart';

class PostLogicalChannel extends ConjunctionRequiredSyntax
    implements FilteringRuleChannel {
  /// Returns the new instance of [PostLogicalChannel].
  const PostLogicalChannel(super.buffer);
}
