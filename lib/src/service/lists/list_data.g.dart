// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListData _$$_ListDataFromJson(Map json) => $checkedCreate(
      r'_$_ListData',
      json,
      ($checkedConvert) {
        final val = _$_ListData(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String?),
          ownerId: $checkedConvert('owner_id', (v) => v as String?),
          followerCount: $checkedConvert('follower_count', (v) => v as int?),
          memberCount: $checkedConvert('member_count', (v) => v as int?),
          isPrivate: $checkedConvert('private', (v) => v as bool?),
          createdAt: $checkedConvert('created_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'ownerId': 'owner_id',
        'followerCount': 'follower_count',
        'memberCount': 'member_count',
        'isPrivate': 'private',
        'createdAt': 'created_at'
      },
    );

Map<String, dynamic> _$$_ListDataToJson(_$_ListData instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('follower_count', instance.followerCount);
  writeNotNull('member_count', instance.memberCount);
  writeNotNull('private', instance.isPrivate);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  return val;
}
