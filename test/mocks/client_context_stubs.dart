// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:convert';
import 'dart:io';

// 📦 Package imports:
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/client/user_context.dart';
import 'mock.mocks.dart';

MockClientContext buildGetStub(
  final UserContext userContext,
  final String unencodedPath,
  final String resourcePath,
  final Map<String, String> queryParameters, {
  int statusCode = 200,
}) {
  final mockClientContext = MockClientContext();

  when(mockClientContext.get(
    userContext,
    Uri.https('api.twitter.com', unencodedPath, queryParameters),
  )).thenAnswer(
    (_) async => Response(
      await File(resourcePath).readAsString(),
      statusCode,
      headers: {'content-type': 'application/json; charset=utf-8'},
      request: Request('GET', Uri()),
    ),
  );

  return mockClientContext;
}

/// This stub is used to test paging feature mainly.
MockClientContext buildGetStubWithAnyUriAndMultiResources(
  final UserContext userContext,
  final List<String> resourcePaths, {
  int statusCode = 200,
}) {
  final mockClientContext = MockClientContext();

  when(mockClientContext.get(
    userContext,
    any,
  )).thenAnswer(
    (_) async => Response(
      await File(resourcePaths.removeAt(0)).readAsString(),
      statusCode,
      headers: {'content-type': 'application/json; charset=utf-8'},
      request: Request('GET', Uri()),
    ),
  );

  return mockClientContext;
}

MockClientContext buildPostStub(
  final UserContext userContext,
  final String unencodedPath,
  final String resourcePath, {
  Map<String, String> queryParameters = const {},
  int statusCode = 200,
}) {
  final mockClientContext = MockClientContext();

  when(mockClientContext.post(
    userContext,
    Uri.https('api.twitter.com', unencodedPath, queryParameters),
    headers: anyNamed('headers'),
    body: anyNamed('body'),
  )).thenAnswer(
    (_) async => Response(
      await File(resourcePath).readAsString(),
      statusCode,
      headers: {
        'content-type': 'application/json; charset=utf-8',
      },
      request: Request('POST', Uri()),
    ),
  );

  return mockClientContext;
}

MockClientContext buildPostMultipartStub(
  final UserContext userContext,
  final String unencodedPath,
  final String resourcePath, {
  Map<String, String> queryParameters = const {},
  int statusCode = 200,
}) {
  final mockClientContext = MockClientContext();

  when(mockClientContext.postMultipart(
    userContext,
    Uri.https('api.twitter.com', unencodedPath, queryParameters),
    files: anyNamed('files'),
  )).thenAnswer(
    (_) async => Response(
      await File(resourcePath).readAsString(),
      statusCode,
      headers: {
        'content-type': 'application/json; charset=utf-8',
      },
      request: Request('POST', Uri()),
    ),
  );

  return mockClientContext;
}

MockClientContext buildUploadPostMultipartStub(
  final UserContext userContext,
  final String unencodedPath,
  final String resourcePath, {
  Map<String, String> queryParameters = const {},
  int statusCode = 200,
}) {
  final mockClientContext = MockClientContext();

  when(mockClientContext.postMultipart(
    userContext,
    Uri.https('upload.twitter.com', unencodedPath, queryParameters),
    files: anyNamed('files'),
  )).thenAnswer(
    (_) async => Response(
      await File(resourcePath).readAsString(),
      statusCode,
      headers: {
        'content-type': 'application/json; charset=utf-8',
      },
      request: Request('POST', Uri()),
    ),
  );

  return mockClientContext;
}

MockClientContext buildDeleteStub(
  final UserContext userContext,
  final String unencodedPath,
  final String resourcePath, {
  int statusCode = 200,
}) {
  final mockClientContext = MockClientContext();

  when(mockClientContext.delete(
    userContext,
    Uri.https('api.twitter.com', unencodedPath),
  )).thenAnswer(
    (_) async => Response(
      await File(resourcePath).readAsString(),
      statusCode,
      headers: {'content-type': 'application/json; charset=utf-8'},
      request: Request('DELETE', Uri()),
    ),
  );

  return mockClientContext;
}

MockClientContext buildPutStub(
  final String unencodedPath,
  final String resourcePath, {
  int statusCode = 200,
}) {
  final mockClientContext = MockClientContext();

  when(mockClientContext.put(
    UserContext.oauth2OrOAuth1,
    Uri.https('api.twitter.com', unencodedPath),
    headers: anyNamed('headers'),
    body: anyNamed('body'),
  )).thenAnswer(
    (_) async => Response(
      await File(resourcePath).readAsString(),
      statusCode,
      headers: {'content-type': 'application/json; charset=utf-8'},
      request: Request('PUT', Uri()),
    ),
  );

  return mockClientContext;
}

MockClientContext buildSendStub(
  final UserContext userContext,
  final String resourcePath, [
  final Map<String, String>? queryParameters,
  int statusCode = 200,
]) {
  final mockClientContext = MockClientContext();

  Stream<List<int>> responseStream() async* {
    final converter = JsonUtf8Encoder();
    final responsesString = await File(resourcePath).readAsString();
    final responses = jsonDecode(responsesString) as List<dynamic>;

    for (final response in responses) {
      yield converter.convert(response);
    }
  }

  when(mockClientContext.getStream(
    userContext,
    any,
  )).thenAnswer(
    (_) async {
      return StreamedResponse(
        responseStream(),
        statusCode,
        headers: {'content-type': 'application/json; charset=utf-8'},
        request: Request('GET', Uri()),
      );
    },
  );

  return mockClientContext;
}
