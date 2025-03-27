// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_banner_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileBannerVariant _$ProfileBannerVariantFromJson(Map<String, dynamic> json) {
  return _ProfileBannerVariant.fromJson(json);
}

/// @nodoc
mixin _$ProfileBannerVariant {
  /// The height of this image.
  @JsonKey(name: 'h')
  int get height => throw _privateConstructorUsedError;

  /// The height of this image.
  @JsonKey(name: 'w')
  int get width => throw _privateConstructorUsedError;

  /// The url of this image.
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileBannerVariantCopyWith<ProfileBannerVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileBannerVariantCopyWith<$Res> {
  factory $ProfileBannerVariantCopyWith(ProfileBannerVariant value,
          $Res Function(ProfileBannerVariant) then) =
      _$ProfileBannerVariantCopyWithImpl<$Res, ProfileBannerVariant>;
  @useResult
  $Res call(
      {@JsonKey(name: 'h') int height,
      @JsonKey(name: 'w') int width,
      String url});
}

/// @nodoc
class _$ProfileBannerVariantCopyWithImpl<$Res,
        $Val extends ProfileBannerVariant>
    implements $ProfileBannerVariantCopyWith<$Res> {
  _$ProfileBannerVariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? width = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileBannerVariantCopyWith<$Res>
    implements $ProfileBannerVariantCopyWith<$Res> {
  factory _$$_ProfileBannerVariantCopyWith(_$_ProfileBannerVariant value,
          $Res Function(_$_ProfileBannerVariant) then) =
      __$$_ProfileBannerVariantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'h') int height,
      @JsonKey(name: 'w') int width,
      String url});
}

/// @nodoc
class __$$_ProfileBannerVariantCopyWithImpl<$Res>
    extends _$ProfileBannerVariantCopyWithImpl<$Res, _$_ProfileBannerVariant>
    implements _$$_ProfileBannerVariantCopyWith<$Res> {
  __$$_ProfileBannerVariantCopyWithImpl(_$_ProfileBannerVariant _value,
      $Res Function(_$_ProfileBannerVariant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? width = null,
    Object? url = null,
  }) {
    return _then(_$_ProfileBannerVariant(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileBannerVariant implements _ProfileBannerVariant {
  const _$_ProfileBannerVariant(
      {@JsonKey(name: 'h') required this.height,
      @JsonKey(name: 'w') required this.width,
      required this.url});

  factory _$_ProfileBannerVariant.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileBannerVariantFromJson(json);

  /// The height of this image.
  @override
  @JsonKey(name: 'h')
  final int height;

  /// The height of this image.
  @override
  @JsonKey(name: 'w')
  final int width;

  /// The url of this image.
  @override
  final String url;

  @override
  String toString() {
    return 'ProfileBannerVariant(height: $height, width: $width, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileBannerVariant &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, height, width, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileBannerVariantCopyWith<_$_ProfileBannerVariant> get copyWith =>
      __$$_ProfileBannerVariantCopyWithImpl<_$_ProfileBannerVariant>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileBannerVariantToJson(
      this,
    );
  }
}

abstract class _ProfileBannerVariant implements ProfileBannerVariant {
  const factory _ProfileBannerVariant(
      {@JsonKey(name: 'h') required final int height,
      @JsonKey(name: 'w') required final int width,
      required final String url}) = _$_ProfileBannerVariant;

  factory _ProfileBannerVariant.fromJson(Map<String, dynamic> json) =
      _$_ProfileBannerVariant.fromJson;

  @override

  /// The height of this image.
  @JsonKey(name: 'h')
  int get height;
  @override

  /// The height of this image.
  @JsonKey(name: 'w')
  int get width;
  @override

  /// The url of this image.
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileBannerVariantCopyWith<_$_ProfileBannerVariant> get copyWith =>
      throw _privateConstructorUsedError;
}
