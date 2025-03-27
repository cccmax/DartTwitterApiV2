// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'space_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpaceMeta _$$_SpaceMetaFromJson(Map json) => $checkedCreate(
      r'_$_SpaceMeta',
      json,
      ($checkedConvert) {
        final val = _$_SpaceMeta(
          resultCount: $checkedConvert('result_count', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {'resultCount': 'result_count'},
    );

Map<String, dynamic> _$$_SpaceMetaToJson(_$_SpaceMeta instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('result_count', instance.resultCount);
  return val;
}
