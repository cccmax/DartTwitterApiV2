// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'base_pagination_control.dart';
import 'pagination_control_type.dart';

class PaginationControl extends BasePaginationControl {
  /// Returns the new instance of [PaginationControl].
  const PaginationControl(super.type);

  /// Returns the control for paging in forward direction.
  factory PaginationControl.forward() =>
      PaginationControl(PaginationControlType.forward);

  /// Returns the control for paging in backward direction.
  factory PaginationControl.backward() =>
      PaginationControl(PaginationControlType.backward);

  /// Returns the control for stopping pagination.
  factory PaginationControl.stop() =>
      PaginationControl(PaginationControlType.stop);
}
