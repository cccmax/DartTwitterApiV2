// ignore_for_file: public_member_api_docs, sort_constructors_first
// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'upload_state.dart';

class UploadEvent {
  /// Returns the new instance of [UploadEvent].
  const UploadEvent(
    this.state,
    this.progress,
  );

  /// The upload state
  final UploadState state;

  /// The upload progress in percent
  final int progress;

  @override
  String toString() => 'UploadEvent(state: $state, progress: $progress)';

  @override
  bool operator ==(covariant UploadEvent other) {
    if (identical(this, other)) return true;

    return other.state == state && other.progress == progress;
  }

  @override
  int get hashCode => state.hashCode ^ progress.hashCode;
}

extension UploadEventExtension on UploadEvent {
  static const _preparingUploadEvent = UploadEvent(UploadState.preparing, 0);
  static const _completedUploadEvent = UploadEvent(UploadState.completed, 100);

  /// Returns the new instance of preparing [UploadEvent].
  static UploadEvent ofPreparing() => _preparingUploadEvent;

  /// Returns the new instance of completed [UploadEvent].
  static UploadEvent ofInProgress(final int progress) =>
      UploadEvent(UploadState.inProgress, progress);

  /// Returns the new instance of completed [UploadEvent].
  static UploadEvent ofCompleted() => _completedUploadEvent;
}
