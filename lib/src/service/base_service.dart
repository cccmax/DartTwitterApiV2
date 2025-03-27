// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:async';
import 'dart:convert';

// 📦 Package imports:
import 'package:http/http.dart';

// 🌎 Project imports:
import '../core/adaptor/object_adaptor.dart';
import '../core/client/client_context.dart';
import '../core/client/stream_response.dart';
import '../core/client/user_context.dart';
import '../core/exception/data_not_found_exception.dart';
import '../core/exception/rate_limit_exceeded_exception.dart';
import '../core/exception/twitter_exception.dart';
import '../core/exception/unauthorized_exception.dart';
import '../core/http_method.dart';
import '../core/https_status.dart';
import '../core/service_helper.dart';
import '../core/util/json_utils.dart';
import 'common/data.dart';
import 'common/empty_data.dart';
import 'common/includes.dart';
import 'common/meta.dart';
import 'common/rate_limit.dart';
import 'pagination/bidirectional_pagination.dart';
import 'pagination/forward_pageable.dart';
import 'pagination/pageable.dart';
import 'pagination/unidirectional_pagination.dart';
import 'response/pagination_response.dart';
import 'response/response_field.dart';
import 'response/twitter_request.dart';
import 'response/twitter_response.dart';

/// The callback function for building data object from response.
typedef DataBuilder<D extends Data> = D Function(Map<String, Object?> json);

/// The callback function for building meta object from response.
typedef MetaBuilder<M extends Meta> = M Function(Map<String, Object?> json);

abstract class _Service {
  Future<Response> get(
    UserContext userContext,
    String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
  });

  Future<StreamResponse> getStream(
    final UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
  });

  Future<Response> post(
    UserContext userContext,
    String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    Map<String, String> body = const {},
  });

  Future<Response> postMultipart(
    final UserContext userContext,
    final String unencodedPath, {
    List<MultipartFile> files = const [],
    Map<String, dynamic> queryParameters = const {},
  });

  Future<Response> delete(
    UserContext userContext,
    String unencodedPath,
  );

  Future<Response> put(
    UserContext userContext,
    String unencodedPath, {
    Map<String, String> body = const {},
  });

  TwitterResponse<D, M>
      transformSingleDataResponse<D extends Data, M extends Meta>(
    Response response, {
    required DataBuilder<D> dataBuilder,
    MetaBuilder<M>? metaBuilder,
  });

  TwitterResponse<EmptyData, M> transformEmptyDataResponse<M extends Meta>(
    Response response, {
    MetaBuilder<M>? metaBuilder,
  });

  TwitterResponse<List<D>, M>
      transformMultiDataResponse<D extends Data, M extends Meta>(
    Response response, {
    required DataBuilder<D> dataBuilder,
    MetaBuilder<M>? metaBuilder,
  });

  Future<PaginationResponse<List<D>, M>>
      getPage<D extends Data, M extends Meta>(
    UserContext userContext,
    String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  });

  Future<void> executePaginationIfNecessary<D extends Data, M extends Pageable>(
    UserContext userContext,
    String unencodedPath,
    Map<String, dynamic> queryParameters, {
    required Paging<List<D>, M>? paging,
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  });

  Future<void> executeForwardPaginationIfNecessary<D extends Data,
      M extends ForwardPageable>(
    UserContext userContext,
    String unencodedPath,
    Map<String, dynamic> queryParameters, {
    required ForwardPaging<List<D>, M>? paging,
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  });
}

abstract class BaseService implements _Service {
  /// Returns the new instance of [BaseService].
  BaseService({required ClientContext context})
      : _helper = ServiceHelper(
          authority: 'api.twitter.com',
          context: context,
        );

  final ServiceHelper _helper;

