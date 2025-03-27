// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'reply_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReplyStateData _$$_ReplyStateDataFromJson(Map json) => $checkedCreate(
      r'_$_ReplyStateData',
      json,
      ($checkedConvert) {
        final val = _$_ReplyStateData(
          isHidden: $checkedConvert('hidden', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isHidden': 'hidden'},
    );

Map<String, dynamic> _$$_ReplyStateDataToJson(_$_ReplyStateData instance) =>
    <String, dynamic>{
      'hidden': instance.isHidden,
    };
