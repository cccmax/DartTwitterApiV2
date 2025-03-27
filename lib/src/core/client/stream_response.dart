// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../service/response/twitter_request.dart';
import '../https_status.dart';

class StreamResponse {
  /// Returns the new instance of [StreamResponse].
  const StreamResponse({
    required this.headers,
    required this.status,
    required this.request,
    required this.body,
  });

  /// The headers
  final Map<String, String> headers;

  /// The http status
  final HttpStatus status;

  /// The request that generated this response
  final TwitterRequest request;

  /// The body
  final Stream<Map<String, dynamic>> body;
}
