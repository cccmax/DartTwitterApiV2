// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'delete_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeleteStateData _$$_DeleteStateDataFromJson(Map json) => $checkedCreate(
      r'_$_DeleteStateData',
      json,
      ($checkedConvert) {
        final val = _$_DeleteStateData(
          isDeleted: $checkedConvert('deleted', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isDeleted': 'deleted'},
    );

Map<String, dynamic> _$$_DeleteStateDataToJson(_$_DeleteStateData instance) =>
    <String, dynamic>{
      'deleted': instance.isDeleted,
    };
