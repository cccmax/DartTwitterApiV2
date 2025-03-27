// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:async';

// 🌎 Project imports:
import '../../core/client/user_context.dart';
import '../response/pagination_response.dart';
import 'base_pagination_control.dart';
import 'forward_pageable.dart';
import 'pagination_control_type.dart';

typedef PageFlipper<D, M extends ForwardPageable>
    = Future<PaginationResponse<D, M>> Function(
  UserContext userContext,
  String unencodedPath,
  Map<String, dynamic> queryParameters,
);

abstract class Pagination<D, M extends ForwardPageable> {
  /// Returns the new instance of [Pagination].
  const Pagination(
    this.rootPage,
    this.flipper,
  );

  /// The root page
  final PaginationResponse<D, M> rootPage;

  /// The flipper for next page.
  final PageFlipper<D, M> flipper;

  /// Returns the next token.
  String? getNextToken(
    final BasePaginationControl control,
    //! The type system of Dart makes it difficult to express
    //! "Pageable or ForwardPageable", so it's assumed to be dynamic.
    final dynamic meta,
  );

  /// Executes the process on paging.
  Future<BasePaginationControl> invokePaging(
    final int count,
    final PaginationResponse<D, M> page,
  );

  /// Updates the pagination token for next page.
  void updatePaginationToken(
    final Map<String, dynamic> queryParameters,
    final String? nextToken,
  );

  /// Executes the paging process.
  Future<void> execute() async {
    PaginationResponse<D, M> thisPage = rootPage;
    int count = 1;

    BasePaginationControl control = await invokePaging(
      count,
      thisPage,
    );

    do {
      //! Do not edit map directly.
      final newQueryParameters = Map<String, dynamic>.from(
        thisPage.queryParameters,
      );

      final nextToken = getNextToken(control, thisPage.meta);

      if (nextToken?.isEmpty ?? true) {
        //! There is no more pages.
        break;
      }

      updatePaginationToken(
        newQueryParameters,
        nextToken,
      );

      thisPage = await flipper.call(
        thisPage.userContext,
        thisPage.unencodedPath,
        newQueryParameters,
      );

      control = await invokePaging(
        ++count,
        thisPage,
      );
    } while (control.type.isNotStop);
  }
}
