// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:io';

// 📦 Package imports:
import 'package:http/http.dart';

// 🌎 Project imports:
import 'twitter_exception.dart';

/// This class indicates that an exception occurred during a file upload to
/// Twitter.
class TwitterUploadException extends TwitterException {
  /// Returns the new instance of [TwitterUploadException].
  TwitterUploadException(
    this.file,
    final String message, [
    final Response? response,
  ]) : super(message, response ?? Response('', 400));

  /// The file in which the exception occurred.
  final File file;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('TwitterUploadException: $message\n')
      ..writeln('  ✅ File Path:')
      ..writeln('   ${file.path}\n');

    if (response.request != null) {
      buffer
        ..writeln('  ✅ Status Code:')
        ..writeln('   ${response.statusCode}\n')
        ..writeln('  ✅ Request:')
        ..writeln('   ${response.request}\n')
        ..writeln('  ✅ Headers:')
        ..writeln('   ${response.headers}\n');

      if (body != null) {
        buffer
          ..writeln('  ✅ Body:')
          ..writeln('   $body\n');
      }
    }

    buffer.writeln('  Please create an Issue if you have a question '
        'or suggestion for this exception.');

    return buffer.toString();
  }
}
