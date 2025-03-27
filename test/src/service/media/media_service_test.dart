// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:io';

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/client/client_context.dart';
import 'package:twitter_api_v2/src/core/client/user_context.dart';
import 'package:twitter_api_v2/src/core/exception/twitter_upload_exception.dart';
import 'package:twitter_api_v2/src/service/media/media_service.dart';
import 'package:twitter_api_v2/src/service/media/uploaded_media_data.dart';
import '../../../mocks/client_context_stubs.dart' as context;
import '../common_expectations.dart';

void main() {
  group('.uploadImage', () {
    test('normal case', () async {
      final mediaService = MediaService(
        context: context.buildUploadPostMultipartStub(
          UserContext.oauth1Only,
          '/1.1/media/upload.json',
          'test/src/service/media/data/upload_image.json',
        ),
      );

      final response = await mediaService.uploadImage(
        file: File.fromUri(
          Uri.file('test/src/service/media/data/Dash.png'),
        ),
      );

      expect(response.data, isA<UploadedMediaData>());
      expect(response.data.id, '710511363345354753');
    });

    test('with invalid oauth token', () async {
      final mediaService = MediaService(
        context: ClientContext(
          bearerToken: 'xxxx',
          timeout: const Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth1(
        () async => await mediaService.uploadImage(
          file: File.fromUri(
            Uri.file('test/src/service/media/data/Dash.png'),
          ),
        ),
      );
    });

    test('with no content jpg', () async {
      final mediaService = MediaService(
        context: ClientContext(
          bearerToken: 'xxxx',
          timeout: const Duration(seconds: 10),
        ),
      );

      expect(
        () async => await mediaService.uploadImage(
          file: File.fromUri(
            Uri.file('test/src/service/media/data/no_content.jpg'),
          ),
        ),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'Cannot upload because the file size is 0.',
            ),
          ),
        ),
      );
    });

    test('with video content', () async {
      final mediaService = MediaService(
        context: ClientContext(
          bearerToken: 'xxxx',
          timeout: const Duration(seconds: 10),
        ),
      );

      expect(
        () async => await mediaService.uploadImage(
          file: File.fromUri(
            Uri.file('test/src/service/media/data/video.mp4'),
          ),
        ),
        throwsA(
          allOf(
            isA<TwitterUploadException>(),
            predicate(
              (dynamic e) =>
                  e.message ==
                  'Only image uploads are allowed from this endpoint. '
                      'Use "uploadMedia" if you need to upload videos.',
            ),
          ),
        ),
      );
    });
  });
}
