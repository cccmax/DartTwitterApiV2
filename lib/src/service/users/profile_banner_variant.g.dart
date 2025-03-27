// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'profile_banner_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileBannerVariant _$$_ProfileBannerVariantFromJson(Map json) =>
    $checkedCreate(
      r'_$_ProfileBannerVariant',
      json,
      ($checkedConvert) {
        final val = _$_ProfileBannerVariant(
          height: $checkedConvert('h', (v) => v as int),
          width: $checkedConvert('w', (v) => v as int),
          url: $checkedConvert('url', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'height': 'h', 'width': 'w'},
    );

Map<String, dynamic> _$$_ProfileBannerVariantToJson(
        _$_ProfileBannerVariant instance) =>
    <String, dynamic>{
      'h': instance.height,
      'w': instance.width,
      'url': instance.url,
    };
