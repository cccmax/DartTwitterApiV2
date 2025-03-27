// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'mute_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MuteStateData _$$_MuteStateDataFromJson(Map json) => $checkedCreate(
      r'_$_MuteStateData',
      json,
      ($checkedConvert) {
        final val = _$_MuteStateData(
          isMuting: $checkedConvert('muting', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isMuting': 'muting'},
    );

Map<String, dynamic> _$$_MuteStateDataToJson(_$_MuteStateData instance) =>
    <String, dynamic>{
      'muting': instance.isMuting,
    };
