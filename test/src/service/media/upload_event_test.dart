// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/media/upload_event.dart';
import 'package:twitter_api_v2/src/service/media/upload_state.dart';

void main() {
  test('.ofPreparing', () {
    final actual = UploadEventExtension.ofPreparing();

    expect(actual.state, UploadState.preparing);
    expect(actual.progress, 0);
  });

  group('.ofInProgress', () {
    test('when progress is 0', () {
      final actual = UploadEventExtension.ofInProgress(0);

      expect(actual.state, UploadState.inProgress);
      expect(actual.progress, 0);
    });

    test('when progress is 100', () {
      final actual = UploadEventExtension.ofInProgress(100);

      expect(actual.state, UploadState.inProgress);
      expect(actual.progress, 100);
    });

    test('when progress is 50', () {
      final actual = UploadEventExtension.ofInProgress(50);

      expect(actual.state, UploadState.inProgress);
      expect(actual.progress, 50);
    });
  });

  test('.ofCompleted', () {
    final actual = UploadEventExtension.ofCompleted();

    expect(actual.state, UploadState.completed);
    expect(actual.progress, 100);
  });
}
