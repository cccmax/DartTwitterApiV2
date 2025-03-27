// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

enum UserContext {
  /// App Only.
  appOnly,

  /// OAuth 2.0 only.
  oauth2Only,

  /// OAuth 1.0a only.
  oauth1Only,

  /// OAuth 2.0 or OAuth 1.0a.
  oauth2OrOAuth1,
}
