// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/media/upload_state.dart';

void main() {
  test('.name', () {
    expect(UploadState.preparing.name, 'preparing');
    expect(UploadState.inProgress.name, 'inProgress');
    expect(UploadState.completed.name, 'completed');
  });
}
