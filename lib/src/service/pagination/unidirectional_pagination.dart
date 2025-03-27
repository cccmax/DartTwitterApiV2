// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:async';

// 🌎 Project imports:
import '../response/pagination_response.dart';
import 'base_pagination_control.dart';
import 'forward_pageable.dart';
import 'forward_pagination_control.dart';
import 'forward_paging_event.dart';
import 'pagination.dart';

typedef ForwardPaging<D, M extends ForwardPageable>
    = FutureOr<ForwardPaginationControl> Function(
  ForwardPagingEvent<D, M> event,
);

/// This class is an object representing unidirectional paging.
class UnidirectionalPagination<D, M extends ForwardPageable>
    extends Pagination<D, M> {
  /// Returns the new instance of [UnidirectionalPagination].
  const UnidirectionalPagination(
    super.rootPage,
    this.paging,
    super.flipper,
  );

  /// The paging callback
  final ForwardPaging<D, M> paging;

  @override
  String? getNextToken(
    final BasePaginationControl control,
    final dynamic meta,
  ) =>
      meta?.nextToken;

  @override
  Future<BasePaginationControl> invokePaging(
    final int count,
    final PaginationResponse<D, M> page,
  ) async =>
      await paging.call(
        ForwardPagingEvent<D, M>(count, page),
      );

  @override
  void updatePaginationToken(
    final Map<String, dynamic> queryParameters,
    final String? nextToken,
  ) =>
      queryParameters['next_token'] = nextToken;
}
