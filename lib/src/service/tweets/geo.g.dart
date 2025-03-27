// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'geo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Geo _$$_GeoFromJson(Map json) => $checkedCreate(
      r'_$_Geo',
      json,
      ($checkedConvert) {
        final val = _$_Geo(
          placeId: $checkedConvert('place_id', (v) => v as String?),
          coordinates: $checkedConvert(
              'coordinates',
              (v) => v == null
                  ? null
                  : GeoCoordinates.fromJson(
                      Map<String, Object?>.from(v as Map))),
        );
        return val;
      },
      fieldKeyMap: const {'placeId': 'place_id'},
    );

Map<String, dynamic> _$$_GeoToJson(_$_Geo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('place_id', instance.placeId);
  writeNotNull('coordinates', instance.coordinates?.toJson());
  return val;
}
