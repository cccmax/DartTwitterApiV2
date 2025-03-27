// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/compliance/job_status.dart';

void main() {
  test('.name', () {
    expect(JobStatus.created.name, 'created');
    expect(JobStatus.inProgress.name, 'inProgress');
    expect(JobStatus.failed.name, 'failed');
    expect(JobStatus.complete.name, 'complete');
  });

  test('.value', () {
    expect(JobStatus.created.value, 'created');
    expect(JobStatus.inProgress.value, 'in_progress');
    expect(JobStatus.failed.value, 'failed');
    expect(JobStatus.complete.value, 'complete');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(JobStatus.valueOf('in_progress'), JobStatus.inProgress);
    });

    test('when value is unsupported', () {
      expect(() => JobStatus.valueOf('inProgress'),
          throwsA(isA<UnsupportedError>()));
    });
  });
}
