// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'logical_operator.dart';

class Or extends LogicalOperator {
  /// Returns the new instance of [Or].
  const Or() : super(false);

  @override
  String format() => ' OR ';
}
