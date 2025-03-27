// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

class ValidationResult {
  /// Returns the new instance of [ValidationResult].
  const ValidationResult._([this.message = '']);

  /// Returns the new instance of [ValidationResult] as succeeded.
  factory ValidationResult.succeeded() => ValidationResult._();

  /// Returns the new instance of [ValidationResult] as failed.
  factory ValidationResult.failed(final String message) =>
      ValidationResult._(message);

  /// The error message.
  final String message;

  /// Returns true if this result has error, otherwise false.
  bool get hasError => message.isNotEmpty;
}
