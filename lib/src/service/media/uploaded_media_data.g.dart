// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'uploaded_media_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UploadedMediaData _$$_UploadedMediaDataFromJson(Map json) => $checkedCreate(
      r'_$_UploadedMediaData',
      json,
      ($checkedConvert) {
        final val = _$_UploadedMediaData(
          id: $checkedConvert('media_id_string', (v) => v as String),
          expiresAt:
              $checkedConvert('expires_at', (v) => DateTime.parse(v as String)),
          locale: $checkedConvert(
              'locale',
              (v) => v == null
                  ? null
                  : Locale.fromJson(Map<String, Object?>.from(v as Map))),
        );
        return val;
      },
      fieldKeyMap: const {'id': 'media_id_string', 'expiresAt': 'expires_at'},
    );

Map<String, dynamic> _$$_UploadedMediaDataToJson(
    _$_UploadedMediaData instance) {
  final val = <String, dynamic>{
    'media_id_string': instance.id,
    'expires_at': instance.expiresAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('locale', instance.locale?.toJson());
  return val;
}
