// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

enum MediaMimeType implements Serializable {
  image('IMAGE'),
  gif('GIF'),
  video('VIDEO'),
  videoCaption('SUBTITLES');

  @override
  final String value;

  const MediaMimeType(this.value);

  /// Returns [MediaMimeType] based on [mediaMimeType].
  static MediaMimeType valueOf(final String mediaMimeType) {
    if (mediaMimeType.endsWith('x-subrip')) {
      return videoCaption;
    }

    if (mediaMimeType.startsWith('video')) {
      return video;
    }

    if (mediaMimeType.startsWith('image')) {
      if (mediaMimeType.endsWith('gif')) {
        return gif;
      }

      return image;
    }

    throw UnsupportedError(
      'Unsupported Mime type [$mediaMimeType].',
    );
  }
}
