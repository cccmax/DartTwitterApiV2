// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'tweet_context_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TweetContextAnnotation _$$_TweetContextAnnotationFromJson(Map json) =>
    $checkedCreate(
      r'_$_TweetContextAnnotation',
      json,
      ($checkedConvert) {
        final val = _$_TweetContextAnnotation(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_TweetContextAnnotationToJson(
    _$_TweetContextAnnotation instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  return val;
}
