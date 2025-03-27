// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'base_pagination_control.dart';
import 'pagination_control_type.dart';

class ForwardPaginationControl extends BasePaginationControl {
  /// Returns the new instance of [ForwardPaginationControl].
  const ForwardPaginationControl(super.type);

  /// Returns the control for paging next page.
  factory ForwardPaginationControl.next() =>
      ForwardPaginationControl(PaginationControlType.forward);

  /// Returns the control for stopping pagination.
  factory ForwardPaginationControl.stop() =>
      ForwardPaginationControl(PaginationControlType.stop);
}
