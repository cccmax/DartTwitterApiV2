// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'bookmark_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookmarkStateData _$$_BookmarkStateDataFromJson(Map json) => $checkedCreate(
      r'_$_BookmarkStateData',
      json,
      ($checkedConvert) {
        final val = _$_BookmarkStateData(
          isBookmarked: $checkedConvert('bookmarked', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isBookmarked': 'bookmarked'},
    );

Map<String, dynamic> _$$_BookmarkStateDataToJson(
        _$_BookmarkStateData instance) =>
    <String, dynamic>{
      'bookmarked': instance.isBookmarked,
    };
