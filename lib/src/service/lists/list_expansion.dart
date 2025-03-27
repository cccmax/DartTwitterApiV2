// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

/// Represents an extensible field about List.
enum ListExpansion implements Serializable {
  /// `owner_id`
  ownerId('owner_id');

  @override
  final String value;

  static ListExpansion valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const ListExpansion(this.value);
}
