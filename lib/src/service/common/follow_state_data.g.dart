// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'follow_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FollowStateData _$$_FollowStateDataFromJson(Map json) => $checkedCreate(
      r'_$_FollowStateData',
      json,
      ($checkedConvert) {
        final val = _$_FollowStateData(
          isFollowing: $checkedConvert('following', (v) => v as bool),
          isPending:
              $checkedConvert('pending_follow', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {
        'isFollowing': 'following',
        'isPending': 'pending_follow'
      },
    );

Map<String, dynamic> _$$_FollowStateDataToJson(_$_FollowStateData instance) =>
    <String, dynamic>{
      'following': instance.isFollowing,
      'pending_follow': instance.isPending,
    };
