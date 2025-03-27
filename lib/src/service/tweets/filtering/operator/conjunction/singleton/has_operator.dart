// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'has_operator_type.dart';
import 'singleton_operator.dart';

class HasOperator extends SingletonOperator {
  /// Returns the new instance of [HasOperator].
  const HasOperator(
    this.type, {
    bool negated = false,
  }) : super(negated);

  /// The operator type
  final HasOperatorType type;

  @override
  String format() => 'has:${type.value}';
}
