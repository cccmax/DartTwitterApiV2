// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageData _$$_MessageDataFromJson(Map json) => $checkedCreate(
      r'_$_MessageData',
      json,
      ($checkedConvert) {
        final val = _$_MessageData(
          eventId: $checkedConvert('dm_event_id', (v) => v as String),
          conversationId:
              $checkedConvert('dm_conversation_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'eventId': 'dm_event_id',
        'conversationId': 'dm_conversation_id'
      },
    );

Map<String, dynamic> _$$_MessageDataToJson(_$_MessageData instance) =>
    <String, dynamic>{
      'dm_event_id': instance.eventId,
      'dm_conversation_id': instance.conversationId,
    };
