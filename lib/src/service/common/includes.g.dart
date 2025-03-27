// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'includes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Includes _$$_IncludesFromJson(Map json) => $checkedCreate(
      r'_$_Includes',
      json,
      ($checkedConvert) {
        final val = _$_Includes(
          tweets: $checkedConvert(
              'tweets',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      TweetData.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
          users: $checkedConvert(
              'users',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      UserData.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
          media: $checkedConvert(
              'media',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      MediaData.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
          places: $checkedConvert(
              'places',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      PlaceData.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
          polls: $checkedConvert(
              'polls',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      PollData.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
          topics: $checkedConvert(
              'topics',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      TopicData.fromJson(Map<String, Object?>.from(e as Map)))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_IncludesToJson(_$_Includes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tweets', instance.tweets?.map((e) => e.toJson()).toList());
  writeNotNull('users', instance.users?.map((e) => e.toJson()).toList());
  writeNotNull('media', instance.media?.map((e) => e.toJson()).toList());
  writeNotNull('places', instance.places?.map((e) => e.toJson()).toList());
  writeNotNull('polls', instance.polls?.map((e) => e.toJson()).toList());
  writeNotNull('topics', instance.topics?.map((e) => e.toJson()).toList());
  return val;
}
