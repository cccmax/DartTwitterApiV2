// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operation/logical_operation.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/logical/and.dart';
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/logical/or.dart';

void main() {
  test('.createAnd', () {
    final actual = LogicalOperation().createAnd();

    expect(actual, isA<And>());
  });

  test('.createOr', () {
    final actual = LogicalOperation().createOr();

    expect(actual, isA<Or>());
  });
}
