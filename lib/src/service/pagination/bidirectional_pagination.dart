// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:async';

// 🌎 Project imports:
import '../response/pagination_response.dart';
import 'base_pagination_control.dart';
import 'pageable.dart';
import 'pagination.dart';
import 'pagination_control.dart';
import 'pagination_control_type.dart';
import 'paging_event.dart';

typedef Paging<D, M extends Pageable> = FutureOr<PaginationControl> Function(
  PagingEvent<D, M> event,
);

/// This class is an object representing bidirectional
/// (Forward, Backward) paging.
class BidirectionalPagination<D, M extends Pageable> extends Pagination<D, M> {
  /// Returns the new instance of [BidirectionalPagination].
  const BidirectionalPagination(
    super.rootPage,
    this.paging,
    super.flipper,
  );

  /// The paging callback
  final Paging<D, M> paging;

  @override
  String? getNextToken(
    final BasePaginationControl control,
    final dynamic meta,
  ) =>
      control.type.isForward ? meta?.nextToken : meta?.previousToken;

  @override
  Future<BasePaginationControl> invokePaging(
    final int count,
    final PaginationResponse<D, M> page,
  ) async =>
      await paging.call(
        PagingEvent(count, page),
      );

  @override
  void updatePaginationToken(
    final Map<String, dynamic> queryParameters,
    final String? nextToken,
  ) =>
      queryParameters['pagination_token'] = nextToken;
}
