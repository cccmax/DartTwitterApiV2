// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'like_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikeStateData _$$_LikeStateDataFromJson(Map json) => $checkedCreate(
      r'_$_LikeStateData',
      json,
      ($checkedConvert) {
        final val = _$_LikeStateData(
          isLiked: $checkedConvert('liked', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isLiked': 'liked'},
    );

Map<String, dynamic> _$$_LikeStateDataToJson(_$_LikeStateData instance) =>
    <String, dynamic>{
      'liked': instance.isLiked,
    };
