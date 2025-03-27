// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'profile_banner_variants_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileBannerVariantsData _$$_ProfileBannerVariantsDataFromJson(Map json) =>
    $checkedCreate(
      r'_$_ProfileBannerVariantsData',
      json,
      ($checkedConvert) {
        final val = _$_ProfileBannerVariantsData(
          ipad: $checkedConvert(
              'ipad',
              (v) => ProfileBannerVariant.fromJson(
                  Map<String, Object?>.from(v as Map))),
          ipadRetina: $checkedConvert(
              'ipad_retina',
              (v) => ProfileBannerVariant.fromJson(
                  Map<String, Object?>.from(v as Map))),
          web: $checkedConvert(
              'web',
              (v) => ProfileBannerVariant.fromJson(
                  Map<String, Object?>.from(v as Map))),
          webRetina: $checkedConvert(
              'web_retina',
              (v) => ProfileBannerVariant.fromJson(
                  Map<String, Object?>.from(v as Map))),
          mobile: $checkedConvert(
              'mobile',
              (v) => ProfileBannerVariant.fromJson(
                  Map<String, Object?>.from(v as Map))),
          mobileRetina: $checkedConvert(
              'mobile_retina',
              (v) => ProfileBannerVariant.fromJson(
                  Map<String, Object?>.from(v as Map))),
        );
        return val;
      },
      fieldKeyMap: const {
        'ipadRetina': 'ipad_retina',
        'webRetina': 'web_retina',
        'mobileRetina': 'mobile_retina'
      },
    );

Map<String, dynamic> _$$_ProfileBannerVariantsDataToJson(
        _$_ProfileBannerVariantsData instance) =>
    <String, dynamic>{
      'ipad': instance.ipad.toJson(),
      'ipad_retina': instance.ipadRetina.toJson(),
      'web': instance.web.toJson(),
      'web_retina': instance.webRetina.toJson(),
      'mobile': instance.mobile.toJson(),
      'mobile_retina': instance.mobileRetina.toJson(),
    };
