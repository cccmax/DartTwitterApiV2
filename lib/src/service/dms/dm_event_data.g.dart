// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'dm_event_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DMEventData _$$_DMEventDataFromJson(Map json) => $checkedCreate(
      r'_$_DMEventData',
      json,
      ($checkedConvert) {
        final val = _$_DMEventData(
          id: $checkedConvert('id', (v) => v as String),
          eventType: $checkedConvert(
              'event_type', (v) => $enumDecode(_$DMEventTypeEnumMap, v)),
          text: $checkedConvert('text', (v) => v as String?),
          senderId: $checkedConvert('sender_id', (v) => v as String?),
          conversationId:
              $checkedConvert('dm_conversation_id', (v) => v as String?),
          referencedTweets: $checkedConvert(
              'referenced_tweets',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => DMReferencedTweet.fromJson(
                      Map<String, Object?>.from(e as Map)))
                  .toList()),
          attachments: $checkedConvert(
              'attachments',
              (v) => v == null
                  ? null
                  : DMAttachments.fromJson(
                      Map<String, Object?>.from(v as Map))),
          createdAt: $checkedConvert('created_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'eventType': 'event_type',
        'senderId': 'sender_id',
        'conversationId': 'dm_conversation_id',
        'referencedTweets': 'referenced_tweets',
        'createdAt': 'created_at'
      },
    );

Map<String, dynamic> _$$_DMEventDataToJson(_$_DMEventData instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'event_type': _$DMEventTypeEnumMap[instance.eventType]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('sender_id', instance.senderId);
  writeNotNull('dm_conversation_id', instance.conversationId);
  writeNotNull('referenced_tweets',
      instance.referencedTweets?.map((e) => e.toJson()).toList());
  writeNotNull('attachments', instance.attachments?.toJson());
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  return val;
}

const _$DMEventTypeEnumMap = {
  DMEventType.messageCreate: 'MessageCreate',
  DMEventType.participantsJoin: 'ParticipantsJoin',
  DMEventType.participantsLeave: 'ParticipantsLeave',
};
