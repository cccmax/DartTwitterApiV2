// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

class Range {
  /// Returns the new instance of [Range].
  const Range._(this.from, this.to);

  /// Obtains a range using the specified element as both
  /// the minimum and maximum in this range.
  factory Range.point(final int value) => Range._(value, value);

  /// Obtains a range with the specified minimum and maximum values.
  ///
  /// The `from` parameter must be less than `to` parameter,
  /// otherwise [ArgumentError] will be thrown.
  factory Range.between(final int from, final int to) {
    if (from > to) {
      throw ArgumentError('The "from" parameter must be less than "to".');
    }

    return Range._(from, to);
  }

  /// The "from" number
  final int from;

  /// The "to" number
  final int to;

  /// Returns true if this range is the point, otherwise false.
  bool get isPoint => from == to;

  @override
  String toString() => 'Range(from: $from, to: $to)';

  @override
  bool operator ==(covariant Range other) {
    if (identical(this, other)) return true;

    return other.from == from && other.to == to;
  }

  @override
  int get hashCode => from.hashCode ^ to.hashCode;
}
