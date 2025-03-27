// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../../core/serializable.dart';

/// This enum represents the compliance job status.
enum JobStatus implements Serializable {
  created('created'),

  @JsonValue('in_progress')
  inProgress('in_progress'),

  failed('failed'),

  complete('complete');

  @override
  final String value;

  static JobStatus valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const JobStatus(this.value);
}
