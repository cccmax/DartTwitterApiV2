// ignore_for_file: public_member_api_docs, sort_constructors_first
// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../response/twitter_response.dart';
import 'forward_pageable.dart';

class ForwardPagingEvent<D, M extends ForwardPageable> {
  /// Returns the new instance of [ForwardPagingEvent].
  const ForwardPagingEvent(
    this.count,
    this.response,
  );

  /// Indicates the number of cases where paging has occurred.
  ///
  /// Note that this number does not indicate how many pages out of all the
  /// pages, but rather how many times paging has occurred from the root page.
  final int count;

  /// The root page for this paging process
  final TwitterResponse<D, M> response;

  /// Returns true if there is a next page, otherwise false.
  bool get hasNextPage => response.meta?.nextToken?.isNotEmpty ?? false;

  /// Returns true if there is not a next page, otherwise false.
  bool get hasNotNextPage => !hasNextPage;

  @override
  String toString() => 'ForwardPagingEvent(count: $count, response: $response)';
}