  final RateLimitConverter rateLimitConverter = const RateLimitConverter();

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
        validate: (response) {
          _checkGetResponse(response, response.body);

          return response;
        },
      );

  @override
  Future<StreamResponse> getStream(
    final UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
  }) async =>
      await _helper.getStream(
        userContext,
        unencodedPath,
        queryParameters: queryParameters,
        validate: (response, event) {
          _checkGetResponse(response, event);

          final jsonBody = jsonDecode(event);
          if (!jsonBody.containsKey(ResponseField.data.value)) {
            throw DataNotFoundException(
              'No data exists in response.',
              response,
              event,
            );
          }

          return jsonBody;
        },
      );

  @override
  Future<Response> post(
    final UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    dynamic body = const {},
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
  Future<Response> delete(
    final UserContext userContext,
    final String unencodedPath,
  ) async =>
      await _helper.delete(
        userContext,
        unencodedPath,
        validate: checkResponse,
      );

  @override
  Future<Response> put(
    final UserContext userContext,
    final String unencodedPath, {
    dynamic body = const {},
  }) async =>
      await _helper.put(
        userContext,
        unencodedPath,
        body: body,
        validate: checkResponse,
      );

  @override
  TwitterResponse<D, M>
      transformSingleDataResponse<D extends Data, M extends Meta>(
    Response response, {
    required DataBuilder<D> dataBuilder,
    MetaBuilder<M>? metaBuilder,
    ObjectAdaptor? adaptor,
  }) {
    final jsonBody = adaptor != null
        ? adaptor.execute(tryJsonDecode(response, response.body))
        : _checkResponseBody(response);

    return TwitterResponse(
      headers: response.headers,
      status: HttpStatus.valueOf(response.statusCode),
      request: TwitterRequest(
        method: HttpMethod.valueOf(response.request!.method),
        url: response.request!.url,
      ),
      rateLimit: RateLimit.fromJson(
        rateLimitConverter.convert(response.headers),
      ),
      data: dataBuilder(
        jsonBody[ResponseField.data.value],
      ),
      includes: jsonBody.containsKey(ResponseField.includes.value)
          ? Includes.fromJson(jsonBody[ResponseField.includes.value])
          : null,
      meta:
          jsonBody.containsKey(ResponseField.meta.value) && metaBuilder != null
              ? metaBuilder(jsonBody[ResponseField.meta.value])
              : null,
    );
  }

  @override
  TwitterResponse<EmptyData, M> transformEmptyDataResponse<M extends Meta>(
    Response response, {
    MetaBuilder<M>? metaBuilder,
    ObjectAdaptor? adaptor,
  }) {
    final jsonBody = adaptor != null
        ? adaptor.execute(tryJsonDecode(response, response.body))
        : tryJsonDecode(response, response.body);

    return TwitterResponse(
      headers: response.headers,
      status: HttpStatus.valueOf(response.statusCode),
      request: TwitterRequest(
        method: HttpMethod.valueOf(response.request!.method),
        url: response.request!.url,
      ),
      rateLimit: RateLimit.fromJson(
        rateLimitConverter.convert(response.headers),
      ),
      data: const EmptyData(),
      includes: jsonBody.containsKey(ResponseField.includes.value)
          ? Includes.fromJson(jsonBody[ResponseField.includes.value])
          : null,
      meta:
          jsonBody.containsKey(ResponseField.meta.value) && metaBuilder != null
              ? metaBuilder(jsonBody[ResponseField.meta.value])
              : null,
    );
  }

  @override
  TwitterResponse<List<D>, M>
      transformMultiDataResponse<D extends Data, M extends Meta>(
    Response response, {
    required DataBuilder<D> dataBuilder,
    MetaBuilder<M>? metaBuilder,
  }) {
    final jsonBody = _checkResponseBody(response);

    return TwitterResponse(
      headers: response.headers,
      status: HttpStatus.valueOf(response.statusCode),
      request: TwitterRequest(
        method: HttpMethod.valueOf(response.request!.method),
        url: response.request!.url,
      ),
      rateLimit: RateLimit.fromJson(
        rateLimitConverter.convert(response.headers),
      ),
      data: jsonBody[ResponseField.data.value]
          .map<D>((json) => dataBuilder(json))
          .toList(),
      includes: jsonBody.containsKey(ResponseField.includes.value)
          ? Includes.fromJson(jsonBody[ResponseField.includes.value])
          : null,
      meta:
          jsonBody.containsKey(ResponseField.meta.value) && metaBuilder != null
              ? metaBuilder(jsonBody[ResponseField.meta.value])
              : null,
    );
  }

  @override
  Future<PaginationResponse<List<D>, M>>
      getPage<D extends Data, M extends Meta>(
    UserContext userContext,
    String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  }) async {
    final response = await get(
      userContext,
      unencodedPath,
      queryParameters: queryParameters,
    );

    final jsonBody = _checkResponseBody(response);

    return PaginationResponse(
      userContext: userContext,
      unencodedPath: unencodedPath,
      queryParameters: queryParameters,
      headers: response.headers,
      status: HttpStatus.valueOf(response.statusCode),
      request: TwitterRequest(
        method: HttpMethod.valueOf(response.request!.method),
        url: response.request!.url,
      ),
      rateLimit: RateLimit.fromJson(
        rateLimitConverter.convert(response.headers),
      ),
      data: jsonBody[ResponseField.data.value]
          .map<D>((tweet) => dataBuilder(tweet))
          .toList(),
      includes: jsonBody.containsKey(ResponseField.includes.value)
          ? Includes.fromJson(jsonBody[ResponseField.includes.value])
          : null,
      meta: jsonBody.containsKey(ResponseField.meta.value)
          ? metaBuilder(jsonBody[ResponseField.meta.value])
          : null,
    );
  }

  @override
  Future<PaginationResponse<List<D>, M>>
      executePaginationIfNecessary<D extends Data, M extends Pageable>(
    UserContext userContext,
    String unencodedPath,
    Map<String, dynamic> queryParameters, {
    required Paging<List<D>, M>? paging,
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  }) async {
    final rootPage = await getPage<D, M>(
      userContext,
      unencodedPath,
      queryParameters: queryParameters,
      dataBuilder: dataBuilder,
      metaBuilder: metaBuilder,
    );

    if (paging != null) {
      await BidirectionalPagination(
        rootPage,
        paging,
        (userContext, unencodedPath, queryParameters) async =>
            await getPage<D, M>(
          userContext,
          unencodedPath,
          queryParameters: queryParameters,
          dataBuilder: dataBuilder,
          metaBuilder: metaBuilder,
        ),
      ).execute();
    }

    return rootPage;
  }

  @override
  Future<PaginationResponse<List<D>, M>> executeForwardPaginationIfNecessary<
      D extends Data, M extends ForwardPageable>(
    UserContext userContext,
    String unencodedPath,
    Map<String, dynamic> queryParameters, {
    required ForwardPaging<List<D>, M>? paging,
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  }) async {
    final rootPage = await getPage<D, M>(
      userContext,
      unencodedPath,
      queryParameters: queryParameters,
      dataBuilder: dataBuilder,
      metaBuilder: metaBuilder,
    );

    if (paging != null) {
      await UnidirectionalPagination<List<D>, M>(
        rootPage,
        paging,
        (userContext, unencodedPath, queryParameters) async =>
            await getPage<D, M>(
          userContext,
          unencodedPath,
          queryParameters: queryParameters,
          dataBuilder: dataBuilder,
          metaBuilder: metaBuilder,
        ),
      ).execute();
    }

    return rootPage;
  }

  Map<String, dynamic> _checkResponseBody(final Response response) {
    final jsonBody = tryJsonDecode(response, response.body);

    if (!jsonBody.containsKey(ResponseField.data.value)) {
      //! This occurs when the tweet to be processed has been deleted or
      //! when the target data does not exist at the time of search.
      throw DataNotFoundException(
        'No data exists in response.',
        response,
      );
    }

    return jsonBody;
  }

  Response checkResponse(
    final Response response,
  ) {
    if (HttpStatus.unauthorized.equalsByCode(response.statusCode)) {
      throw UnauthorizedException(
        'The specified access token is invalid.',
        response,
      );
    }

    if (HttpStatus.tooManyRequests.equalsByCode(response.statusCode)) {
      throw RateLimitExceededException(
        'Rate limit exceeded.',
        response,
      );
    }

    if (HttpStatus.forbidden.equalsByCode(response.statusCode) ||
        HttpStatus.unprocessableEntity.equalsByCode(response.statusCode)) {
      throw TwitterException(
        'Invalid request.',
        response,
      );
    }

    if ((HttpStatus.ok.equalsByCode(response.statusCode) &&
            response.body.isEmpty) ||
        HttpStatus.created.equalsByCode(response.statusCode) ||
        HttpStatus.noContent.equalsByCode(response.statusCode)) {
      return response;
    }

    tryJsonDecode(response, response.body);

    return response;
  }

  void _checkGetResponse(
    final BaseResponse response,
    final String event,
  ) {
    if (HttpStatus.unauthorized.equalsByCode(response.statusCode)) {
      throw UnauthorizedException(
        'The specified access token is invalid.',
        response,
      );
    }

    if (HttpStatus.notFound.equalsByCode(response.statusCode)) {
      throw DataNotFoundException(
        'No data exists in response.',
        response,
      );
    }

    if (HttpStatus.tooManyRequests.equalsByCode(response.statusCode)) {
      throw RateLimitExceededException(
        'Rate limit exceeded.',
        response,
      );
    }

    tryJsonDecode(response, event);
  }
}

class RateLimitConverter {
  /// Returns the new instance of [RateLimitConverter].
  const RateLimitConverter();

  Map<String, dynamic> convert(final Map<String, String> input) => {
        //! Although it rarely occurs, there is a case where the header does not
        //! contain rate limiting information.
        'x-rate-limit-limit': _getInt(input, 'x-rate-limit-limit'),
        'x-rate-limit-remaining': _getInt(input, 'x-rate-limit-remaining'),
        'x-rate-limit-reset': _getDateTimeString(input, 'x-rate-limit-reset'),
      };

  int _getInt(final Map<String, String> input, final String key) =>
      input.containsKey(key) ? int.parse(input[key]!) : 0;

  String _getDateTimeString(final Map<String, String> input, final String key) {
    if (!input.containsKey(key)) {
      return DateTime.fromMillisecondsSinceEpoch(0).toString();
    }

    return DateTime.fromMillisecondsSinceEpoch(
      int.parse(input[key]!) * 1000,
    ).toString();
  }
}
