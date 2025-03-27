// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'object_adaptor.dart';

class ProfileBannerObjectAdaptor implements ObjectAdaptor {
  /// Returns the new instance of [ProfileBannerObjectAdaptor].
  const ProfileBannerObjectAdaptor();

  @override
  Map<String, dynamic> execute(final Map<String, dynamic> source) => {
        'data': source['sizes'],
      };
}
