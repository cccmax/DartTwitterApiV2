// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/decahose_partition.dart';

void main() {
  test('.name', () {
    expect(DecahosePartition.section1.name, 'section1');
    expect(DecahosePartition.section2.name, 'section2');
  });

  test('.value', () {
    expect(DecahosePartition.section1.value, '1');
    expect(DecahosePartition.section2.value, '2');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(DecahosePartition.valueOf('1'), DecahosePartition.section1);
    });

    test('when value is unsupported', () {
      expect(() => DecahosePartition.valueOf('0'),
          throwsA(isA<UnsupportedError>()));
    });
  });
}
