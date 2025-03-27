// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/https_status.dart';
import '../common/empty_data.dart';
import '../common/includes.dart';
import '../common/rate_limit.dart';
import 'twitter_request.dart';

/// The class represents the response from Twitter API v2.
class TwitterResponse<D, M> {
  /// Returns the new instance of [TwitterResponse].
  const TwitterResponse({
    required this.headers,
    required this.status,
    required this.request,
    required this.rateLimit,
    required this.data,
    this.includes,
    this.meta,
  });

  /// The http headers
  final Map<String, String> headers;

  /// The http status
  final HttpStatus status;

  /// The request that generated this response
  final TwitterRequest request;

  /// The rate limit
  final RateLimit rateLimit;

  /// The data field
  final D data;

  /// The includes field
  final Includes? includes;

  /// The meta field
  final M? meta;

  /// Returns true if this response has [includes], otherwise false.
  bool get hasIncludes => includes != null;

  /// Returns true if this response has not [includes], otherwise false.
  bool get hasNotIncludes => !hasIncludes;

  /// Returns true if this response has [meta], otherwise false.
  bool get hasMeta => meta != null;

  /// Returns true if this response has not [meta], otherwise false.
  bool get hasNotMeta => !hasMeta;

  /// Returns the JSON representation of this response.
  ///
  /// It equals to raw JSON response from Twitter.
  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (data is! EmptyData) {
      json['data'] = data is List
          ? (data as List).map((e) => e.toJson()).toList()
          : (data as dynamic).toJson();
    }

    final $includes = includes?.toJson();
    if ($includes != null) {
      json['includes'] = $includes;
    }

    final $meta = (meta as dynamic)?.toJson();
    if ($meta != null) {
      json['meta'] = $meta;
    }

    return json;
  }

  @override
  String toString() {
    final StringBuffer buffer = StringBuffer();
    buffer.write('TwitterResponse(');
    buffer.write('rateLimit: $rateLimit, ');
    buffer.write('data: $data, ');
    buffer.write('includes: $includes, ');
    buffer.write('meta: $meta');
    buffer.write(')');

    return buffer.toString();
  }
}
