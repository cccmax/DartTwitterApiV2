// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:convert' as converter;

// 📦 Package imports:
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// 🌎 Project imports:
import '../service/response/twitter_request.dart';
import 'client/client_context.dart';
import 'client/stream_request.dart';
import 'client/stream_response.dart';
import 'client/user_context.dart';
import 'http_method.dart';
import 'https_status.dart';
import 'serializable.dart';
import 'util/json_utils.dart';

abstract class Service {
  Future<http.Response> get(
    UserContext userContext,
    String unencodedPath, {
    Response Function(Response response)? validate,
  });

  Future<StreamResponse> getStream(
    final UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> Function(
            StreamedResponse streamedResponse, String event)?
        validate,
  });

  Future<http.Response> post(
    UserContext userContext,
    String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    Map<String, String> body = const {},
    Response Function(Response response)? validate,
  });

  Future<http.Response> postMultipart(
    UserContext userContext,
    String unencodedPath, {
    List<http.MultipartFile> files = const [],
    Map<String, dynamic> queryParameters = const {},
    Response Function(Response response)? validate,
  });

  Future<http.Response> delete(
    UserContext userContext,
    String unencodedPath, {
    Response Function(Response response)? validate,
  });

  Future<http.Response> put(
    UserContext userContext,
    String unencodedPath, {
    Map<String, String> body = const {},
    Response Function(Response response)? validate,
  });
}

class ServiceHelper implements Service {
  /// Returns the new instance of [ServiceHelper].
  const ServiceHelper({
    required String authority,
    required ClientContext context,
  })  : _authority = authority,
        _context = context;

  /// The base url
  final String _authority;

  /// The twitter client
  final ClientContext _context;

  @override
  Future<http.Response> get(
    final UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    Response Function(Response response)? validate,
  }) async {
    final response = await _context.get(
      userContext,
      Uri.https(
        _authority,
        unencodedPath,
        _convertQueryParameters(queryParameters),
      ),
    );

    return validate != null ? validate(response) : response;
  }

  @override
  Future<StreamResponse> getStream(
    final UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> Function(
            StreamedResponse streamedResponse, String event)?
        validate,
  }) async {
    final streamedResponse = await _context.getStream(
      userContext,
      StreamRequest(
        Uri.https(
          _authority,
          unencodedPath,
          _convertQueryParameters(queryParameters),
        ),
      ),
    );

    return StreamResponse(
      headers: streamedResponse.headers,
      status: HttpStatus.valueOf(streamedResponse.statusCode),
      request: TwitterRequest(
        method: HttpMethod.valueOf(streamedResponse.request!.method),
        url: streamedResponse.request!.url,
      ),
      body: streamedResponse.stream.transform(converter.utf8.decoder).map(
            (event) => validate != null
                ? validate(streamedResponse, event)
                : tryJsonDecode(streamedResponse, event),
          ),
    );
  }

  @override
  Future<http.Response> post(
    final UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    dynamic body = const {},
    Response Function(Response response)? validate,
  }) async {
    final response = await _context.post(
      userContext,
      Uri.https(
        _authority,
        unencodedPath,
        _convertQueryParameters(queryParameters),
      ),
      headers: {'Content-type': 'application/json'},
      body: converter.jsonEncode(_removeNullValues(body)),
    );

    return validate != null ? validate(response) : response;
  }

  @override
  Future<http.Response> postMultipart(
    final UserContext userContext,
    final String unencodedPath, {
    List<http.MultipartFile> files = const [],
    Map<String, dynamic> queryParameters = const {},
    Response Function(Response response)? validate,
  }) async {
    final response = await _context.postMultipart(
      userContext,
      Uri.https(
        _authority,
        unencodedPath,
        _convertQueryParameters(queryParameters),
      ),
      files: files,
    );

    return validate != null ? validate(response) : response;
  }

  @override
  Future<http.Response> delete(
    final UserContext userContext,
    final String unencodedPath, {
    Response Function(Response response)? validate,
  }) async {
    final response = await _context.delete(
      userContext,
      Uri.https(_authority, unencodedPath),
    );

    return validate != null ? validate(response) : response;
  }

  @override
  Future<http.Response> put(
    final UserContext userContext,
    final String unencodedPath, {
    dynamic body = const {},
    Response Function(Response response)? validate,
  }) async {
    final response = await _context.put(
      userContext,
      Uri.https(_authority, unencodedPath),
      headers: {'Content-type': 'application/json'},
      body: converter.jsonEncode(_removeNullValues(body)),
    );

    return validate != null ? validate(response) : response;
  }

  dynamic _removeNullValues(final dynamic object) {
    if (object is Map) {
      final parameters = <String, dynamic>{};
      object.forEach((key, value) {
        final newObject = _removeNullValues(value);

        if (newObject != null) {
          parameters[key] = newObject;
        }
      });

      return parameters.isNotEmpty ? parameters : null;
    } else if (object is List) {
      final parameters = <dynamic>[];
      for (final value in object) {
        final newObject = _removeNullValues(value);

        if (newObject != null) {
          parameters.add(newObject);
        }
      }

      return parameters.isNotEmpty ? parameters : null;
    }

    //! Just return it as is if it's neither Map nor List.
    return object;
  }

  Map<String, String> _convertQueryParameters(
    final Map<String, dynamic> queryParameters,
  ) {
    final serializedParameters = queryParameters.map((key, value) {
      if (value is List<Serializable>?) {
        return MapEntry(
          key,
          value?.toSet().map((e) => e.value).toList().join(','),
        );
      } else if (value is List<Enum>?) {
        return MapEntry(
          key,
          value?.toSet().map((e) => e.name).join(','),
        );
      } else if (value is List?) {
        return MapEntry(
          key,
          value?.toSet().join(','),
        );
      } else if (value is Serializable) {
        return MapEntry(
          key,
          value.value,
        );
      }

      return MapEntry(key, value);
    });

    return Map.from(_removeNullValues(serializedParameters) ?? {}).map(
      //! Uri.https(...) needs iterable in the value for query params by
      //! which it means a String in the value of the Map too. So you need
      //! to convert it from Map<String, dynamic> to Map<String, String>
      (key, value) {
        if (value is DateTime) {
          return MapEntry(key, value.toUtc().toIso8601String());
        }

        return MapEntry(key, value.toString());
      },
    );
  }
}
