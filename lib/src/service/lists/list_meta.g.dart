// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'list_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListMeta _$$_ListMetaFromJson(Map json) => $checkedCreate(
      r'_$_ListMeta',
      json,
      ($checkedConvert) {
        final val = _$_ListMeta(
          resultCount: $checkedConvert('result_count', (v) => v as int?),
          nextToken: $checkedConvert('next_token', (v) => v as String?),
          previousToken: $checkedConvert('previous_token', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'resultCount': 'result_count',
        'nextToken': 'next_token',
        'previousToken': 'previous_token'
      },
    );

Map<String, dynamic> _$$_ListMetaToJson(_$_ListMeta instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('result_count', instance.resultCount);
  writeNotNull('next_token', instance.nextToken);
  writeNotNull('previous_token', instance.previousToken);
  return val;
}
