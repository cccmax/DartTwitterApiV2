// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:http/http.dart';

// 🌎 Project imports:
import '../core/client/user_context.dart';
import '../core/service_helper.dart';
import '../core/util/json_utils.dart';
import 'base_service.dart';
import 'common/data.dart';
import 'common/locale.dart';
import 'common/meta.dart';
import 'response/twitter_response.dart';

abstract class _MediaService {
  Future<Response> postMultipart(
    final UserContext userContext,
    final String unencodedPath, {
    List<MultipartFile> files = const [],
    Map<String, dynamic> queryParameters = const {},
  });

  TwitterResponse<D, M>
      transformUploadedDataResponse<D extends Data, M extends Meta>(
    Response response, {
    Locale? locale,
    required DataBuilder<D> dataBuilder,
  });
}

abstract class BaseMediaService extends BaseService implements _MediaService {
  /// Returns the new instance of [BaseMediaService].
  BaseMediaService({required super.context})
      : _helper = ServiceHelper(
          authority: 'upload.twitter.com',
          context: context,
        );

  final ServiceHelper _helper;

  @override
  Future<Response> get(
    final UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
  }) async =>
      await _helper.get(
        userContext,
        unencodedPath,
        queryParameters: queryParameters,
        validate: checkResponse,
      );

  @override
  Future<Response> post(
    final UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    dynamic body = const {},
    Response Function(Response response)? validate,
  }) async =>
      await _helper.post(
        userContext,
        unencodedPath,
        queryParameters: queryParameters,
        body: body,
        validate: checkResponse,
      );

  @override
  Future<Response> postMultipart(
    final UserContext userContext,
    final String unencodedPath, {
    List<MultipartFile> files = const [],
    Map<String, dynamic> queryParameters = const {},
  }) async =>
      await _helper.postMultipart(
        userContext,
        unencodedPath,
        files: files,
        queryParameters: queryParameters,
        validate: checkResponse,
      );

  @override
  TwitterResponse<D, M>
      transformUploadedDataResponse<D extends Data, M extends Meta>(
    Response response, {
    Locale? locale,
    required DataBuilder<D> dataBuilder,
  }) {
    final json = tryJsonDecode(response, response.body);

    final uploadedMedia = <String, dynamic>{
      'media_id_string': json['media_id_string'],
      'expires_at': DateTime.now()
          .add(Duration(seconds: json['expires_after_secs']))
          .toIso8601String(),
    };

    if (locale != null) {
      uploadedMedia['locale'] = locale.toJson();
    }

    //! Convert to a data structure compliant with v2 specs.
    return super.transformSingleDataResponse(
      Response(
        jsonEncode({
          'data': uploadedMedia,
        }),
        response.statusCode,
        headers: response.headers,
        request: response.request,
      ),
      dataBuilder: dataBuilder,
    );
  }
}
