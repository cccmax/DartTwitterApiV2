// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'poll_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PollData _$$_PollDataFromJson(Map json) => $checkedCreate(
      r'_$_PollData',
      json,
      ($checkedConvert) {
        final val = _$_PollData(
          id: $checkedConvert('id', (v) => v as String),
          options: $checkedConvert(
              'options',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      PollOption.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
          votingStatus: $checkedConvert('voting_status',
              (v) => $enumDecodeNullable(_$PollVotingStatusEnumMap, v)),
          durationMinutes:
              $checkedConvert('duration_minutes', (v) => v as int?),
          endAt: $checkedConvert('end_datetime',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'votingStatus': 'voting_status',
        'durationMinutes': 'duration_minutes',
        'endAt': 'end_datetime'
      },
    );

Map<String, dynamic> _$$_PollDataToJson(_$_PollData instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'options': instance.options.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'voting_status', _$PollVotingStatusEnumMap[instance.votingStatus]);
  writeNotNull('duration_minutes', instance.durationMinutes);
  writeNotNull('end_datetime', instance.endAt?.toIso8601String());
  return val;
}

const _$PollVotingStatusEnumMap = {
  PollVotingStatus.open: 'open',
  PollVotingStatus.closed: 'closed',
};
