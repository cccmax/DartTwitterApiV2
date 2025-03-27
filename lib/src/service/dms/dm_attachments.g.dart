// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'dm_attachments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DMAttachments _$$_DMAttachmentsFromJson(Map json) => $checkedCreate(
      r'_$_DMAttachments',
      json,
      ($checkedConvert) {
        final val = _$_DMAttachments(
          mediaKeys: $checkedConvert('media_keys',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'mediaKeys': 'media_keys'},
    );

Map<String, dynamic> _$$_DMAttachmentsToJson(_$_DMAttachments instance) =>
    <String, dynamic>{
      'media_keys': instance.mediaKeys,
    };
