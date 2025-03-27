// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'pinned_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PinnedStateData _$$_PinnedStateDataFromJson(Map json) => $checkedCreate(
      r'_$_PinnedStateData',
      json,
      ($checkedConvert) {
        final val = _$_PinnedStateData(
          isPinned: $checkedConvert('pinned', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isPinned': 'pinned'},
    );

Map<String, dynamic> _$$_PinnedStateDataToJson(_$_PinnedStateData instance) =>
    <String, dynamic>{
      'pinned': instance.isPinned,
    };
