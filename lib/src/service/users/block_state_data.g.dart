// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'block_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlockStateData _$$_BlockStateDataFromJson(Map json) => $checkedCreate(
      r'_$_BlockStateData',
      json,
      ($checkedConvert) {
        final val = _$_BlockStateData(
          isBlocking: $checkedConvert('blocking', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isBlocking': 'blocking'},
    );

Map<String, dynamic> _$$_BlockStateDataToJson(_$_BlockStateData instance) =>
    <String, dynamic>{
      'blocking': instance.isBlocking,
    };
