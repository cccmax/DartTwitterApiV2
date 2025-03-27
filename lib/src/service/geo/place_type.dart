// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/serializable.dart';

enum PlaceType implements Serializable {
  poi,
  neighborhood,
  city,
  admin,
  country,
  unknown;

  @override
  String get value => name;

  static PlaceType valueOf(final String value) {
    for (final element in values) {
      if (element.value == value) {
        return element;
      }
    }

    throw UnsupportedError('Unsupported value [$value].');
  }

  const PlaceType();
}
