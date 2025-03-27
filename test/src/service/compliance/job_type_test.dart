// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/compliance/job_type.dart';

void main() {
  test('.name', () {
    expect(JobType.tweets.name, 'tweets');
    expect(JobType.users.name, 'users');
  });

  test('.value', () {
    expect(JobType.tweets.value, 'tweets');
    expect(JobType.users.value, 'users');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(JobType.valueOf('users'), JobType.users);
    });

    test('when value is unsupported', () {
      expect(() => JobType.valueOf('test'), throwsA(isA<UnsupportedError>()));
    });
  });
}
