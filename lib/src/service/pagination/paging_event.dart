// ignore_for_file: public_member_api_docs, sort_constructors_first
// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'forward_paging_event.dart';
import 'pageable.dart';

class PagingEvent<D, M extends Pageable> extends ForwardPagingEvent<D, M> {
  /// Returns the new instance of [PagingEvent].
  const PagingEvent(
    super.count,
    super.response,
  );

  /// Returns true if there is a previous page, otherwise false.
  bool get hasPreviousPage => response.meta?.previousToken?.isNotEmpty ?? false;

  /// Returns true if there is not a previous page, otherwise false.
  bool get hasNotPreviousPage => !hasPreviousPage;

  @override
  String toString() => 'PagingEvent(count: $count, response: $response)';
}
