// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'upload_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UploadError _$$_UploadErrorFromJson(Map json) => $checkedCreate(
      r'_$_UploadError',
      json,
      ($checkedConvert) {
        final val = _$_UploadError(
          code: $checkedConvert('code', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_UploadErrorToJson(_$_UploadError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'message': instance.message,
    };
