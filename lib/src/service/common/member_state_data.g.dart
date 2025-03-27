// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'member_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListMemberStateData _$$_ListMemberStateDataFromJson(Map json) =>
    $checkedCreate(
      r'_$_ListMemberStateData',
      json,
      ($checkedConvert) {
        final val = _$_ListMemberStateData(
          isMember: $checkedConvert('is_member', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isMember': 'is_member'},
    );

Map<String, dynamic> _$$_ListMemberStateDataToJson(
        _$_ListMemberStateData instance) =>
    <String, dynamic>{
      'is_member': instance.isMember,
    };
