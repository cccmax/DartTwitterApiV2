// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/client/user_context.dart';

void main() {
  test('.name', () {
    expect(UserContext.appOnly.name, 'appOnly');
    expect(UserContext.oauth1Only.name, 'oauth1Only');
    expect(UserContext.oauth2Only.name, 'oauth2Only');
    expect(UserContext.oauth2OrOAuth1.name, 'oauth2OrOAuth1');
  });
}
