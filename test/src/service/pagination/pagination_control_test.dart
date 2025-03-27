// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/pagination/pagination_control.dart';
import 'package:twitter_api_v2/src/service/pagination/pagination_control_type.dart';

void main() {
  test('.forward', () {
    final actual = PaginationControl.forward();

    expect(actual.type, PaginationControlType.forward);
  });

  test('.backward', () {
    final actual = PaginationControl.backward();

    expect(actual.type, PaginationControlType.backward);
  });

  test('.stop', () {
    final actual = PaginationControl.stop();

    expect(actual.type, PaginationControlType.stop);
  });
}
