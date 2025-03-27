// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'dm_event_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DMEventMeta _$$_DMEventMetaFromJson(Map json) => $checkedCreate(
      r'_$_DMEventMeta',
      json,
      ($checkedConvert) {
        final val = _$_DMEventMeta(
          resultCount: $checkedConvert('result_count', (v) => v as int),
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

Map<String, dynamic> _$$_DMEventMetaToJson(_$_DMEventMeta instance) {
  final val = <String, dynamic>{
    'result_count': instance.resultCount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next_token', instance.nextToken);
  writeNotNull('previous_token', instance.previousToken);
  return val;
}
