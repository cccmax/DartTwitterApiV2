// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../geo/geo_coordinates.dart';

part 'geo.freezed.dart';
part 'geo.g.dart';

@freezed
class Geo with _$Geo {
  @JsonSerializable(includeIfNull: false)
  const factory Geo({
    /// The unique identifier of the place, if this is a point of interest
    /// tagged in the Tweet.
    ///
    /// You can obtain the expanded object in includes.places by adding
    /// `TweetExpansion.geoPlaceId` in the request's query parameter.
    String? placeId,

    /// Contains details about the coordinates of the location tagged by the
    /// user in this Tweet, if they specified one.
    GeoCoordinates? coordinates,
  }) = _Geo;

  factory Geo.fromJson(Map<String, Object?> json) => _$GeoFromJson(json);
}
