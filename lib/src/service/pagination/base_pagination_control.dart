// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'pagination_control_type.dart';

class BasePaginationControl {
  /// Returns the new instance of [BasePaginationControl].
  const BasePaginationControl(this.type);

  /// The type of pagination control
  final PaginationControlType type;
}
