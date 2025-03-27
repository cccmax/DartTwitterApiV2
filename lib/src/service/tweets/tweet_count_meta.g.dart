// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'tweet_count_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TweetCountMeta _$$_TweetCountMetaFromJson(Map json) => $checkedCreate(
      r'_$_TweetCountMeta',
      json,
      ($checkedConvert) {
        final val = _$_TweetCountMeta(
          total: $checkedConvert('total_tweet_count', (v) => v as int),
          nextToken: $checkedConvert('next_token', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'total': 'total_tweet_count',
        'nextToken': 'next_token'
      },
    );

Map<String, dynamic> _$$_TweetCountMetaToJson(_$_TweetCountMeta instance) {
  final val = <String, dynamic>{
    'total_tweet_count': instance.total,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next_token', instance.nextToken);
  return val;
}
