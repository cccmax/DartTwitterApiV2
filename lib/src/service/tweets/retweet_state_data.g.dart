// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'retweet_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RetweetStateData _$$_RetweetStateDataFromJson(Map json) => $checkedCreate(
      r'_$_RetweetStateData',
      json,
      ($checkedConvert) {
        final val = _$_RetweetStateData(
          isRetweeted: $checkedConvert('retweeted', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isRetweeted': 'retweeted'},
    );

Map<String, dynamic> _$$_RetweetStateDataToJson(_$_RetweetStateData instance) =>
    <String, dynamic>{
      'retweeted': instance.isRetweeted,
    };
