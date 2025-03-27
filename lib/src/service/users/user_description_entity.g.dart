// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'user_description_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDescriptionEntity _$$_UserDescriptionEntityFromJson(Map json) =>
    $checkedCreate(
      r'_$_UserDescriptionEntity',
      json,
      ($checkedConvert) {
        final val = _$_UserDescriptionEntity(
          urls: $checkedConvert(
              'urls',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => Url.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
          hashtags: $checkedConvert(
              'hashtags',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => Tag.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
          cashtags: $checkedConvert(
              'cashtags',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => Tag.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
          mentions: $checkedConvert(
              'mentions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      Mention.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_UserDescriptionEntityToJson(
    _$_UserDescriptionEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('urls', instance.urls?.map((e) => e.toJson()).toList());
  writeNotNull('hashtags', instance.hashtags?.map((e) => e.toJson()).toList());
  writeNotNull('cashtags', instance.cashtags?.map((e) => e.toJson()).toList());
  writeNotNull('mentions', instance.mentions?.map((e) => e.toJson()).toList());
  return val;
}
