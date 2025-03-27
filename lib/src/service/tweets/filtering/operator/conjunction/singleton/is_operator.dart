// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'is_operator_type.dart';
import 'singleton_operator.dart';

class IsOperator extends SingletonOperator {
  /// Returns the new instance of [IsOperator].
  const IsOperator(
    this.type, {
    bool negated = false,
  }) : super(negated);

  /// The operator type
  final IsOperatorType type;

  @override
  String format() => 'is:${type.name}';
}
