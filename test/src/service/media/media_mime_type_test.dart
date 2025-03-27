// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/media/media_mime_type.dart';

void main() {
  test('.name', () {
    expect(MediaMimeType.image.name, 'image');
    expect(MediaMimeType.gif.name, 'gif');
    expect(MediaMimeType.video.name, 'video');
    expect(MediaMimeType.videoCaption.name, 'videoCaption');
  });

  test('.value', () {
    expect(MediaMimeType.image.value, 'IMAGE');
    expect(MediaMimeType.gif.value, 'GIF');
    expect(MediaMimeType.video.value, 'VIDEO');
    expect(MediaMimeType.videoCaption.value, 'SUBTITLES');
  });

  group('.valueOf', () {
    test('with png', () {
      final mimeType = MediaMimeType.valueOf('image/png');

      expect(mimeType, MediaMimeType.image);
    });

    test('with gif', () {
      final mimeType = MediaMimeType.valueOf('image/gif');

      expect(mimeType, MediaMimeType.gif);
    });

    test('with video', () {
      final mimeType = MediaMimeType.valueOf('video/mp4');

      expect(mimeType, MediaMimeType.video);
    });

    test('with caption (.srt)', () {
      final mimeType = MediaMimeType.valueOf('application/x-subrip');

      expect(mimeType, MediaMimeType.videoCaption);
    });

    test('with unsupported mime type', () {
      expect(
        () => MediaMimeType.valueOf('application/vnd.ms-excel'),
        throwsA(
          allOf(
            isA<UnsupportedError>(),
            predicate(
              (dynamic e) =>
                  e.message ==
                  'Unsupported Mime type [application/vnd.ms-excel].',
            ),
          ),
        ),
      );
    });
  });
}
