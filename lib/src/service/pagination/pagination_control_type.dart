// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

enum PaginationControlType {
  forward,
  backward,
  stop,
}

extension PaginationControlTypeExtension on PaginationControlType {
  /// Returns true if this element is [PaginationControlType.forward],
  /// otherwise false.
  bool get isForward => this == PaginationControlType.forward;

  /// Returns true if this element is not [PaginationControlType.stop],
  /// otherwise false.
  bool get isNotStop => this != PaginationControlType.stop;
}
