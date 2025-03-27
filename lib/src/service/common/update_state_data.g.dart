// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'update_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateStateData _$$_UpdateStateDataFromJson(Map json) => $checkedCreate(
      r'_$_UpdateStateData',
      json,
      ($checkedConvert) {
        final val = _$_UpdateStateData(
          isUpdated: $checkedConvert('updated', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isUpdated': 'updated'},
    );

Map<String, dynamic> _$$_UpdateStateDataToJson(_$_UpdateStateData instance) =>
    <String, dynamic>{
      'updated': instance.isUpdated,
    };
